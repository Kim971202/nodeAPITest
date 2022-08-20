var express = require("express");
var router = express.Router();
const pool = require("../database/pool");

//요약정보 조회
router.get("/getSummaryInfoList", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
  } = req.query;

  console.log(serviceKey, dongCode, hoCode);

  //http://localhost:3000/etc/getSummaryInfoList?serviceKey=111111111&dongCode=101&hoCode=101
  try {
    const tSQL =
      " and b.dong_code ='" + dongCode + "' and b.ho_code = '" + hoCode + "' ";
    const sql = `SELECT a.idx, '공지사항' AS summaryTitle, count(a.start_date) AS summaryMSG
                FROM t_notice a
                INNER JOIN t_notice_send b
                WHERE a.idx = b.idx AND DATE_FORMAT(a.start_date, '%Y%m%d%h%i%s') >= now() ${tSQL}
                UNION ALL
                SELECT idx, '택배' AS summaryTitle, count(arrival_time) AS summaryMSG
                FROM t_delivery
                WHERE arrival_time >= now() AND parcel_status = 1;`;

    const data = await pool.query(sql);
    const resultList = data[0];
    let summaryTitle = "";
    let summaryMSG = "";

    // summaryMSG가 0인 경우는 새로운게 없는 상황 이므로 표시하지 안는다.
    if (resultList.length > 0) {
      summaryTitle = resultList[0].summaryTitle;
      summaryMSG = resultList[0].summaryMSG;
    }
    console.log("resultListLength: " + resultList.length)

    for(i = 0; i < resultList.length; i++){
      console.log("i: " + i);
      if(resultList[i].summaryMSG == 0){
        console.log("resultList[" + i + "]summaryMSG: " + resultList[i].summaryMSG)
        resultList.splice(i , 1);
        //splice 사용시 기존 인덱스 - 1 이기 때문에 1을 빼줘야 한다.
        i--;
      }
    }

    let jsonResult = {
      resultCode: "00",
      resultMsg: "NORMAL_SERVICE",
      data: {
        dongCode,
        hoCode,
        items: [resultList],
      },
    };
    return res.json(jsonResult);
  } catch (error) {
    return res.status(500).json(err);
  }
});

module.exports = router;
