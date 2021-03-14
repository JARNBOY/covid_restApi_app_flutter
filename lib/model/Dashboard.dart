import 'package:flutter/material.dart';

//------------data all response --------------
// class Dashboard_Config_Model{
//   final Dashboard_Cases_Model cases_model;
//   final Dashboard_Data_Model data_model;
//   Dashboard_Config_Model({
//     this.cases_model,
//     this.data_model,
//   });
// }
//------------model response type 1--------------
List<Dashboard_Cases_Model> list_cases = [];

class Dashboard_Cases_Model {
  final String date;
  final int cases;
  Dashboard_Cases_Model({
    this.cases,
    this.date,
  });
}

//------------model response type 2--------------
List<Dashboard_Data_Model> list_data = [];

class Dashboard_Data_Model {
  final String date;
  final int data;
  Dashboard_Data_Model({
    this.data,
    this.date,
  });
}
