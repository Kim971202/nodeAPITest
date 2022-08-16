const mysql = require("mysql2/promise");
// From Working Office
const pool = mysql.createPool({
  host: "43.200.134.34",
  port: "3306",
  user: "root",
  password: "testPWD",
  database: "complexdb",
  connectionLimit: 10,
});

module.exports = pool;
