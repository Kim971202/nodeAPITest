var express = require("express");
var router = express.Router();

let value = "";

const redis = require("redis");
const redisInfo = {
  host: "127.0.0.1",
  port: 6379,
  db: 0,
};
const client = redis.createClient(redisInfo);

client.on("error", (err) => {
  console.error(err);
});

client.on("ready", () => {
  console.log("redis is ready");
});

router.get("/", (req, res, next) => {
  try {
    client.get("k_two", (err, result) => {
      console.log("result: " + result); // v_two
      value = result;
    });

    let jsonResult = {
      value,
    };

    return res.json(jsonResult);
  } catch (err) {
    return res.status(500).json(err);
  }
});

module.exports = router;
