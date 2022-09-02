const mysql = require("mysql2/promise");
<<<<<<< HEAD
// From Working Office
const pool = mysql.createPool({
  host: "localhost",
  port: "3306",
  user: "root",
  password: "1234",
  database: "complexdb",
  connectionLimit: 10,
=======
// localhost - for local test
// 43.200.134.34 - for cloud test
// 43.200.134.141 - for cloud real
const pool = mysql.createPool({
  host: process.env.MYSQL_HOST,
  port: process.env.MYSQL_PORT,
  user: process.env.MYSQL_USERNAME,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DB,
  connectionLimit: process.env.MYSQL_LIMIT,
>>>>>>> f71cc3fe5d0585eb78da06a13a5bd8d8e96cb54c
});

module.exports = pool;
