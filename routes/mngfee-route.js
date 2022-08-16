var express = require("express");
var router = express.Router();
const pool = require("../database/pool");

router.get("/getManagementFeeList", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    numOfRows = 10, //           페이지 당 결과수
    pageNo = 1, //               페이지 번호
    doubleDataFlag = "Y", //     2배수 데이터 사용여부
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
    mngYear = "2000", //         대상년도
  } = req.query;

  console.log(
    serviceKey,
    numOfRows,
    pageNo,
    dongCode,
    hoCode,
    doubleDataFlag,
    mngYear
  );
  //http://localhost:3000/mngfee/getManagementFeeList?serviceKey=22222&numOfRows=12&pageNo=1&dongCode=101&hoCode=101&doubleDataFlag=Y&mngYear=2022

  try {
    let sRow = (pageNo - 1) * numOfRows;
    let size = numOfRows * (doubleDataFlag === "Y" ? 2 : 1);

    const sql = `select mng_year as mngYear, mng_month as mngMonth, total_mng as totalMng 
       from t_management_fee 
       where mng_year = ? and dong_code = ? and ho_code = ? limit ?, ?`;
    const data = await pool.query(sql, [
      mngYear,
      dongCode,
      hoCode,
      Number(sRow),
      Number(size),
    ]);
    let resultList = data[0];

    const sql2 =
      "select count(*) as cnt from t_management_fee where mng_year = ? and dong_code = ? and ho_code = ?";
    const data2 = await pool.query(sql2, [mngYear, dongCode, hoCode]);
    let resultCnt = data2[0];

    let jsonResult = {
      resultCode: "00",
      resultMsg: "NORMAL_SERVICE",
      numOfRows,
      totalCount: resultCnt[0].cnt + "",
      doubleDataFlag,
      data: {
        dongCode,
        hoCode,
        items: resultList,
      },
    };
    console.log(resultList);

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

router.get("/getManagementFeeDetail", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    //dataType = "JSON", //      요청자료 형식
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
    mngYear = "0000", //         대상년도
    mngMonth = "0000", //        대상월
  } = req.query;

  console.log(serviceKey, dongCode, hoCode, mngYear, mngMonth);
  //http://localhost:3000/mngfee/getManagementFeeDetail?serviceKey=22222&dongCode=101&hoCode=101&mngYear=2022&mngMonth=06

  try {
    const sql2 = "select * from t_set_management_fee order by mng_fee_order;"; //order by반드시 넣어야 함
    const data2 = await pool.query(sql2);
    const resultList2 = data2[0];
    console.log(resultList2.length);

    let mngFeeItem = [];
    let mngFeeAlias = [];
    let mngFee = [];

    for (i = 0; i < resultList2.length; i++) {
      mngFeeItem[i] = resultList2[i].mng_fee_item;
      mngFeeAlias[i] = resultList2[i].mng_fee_alias;
    }
    //console.log("========================================================");
    // console.log("mngFeeItem=>" + mngFeeItem); //
    // console.log("mngFeeAlias=>" + mngFeeAlias);

    const sql = `select ${mngFeeItem} from t_management_fee 
    where mng_year = ? and mng_month = ? and dong_code = ? and ho_code = ?`;

    const data = await pool.query(sql, [mngYear, mngMonth, dongCode, hoCode]);
    let resultList = data[0]; //
    // console.log(resultList[0]);

    for (i = 0; i < mngFeeItem.length; i++) {
      mngFee[i] = resultList[0][mngFeeItem[i]];
    }
    //console.log("mngFee=>" + mngFee);
    console.log("mngFee=>" + mngFee.length);
    console.log("mngFeeItem=>" + mngFeeItem.length);
    console.log("mngFeeAlias=>" + mngFeeAlias.length);

    let jsonResult = {
      resultCode: "00",
      resultMsg: "NORMAL_SERVICE",
      data: {
        mngYear,
        mngMonth,
        dongCode,
        hoCode,
        mngFeeItem: mngFeeAlias,
        mngFee,
        // item: {
        //   mngFeeItem: mngFeeAlias,
        //   mngFee,
        // },
      },
    };

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

module.exports = router;
