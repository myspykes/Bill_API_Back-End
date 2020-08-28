const express = require("express");
const mysql = require("mysql");
const bodyParser = require("express");
const mysqlConnection = require("./connection");
const { json } = require("body-parser");

var app = express();

app.use(bodyParser.json());

app.get("/", (req, res) => {
  res.send("Hello");
});

//display all lawyers
app.get("/lawyersReporter", (req, res) => {
  mysqlConnection.query(
    "SELECT * FROM lawChamber.lawyers;",
    (err, rows, fields) => {
      if (!err) {
        res.send(rows);
        //res.json(rows);
      } else {
        console.log(err);
      }
    }
  );
});

// DISPLAY REPORTS
app.get("/reportsforalltIimeSheet", (req, res) => {
  mysqlConnection.query(
    "SELECT * FROM lawChamber.timesheet;;",
    (err, rows, fields) => {
      if (!err) {
        res.send(rows);
      } else {
        console.log(err);
      }
    }
  );
});

// use post to insert into the lawyers timesheet table
app.post("/inputlawyers", (req, res) => {
  let emp = req.body;
  var sql =
    "SET @employeeID = ?;SET @project_Name = ?;SET @p_Date = ?;SET @p_Start = ?;SET @p_End = ?;CALL LawyerAddTime(@employeeID,@project_Name,@p_Date,@p_Start,@p_End);";

  mysqlConnection.query(
    sql,
    [emp.employeeID, emp.project_Name, emp.p_Date, emp.p_Start, emp.p_End],
    (err, rows, fields) => {
      if (!err) {
        // respond by sending the inserted row id
        res.send(rows);
      } else {
        console.log(err);
      }
    }
  );
});

// add lawyers to the database
app.post("/addlawyers", (req, res) => {
  let emp = req.body;
  var sql =
    "SET @firstName = ?;SET @lastName = ?;SET @barGrading = ?;CALL lawyerADDInfo(@firstName ,@lastName,@barGrading);";

  mysqlConnection.query(
    sql,
    [emp.firstName, emp.lastName, emp.barGrading],
    (err, rows, fields) => {
      if (!err) {
        // respond by sending the inserted row id
        res.send(rows);
      } else {
        console.log(err);
      }
    }
  );
});

//view single employee single sheet
//but not asked for
/*
app.post("/singlesheet", (req, res) => {
  let emp = req.body;
  var sql =
    "SET @employeeID = ?;SET @startDate = ?;SET @endDate = ?;CALL lawChamber.timestampsheet(@employeeID,@startDate,@endDate);";

  mysqlConnection.query(
    sql,
    [emp.employeeID, emp.startDate, emp.endDate],
    (err, rows, fields) => {
      if (!err) {
        res.send(rows);
      } else {
        console.log(err);
      }
    }
  );
});
*/

//sum project within a range for a specific company
app.post("/rangesumReport", (req, res) => {
  let emp = req.body;
  var sql =
    "SET @project_Name = ?;SET @startRange = ?;SET @endRange = ?;CALL company_sum_range(@project_Name,@startRange,@endRange); ";
  mysqlConnection.query(
    sql,
    [emp.project_Name, emp.startRange, emp.endRange],
    (err, rows, fields) => {
      if (!err) {
        res.send(rows);
      } else {
        console.log(err);
      }
    }
  );
});

// sum all project for company
app.post("/sumReport", (req, res) => {
  let emp = req.body;
  var sql = "SET @project_Name = ?;CALL lawChamber.companySum(@project_Name); ";
  mysqlConnection.query(sql, [emp.project_Name], (err, rows, fields) => {
    if (!err) {
      res.send(rows);
    } else {
      console.log(err);
    }
  });
});

//Delete lawyer record
app.delete("/lawyersReporter/:id", (req, res) => {
  mysqlConnection.query(
    "DELETE FROM lawChamber.lawyers WHERE employee_ID = ?",
    [req.params.id],
    (err, rows, fields) => {
      if (!err) {
        res.send("content deleted");
      } else {
        console.log(err);
      }
    }
  );
});

app.listen("5000", () => {
  console.log(`Server connected`);
});
