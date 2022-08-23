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

//민원신청타입코드 조회
router.get("/getApplicationCompaintType", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    numOfRows = 10, //           페이지 당 결과수
    pageNo = 1, //               페이지 번호
    doubleDataFlag = "Y", //     2배수 데이터 사용여부
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
  } = req.query;

  console.log(serviceKey, numOfRows, pageNo, dongCode, hoCode, doubleDataFlag);
  //http://localhost:3000/complaint/getApplicationCompaintType?serviceKey=22222&numOfRows=5&pageNo=1&dongCode=101&hoCode=101&doubleDataFlag=Y

  try {
    let sRow = (pageNo - 1) * numOfRows;
    //console.log("sRow = %d", sRow);
    //ex: 2page start = (2-1) * 10

    let size = numOfRows * (doubleDataFlag === "Y" ? 2 : 1);
    //console.log("size= %d", size);

    const sql = `select app_code as appCode, app_name as appCodeName
                 from t_complaints_type 
                 order by app_code, sort_order
                 limit ?, ?`;

    console.log("sql=>" + sql);
    const data = await pool.query(sql, [Number(sRow), Number(size)]);
    let resultList = data[0];

    const sql2 = "select count(*) as cnt from t_complaints_type";
    const data2 = await pool.query(sql2);

    let resultCnt = data2[0];

    console.log("resultList : ", resultList);
    // console.log("resultCnt[0].cnt : ", resultCnt[0].cnt);

    let jsonResult = {
      resultCode: "0000",
      resultMsg: "NORMAL_SERVICE",
      numOfRows,
      pageNo,
      totalCount: resultCnt[0].cnt + "",
      doubleDataFlag,
      data: {
        dongCode,
        hoCode,
        items: resultList,
      },
    };

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

//민원신청현황 목록조회
router.get("/getApplicationCompaintList", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    numOfRows = 10, //           페이지 당 결과수
    pageNo = 1, //               페이지 번호
    doubleDataFlag = "Y", //     2배수 데이터 사용여부
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
    appCode = "ALL", //          민원유형: 전체(ALL)/월패드에서 호출 시 : 1(보수신청)
    viewPeriod = "ALL", //       조회기간전체: (ALL)/일주일(1WEEK)/1개월(1MONTH)/3개월(3MONTH)
    progressStatus = "3", //     진행상태: 신청(1)/접수(2)/처리(3)/ 취소(0)
  } = req.query;

  console.log(
    serviceKey,
    numOfRows,
    pageNo,
    dongCode,
    hoCode,
    doubleDataFlag,
    appCode,
    viewPeriod,
    progressStatus
  );
  //http://localhost:3000/complaint/getApplicationCompaintList?serviceKey=222222&numOfRows=10&pageNo=1&doublDataFlag=Y&dongCode=101&hoCode=101&appCode=ALL&viewPeriod=ALL&progressStatus=3

  let appCode_ = appCode === "ALL" ? "%" : appCode;

  let startDate = viewPeriodDate(viewPeriod);

  console.log("appCode_ : ", appCode_);
  console.log("startDate : ", startDate);

  try {
    let sRow = (pageNo - 1) * numOfRows;
    //console.log("sRow = %d", sRow);
    //ex: 2page start = (2-1) * 10

    let size = numOfRows * (doubleDataFlag === "Y" ? 2 : 1);
    //console.log("size= %d", size);

    // 문서상 삭제된 a.app_content, 삭제
    let sql = `select a.idx, a.app_title as appTitle, DATE_FORMAT(a.app_date, '%Y%m%d%h%i%s') as appDate, 
                      a.app_code as appCode, a.progress_status as progressStatus 
               from t_application_complaint a inner join t_complaints_type b
               on a.app_code = b.app_code
               where a.dong_code = ? and a.ho_code = ? and a.app_code like ? and a.app_date >= ? 
               limit ?, ? `;

    console.log("sql=>" + sql);

    const data = await pool.query(sql, [
      dongCode,
      hoCode,
      appCode_,
      startDate,
      Number(sRow),
      Number(size),
    ]);
    let resultList = data[0];

    const sql2 = `select count(*) as cnt  
                  from t_application_complaint a inner join t_complaints_type b
                  on a.app_code = b.app_code
                  where a.dong_code = ? and a.ho_code = ? and a.app_code like ? and a.app_date >= ?`;
    const data2 = await pool.query(sql2, [
      dongCode,
      hoCode,
      appCode_,
      startDate,
    ]);

    let resultCnt = data2[0];

    console.log("resultList : ", resultList);
    // console.log("resultCnt[0].cnt : ", resultCnt[0].cnt);

    let jsonResult = {
      resultCode: "0000",
      resultMsg: "NORMAL_SERVICE",
      numOfRows,
      pageNo,
      totalCount: resultCnt[0].cnt + "",
      doubleDataFlag,
      data: {
        dongCode,
        hoCode,
        appCode,
        //viewPeriod,
        items: resultList,
      },
    };

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

//민원신청 상세보기 조회
router.get("/getApplicationCompaintDetail", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    numOfRows = 10, //           페이지 당 결과수
    pageNo = 1, //               페이지 번호
    doubleDataFlag = "Y", //     2배수 데이터 사용여부
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
    idx = "0", //                idx
  } = req.query;

  console.log(
    serviceKey,
    numOfRows,
    pageNo,
    dongCode,
    hoCode,
    doubleDataFlag,
    idx
  );
  //http://localhost:3000/complaint/getApplicationCompaintDetail?serviceKey=222222&numOfRows=10&pageNo=1&doublDataFlag=Y&dongCode=101&hoCode=101&idx=3

  try {
    let sRow = (pageNo - 1) * numOfRows;
    //console.log("sRow = %d", sRow);
    //ex: 2page start = (2-1) * 10

    let size = numOfRows * (doubleDataFlag === "Y" ? 2 : 1);
    //console.log("size= %d", size);

    let sql = `select a.idx, a.app_title as appTitle, DATE_FORMAT(a.app_date, '%Y%m%d%h%i%s') as appDate, 
                      a.app_code as appCode, b.app_name as appName, a.app_content as appContent, a.progress_status as progressStatus,
                      app_receipt_date as appReceiptDate,  DATE_FORMAT(a.app_complete_date, '%Y%m%d%h%i') as appCompleteDate
               from t_application_complaint a inner join t_complaints_type b
               on a.app_code = b.app_code
               where a.idx = ? `;

    console.log("sql=>" + sql);

    const data = await pool.query(sql, [idx]);

    let resultList = "";
    let appTitle = "";
    let appDate = "";
    let appContent = "";
    let appName = "";
    let appCode = "";
    let progressStatus = "";
    let appReceiptDate = "";
    let appCompleteDate = "";

    resultList = data[0];
    if (resultList.length > 0) {
      appTitle = resultList[0].appTitle;
      appDate = resultList[0].appDate;
      appContent = resultList[0].appContent;
      appCode = resultList[0].appCode;
      appName = resultList[0].appName;
      progressStatus = resultList[0].progressStatus;
      appReceiptDate = resultList[0].appReceiptDate;
      appCompleteDate = resultList[0].appCompleteDate;
    }

    //console.log(resultList[0].notiTitle);

    let jsonResult = {
      resultCode: "00",
      resultMsg: "NORMAL_SERVICE",
      data: {
        dongCode,
        hoCode,
        idx,
        appTitle,
        appDate,
        appCode,
        appName,
        appContent,
        progressStatus,
        appReceiptDate,
        appCompleteDate,
      },
    };

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

//민원신청 등록
router.post("/postApplicationCompaint", async (req, res, next) => {
  // console.log(JSON.stringify(req.body));
  // console.log(req.body);

  let {
    serviceKey = "", //   서비스 인증키
    dongCode = "", //     동코드
    hoCode = "", //       호코드
    appTitle = "", //     민원제목
    appDate = "", //      신청일자
    appCode = "", //      민원유형코드
    appMethod = "W", //    신청방법 : 월패드(W), 스마트폰(S)
    appContent = "dddfsfsdfsdf",
  } = req.body;

  console.log(
    serviceKey,
    dongCode,
    hoCode,
    appTitle,
    appDate,
    appCode,
    appMethod,
    appContent
  );
  //http://localhost:3000/complaint/postApplicationCompaint  {"serviceKey":"11111111","dongCode":"101","hoCode":"1","appTitle":"하자보수 신청 건","appDate":"20220718","appCode": "1", “appMethod”: “W”}

  let resulCode = "00";
  if (serviceKey === "") resulCode = "10"; // INVALID_REQUEST_PARAMETER_ERROR

  if (dongCode === "") resulCode = "10";

  if (hoCode === "") resulCode = "10";

  if (appTitle === "") resulCode = "10";

  if (isDate(appDate) === 0) {
    appDate = strDateFormat(appDate);
  } else resulCode = "10";

  if (appCode === "") resulCode = "10";

  if (appMethod === "") resulCode = "10";

  if (appContent === "") resulCode = "10";

  console.log("appDate=> " + appDate);
  console.log("resulCode=> " + resulCode);

  if (resulCode === "00") {
    try {
      let sql = `insert into t_application_complaint(app_title, app_date, app_code, app_method, app_content, progress_status, dong_code, ho_code) 
        values (?, ?, ?, ?, ?, 1, ?, ?) `;
      console.log("sql=>" + sql);
      const data = await pool.query(sql, [
        appTitle,
        appDate,
        appCode,
        appMethod,
        appContent,
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

//민원신청 수정
router.put("/putApplicationCompaint", async (req, res, next) => {
  // console.log(JSON.stringify(req.body));
  // console.log(req.body);

  let {
    serviceKey = "", //   서비스 인증키
    dongCode = "", //     동코드
    hoCode = "", //       호코드
    idx = 0, //            idx
    appTitle = "", //     민원제목
    appDate = "", //      신청일자
    appCode = "", //      민원유형코드
    appMethod = "W", //   신청방법 : 월패드(W), 스마트폰(S)
    appContent = "dddfsfsdfsdf",
    progressStatus = "", // 진행상태
  } = req.body;

  console.log(
    serviceKey,
    dongCode,
    hoCode,
    idx,
    appTitle,
    appDate,
    appCode,
    appMethod,
    appContent,
    progressStatus
  );
  //http://localhost:3000/complaint/putApplicationCompaint  {"serviceKey":"11111111","dongCode":"101", "idx":"1", "hoCode":"1","appTitle":"하자보수 신청 건","appDate":"20220718","appCode": "1", “appMethod”: “W”, "progressStatus":"2"}

  let resulCode = "00";
  if (serviceKey === "") resulCode = "10"; // INVALID_REQUEST_PARAMETER_ERROR

  if (dongCode === "") resulCode = "10";

  if (hoCode === "") resulCode = "10";

  if (appTitle === "") resulCode = "10";

  if (isDate(appDate) === 0) {
    appDate = strDateFormat(appDate);
  } else resulCode = "10";

  if (appCode === "") resulCode = "10";

  if (appMethod === "") resulCode = "10";

  if (appContent === "") resulCode = "10";

  if (progressStatus === "") resulCode = "10";

  console.log("appDate=> " + appDate);
  console.log("resulCode=> " + resulCode);

  if (resulCode === "00") {
    try {
      let sql = `update t_application_complaint set 
                        app_title = ?, 
                        app_date = ?, 
                        app_code = ?, 
                        app_method = ?, 
                        app_content = ?,
                        progressStatus = ? 
                 where idx = ? `;
      console.log("sql=>" + sql);
      const data = await pool.query(sql, [
        appTitle,
        appDate,
        appCode,
        appMethod,
        appContent,
        progressStatus,
        idx,
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

//민원정보 삭제
router.delete("/delApplicationCompaint", async (req, res, next) => {
  // console.log(JSON.stringify(req.body));
  // console.log(req.body);

  let {
    serviceKey = "", //   서비스 인증키
    dongCode,
    hoCode,
    idx = "",
  } = req.body;

  console.log(serviceKey, dongCode, hoCode, idx);
  //http://localhost:3000/complaint/delApplicationCompaint  {"serviceKey":"11111111", “dongCode”: “101”, “hoCode”: “101”, “idx”: “1”}

  let resulCode = "00";

  if (serviceKey === "") resulCode = "10"; // INVALID_REQUEST_PARAMETER_ERROR

  if (dongCode === "") resulCode = "10";

  if (hoCode === "") resulCode = "10";

  if (resulCode !== "00")
    return res.json({ resultCode: "01", resultMsg: "에러" });

  try {
    let sql = "delete from t_application_complaint where idx = ? ";
    console.log("sql=>" + sql);
    const data = await pool.query(sql, [idx]);
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
