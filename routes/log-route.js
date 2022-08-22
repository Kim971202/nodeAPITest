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

//출입이력 목록조회
router.get("/getInoutLogList", async (req, res, next) => {
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
  //http://localhost:3000/log/getInoutLogList?serviceKey=22222&numOfRows=10&pageNo=1&dongCode=101&hoCode=101&doubleDataFlag=Y&occurLocFlag=ALL&viewPeriod=ALL

  let occurDTime = viewPeriodDate(viewPeriod);

  let fSQL = ` where dong_code = '${dongCode}' and ho_code = '${hoCode}'  and occur_dtime >= '${occurDTime}' `;

  let hSQL = `select DATE_FORMAT(occur_dtime, '%Y%m%d%H%i%s') as occurDTime, 
                    '새대현관' as occurLocName,
                    (
                      CASE WHEN entry_method = 'C' THEN '출입카드'
                          WHEN entry_method = 'P' THEN '비밀번호'
                          WHEN entry_method = 'B' THEN 'BLE'
                          ELSE '정보없음'
                      END
                    ) as ioMethods
              from t_home_entry_log  `;

  let lSQL = `select DATE_FORMAT(occur_dtime, '%Y%m%d%H%i%s') as occurDTime, 
                  '공동현관' as occurLocName, 
                  (
                    CASE WHEN entry_method = 'C' THEN '출입카드'
                        WHEN entry_method = 'P' THEN '비밀번호'
                        WHEN entry_method = 'B' THEN 'BLE'
                        ELSE '정보없음'
                    END
                  ) as ioMethod
              from t_lobby_entry_log  `;

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
        occurLocFlag,
        viewPeriod,
        items: resultList,
      },
    };
    console.log(jsonResult);

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

//비상이력 목록조회
router.get("/getEmergencyLogList", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    numOfRows = 10, //           페이지 당 결과수
    pageNo = 1, //               페이지 번호
    doubleDataFlag = "Y", //     2배수 데이터 사용여부
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
    occurLocFlag = "ALL", //     발생위치구분: 전체(ALL)/세대(HOUSE)/공용부(PUBLIC)
    viewPeriod = "ALL", //       조회기간: 전체(ALL)/일주일(1WEEK)/1개월(1MONTH)/3개월(3MONTH)
  } = req.query;

  console.log(
    serviceKey,
    numOfRows,
    pageNo,
    dongCode,
    hoCode,
    doubleDataFlag,
    occurLocFlag,
    viewPeriod
  );
  //http://localhost:3000/log/getEmergencyLogList?serviceKey=22222&numOfRows=5&pageNo=1&dongCode=101&hoCode=101&doubleDataFlag=Y

  try {
    let sRow = (pageNo - 1) * numOfRows;
    //console.log("sRow = %d", sRow);
    //ex: 2page start = (2-1) * 10

    let size = numOfRows * (doubleDataFlag === "Y" ? 2 : 1);
    //console.log("size= %d", size);

    const sql = `select DATE_FORMAT(occur_dtime, '%Y%m%d%H%i%s') as occurDTime, 
                      (
                        CASE WHEN occur_loc_loc = 'HOUSE' THEN '세대'
                            WHEN occur_loc_loc = 'PUBLIC' THEN '공용부'
                            ELSE '정보없음'
                        END
                      ) as occurLocName, 
                      (
                        CASE WHEN emergency_type = 'invasion' THEN '침입'
                            WHEN emergency_type = 'emer' THEN '비상'
                            WHEN emergency_type = 'fire' THEN '화재'
                            WHEN emergency_type = 'gas' THEN '가스'
                            WHEN emergency_type = 'ladder' THEN '피난사다리'
                            WHEN emergency_type = 'pir' THEN '동체감지기'
                            ELSE '기타'
                        END
                      ) as emergencyType,
                      (
                        CASE WHEN state = '0' THEN '발생'
                            WHEN state = '1' THEN '정지'
                            WHEN state = '2' THEN '복귀'
                            ELSE '정보없음'
                        END
                      ) as state
                 from t_hn_emergency_log
                 where dong_code = ? and ho_code =?
                 order by occur_dtime desc
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
      "select count(*) as cnt from t_hn_emergency_log where dong_code = ? and ho_code =? ";
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
        occurLocFlag,
        viewPeriod,
        items: resultList,
      },
    };

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

module.exports = router;
