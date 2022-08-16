const mysql = require("mysql2/promise");

const pool = mysql.createPool({
  host: "43.200.134.34",
  port: "3306",
  user: "root",
  password: "1234",
  database: "complexdb",
  connectionLimit: 10,
});

module.exports = pool;
