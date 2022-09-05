import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:homeweb/Screens/NetworkService/networkHelper.dart';
import 'package:sidebarx/sidebarx.dart';

import '../widget/alert_emp.dart';
import '../widget/alert_emp_update.dart';

class SidebarXExampleApp extends StatelessWidget {
  SidebarXExampleApp({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
              backgroundColor: canvasColor,
              title: Text(_getTitleByIndex(_controller.selectedIndex)),
              leading: IconButton(
                onPressed: () {
                  // if (!Platform.isAndroid && !Platform.isIOS) {
                  //   _controller.setExtended(true);
                  // }
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            )
                : null,
            drawer: ExampleSidebarX(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) ExampleSidebarX(controller: _controller),
                Expanded(
                  child: Center(
                    child: _ScreensExample(
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FlutterLogo(),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
          onTap: () {
            debugPrint('Home');
          },
        ),
        const SidebarXItem(
          icon: Icons.search,
          label: 'Search',
        ),
        const SidebarXItem(
          icon: Icons.people,
          label: 'People',
        ),
        const SidebarXItem(
          icon: Icons.favorite,
          label: 'Favorite',
        ),
        const SidebarXItem(
          iconWidget: FlutterLogo(size: 20),
          label: 'Flutter',
        ),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
   _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  List empList = [];

  Future<dynamic> getData()async{
    NetworkHeloper networkHeloper = NetworkHeloper();
    empList = await networkHeloper.getNetwork();
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return FutureBuilder(
              future:getData(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if(snapshot.data != null){
                  return DataTable2(
                      columnSpacing: 12,
                      horizontalMargin: 12,
                      minWidth: 100,
                      columns: [
                        DataColumn2(
                            label: Text('ID'),
                            size: ColumnSize.S
                        ),
                        DataColumn(
                          label: Text('Name'),
                        ),
                        DataColumn(
                          label: Text('Date of Birth'),
                        ),
                        DataColumn(
                          label: Text('Desination ID'),
                        ),
                        DataColumn(
                          label: Text('Department ID'),
                        ),
                        DataColumn(
                          label: Text('Remark'),
                        ),
                        DataColumn(
                          label: Text('Created At'),
                        ),
                        DataColumn(
                          label: Text('Updated At'),
                        ),
                        DataColumn2(
                            label: Text(''),
                            size: ColumnSize.S
                        ),
                      ],
                      rows: List<DataRow>.generate(
                          empList.length,
                              (index) => DataRow(cells: [
                            DataCell(Text(empList[index]['id'].toString())),
                            DataCell(Text(empList[index]['name'].toString())),
                            DataCell(Text(empList[index]['date_of_birth'].toString())),
                            DataCell(Text(empList[index]['designation_id'].toString())),
                            DataCell(Text(empList[index]['department_id'].toString())),
                            DataCell(Text(empList[index]['remark'].toString())),
                            DataCell(Text(empList[index]['created_at'].toString())),
                            DataCell(Text(empList[index]['updated_at'].toString())),
                            DataCell(Row(
                              children: [
                                InkWell(
                                    onTap:(){
                                      alert_emp(context,empList[index]);
                                    },
                                    child: Icon(Icons.preview_outlined)),
                                InkWell(
                                    onTap:(){
                                      Alert_EMP_UPDATE alert_emp_up = Alert_EMP_UPDATE(empList[index]);
                                      alert_emp_up.alert_emp_update(context);
                                    },
                                    child: Icon(Icons.edit)),
                                InkWell(
                                    onTap:(){},
                                    child: Icon(Icons.delete)),
                              ],
                            ))
                          ]))
                  );
                }
                return CircularProgressIndicator();
              },
            );
            // return ListView.builder(
            //   itemCount: empList.length,
            //   padding: const EdgeInsets.only(top: 10),
            //   itemBuilder: (context, index){
            //     return Container(
            //       child: Column(
            //         children: [
            //
            //         ],
            //       ),
            //
            //     );
            //   }
            // );
          case 1:
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: 3,
              itemBuilder: (context, index) => Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).canvasColor,
                  boxShadow: const [BoxShadow()],
                ),
              ),
            );
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headline5,
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Search';
    case 2:
      return 'People';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    default:
      return 'Not found page';
  }
}

const primaryColor = Color(0xFF685BFF);
// const canvasColor = Color(0xFF2E2E48);
const canvasColor = Colors.grey;
// const scaffoldBackgroundColor = Color(0xFF464667);
const scaffoldBackgroundColor = Colors.white;
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);