

import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class NetworkHeloper {
  Future<dynamic> getNetwork()async{
    Response response = await http.get(Uri.parse("https://phpstack-598410-2859373.cloudwaysapps.com/api/employees"));
    var resdata = jsonDecode(response.body);
    if(response.statusCode == 200){
      return resdata;
    }
  }

updateEmp(emp_id,emp_name,emp_dob,emp_designation,emp_department,emp_remark)async{
    Response response = await http.patch(Uri.parse("https://phpstack-598410-2859373.cloudwaysapps.com/api/employees/$emp_id"),
    body: {
      "name": emp_name,
      // "date_of_birth": "2000-10-10",
      // "designation_id": 3,
      // "department_id": 2,
      "remark": emp_remark
    }
    );
    var resdata = jsonDecode(response.body);
    if(response.statusCode == 200){
     print(resdata.toString());
    }
  }
}