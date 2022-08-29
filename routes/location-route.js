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

//위치 리스트 조회
router.get("/getLocationList", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    numOfRows = 10, //           페이지 당 결과수
    pageNo = 1, //               페이지 번호
    doubleDataFlag = "Y", //     2배수 데이터 사용여부
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
    locFlag = "PARKING", //      위치구분: 가족위치(FAMILY)/주차위치(PARKING)
    viewPeriod = "ALL", //       조회기간전체: (ALL)/일주일(1WEEK)/1개월(1MONTH)/3개월(3MONTH)
  } = req.query;

  console.log(
    serviceKey,
    numOfRows,
    pageNo,
    dongCode,
    hoCode,
    doubleDataFlag,
    locFlag,
    viewPeriod
  );
  //http://localhost:3000/location/getLocationList?serviceKey=11111111&numOfRows=10&pageNo=1&doublDataFlag=Y&dongCode=101&hoCode=101&locFlag=FAMILY&viewPeriod=ALL

  let sDate = viewPeriodDate(viewPeriod);

  let loc_tb = "";
  let fSQL = "";

  if (locFlag === "FAMILY") {
    fSQL = `select 0 as idx, 
                    tag_id as tagId, tag_name as tagName, tag_desc as tagDesc, pos_desc as posDesc,
                    '' as floorName, '' as buildingName, '' as posX, '' as posY, '' as imgURL,
                    DATE_FORMAT(pos_update_date, '%Y%m%d%h%i%s') as posUpdateDate
                    from t_family_loc 
                    where dong_code = ? and ho_code = ?`;

    loc_tb = "t_family_loc";
  } else if (locFlag === "PARKING") {
    fSQL = `select  idx, 
                    tag_id as tagId, tag_name as tagName, tag_desc as tagDesc, pos_desc as posDesc,
                    floor_name as floorName, building_name as buildingName, pos_x as posX, pos_y as posY, '' as imgURL,
                    DATE_FORMAT(pos_update_date, '%Y%m%d%h%i%s') as posUpdateDate
                    from t_parking_loc 
                    where pos_update_date >= '${sDate}' and dong_code = ? and ho_code = ?`;

    loc_tb = "t_parking_loc";
  }

  console.log("loc_tb : ", loc_tb);

  try {
    let sRow = (pageNo - 1) * numOfRows;
    //console.log("sRow = %d", sRow);
    //ex: 2page start = (2-1) * 10

    let size = numOfRows * (doubleDataFlag === "Y" ? 2 : 1);
    //console.log("size= %d", size);

    const sql = fSQL + " limit ?, ?";

    console.log("sql=>" + sql);
    const data = await pool.query(sql, [
      dongCode,
      hoCode,
      Number(sRow),
      Number(size),
    ]);
    let resultList = data[0];

    const sql2 = `select count(*) as cnt from ${loc_tb} where dong_code = ? and ho_code = ?`;
    const data2 = await pool.query(sql2, [dongCode, hoCode]);

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
        locFlag,
        viewPeriod,
        items: resultList,
      },
    };

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

//위치태그 명칭 변경
router.put("/putLocationTagName", async (req, res, next) => {
  // console.log(JSON.stringify(req.body));
  // console.log(req.body);

  let {
    serviceKey = "", //   서비스 인증키
    dongCode = "", //     동코드
    hoCode = "", //       호코드
    tagId = "", //        태그아이디
    tagName = "", //      태그사용자명
  } = req.body;

  console.log(serviceKey, dongCode, hoCode, tagId, tagName);
  //http://localhost:3000/location/putLocationTagName  {"serviceKey":"11111111", “dongCode”: “101”,“hoCode”: “101”,“tagId”: “11111113”,“tagName”: “홍길동태그”}

  let resulCode = "00";
  if (serviceKey === "") resulCode = "10"; // INVALID_REQUEST_PARAMETER_ERROR
  if (dongCode === "") resulCode = "10";
  if (hoCode === "") resulCode = "10";
  if (tagId === "") resulCode = "10";
  if (tagName === "") resulCode = "10";

  if (resulCode !== "00")
    return res.json({ resultCode: "01", resultMsg: "에러" });

  try {
    // 태그사용자명 수정
    let sql = "update t_family_loc set tag_desc = ? where tag_id = ? ";
    console.log("sql=>" + sql);
    const data = await pool.query(sql, [tagName, tagId]);
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
