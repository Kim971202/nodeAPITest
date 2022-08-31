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
      " AND dong_code ='" + dongCode + "' AND ho_code = '" + hoCode + "' ";
    const sql = `SELECT a.idx, '공지사항' AS summaryTitle, count(a.start_date) AS summaryMSG
                FROM t_notice a
                INNER JOIN t_notice_send b
                WHERE a.idx = b.idx AND DATE_FORMAT(a.start_date, '%Y-%m-%d') = DATE_FORMAT(now(), '%Y-%m-%d') ${tSQL}
                UNION ALL
                SELECT idx, '택배' AS summaryTitle, count(arrival_time) AS summaryMSG
                FROM t_delivery
                WHERE arrival_time >= now() AND parcel_status = 1 ${tSQL}
                UNION ALL
                SELECT idx, '비상' AS summaryTitle, count(occur_dtime) AS summaryMSG
                FROM t_hn_emergency_log
                WHERE occur_dtime >= now() ${tSQL}
                UNION ALL
                SELECT idx, '차량입차' AS summaryTitle, count(inout_dtime) AS summaryMSG
                FROM t_parking_io
                WHERE inout_dtime >= now() ${tSQL}
                UNION ALL
                SELECT client_ip AS idx, '방범이력' AS summaryTitle, count(setting_dtime) AS summaryMSG
                FROM t_prevent_setting_log
                WHERE setting_dtime >= now() ${tSQL}
                UNION ALL
                SELECT idx, '부재중방문자' AS summaryTitle, count(occur_dtime) AS summaryMSG
                FROM t_home_visit_video_log
                WHERE occur_dtime >= now() ${tSQL};`;

    const data = await pool.query(sql);
    const resultList = data[0];
    let summaryTitle = "";
    let summaryMSG = "";

    let emerMSG = "비상건수";

    console.log("resultListLength: " + resultList.length);
    // summaryMSG가 0인경우 배열에서 제거하는 for문
    for (i = 0; i < resultList.length; i++) {
      summaryTitle = resultList[i].summaryTitle;
      summaryMSG = resultList[i].summaryMSG;
      console.log("summaryTitle: " + summaryTitle);
      console.log("summaryMGS: " + summaryMSG);
      summaryMSG = emerMSG;
      console.log("summaryMSG1212: " + summaryMSG);
      if (resultList[i].summaryMSG == 0) {
        console.log(
          "resultList[" + i + "]summaryMSG: " + resultList[i].summaryMSG
        );
        resultList.splice(i, 1);
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
