import 'package:flutter/material.dart';
import 'package:login_signup_ui_starter/theme.dart';

import 'package:login_signup_ui_starter/screens/cam.dart';
import 'package:login_signup_ui_starter/screens/home.dart';
import 'package:login_signup_ui_starter/screens/profil.dart';
import 'package:login_signup_ui_starter/screens/map.dart';

class Navbar extends StatefulWidget {

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int index = 0;

  final screens = [
    Home(),
    Map(),
    Camera(),
    Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: kPrimaryColor,
          labelTextStyle: MaterialStateProperty.all(TextStyle(fontSize: 12, fontWeight: FontWeight.w500,))
          ),
        child: NavigationBar(
          height: 60,
          backgroundColor: kWhiteColor,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: Duration(seconds: 2),
          selectedIndex: index,
          onDestinationSelected: (index) => 
            setState(() => this.index = index),
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), selectedIcon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.map_outlined), selectedIcon: Icon(Icons.map), label: 'Map'),
            NavigationDestination(icon: Icon(Icons.camera_alt_outlined), selectedIcon: Icon(Icons.camera_alt), label: 'Camera'),
            NavigationDestination(icon: Icon(Icons.portrait_outlined), selectedIcon: Icon(Icons.portrait), label: 'Profil'),
          ],
        ),
      ),
    );
  }
}

// class Navbar extends StatefulWidget {

//   @override
//   State<Navbar> createState() => _Navbar();
// }

// class _Navbar extends State<Navbar> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   List<Widget> _widgetOptions = <Widget>[
//     GestureDetector( onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));}, ),
//     GestureDetector( onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Camera()));}, ),
//     GestureDetector( onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Profil()));}, ),
//     GestureDetector( onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Map()));}, ),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(/*
//       appBar: AppBar(
//         title: const Text('Log In'),
//       ),*/
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//             backgroundColor: Colors.black
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.camera),
//             label: 'Cam',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.map),
//             label: 'Map',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.portrait),
//             label: 'Profil',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Color.fromARGB(255, 255, 155, 121),
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }





// class Navbar extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabScaffold(tabBar: CupertinoTabBar(
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//       ]
//     ), 
//     tabBuilder: (context, index) {
//       switch(index){
//         case 0:
//           return CupertinoTabView(builder: (context) {
//             return CupertinoPageScaffold(child: Home(),);
//           });
//         case 1:
//           return CupertinoTabView(builder: (context) {
//             return CupertinoPageScaffold(child: Map(),);
//           });
//         case 2:
//           return CupertinoTabView(builder: (context) {
//             return CupertinoPageScaffold(child: Camera(),);
//           });
//         case 3:
//           return CupertinoTabView(builder: (context) {
//             return CupertinoPageScaffold(child: Profil(),);
//           });
//       }
//     });
//   }
// }

