import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class HomeTest extends StatefulWidget {
  const HomeTest({Key? key}) : super(key: key);

  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  final List<String> items = ['Item1', 'Item2', 'Item3', 'Item4'];
  String? selectedValue;

  int statusCode = 0;

  var sideLength = Colors.white;

  var c_Color;

  void _updateLocation(PointerEvent details) {
    setState(() {
      c_Color = Colors.red;
      // x = details.position.dx;
      // y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF212529),
          title: Container(
              padding: EdgeInsets.only(left: 100),
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.focused))
                          return Colors.white;
                        if (states.contains(MaterialState.pressed))
                          return Colors.transparent;
                        return Colors.white;// null throus error in flutter 2.2+.
                      }),
                ),
                onPressed: () {
                  setState(() {
                    statusCode = 0;
                  });
                },
                child: Text('Test Application'),
              ),),
          actions: [
            Container(
              padding: EdgeInsets.only(right: 100),
              child: Row(
                children: [
                  InkWell(
                      onTap:(){},
                      onHover: (value) {
                        print(value);
                        setState(() {
                          sideLength = value?Colors.white :Colors.white.withOpacity(0.5);
                        });
                      },
                      child: Text('Homes',style: TextStyle(
                        color: sideLength
                      ),)),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.focused))
                              return Colors.white;
                            if (states.contains(MaterialState.hovered))
                              return Colors.white;
                            if (states.contains(MaterialState.pressed))
                              return Colors.transparent;
                            return Colors.white.withOpacity(0.5); // null throus error in flutter 2.2+.
                          }),
                    ),
                    onPressed: () {  setState(() {
                      statusCode = 0;
                    }); },
                    child: Text('Home'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.focused))
                                  return Colors.white;
                                if (states.contains(MaterialState.hovered))
                                  return Colors.white;
                                if (states.contains(MaterialState.pressed))
                                  return Colors.transparent;
                                return Colors.white.withOpacity(0.5);// null throus error in flutter 2.2+.
                          }),
                    ),
                    onPressed: () {
                      setState(() {
                        statusCode = 1;
                      });
                    },
                    child: Text('Employees'),
                  ),
                  SizedBox(
                    width: 10,
                  ) ,
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.focused))
                                  return Colors.white;
                                if (states.contains(MaterialState.hovered))
                                  return Colors.white;
                                if (states.contains(MaterialState.pressed))
                                  return Colors.transparent;
                                return Colors.white.withOpacity(0.5);// null throus error in flutter 2.2+.
                          }),
                    ),
                    onPressed: () {
                      setState(() {
                        statusCode = 2;
                      });
                    },
                    child: Text('Department'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.focused))
                                  return Colors.white;
                                if (states.contains(MaterialState.hovered))
                                  return Colors.white;
                                if (states.contains(MaterialState.pressed))
                                  return Colors.transparent;
                                return Colors.white.withOpacity(0.5);// null throus error in flutter 2.2+.
                          }),
                    ),
                    onPressed: () {
                      setState(() {
                        statusCode = 3;
                      });
                    },
                    child: Text('Designation'),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            )
          ],
        ),
        body: Scaffold(
          body: Column(
            children: [
              Visibility(
                visible: statusCode == 0,
                child:   Text("Home"),
              ),
              Visibility(
                visible: statusCode == 1,
                child:   buildEmployees(),
              ),
              Visibility(
                visible: statusCode == 2,
                child:   buildDepartment(),
              ),
              Visibility(
                visible: statusCode == 3,
                child:   buildDesignation(),
              ),
            ],
          )
        ));
  }

  Container buildEmployees() {
    return Container(
          padding: EdgeInsets.symmetric(horizontal: 100),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Home /",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 17,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Container",
                        style: TextStyle(fontSize: 40),
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                          ),
                          onPressed: () {
                            showDialog(context: context, builder: (context) => FittedBox(
                              child: AlertDialog(
                                title: Text("Create Employee"),
                                content: Column(
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder()
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder()
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder()
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder()
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder()
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    ElevatedButton(onPressed: (){}, child: Text("Create"))
                                  ],
                                )
                              ),
                            ));
                          },
                          child: Text("Create employee")),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Showing 1-3 of 3 items.",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Table(
                    columnWidths: const <int, TableColumnWidth>{
                      0: FixedColumnWidth(30),
                      1: FlexColumnWidth(20),
                      2: FlexColumnWidth(30),
                      3: FlexColumnWidth(30),
                      4: FlexColumnWidth(30),
                      5: FlexColumnWidth(30),
                      6: FlexColumnWidth(30),
                      7: FlexColumnWidth(30),
                      8: FixedColumnWidth(64),
                    },
                    border: TableBorder
                        .all(), // Allows to add a border decoration around your table
                    children: [
                      TableRow(children: [
                        TopList('#'),
                        TopList("Name"),
                        TopList('Date of Birth'),
                        TopList('Designation ID'),
                        TopList('Department ID'),
                        TopList('Remark'),
                        TopList('Created At'),
                        TopList('Updated At'),
                        TopList(' '),
                      ]),
                      TableRow(children: [
                        Text(''),
                        topEntry(),
                        topEntry(),
                        buildDropdownButtonHideUnderline(),
                        topEntry(),
                        topEntry(),
                        topEntry(),
                        topEntry(),
                        SizedBox()
                      ]),
                      TableRow(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1)),
                          children: [
                            tableItemDetail('1'),
                            tableItemDetail("Thanil"),
                            tableItemDetail('11-11-2022'),
                            tableItemDetail('Cooker'),
                            tableItemDetail('123'),
                            tableItemDetail('Good'),
                            tableItemDetail('Good boy'),
                            tableItemDetail('12-12-2000\n17:39:10'),
                            crudTable(),
                          ]),
                      TableRow(children: [
                        tableItemDetail('2'),
                        tableItemDetail("Denish"),
                        tableItemDetail('11-11-2022'),
                        tableItemDetail('Drinker'),
                        tableItemDetail('123'),
                        tableItemDetail('Good'),
                        tableItemDetail('Good boy'),
                        tableItemDetail('12-12-2000\n17:39:10'),
                        crudTable(),
                      ]),
                      TableRow(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1)),
                          children: [
                            tableItemDetail('3'),
                            tableItemDetail("Henthoi"),
                            tableItemDetail('11-11-2022'),
                            tableItemDetail('Cowboy'),
                            tableItemDetail('123'),
                            tableItemDetail('Good'),
                            tableItemDetail('Good boy'),
                            tableItemDetail('12-12-2000\n17:39:10'),
                            crudTable()
                          ]),
                    ]),
              ],
            ),
          ),
        );
  }

  Container buildDepartment() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Home /",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Department",
                    style: TextStyle(fontSize: 40),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.green),
                      ),
                      onPressed: () {},
                      child: Text("Create employee")),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Showing 1-3 of 3 items.",
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(30),
                  1: FlexColumnWidth(20),
                  2: FlexColumnWidth(30),
                  3: FlexColumnWidth(30),
                  4: FlexColumnWidth(30),
                  5: FlexColumnWidth(30),
                  6: FlexColumnWidth(30),
                  7: FlexColumnWidth(30),
                  8: FixedColumnWidth(64),
                },
                border: TableBorder
                    .all(), // Allows to add a border decoration around your table
                children: [
                  TableRow(children: [
                    TopList('#'),
                    TopList("Name"),
                    TopList('Date of Birth'),
                    TopList('Designation ID'),
                    TopList('Department ID'),
                    TopList('Remark'),
                    TopList('Created At'),
                    TopList('Updated At'),
                    TopList(' '),
                  ]),
                  TableRow(children: [
                    Text(''),
                    topEntry(),
                    topEntry(),
                    buildDropdownButtonHideUnderline(),
                    topEntry(),
                    topEntry(),
                    topEntry(),
                    topEntry(),
                    SizedBox()
                  ]),
                  TableRow(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1)),
                      children: [
                        tableItemDetail('1'),
                        tableItemDetail("Thanil"),
                        tableItemDetail('11-11-2022'),
                        tableItemDetail('Cooker'),
                        tableItemDetail('123'),
                        tableItemDetail('Good'),
                        tableItemDetail('Good boy'),
                        tableItemDetail('12-12-2000\n17:39:10'),
                        crudTable(),
                      ]),
                  TableRow(children: [
                    tableItemDetail('2'),
                    tableItemDetail("Denish"),
                    tableItemDetail('11-11-2022'),
                    tableItemDetail('Drinker'),
                    tableItemDetail('123'),
                    tableItemDetail('Good'),
                    tableItemDetail('Good boy'),
                    tableItemDetail('12-12-2000\n17:39:10'),
                    crudTable(),
                  ]),
                  TableRow(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1)),
                      children: [
                        tableItemDetail('3'),
                        tableItemDetail("Henthoi"),
                        tableItemDetail('11-11-2022'),
                        tableItemDetail('Cowboy'),
                        tableItemDetail('123'),
                        tableItemDetail('Good'),
                        tableItemDetail('Good boy'),
                        tableItemDetail('12-12-2000\n17:39:10'),
                        crudTable()
                      ]),
                ]),
          ],
        ),
      ),
    );
  }

  Container buildDesignation() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Home /",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Designation",
                    style: TextStyle(fontSize: 40),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.green),
                      ),
                      onPressed: () {},
                      child: Text("Create employee")),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Showing 1-3 of 3 items.",
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(30),
                  1: FlexColumnWidth(20),
                  2: FlexColumnWidth(30),
                  3: FlexColumnWidth(30),
                  4: FlexColumnWidth(30),
                  5: FlexColumnWidth(30),
                  6: FlexColumnWidth(30),
                  7: FlexColumnWidth(30),
                  8: FixedColumnWidth(64),
                },
                border: TableBorder
                    .all(), // Allows to add a border decoration around your table
                children: [
                  TableRow(children: [
                    TopList('#'),
                    TopList("Name"),
                    TopList('Date of Birth'),
                    TopList('Designation ID'),
                    TopList('Department ID'),
                    TopList('Remark'),
                    TopList('Created At'),
                    TopList('Updated At'),
                    TopList(' '),
                  ]),
                  TableRow(children: [
                    Text(''),
                    topEntry(),
                    topEntry(),
                    buildDropdownButtonHideUnderline(),
                    topEntry(),
                    topEntry(),
                    topEntry(),
                    topEntry(),
                    SizedBox()
                  ]),
                  TableRow(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1)),
                      children: [
                        tableItemDetail('1'),
                        tableItemDetail("Thanil"),
                        tableItemDetail('11-11-2022'),
                        tableItemDetail('Cooker'),
                        tableItemDetail('123'),
                        tableItemDetail('Good'),
                        tableItemDetail('Good boy'),
                        tableItemDetail('12-12-2000\n17:39:10'),
                        crudTable(),
                      ]),
                  TableRow(children: [
                    tableItemDetail('2'),
                    tableItemDetail("Denish"),
                    tableItemDetail('11-11-2022'),
                    tableItemDetail('Drinker'),
                    tableItemDetail('123'),
                    tableItemDetail('Good'),
                    tableItemDetail('Good boy'),
                    tableItemDetail('12-12-2000\n17:39:10'),
                    crudTable(),
                  ]),
                  TableRow(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1)),
                      children: [
                        tableItemDetail('3'),
                        tableItemDetail("Henthoi"),
                        tableItemDetail('11-11-2022'),
                        tableItemDetail('Cowboy'),
                        tableItemDetail('123'),
                        tableItemDetail('Good'),
                        tableItemDetail('Good boy'),
                        tableItemDetail('12-12-2000\n17:39:10'),
                        crudTable()
                      ]),
                ]),
          ],
        ),
      ),
    );
  }

  Container buildDropdownButtonHideUnderline() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Row(
              children: const [
                SizedBox(
                  width: 4,
                ),
              ],
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ))
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            },
            icon: const Icon(
              Icons.expand_more,
              size: 20,
            ),
            iconSize: 14,
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.black,
            buttonHeight: 50,
            buttonWidth: 160,
            buttonPadding: const EdgeInsets.only(left: 14, right: 14),
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black26,
              ),
              color: Colors.white,
            ),
            buttonElevation: 2,
            itemHeight: 40,
            itemPadding: const EdgeInsets.only(left: 14, right: 14),
            dropdownMaxHeight: 200,
            dropdownWidth: 200,
            dropdownPadding: null,
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white,
            ),
            dropdownElevation: 8,
            scrollbarRadius: const Radius.circular(40),
            scrollbarThickness: 6,
            scrollbarAlwaysShow: true,
            offset: const Offset(-20, 0),
          ),
        ),
      ),
    );
  }
}

class tableItemDetail extends StatelessWidget {
  final itemData;
  tableItemDetail(this.itemData);

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("$itemData"),
          )),
    );
  }
}

class TopList extends StatelessWidget {
  final listTxt;
  TopList(this.listTxt);

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Align(alignment: Alignment.centerLeft, child: Text("$listTxt")),
      ),
    );
  }
}

class topEntry extends StatelessWidget {
  const topEntry({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: SizedBox(
          height: 30,
          child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder())),
        ),
      ),
    );
  }
}

class crudTable extends StatelessWidget {
  // final listTxt;
  // TopList(this.listTxt);

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Align(
            alignment: Alignment.centerLeft,
            child: FittedBox(
              child: Row(
                children: [
                  Icon(Icons.visibility),
                  Icon(Icons.edit),
                  Icon(Icons.delete),
                ],
              ),
            )),
      ),
    );
  }
}