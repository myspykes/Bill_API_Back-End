const mysql = require("mysql");
//create connection
var mysqlConnection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Birthday12",
  database: "lawChamber",
  multipleStatements: true,
});
//Connect and check for error
mysqlConnection.connect((err) => {
  if (!err) {
    console.log("Mysql connected");
  } else {
    console.log("Connection Fialed");
  }
});

module.exports = mysqlConnection;
