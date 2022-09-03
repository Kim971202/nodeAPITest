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

//cctv정보 리스트 조회
router.get("/getCCTVInfoList", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    numOfRows = 10, //           페이지 당 결과수
    pageNo = 1, //               페이지 번호
    doubleDataFlag = "Y", //     2배수 데이터 사용여부
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
    interfaceType = "WebT", //   WebT / NVR
  } = req.query;

  console.log(
    serviceKey,
    numOfRows,
    pageNo,
    dongCode,
    hoCode,
    doubleDataFlag,
    interfaceType
  );
  //http://localhost:3000/cctv/getCCTVInfoList?serviceKey=22222&numOfRows=5&pageNo=1&dongCode=101&hoCode=101&doubleDataFlag=Y

  try {
    let sRow = (pageNo - 1) * numOfRows;
    //console.log("sRow = %d", sRow);
    //ex: 2page start = (2-1) * 10

    let size = numOfRows * (doubleDataFlag === "Y" ? 2 : 1);
    //console.log("size= %d", size);

    const sql = `select a.cam_no as cctvNo, cam_name as cctvAlias, cam_address as cctvAddress
                 from t_cctv_dong a left join t_cctv b
                 on a.cam_no = b.cam_no
                 where dong_code = ?
                 limit ?, ?`;

    console.log("sql=>" + sql);
    const data = await pool.query(sql, [dongCode, Number(sRow), Number(size)]);
    let resultList = data[0];

    const sql2 =
      "select count(*) as cnt from t_cctv_dong a left join t_cctv b on a.cam_no = b.cam_no where dong_code = ? ";
    const data2 = await pool.query(sql2, [dongCode]);

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
        interfaceType,
        items: resultList,
      },
    };

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

module.exports = router;
