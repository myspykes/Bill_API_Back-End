"use strict";

var express = require("express");

var mysql = require("mysql");

var bodyParser = require("express");

var mysqlConnection = require("./connection");

var _require = require("body-parser"),
    json = _require.json;

var app = express();
app.use(bodyParser.json());
app.get("/", function (req, res) {
  res.send("Hello");
}); //display all lawyers

app.get("/lawyersReporter", function (req, res) {
  mysqlConnection.query("call lawChamber.lawyerslist();", function (err, rows, fields) {
    if (!err) {
      res.send(rows); //res.json(rows);
    } else {
      console.log(err);
    }
  });
}); // DISPLAY REPORTS

app.get("/reportsforalltIimeSheet", function (req, res) {
  mysqlConnection.query("SELECT * FROM lawChamber.timesheet;;", function (err, rows, fields) {
    if (!err) {
      res.send(rows);
    } else {
      console.log(err);
    }
  });
}); // use post to insert into the lawyers timesheet table

app.post("/inputlawyers", function (req, res) {
  var emp = req.body;
  var sql = "SET @employeeID = ?;SET @project_Name = ?;SET @p_Date = ?;SET @p_Start = ?;SET @p_End = ?;CALL LawyerAddTime(@employeeID,@project_Name,@p_Date,@p_Start,@p_End);";
  mysqlConnection.query(sql, [emp.employeeID, emp.project_Name, emp.p_Date, emp.p_Start, emp.p_End], function (err, rows, fields) {
    if (!err) {
      // respond by sending the inserted row id
      res.send(rows);
    } else {
      console.log(err);
    }
  });
}); // add lawyers to the database

app.post("/addlawyers", function (req, res) {
  var emp = req.body;
  var sql = "SET @firstName = ?;SET @lastName = ?;SET @barGrading = ?;CALL lawyerADDInfo(@firstName ,@lastName,@barGrading);";
  mysqlConnection.query(sql, [emp.firstName, emp.lastName, emp.barGrading], function (err, rows, fields) {
    if (!err) {
      // respond by sending the inserted row id
      res.send(rows);
    } else {
      console.log(err);
    }
  });
}); //view single employee single sheet

app.post("/singlesheet", function (req, res) {
  var emp = req.body;
  var sql = "SET @employeeID = ?;SET @startDate = ?;SET @endDate = ?;CALL lawChamber.timestampsheet(@employeeID,@startDate,@endDate);";
  mysqlConnection.query(sql, [emp.employeeID, emp.startDate, emp.endDate], function (err, rows, fields) {
    if (!err) {
      res.send(rows);
    } else {
      console.log(err);
    }
  });
}); //sum project within a range for a specific company

app.post("/rangesumReport", function (req, res) {
  var emp = req.body;
  var sql = "SET @project_Name = ?;SET @startRange = ?;SET @endRange = ?;CALL company_sum_range(@project_Name,@startRange,@endRange); ";
  mysqlConnection.query(sql, [emp.project_Name, emp.startRange, emp.endRange], function (err, rows, fields) {
    if (!err) {
      res.send(rows);
    } else {
      console.log(err);
    }
  });
}); // sum all project for company

app.post("/sumReport", function (req, res) {
  var emp = req.body;
  var sql = "SET @project_Name = ?;CALL lawChamber.companySum(@project_Name); ";
  mysqlConnection.query(sql, [emp.project_Name], function (err, rows, fields) {
    if (!err) {
      res.send(rows);
    } else {
      console.log(err);
    }
  });
});
app.listen("5000", function () {
  console.log("Server connected");
});