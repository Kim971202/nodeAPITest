const express = require("express");
const bodyParser = require("body-parser");
const dotenv = require("dotenv");
dotenv.config();

const noticeRoute = require("./routes/notice-route");
const mngFeeRoute = require("./routes/mngfee-route");
const deliveryRoute = require("./routes/delivery-route");
const parkingRoute = require("./routes/parking-route");
const elivatorRoute = require("./routes/elivator-route");
const locationRoute = require("./routes/location-route");
const evchargingRoute = require("./routes/evcharging-route");
const cctvRoute = require("./routes/cctv-route");
const complaintRoute = require("./routes/complaint-route");
const voteRoute = require("./routes/vote-route");
const keyContactRoute = require("./routes/keycontact-route");
const visitorRoute = require("./routes/visitor-route");
const logRoute = require("./routes/log-route");
const contractRoute = require("./routes/contract-route");
const homeInfoRoute = require("./routes/homeInfo-route");
const emsRoute = require("./routes/ems-route");
//////////////////////////////////////////////
const etcRoute = require("./routes/etc-route");
//////////////////////////////////////////////

const redisRouter = require("./routes/redis-route");

const app = express();
const port = 3000; // 서버 포트번호

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use("/notice", noticeRoute);
app.use("/mngfee", mngFeeRoute);
app.use("/delivery", deliveryRoute);
app.use("/parking", parkingRoute);
app.use("/elivator", elivatorRoute);
app.use("/location", locationRoute);
app.use("/evcharging", evchargingRoute);
app.use("/cctv", cctvRoute);
app.use("/complaint", complaintRoute);
app.use("/vote", voteRoute);
app.use("/keycontact", keyContactRoute);
app.use("/visitor", visitorRoute);
app.use("/log", logRoute);
app.use("/contract", contractRoute);
app.use("/homeInfo", homeInfoRoute);
app.use("/ems", emsRoute);
app.use("/etc", etcRoute);
app.use("/redis", redisRouter);

app.listen(port, () => {
  console.log(`서버가 실행됩니다. http://localhost:${port}`);
});
/*
//app.use(express.static("public")); // public 폴더에 있는 모든 정적 파일을 URL로 제공할 수 있게 됩니다.
//app.use(express.static("files")); // files 폴더에 있는 모든 정적 파일을 URL로 제공할 수 있게 됩니다.
//app.use("/static", express.static("public"));

app.use(
  express.json({
    limit: "50mb", // 최대 50메가
  })
); // 클라이언트 요청 body를 json으로 파싱 처리

app.get("/getNoticeList", async (req, res) => {
  const sql = "SELECT * FROM t_notice";
  const noticeList = await mysql.query(sql);
  console.log(noticeList);

  res.send(noticeList);
});

// 클라이언트에서 HTTP 요청 메소드 중 GET를 이용해서 'host:port'로 요청을 보내면 실행되는 라우트입니다.
app.get("/", (req, res) => {
  res.send("Hello World!");
});

// 클라이언트에서 HTTP 요청 메소드 GET 방식으로 'host:port/about'을 호출했을 때
app.get("/about", function (req, res) {
  res.send("about"); // 클라이언트에 about 문자열 전송
});

app.get("/error", function (req, res) {
  throw new Error("에러발생"); // 라우트에서 에러가 발생하면 익스프레스가 알아서 이를 잡아서 처리합니다. 클라이언트로 500에러 코드와 에러 정보를 전달합니다.
});

app.get("/error2", function (req, res, next) {
  next(new Error("에러발생")); // next() 함수를 사용해서 에러 처리 핸들러로 에러 전달합니다.
});

// 에러 처리 핸들러 미들웨어
app.use(function (err, req, res, next) {
  res.status(500).json({ statusCode: res.statusCode, err: err.message }); // 상태코드 500, 에러 메시지 전달
});


*/
