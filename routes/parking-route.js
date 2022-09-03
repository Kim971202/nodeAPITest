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

//입출차 리스트 조회
router.get("/getParkingIOList", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    numOfRows = 10, //           페이지 당 결과수
    pageNo = 1, //               페이지 번호
    doubleDataFlag = "Y", //     2배수 데이터 사용여부
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
    carNo = "ALL", //            차량번호
    carFlag = "ALL", //          차량구분: 전체(ALL)/세대(HOUSEHOLD)/방문(VISIT)
    viewPeriod = "ALL", //       조회기간전체: (ALL)/일주일(1WEEK)/1개월(1MONTH)/3개월(3MONTH)
  } = req.query;

  console.log(
    serviceKey,
    numOfRows,
    pageNo,
    dongCode,
    hoCode,
    doubleDataFlag,
    carNo,
    carFlag,
    viewPeriod
  );
  //http://localhost:3000/parking/getParkingIOList?serviceKey=22222&numOfRows=5&pageNo=2&dongCode=101&hoCode=101&doubleDataFlag=Y&L&carNo=ALL&carFlag=ALL&viewPeriod=ALL

  let carNo_ = carNo === "ALL" ? "%" : carNo;

  let carFlag_ = "%";
  if (carFlag === "HOUSEHOLD") carFlag_ = "세대";
  else if (carFlag === "VISIT") carFlag_ = "방문";

  let startDate = viewPeriodDate(viewPeriod);

  console.log("startDate : ", startDate);

  try {
    let sRow = (pageNo - 1) * numOfRows;
    //console.log("sRow = %d", sRow);
    //ex: 2page start = (2-1) * 10

    let size = numOfRows * (doubleDataFlag === "Y" ? 2 : 1);
    //console.log("size= %d", size);

    const sql = `select DATE_FORMAT(inout_dtime, '%Y%m%d%h%i') as inoutDate, car_no as carNo, inout_flag as inoutFlag, car_flag as  carFlag
                 from t_parking_io where dong_code = ? and ho_code = ? and car_no like ? and car_flag like ? and inout_dtime >= ?
                 limit ?, ?`;

    console.log("sql=>" + sql);
    const data = await pool.query(sql, [
      dongCode,
      hoCode,
      carNo_,
      carFlag_,
      startDate,
      Number(sRow),
      Number(size),
    ]);
    let resultList = data[0];

    const sql2 =
      "select count(*) as cnt from t_parking_io where car_no like ? and car_flag = ? and inout_dtime >= ?";
    const data2 = await pool.query(sql2, [carNo_, carFlag, startDate]);

    let resultCnt = data2[0];

    console.log("resultList : ", resultList);
    // console.log("resultCnt[0].cnt : ", resultCnt[0].cnt);

    let jsonResult = {
      resultCode: "00",
      resultMsg: "NORMAL_SERVICE",
      numOfRows,
      pageNo,
      dongCode,
      hoCode,
      totalCount: resultCnt[0].cnt + "",
      doubleDataFlag,
      data: {
        carNo,
        carFlag,
        viewPeriod,
        items: resultList,
      },
    };

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

router.get("/getParkingResvList", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    numOfRows = 10, //           페이지 당 결과수
    pageNo = 1, //               페이지 번호
    doubleDataFlag = "Y", //     2배수 데이터 사용여부
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
    carNo = "ALL", //            차량번호: 전체(ALL)/차량번호
    inCarFlag = "ALL", //        입차여부: 전체(ALL)/입차(IN)
    viewPeriod = "ALL", //       조회기간전체: (ALL)/일주일(1WEEK)/1개월(1MONTH)/3개월(3MONTH)
  } = req.query;

  console.log(
    serviceKey,
    numOfRows,
    pageNo,
    dongCode,
    hoCode,
    doubleDataFlag,
    carNo,
    inCarFlag,
    viewPeriod
  );
  //http://localhost:3000/parking/getParkingResvList?serviceKey=222222&numOfRows=10&pageNo=1&doublDataFlag=Y&dongCode=101&hoCode=101&carNo=ALL&inCarFlag=ALL&viewPeriod=ALL

  let carNo_ = carNo === "ALL" ? "%" : carNo;
  let inCarFlag_ = inCarFlag === "IN" ? inCarFlag : "%";

  let startDate = viewPeriodDate(viewPeriod);

  console.log("carNo : ", carNo);
  console.log("carNo_ : ", carNo_);
  console.log("inCarFlag_ : ", inCarFlag_);
  console.log("startDate : ", startDate);

  try {
    let sRow = (pageNo - 1) * numOfRows;
    //console.log("sRow = %d", sRow);
    //ex: 2page start = (2-1) * 10

    let size = numOfRows * (doubleDataFlag === "Y" ? 2 : 1);
    //console.log("size= %d", size);

    // DATEDIFF(vis_end_date, vis_start_date) as visStartCnt,
    let sql = `select DATE_FORMAT(vis_start_date, '%Y%m%d%h%i%s') as visStartDate,
                        resv_no as resvNo,
                        car_no as carNo,
                        inout_flag as inCarFlag `;
    const fSQL =
      " from t_parking_resv where dong_code = ? and ho_code = ? and car_no like ? and inout_flag like ? and vis_start_date >= ? ";
    const lSQL = " limit ?, ? ";
    sql = sql + fSQL + lSQL;
    console.log("sql=>" + sql);

    const data = await pool.query(sql, [
      dongCode,
      hoCode,
      carNo_,
      inCarFlag_,
      startDate,
      Number(sRow),
      Number(size),
    ]);
    let resultList = data[0];

    const sql2 = "select count(*) as cnt " + fSQL;
    const data2 = await pool.query(sql2, [
      dongCode,
      hoCode,
      carNo_,
      inCarFlag_,
      startDate,
    ]);

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
        carNo,
        inCarFlag,
        viewPeriod,
        items: resultList,
      },
    };

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

