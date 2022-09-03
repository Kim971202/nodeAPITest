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

//주요연락처 목록조회
router.get("/getKeyContactList", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    numOfRows = 10, //           페이지 당 결과수
    pageNo = 1, //               페이지 번호
    doubleDataFlag = "Y", //     2배수 데이터 사용여부
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
    contactFlag = "ALL", //      전체(ALL)//단지시설(1)/공공기관(2)/주변상가(3)/기타시설(4)
    facilityName = "ALL", //     전체(ALL)/시설명칭
  } = req.query;

  console.log(
    serviceKey,
    numOfRows,
    pageNo,
    dongCode,
    hoCode,
    doubleDataFlag,
    contactFlag,
    facilityName
  );
  //http://localhost:3000/keycontact/getKeyContactList?serviceKey=22222&numOfRows=10&pageNo=1&dongCode=101&hoCode=101&doubleDataFlag=Y&contactFlag=ALL&facilityName=ALL

  let contactFlag_ = "";
  if (contactFlag === "ALL") contactFlag_ = "%";
  else if (contactFlag === 1) contactFlag_ = "단지시설";
  else if (contactFlag === 2) contactFlag_ = "공공기관";
  else if (contactFlag === 3) contactFlag_ = "주변상가";
  else if (contactFlag === 4) contactFlag_ = "기타시설";

  let facilityName_ = facilityName + "%";
  if (facilityName === "ALL") facilityName_ = "%";

  console.log("contactFlag_=>" + contactFlag_);
  console.log("facilityName_=>" + facilityName_);

  try {
    let sRow = (pageNo - 1) * numOfRows;
    //console.log("sRow = %d", sRow);
    //ex: 2page start = (2-1) * 10

    let size = numOfRows * (doubleDataFlag === "Y" ? 2 : 1);
    //console.log("size= %d", size);

    const sql = `select contact_flag as contactFlagName, facility_name as facilityName, phone_num as phoneNum
                 from t_key_contact
                 where contact_flag LIKE ? and facility_name LIKE ?
                 limit ?, ?`;

    console.log("sql=>" + sql);
    const data = await pool.query(sql, [
      contactFlag_,
      facilityName_,
      Number(sRow),
      Number(size),
    ]);
    let resultList = data[0];

    const sql2 =
      "select count(*) as cnt from t_key_contact where contact_flag LIKE ? and facility_name LIKE ? ";
    const data2 = await pool.query(sql2, [contactFlag_, facilityName_]);

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
        contactFlag,
        facilityName,
        items: resultList,
      },
    };

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

module.exports = router;
