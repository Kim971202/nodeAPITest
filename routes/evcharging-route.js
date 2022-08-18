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

//전기차충전 이력 리스트 조회
router.get("/getEVChargingLog", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    numOfRows = 10, //           페이지 당 결과수
    pageNo = 1, //               페이지 번호
    doubleDataFlag = "Y", //     2배수 데이터 사용여부
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
    //viewPeriod = "ALL", //       조회기간전체: (ALL)/일주일(1WEEK)/1개월(1MONTH)/3개월(3MONTH)
  } = req.query;

  console.log(
    serviceKey,
    numOfRows,
    pageNo,
    dongCode,
    hoCode,
    doubleDataFlag
    //viewPeriod
  );
  //http://localhost:3000/evcharging/getEVChargingLog?serviceKey=22222&numOfRows=5&pageNo=1&dongCode=101&hoCode=101&doubleDataFlag=Y
  //&viewPeriod=ALL

  //let startDate = viewPeriodDate(viewPeriod);
  //console.log("startDate : ", startDate);

  try {
    let sRow = (pageNo - 1) * numOfRows;
    //console.log("sRow = %d", sRow);
    //ex: 2page start = (2-1) * 10

    let size = numOfRows * (doubleDataFlag === "Y" ? 2 : 1);
    //console.log("size= %d", size);

    const sql = `select idx, charger_status as chargerStatus, charger_id, charger_loc, 
                        (
                          CASE WHEN charger_type = '완속' THEN 'slow'
                               WHEN charger_type = '급속' THEN 'fast'
                              ELSE '-'
                          END
                        ) as  chargerType,
                        DATE_FORMAT(charge_start_dtime, '%Y%m%d%h%i%s') as startDTime, 
                        DATE_FORMAT(charge_end_dtime, '%Y%m%d%h%i%s') as endDTime,
                        charge_remain_time as remainTime, use_fee as chargeUseFee, charge_amount as fillingAmount
                 from t_ev_charging_log where dong_code = ? and ho_code = ?  
                 limit ?, ?`;

    console.log("sql=>" + sql);
    const data = await pool.query(sql, [
      dongCode,
      hoCode,
      Number(sRow),
      Number(size),
    ]);
    let resultList = data[0];

    const sql2 =
      "select count(*) as cnt from t_ev_charging_log where dong_code = ? and ho_code = ?";
    const data2 = await pool.query(sql2, [dongCode, hoCode]);

    let resultCnt = data2[0];

    console.log("resultList : ", resultList);
    // console.log("resultCnt[0].cnt : ", resultCnt[0].cnt);

    let jsonResult = {
      resultCode: "00",
      resultMsg: "NORMAL_SERVICE",
      numOfRows,
      pageNo,
      totalCount: resultCnt[0].cnt + "",
      doubleDataFlag,
      data: {
        dongCode,
        hoCode,
        //viewPeriod,
        items: resultList,
      },
    };

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

module.exports = router;
