import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

dynamic alert_emp(context,dataList) => showDialog(
    context: context,
    builder: (context) => FittedBox(
      child: AlertDialog(
          title: Text(dataList['name']),
          content: SingleChildScrollView(
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("ID"),
                    SizedBox(width: 10,),
                    Text(dataList['id'].toString())
                  ],
                ),
                Divider(color: Colors.black,) ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Name"),
                    SizedBox(width: 10,),
                    Text(dataList['name'])
                  ],
                ),
                Divider(color: Colors.black,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("DOB"),
                    SizedBox(width: 10,),
                    Text(dataList['date_of_birth'])
                  ],
                ),
                Divider(color: Colors.black,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Destination ID"),
                    SizedBox(width: 10,),
                    Text(dataList['designation_id'].toString())
                  ],
                ),
                Divider(color: Colors.black,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Department ID"),
                    SizedBox(width: 10,),
                    Text(dataList['department_id'].toString())
                  ],
                ),
                Divider(color: Colors.black,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Remark"),
                    SizedBox(width: 10,),
                    Text(dataList['remark'])
                  ],
                ),
                Divider(color: Colors.black,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Created At"),
                    SizedBox(width: 10,),
                    Text(dataList['created_at'])
                  ],
                ),
                Divider(color: Colors.black,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Updated AT"),
                    SizedBox(width: 10,),
                    Text(dataList['updated_at'] == null ? "?" : dataList['updated_at'])
                  ],
                ),
                Divider(color: Colors.black,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        style: btnStyleColor(Colors.green),
                        child: Text("Update")),
                    ElevatedButton(
                        onPressed: () {},
                        style: btnStyleColor(Colors.red),
                        child: Text("Delete"))
                  ],
                )
              ],
            )
          )),
    ));