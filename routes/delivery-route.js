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

router.get("/getParcelList", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    numOfRows = 10, //           페이지 당 결과수
    pageNo = 1, //               페이지 번호
    doubleDataFlag = "Y", //     2배수 데이터 사용여부
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
    parcelStatus = "ALL", //     택배상태:전체(ALL/ 보관함(LOCKER)/반품(RETURN)/수령(RECEIPT)
    viewPeriod = "ALL", //       조회기간전체: (ALL)/일주일(1WEEK)/1개월(1MONTH)/3개월(3MONTH)
  } = req.query;

  console.log(
    serviceKey,
    numOfRows,
    pageNo,
    doubleDataFlag,
    dongCode,
    hoCode,
    parcelStatus,
    viewPeriod
  );
  //http://localhost:3000/delivery/getParcelList?serviceKey=22222&numOfRows=5&pageNo=2&dongCode=101&hoCode=101&doubleDataFlag=Y&parcelStatus=ALL&viewPeriod=ALL

  let parcelStatus_ = "%";

  if (parcelStatus === "LOCKER") parcelStatus_ = "0";
  else if (parcelStatus === "RETURN") parcelStatus_ = "1";
  else if (parcelStatus === "RECEIPT") parcelStatus_ = "2";
  console.log("parcelStatus_=>" + parcelStatus_);

  let arrivalTime = viewPeriodDate(viewPeriod);

  try {
    let sRow = (pageNo - 1) * numOfRows;
    //console.log("sRow = %d", sRow);
    //ex: 2page start = (2-1) * 10

    let size = numOfRows * (doubleDataFlag === "Y" ? 2 : 1);
    //console.log("size= %d", size);

    const sql = `select DATE_FORMAT(arrival_time, '%Y%m%d%H%i%s') as arrivalDate, 
      (
          CASE WHEN parcel_status = 0 THEN '보관함'
              WHEN parcel_status = 1 THEN '수령'
              WHEN parcel_status = 2 THEN '반품'
              ELSE 'not'
          END
      ) as parcelStatus, IFNULL(memo, '') as parcelCorp from t_delivery where dong_code = ? and ho_code = ?  and arrival_time >= ? and parcel_status LIKE ? limit ?, ?`;
    const data = await pool.query(sql, [
      dongCode,
      hoCode,
      arrivalTime,
      parcelStatus_,
      Number(sRow),
      Number(size),
    ]);
    let resultList = data[0];
    console.log("sql=>" + sql);
    console.log("resultList=>" + resultList);
    const sql2 =
      "select count(*) as cnt from t_delivery where dong_code = ? and ho_code = ? and arrival_time >= ? and parcel_status LIKE ?  ";
    const data2 = await pool.query(sql2, [
      dongCode,
      hoCode,
      arrivalTime,
      parcelStatus_,
    ]);

    let resultCnt = data2[0];

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
        parcelStatus,
        viewPeriod,
        items: resultList,
      },
    };
    console.log(resultList);

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

module.exports = router;
