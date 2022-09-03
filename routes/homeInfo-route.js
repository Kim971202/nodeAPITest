var express = require("express");
var router = express.Router();
const pool = require("../database/pool");

//세대 IP목록조회
router.get("/getHomeIPList", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    numOfRows = 10, //           페이지 당 결과수
    pageNo = 1, //               페이지 번호
    doubleDataFlag = "Y", //     2배수 데이터 사용여부
    dongCode = "", //            전체동(ALL)/동코드
    hoCode = "", //              전체호(ALL)/호코드
  } = req.query;

  console.log(serviceKey, numOfRows, pageNo, dongCode, hoCode, doubleDataFlag);
  //http://localhost:3000/homeInfo/getHomeIPList?serviceKey=22222&numOfRows=10&pageNo=1&dongCode=101&hoCode=101&doubleDataFlag=Y

  let dongCode_ = dongCode;
  if (dongCode === "ALL") dongCode_ = "%";

  let hoCode_ = hoCode;
  if (hoCode === "ALL") hoCode_ = "%";

  console.log("dongCode_=>" + dongCode_);
  console.log("hoCode_=>" + hoCode_);

  try {
    let sRow = (pageNo - 1) * numOfRows;
    //console.log("sRow = %d", sRow);
    //ex: 2page start = (2-1) * 10

    let size = numOfRows * (doubleDataFlag === "Y" ? 2 : 1);
    //console.log("size= %d", size);

    const sql = `select dong_code as dongCode, ho_code as hoCode, wallpad_ip as wallpadIP
                 from t_hn_wallpad
                 where dong_code LIKE ? and ho_code LIKE ?
                 limit ?, ?`;

    console.log("sql=>" + sql);
    const data = await pool.query(sql, [
      dongCode_,
      hoCode_,
      Number(sRow),
      Number(size),
    ]);
    let resultList = data[0];

    const sql2 =
      "select count(*) as cnt from t_hn_wallpad where dong_code LIKE ? and ho_code LIKE ? ";
    const data2 = await pool.query(sql2, [dongCode_, hoCode_]);

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
        items: resultList,
      },
    };

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

module.exports = router;