//방문자 주차 등록
router.post("/postParkingResv", async (req, res, next) => {
  // console.log(JSON.stringify(req.body));
  // console.log(req.body);

  let {
    serviceKey = "", //   서비스 인증키
    dongCode = "", //     동코드
    hoCode = "", //       호코드
    visStartDate = "", // 방문예정일자
    visStartCnt = "", //  방문예정일수
    carNo = "", //        차량번호
    resvMethod = "", //   예약방법:월패드(W)/스마트폰(S)
  } = req.body;

  console.log(
    serviceKey,
    dongCode,
    hoCode,
    visStartDate,
    visStartCnt,
    carNo,
    resvMethod
  );
  //http://localhost:3000/parking/postParkingResv  {"serviceKey":"11111111","dongCode":"101","hoCode":"101","visStartDate":"202206281359","visStartCnt":"1","carNo":"1가1111", "resvMethod": "W"}

  let resulCode = "00";
  if (serviceKey === "") resulCode = "10"; // INVALID_REQUEST_PARAMETER_ERROR
  if (dongCode === "") resulCode = "10";
  if (hoCode === "") resulCode = "10";
  //if (visStartDate === "") resulCode = "10";
  if (isDate(visStartDate) === 0) visStartDate = strDateFormat(visStartDate);
  else resulCode = "10";
  if (visStartCnt === "") resulCode = "10";
  if (carNo === "") resulCode = "10";
  if (resvMethod === "") resulCode = "10";

  let visEndDate = addDays(new Date(visStartDate), visStartCnt);
  console.log("visStartDate=> " + visStartDate);
  console.log("visEndDate=> " + visEndDate);
  console.log("resulCode=> " + resulCode);

  if (resulCode === "00") {
    try {
      // 주차예약기준에 부합하는지 확인(월최대예약일수, 일최대예약건수, 건별 최대 예약일수)
      let sDate = getDateOfMonthByFlag(visStartDate, 1); //금월 1일
      let eDate = getDateOfMonthByFlag(visStartDate, 3); //익월 1일
      let vDate = visStartDate;

      let pSQL = `select month_max_day as monthMaxDays, max_num_per_day as maxNumPerDays,
                      (select sum(datediff(vis_end_date, vis_start_date)+1) from t_parking_resv
                      where vis_start_date >= '${sDate}' and vis_start_date<= '${eDate}' and dong_code = '${dongCode}' and ho_code = '${hoCode}'
                      group by dong_code, ho_code) as monthUseDays,
                      (select count(datediff(vis_end_date, vis_start_date)+1) from t_parking_resv
                      where vis_start_date <= '${vDate}' and vis_end_date > '${vDate}' and dong_code = '${dongCode}' and ho_code = '${hoCode}'
                      group by dong_code, ho_code) as maxUseDays
                  from t_parking_resv_conf`;
      console.log("pSQL=>" + pSQL);
      //const pData = await pool.query(pSQL, [visStartDate]);
      const pData = await pool.query(pSQL, []);
      let result = pData[0];
      console.log(
        Number(result[0].monthMaxDays),
        Number(result[0].monthUseDays)
      );
      console.log(
        Number(result[0].maxNumPerDays),
        Number(result[0].maxUseDays)
      );

      if (result.length < 1)
        return res.json({ resultCode: "01", resultMsg: "에러" });

      if (Number(result[0].monthMaxDays) <= Number(result[0].monthUseDays))
        return res.json({
          resultCode: "02",
          resultMsg: "월 예약가능 일수를 초과했습니다.",
        });

      if (Number(result[0].maxNumPerDays) <= Number(result[0].maxUseDays))
        return res.json({
          resultCode: "03",
          resultMsg: "일 예약가능 일수를 초과했습니다.",
        });

      // 방문에약 등록
      let sql =
        "insert into t_parking_resv(vis_start_date, vis_end_date, car_no, resv_method, dong_code, ho_code) values (?,?,?,?,?,?) ";
      console.log("sql=>" + sql);
      const data = await pool.query(sql, [
        visStartDate,
        visEndDate,
        carNo,
        resvMethod,
        dongCode,
        hoCode,
      ]);
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

//방문자 주차 삭제
router.delete("/delParkingResv", async (req, res, next) => {
  // console.log(JSON.stringify(req.body));
  // console.log(req.body);

  let {
    serviceKey = "", //   서비스 인증키
    resvNo = "", //        예약번호
  } = req.body;

  console.log(serviceKey, resvNo);
  //http://localhost:3000/parking/delParkingResv  {"serviceKey":"11111111", "resvNo": "13"}

  let resulCode = "00";
  if (serviceKey === "") resulCode = "10"; // INVALID_REQUEST_PARAMETER_ERROR
  if (resvNo === "") resulCode = "10";

  if (resulCode !== "00")
    return res.json({ resultCode: "01", resultMsg: "에러" });

  try {
    // 방문에약 삭제
    let sql = "delete from t_parking_resv where resv_no = ? ";
    console.log("sql=>" + sql);
    const data = await pool.query(sql, [resvNo]);
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
});

module.exports = router;
