var express = require("express");
var router = express.Router();
const pool = require("../database/pool");
let {
  viewPeriodDate,
  addDays,
  isDate,
  strDateFormat,
  getDateOfMonthByFlag,
} = require("../module/date-function");

//목표값 설정
router.post("/postEnergyUseTargetSet", async (req, res, next) => {
  console.log(JSON.stringify(req.body));
  // console.log(req.body);

  let {
    serviceKey = "", //   서비스 인증키
    dongCode = "", //     동코드
    hoCode = "", //       호코드
    energyType = "", //   전기(elec)/수도(water)/가스(gas)/온수(hotWater)/난방(heating)
    targetUsage = "", //  목표사용량
  } = req.body;

  console.log(serviceKey, dongCode, hoCode, energyType, targetUsage);
  //http://localhost:3000/ems/postEnergyUseTargetSet  {"serviceKey":"11111111","dongCode":"101","hoCode":"101","energyType":"elec", "targetUsage": "400"}

  let resulCode = "00";
  if (serviceKey === "") resulCode = "10"; // INVALID_REQUEST_PARAMETER_ERROR

  if (dongCode === "") resulCode = "10";

  if (hoCode === "") resulCode = "10";

  if (energyType === "") resulCode = "10";

  if (targetUsage === "") targetUsage = "10";

  console.log("resulCode=> " + resulCode);

  if (resulCode === "00") {
    try {
      let sql =
        "delete from t_energy_target where energy_type = ? and dong_code = ? and ho_code = ? ";
      console.log("sql=>" + sql);
      let data = await pool.query(sql, [energyType, dongCode, hoCode]);
      console.log("data[0]=>" + data[0]);

      sql =
        "insert into t_energy_target(energy_type, dong_code, ho_code, target_value) values (?, ?, ?, ?) ";
      console.log("sql_i=>" + sql);
      data = await pool.query(sql, [energyType, dongCode, hoCode, targetUsage]);
      console.log("data[0]=>" + data[0]);

      let jsonResult = {
        resultCode: resulCode,
        resultMsg: "NORMAL_SERVICE",
      };

      return res.json(jsonResult);
    } catch (err) {
      console.log("test===============" + err);
      return res.status(500).json(err);
    }
  }
});

