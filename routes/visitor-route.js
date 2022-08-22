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

//방문자 목록조회
router.get("/getVisitorList", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    numOfRows = 10, //           페이지 당 결과수
    pageNo = 1, //               페이지 번호
    doubleDataFlag = "Y", //     2배수 데이터 사용여부
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
    occurLocFlag = "ALL", //     발생위치구분: 전체(ALL)/세대(HOUSE)/공동현관(LOBBY)
    viewPeriod = "ALL", //       조회기간: 전체(ALL)/일주일(1WEEK)/1개월(1MONTH)/3개월(3MONTH)
  } = req.query;

  console.log(
    serviceKey,
    numOfRows,
    pageNo,
    doubleDataFlag,
    dongCode,
    hoCode,
    occurLocFlag,
    viewPeriod
  );
  //http://localhost:3000/visitor/getVisitorList?serviceKey=22222&numOfRows=10&pageNo=1&dongCode=101&hoCode=101&doubleDataFlag=Y&occurLocFlag=ALL&viewPeriod=ALL

  let occurDTime = viewPeriodDate(viewPeriod);

  let fSQL = ` where dong_code = '${dongCode}' and ho_code = '${hoCode}'  and occur_dtime >= '${occurDTime}' `;

  let hSQL = `select DATE_FORMAT(occur_dtime, '%Y%m%d%H%i%s') as occurDTime,  
                '새대현관' as occurLocName, IFNULL(file_path, '') as filePath, IFNULL(file_name, '') as fileNath
              from t_home_visit_video_log  `;

  let lSQL = `select DATE_FORMAT(occur_dtime, '%Y%m%d%H%i%s') as occurDTime, 
              '공동현관' as occurLocName, IFNULL(file_path, '') as filePath, IFNULL(file_name, '') as fileNath
              from t_lobby_visit_video_log  `;

  let vSQL = "";
  if (occurLocFlag === "ALL") {
    vSQL = hSQL + fSQL + " union all " + lSQL + fSQL;
  } else if (occurLocFlag === "HOUSE") {
    vSQL = hSQL + fSQL;
  } else if (occurLocFlag === "LOBBY") {
    vSQL = lSQL + fSQL;
  }
  console.log("vSQL=>" + vSQL);

  try {
    let sRow = (pageNo - 1) * numOfRows;
    //console.log("sRow = %d", sRow);
    //ex: 2page start = (2-1) * 10

    let size = numOfRows * (doubleDataFlag === "Y" ? 2 : 1);
    //console.log("size= %d", size);

    const sql = vSQL + " order by occurDTime desc  limit ?, ?";
    const data = await pool.query(sql, [Number(sRow), Number(size)]);
    let resultList = data[0];
    console.log("sql=>" + sql);
    console.log("resultList=>" + resultList);

    const sql2 = vSQL;
    const data2 = await pool.query(sql2);

    let resultCnt = data2[0].length;

    let jsonResult = {
      resultCode: "00",
      resultMsg: "NORMAL_SERVICE",
      numOfRows,
      pageNo,
      totalCount: resultCnt + "",
      doubleDataFlag,
      data: {
        dongCode,
        hoCode,
        viewPeriod,
        occurLocFlag,
        items: resultList,
      },
    };
    console.log(jsonResult);

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

module.exports = router;
