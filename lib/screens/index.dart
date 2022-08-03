import 'package:flutter/material.dart';
import 'package:nineplus/screens/home.dart';
import 'package:nineplus/screens/profile.dart';
import 'package:nineplus/widgets/drawer_tile.dart';

class Index extends StatefulWidget {
  Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final GlobalKey<ScaffoldState> drawerkey = GlobalKey();
  int currentTabIndex = 0;
  void openCloseDrawer() {
    drawerkey.currentState!.isDrawerOpen
        ? Navigator.pop(context)
        : drawerkey.currentState?.openDrawer();
  }

  List<Widget> tabs = [
    Home(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerkey,
      appBar: AppBar(
          // leading: Iconb,
          ),
      drawer: Container(
        width: 180,
        child: Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(),
                  accountName: Text("name"),
                  accountEmail: Text("email")),
              DrawerListTile(
                  title: "home",
                  svgSrc: Icons.home,
                  press: () {
                    setState(() {
                      currentTabIndex = 0;
                    });
                    openCloseDrawer();
                  }),
              DrawerListTile(
                  title: "Profile",
                  svgSrc: Icons.person,
                  press: () {
                    setState(() {
                      currentTabIndex = 1;
                    });
                    openCloseDrawer();
                  })
            ],
          ),
        ),
      ),
      body: tabs[currentTabIndex],
    );
  }
}
