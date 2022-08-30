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

//투표안건 목록조회
router.get("/getVoteAgendaList", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    numOfRows = 10, //           페이지 당 결과수
    pageNo = 1, //               페이지 번호
    doubleDataFlag = "Y", //     2배수 데이터 사용여부
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
    viewPeriod = "ALL", //       조회기간전체: (ALL)/일주일(1WEEK)/1개월(1MONTH)/3개월(3MONTH)
    voteResult = "ALL", //        ALL: 전체보기 N: 투표하기(진행중) Y: 결과보기(투표마감)
  } = req.query;

  console.log(
    serviceKey,
    numOfRows,
    pageNo,
    dongCode,
    hoCode,
    doubleDataFlag,
    viewPeriod,
    voteResult
  );
  //http://localhost:3000/vote/getVoteAgendaList?serviceKey=222222&numOfRows=10&pageNo=1&doublDataFlag=Y&dongCode=101&hoCode=101&viewPeriod=ALL

  let startDate = viewPeriodDate(viewPeriod);

  console.log("startDate : ", startDate);

  try {
    let sRow = (pageNo - 1) * numOfRows;
    //console.log("sRow = %d", sRow);
    //ex: 2page start = (2-1) * 10

    let size = numOfRows * (doubleDataFlag === "Y" ? 2 : 1);
    //console.log("size= %d", size);

    let sql = `select idx, vote_title as voteTitle, 
                      DATE_FORMAT(v_start_dtime, '%Y%m%d%h%i%s') as vStartDate, 
                      DATE_FORMAT(v_end_dtime, '%Y%m%d%h%i%s') as vEndDate, 
                      vote_end_flag as voteResult
               from t_vote_agenda
               where v_start_dtime >= ? 
               limit ?, ? `;

    console.log("sql=>" + sql);

    const data = await pool.query(sql, [startDate, Number(sRow), Number(size)]);
    let resultList = data[0];

    const sql2 = `select count(*) as cnt from t_vote_agenda where v_start_dtime >= ? `;
    const data2 = await pool.query(sql2, [startDate]);

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
    console.log("jsonResult=>" + jsonResult);
    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

//투표 상세보기 조회
router.get("/getVoteAgendaDetail", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    numOfRows = 10, //           페이지 당 결과수
    pageNo = 1, //               페이지 번호
    doubleDataFlag = "Y", //     2배수 데이터 사용여부
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
    idx = "0", //                idx
  } = req.query;

  console.log(
    serviceKey,
    numOfRows,
    pageNo,
    doubleDataFlag,
    dongCode,
    hoCode,
    idx
  );
  //http://localhost:3000/vote/getVoteAgendaDetail?serviceKey=222222&dongCode=101&hoCode=101&idx=1

  try {
    let sRow = (pageNo - 1) * numOfRows;
    //console.log("sRow = %d", sRow);
    //ex: 2page start = (2-1) * 10

    let size = numOfRows * (doubleDataFlag === "Y" ? 2 : 1);
    //console.log("size= %d", size);
    let sql = `select a.idx, a.vote_title as voteTitle, vote_desc as voteDesc,
                  DATE_FORMAT(a.v_start_dtime, '%Y%m%d%h%i%s') as vStartDate, 
                  DATE_FORMAT(a.v_end_dtime, '%Y%m%d%h%i%s') as vEndDate, 
                  a.vote_end_flag as voteResult,
                  b.item_no as itemNo, item_content as itemContent   
               from t_vote_agenda a inner join t_vote_items b
               on a.idx = b.idx 
               where a.idx = ? `;

    console.log("sql=>" + sql);

    const data = await pool.query(sql, [Number(idx)]);

    let resultList = "";
    let voteTitle = "";
    let voteDesc = "";
    let vStartDate = "";
    let vEndDate = "";
    let voteResult = "";

    resultList = data[0];
    if (resultList.length > 0) {
      voteTitle = resultList[0].voteTitle;
      voteDesc = resultList[0].voteDesc;
      vStartDate = resultList[0].vStartDate;
      vEndDate = resultList[0].vEndDate;
      voteResult = resultList[0].voteResult;
    }

    let voteItems = [];
    for (var i = 0; i < resultList.length; i++) {
      voteItems.push({
        itemNo: resultList[i].itemNo,
        itemContent: resultList[i].itemContent,
      });
    }

    console.log("voteItems=>" + voteItems);

    let jsonResult = {
      resultCode: "00",
      resultMsg: "NORMAL_SERVICE",
      idx,
      voteTitle,
      voteDesc,
      vStartDate,
      vEndDate,
      voteItems,
    };

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

//주민투표 투표하기(등록)
router.post("/postVote", async (req, res, next) => {
  // console.log(JSON.stringify(req.body));
  // console.log(req.body);

  let {
    serviceKey = "", //   서비스 인증키
    dongCode = "", //     동코드
    hoCode = "", //       호코드
    idx = 0, //           인덱스
    choiceItemNo = "", // 선택항목
    voteMethod = "W", //  투표방법 : 월패드(W), 스마트폰(S)
  } = req.body;

  console.log(serviceKey, dongCode, hoCode, idx, choiceItemNo, voteMethod);
  //http://localhost:3000/vote/postVote  {"serviceKey":"11111111","dongCode":"101","hoCode":"101","idx":"3","choiceItemNo":"1",“voteMethod”: “W”}

  let resultCode = "00";
  let resultMsg = "투표 처리가 되었습니다.";

  if (serviceKey === "") resultCode = "10"; // INVALID_REQUEST_PARAMETER_ERROR

  if (dongCode === "") resultCode = "10";

  if (hoCode === "") resultCode = "10";

  if (idx === "") resultCode = "10";

  if (choiceItemNo === "") resultCode = "10";

  if (voteMethod === "") resultCode = "10";

  //투표가 마감되었거나 현재날짜가 마감일이후이거나 투표한 세대이면 등록처리 못하게
  let sSQL = `select a.idx from t_vote_agenda a inner join t_voters b
             on a.idx = b.idx
             where a.idx = ? 
                and (a.vote_end_flag = 'Y' or a.fin_end_dtime < now() or (b.dong_code = ? and b.ho_code = ?)) `;

  //console.log("sSQL=>" + sSQL);

  const data = await pool.query(sSQL, [idx, dongCode, hoCode]);

  let result = data[0];
  console.log("resultList.length :" + result.length);

  if (result.length > 0) resultCode = "10";

  console.log("resulCode=> " + resultCode);

  try {
    if (resultCode === "00") {
      let sql = `insert into t_voters(idx, dong_code, ho_code, vote_datetime, vote_method, choice_item_no) 
          values (?, ?, ?, now(), ?, ?) `;
      console.log("sql=>" + sql);
      const data = await pool.query(sql, [
        idx,
        dongCode,
        hoCode,
        voteMethod,
        choiceItemNo,
      ]);
      console.log("data[0]=>" + data[0]);
    } else resultMsg = "투표가 마감되었거나 이미 투표한 세대입니다.";

    let jsonResult = {
      resultCode,
      resultMsg,
    };

    return res.json(jsonResult);
  } catch (err) {
    console.log("test===============" + err);
    return res.status(500).json(err);
  }
});

//투표결과 상세보기 조회(투표종료 및 관리자가 마감한건 조회)
router.get("/getVoteResult", async (req, res, next) => {
  let {
    serviceKey = "111111111", // 서비스 인증키
    numOfRows = 10, //           페이지 당 결과수
    pageNo = 1, //               페이지 번호
    doubleDataFlag = "Y", //     2배수 데이터 사용여부
    dongCode = "0000", //        동코드
    hoCode = "0000", //          호코드
    idx = 0, //                  idx
  } = req.query;

  console.log(
    serviceKey,
    numOfRows,
    pageNo,
    dongCode,
    hoCode,
    doubleDataFlag,
    idx
  );
  //http://localhost:3000/vote/getVoteResult?serviceKey=22222&numOfRows=5&pageNo=1&dongCode=101&hoCode=101&doubleDataFlag=Y&idx=1

  try {
    let sRow = (pageNo - 1) * numOfRows;
    //console.log("sRow = %d", sRow);
    //ex: 2page start = (2-1) * 10

    let size = numOfRows * (doubleDataFlag === "Y" ? 2 : 1);
    //console.log("size= %d", size);
    //투표가 마감되었거나 현재날짜가 마감일이후인 건
    let sql = `select a.idx, a.vote_title as voteTitle, vote_desc as voteDesc,
                  DATE_FORMAT(a.v_start_dtime, '%Y%m%d%h%i%s') as vStartDate, 
                  DATE_FORMAT(a.v_end_dtime, '%Y%m%d%h%i%s') as vEndDate, 
                  a.vote_end_flag as voteResult, a.subjects_num as subjectsNum,
                  participation_num as participationNum, vote_rate as voteRate,
                  b.item_no as itemNo, item_content as itemContent,  
                  (b.votes_number + b.votes_number_off) as votesNumber,
                  CONCAT(ROUND((100*b.votes_number + b.votes_number_off)/participation_num, 2), '%') as getVotesRate
               from t_vote_agenda a inner join t_vote_items b
               on a.idx = b.idx
               where a.vote_end_flag = 'Y' and fin_end_dtime < now() and a.idx = ? `;

    console.log("sql=>" + sql);

    const data = await pool.query(sql, [Number(idx)]);

    let resultList = "";
    let voteTitle = "";
    let voteDesc = "";
    let vStartDate = "";
    let vEndDate = "";
    let voteRate = "";
    let subjectsNum = "";
    let participationNum = "";
    let voteItems = [];

    resultList = data[0];
    if (resultList.length > 0) {
      voteTitle = resultList[0].voteTitle;
      voteDesc = resultList[0].voteDesc;
      vStartDate = resultList[0].vStartDate;
      vEndDate = resultList[0].vEndDate;
      subjectsNum = resultList[0].subjectsNum;
      participationNum = resultList[0].participationNum;
      voteRate = resultList[0].voteRate;
    }

    for (var i = 0; i < resultList.length; i++) {
      voteItems.push({
        itemNo: resultList[i].itemNo,
        itemContent: resultList[i].itemContent,
        votesNumber: resultList[i].votesNumber,
        getVotesRate: resultList[i].getVotesRate,
      });
    }

    //console.log(resultList[0].notiTitle);

    let jsonResult = {
      resultCode: "00",
      resultMsg: "NORMAL_SERVICE",
      idx,
      voteTitle,
      voteDesc,
      vStartDate,
      vEndDate,
      subjectsNum,
      participationNum,
      voteRate,
      voteItems,
    };

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

module.exports = router;
