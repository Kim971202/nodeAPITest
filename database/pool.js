const mysql = require("mysql2/promise");
// localhost - for local test
// 43.200.134.34 - for cloud test
const pool = mysql.createPool({
  host: "localhost",
  port: "3306",
  user: "root",
  password: "1234",
  database: "complexdb",
  connectionLimit: 10,
});

module.exports = pool;