//현재에너지사용량 조회
router.get("/getNowEnergyUse", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
  } = req.query;

  console.log(serviceKey, dongCode, hoCode);
  //http://localhost:3000/ems/getNowEnergyUse?serviceKey=22222&dongCode=101&hoCode=101

  try {
    let today = new Date();
    let yesterday = new Date(today.setDate(today.getDate() - 1)); //전일
    let prevMonthDayE = getDateOfMonthByFlag(today, 0); //전월말일
    let nowMonthDayS = getDateOfMonthByFlag(today, 1); //당월1일
    console.log("yesterday", yesterday);
    console.log("prevMonthDayE", prevMonthDayE);

    let fElec = "";
    let fWater = "";
    let fGas = "";
    let fHotWater = "";
    let fHeating = "";
    let fAircon = "";

    let fElecBaseDate = "1";
    let fWaterBaseDate = "1";
    let fGasBaseDate = "1";
    let fHotWaterBaseDate = "1";
    let fHeatingBaseDate = "1";
    let fAirconBaseDate = "1";

    let fElecUnit = "";
    let fWaterUnit = "";
    let fGasUnit = "";
    let fHotWaterUnit = "";
    let fHeatingUnit = "";
    let fAirconUnit = "";

    let sql = "select * from t_energy_setting";
    //console.log("sql=>" + sql);

    const data = await pool.query(sql);
    let resultList = data[0];
    // console.log("resultList : ", resultList);
    // console.log("resultList.length : ", resultList.length);

    sql = ""; // 현재에너지 사용량 쿼리
    let fSQL = ""; //에너지 예측사용량 쿼리
    let tSQL = ""; //목표사용량 쿼리
    let saSQL = ""; //동일평형사용량 쿼리
    let preSQL = ""; //전년동월사용량
    let mSQL = ""; //우리집 절약순위(면적)
    let strSQL = "";

    for (i = 0; i < resultList.length; i++) {
      if (resultList[i].energy_type === "elec") {
        fElec = resultList[i].energy_type;
        fElecBaseDate = String(resultList[i].meter_base_date);
        fElecUnit = resultList[i].energy_unit;
        console.log("fElecBaseDate=", fElecBaseDate);

        //말일이면
        if (fElecBaseDate === "0") {
          fElecBaseDate = prevMonthDayE;
        } else {
          if (fElecBaseDate.length === 1) fElecBaseDate = "0" + fElecBaseDate;

          fElecBaseDate = nowMonthDayS.substring(0, 8) + fElecBaseDate;
        }

        sql =
          sql +
          strSQL +
          `select 'elec' as energyType, sum(elec_usage) as nowMonthUsage from t_energy 
                        where dong_code = '${dongCode}' and ho_code = '${hoCode}'
                        and energy_dtime > '${fElecBaseDate}'  `;
        strSQL = " union all ";
      } else if (resultList[i].energy_type === "water") {
        fWater = resultList[i].energy_type;
        fWaterBaseDate = resultList[i].meter_base_date + "";
        fWaterUnit = resultList[i].energy_unit;
        console.log("fWaterBaseDate=", fWaterBaseDate);

        if (fWaterBaseDate === "0") {
          fWaterBaseDate = prevMonthDayE;
        } else {
          if (fWaterBaseDate.length === 1)
            fWaterBaseDate = "0" + fWaterBaseDate;

          fWaterBaseDate = nowMonthDayS.substring(0, 8) + fWaterBaseDate;
        }
        console.log("fWaterBaseDate222=", fWaterBaseDate);
        sql =
          sql +
          strSQL +
          `select 'water' as energyType, sum(water_usage) as nowMonthUsage from t_energy 
                        where dong_code = '${dongCode}' and ho_code = '${hoCode}'
                        and energy_dtime > '${fWaterBaseDate}'  `;
        strSQL = " union all ";
      } else if (resultList[i].energy_type === "gas") {
        fGas = resultList[i].energy_type;
        fGasBaseDate = resultList[i].meter_base_date + "";
        fGasUnit = resultList[i].energy_unit;
        console.log("fGasBaseDate=", fGasBaseDate);

        if (fGasBaseDate === "0") {
          fGasBaseDate = prevMonthDayE;
        } else {
          if (fGasBaseDate.length === 1) fGasBaseDate = "0" + fGasBaseDate;

          fGasBaseDate = nowMonthDayS.substring(0, 8) + fGasBaseDate;
        }
        sql =
          sql +
          strSQL +
          `select 'gas' as energyType, sum(gas_usage) as nowMonthUsage from t_energy 
                        where dong_code = '${dongCode}' and ho_code = '${hoCode}'
                        and energy_dtime > '${fGasBaseDate}'  `;
        strSQL = " union all ";
      } else if (resultList[i].energy_type === "hotWater") {
        fHotWater = resultList[i].energy_type;
        fHotWaterBaseDate = resultList[i].meter_base_date + "";
        fHotWaterUnit = resultList[i].energy_unit;
        console.log("fHotWaterBaseDate=", fHotWaterBaseDate);

        if (fHotWaterBaseDate === "0") {
          fHotWaterBaseDate = prevMonthDayE;
        } else {
          if (fHotWaterBaseDate.length === 1)
            fHotWaterBaseDate = "0" + fHotWaterBaseDate;

          fHotWaterBaseDate = nowMonthDayS.substring(0, 8) + fHotWaterBaseDate;
        }
        sql =
          sql +
          strSQL +
          `select 'hotWater' as energyType, sum(hot_water_usage) as nowMonthUsage from t_energy 
                        where dong_code = '${dongCode}' and ho_code = '${hoCode}'
                        and energy_dtime > '${fHotWaterBaseDate}'  `;
        strSQL = " union all ";
      } else if (resultList[i].energy_type === "heating") {
        fHeating = resultList[i].energy_type;
        fHeatingBaseDate = resultList[i].meter_base_date + "";
        fHeatingUnit = resultList[i].energy_unit;
        console.log("fHeatingBaseDate=", fHeatingBaseDate);

        if (fHeatingBaseDate === "0") {
          fHeatingBaseDate = prevMonthDayE;
        } else {
          if (fHeatingBaseDate.length === 1)
            fHeatingBaseDate = "0" + fHeatingBaseDate;

          fHeatingBaseDate = nowMonthDayS.substring(0, 8) + fHeatingBaseDate;
        }
        sql =
          sql +
          strSQL +
          `select 'heating' as energyType, sum(heating_usage) as nowMonthUsage from t_energy 
                        where dong_code = '${dongCode}' and ho_code = '${hoCode}'
                        and energy_dtime > '${fHeatingBaseDate}'  `;
        strSQL = " union all ";
      } else if (resultList[i].energy_type === "aircon") {
        fAircon = resultList[i].energy_type;
        fAirconBaseDate = resultList[i].meter_base_date + "";
        fAirconUnit = resultList[i].energy_unit;
        console.log("fAirconBaseDate=", fAirconBaseDate);

        if (fAirconBaseDate === "0") {
          fAirconBaseDate = prevMonthDayE;
        } else {
          if (fAirconBaseDate.length === 1)
            fAirconBaseDate = "0" + fAirconBaseDate;

          fAirconBaseDate = nowMonthDayS.substring(0, 8) + fAirconBaseDate;
        }
        sql =
          sql +
          strSQL +
          `select 'aircon' as energyType, sum(aircon_usage) as nowMonthUsage from t_energy 
                        where dong_code = '${dongCode}' and ho_code = '${hoCode}'
                        and energy_dtime >= '${fAirconBaseDate}'  `;
        strSQL = " union all ";
      }
    }

    // console.log("fElec=>" + fElec);
    // console.log("fWater=>" + fWater);
    // console.log("fGas=>" + fGas);
    // console.log("fHotWater=>" + fHotWater);
    // console.log("fHeating=>" + fHeating);
    // console.log("fAircon=>" + fAircon);

    //console.log("sql2=>" + sql);

    /*

    const data2 = await pool.query(sql2, [dongCode]);

    let resultCnt = data2[0];

    console.log("resultList : ", resultList);
    // console.log("resultCnt[0].cnt : ", resultCnt[0].cnt);

    let jsonResult = {
      resultCode: "00",
      resultMsg: "NORMAL_SERVICE",
      numOfRows,
      totalCount: resultCnt[0].cnt + "",
      doubleDataFlag,
      data: {
        dongCode,
        hoCode,
        interfaceType,
        items: resultList,
      },
    };
*/
    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

module.exports = router;
