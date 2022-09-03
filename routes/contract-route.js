var express = require("express");
var router = express.Router();
const pool = require("../database/pool");

//계약사항 목록조회
router.get("/getContractList", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    numOfRows = 10, //           페이지 당 결과수
    pageNo = 1, //               페이지 번호
    doubleDataFlag = "Y", //     2배수 데이터 사용여부
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
  } = req.query;

  console.log(serviceKey, numOfRows, pageNo, dongCode, hoCode, doubleDataFlag);
  //http://localhost:3000/contract/getContractList?serviceKey=22222&numOfRows=5&pageNo=2&dongCode=101&hoCode=101&doubleDataFlag=Y

  try {
    let sRow = (pageNo - 1) * numOfRows;
    //console.log("sRow = %d", sRow);
    //ex: 2page start = (2-1) * 10

    let size = numOfRows * (doubleDataFlag === "Y" ? 2 : 1);
    //console.log("size= %d", size);

    const sql = `select idx, contract_title as contractTitle, DATE_FORMAT(contract_date, '%Y%m%d') as contractDate
                 from t_contract_document
                 limit ?, ?`;
    console.log("sql=>" + sql);

    const data = await pool.query(sql, [Number(sRow), Number(size)]);
    let resultList = data[0];

    const sql2 = "select count(*) as cnt from t_contract_document ";

    const data2 = await pool.query(sql2);

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
        items: resultList,
      },
    };
    console.log(resultList);

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

//계약자료 상세보기
router.get("/getContractDetail", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    //dataType = "JSON", //      요청자료 형식
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
    idx = 0, //                  idx
  } = req.query;

  console.log(serviceKey, dongCode, hoCode, idx);
  //http://localhost:3000/contract/getContractDetail?serviceKey=22222&dongCode=101&hoCode=101&idx=1

  try {
    const sql = `select idx, contract_title as contractTitle, DATE_FORMAT(contract_date, '%Y%m%d') as contractDate,
                        file_name as fileName, file_path as filePath, contract_content as contractContent
                 from t_contract_document
                 where idx = ? `;

    const data = await pool.query(sql, [Number(idx)]);

    let resultList = "";
    let contractTitle = "";
    let contractDate = "";
    let fileName = "";
    let filePath = "";
    let contractContent = "";

    resultList = data[0];
    console.log(resultList);
    if (resultList.length > 0) {
      contractTitle = resultList[0].contractTitle;
      contractDate = resultList[0].contractDate;
      fileName = resultList[0].fileName;
      contractContent = resultList[0].contractContent;
      filePath = resultList[0].filePath;
    }
    console.log("filePath: " + filePath);
    //console.log(resultList[0].notiTitle);

    let jsonResult = {
      resultCode: "00",
      resultMsg: "NORMAL_SERVICE",
      data: {
        idx,
        contractTitle,
        contractDate,
        fileName,
        filePath,
        contractContent,
      },
    };

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

module.exports = router;
