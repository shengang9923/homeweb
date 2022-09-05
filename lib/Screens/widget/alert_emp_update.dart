import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:homeweb/Screens/NetworkService/networkHelper.dart';

import '../../constants.dart';


class Alert_EMP_UPDATE{

  TextEditingController emp_name = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController designation_id = TextEditingController();
  TextEditingController department_id = TextEditingController();
  TextEditingController emp_remark = TextEditingController();
  dynamic dataList;
  Alert_EMP_UPDATE(this.dataList){
   emp_name.text = dataList["name"];
   dob.text = dataList["date_of_birth"];
   designation_id.text = dataList["designation_id"].toString();
   department_id.text = dataList["department_id"].toString();
   emp_remark.text = dataList["remark"];
  }

  dynamic alert_emp_update(context) => showDialog(
      context: context,
      builder: (context) => FittedBox(
        child: AlertDialog(
            title: Text("Update data"),
            content: SingleChildScrollView(
                child: Column(
                  children: [
                    Divider(color: Colors.white,) ,
                    TextFormField(
                      controller: emp_name,
                      //  initialValue: dataList['name'],
                      decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                    Divider(color: Colors.black,),
                    TextFormField(
                 controller: dob,
                   //   initialValue: dataList['date_of_birth'],
                      decoration: InputDecoration(
                          labelText: "DOB",
                          border: OutlineInputBorder()
                      ),
                    ),
                    Divider(color: Colors.black,),
                    TextFormField(
                      controller: designation_id,
                    //  initialValue: dataList['designation_id'].toString(),
                      decoration: InputDecoration(
                          labelText: "Designation ID",
                          border: OutlineInputBorder()
                      ),
                    ),
                    Divider(color: Colors.black,),
                    TextFormField(
                      controller: department_id,
                     // initialValue: dataList['department_id'].toString(),
                      decoration: InputDecoration(
                          labelText: "Department ID",
                          border: OutlineInputBorder()
                      ),
                    ),
                    Divider(color: Colors.black,),
                    TextFormField(
                      controller: emp_remark,
                     // initialValue: dataList['remark'],
                      decoration: InputDecoration(
                          labelText: "Remark",
                          border: OutlineInputBorder()
                      ),
                    ),
                    Divider(color: Colors.white,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: ()async{
                              NetworkHeloper networkHelper = NetworkHeloper();
                              await networkHelper.updateEmp(dataList['id'].toString(),emp_name.text,dob.text,designation_id.text,department_id.text,emp_remark.text);
                            },
                            style: btnStyleColor(Colors.green),
                            child: Text("Update")),
                      ],
                    )
                  ],
                )
            )),
      ));
}

