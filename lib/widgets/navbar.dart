import 'package:adzone/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:adzone/screens/cam.dart';
import 'package:adzone/screens/home.dart';
import 'package:adzone/screens/profil.dart';
import 'package:adzone/screens/map.dart';
import 'package:iconsax/iconsax.dart';

class Navbar extends StatefulWidget {
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  final screens = [
    HomeScreen(),
    Map(),
    Camera(),
    Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: GNav(
                  rippleColor: Colors.grey[300],
                  hoverColor: Colors.grey[100],
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: kadzone,
                  color: Colors.black,
                  tabs: [
                    GButton(
                      icon: Iconsax.home,
                      iconActiveColor: kPrimaryColor,
                      iconColor: kGreyColor,
                      textColor: kPrimaryColor,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Iconsax.map,
                      iconActiveColor: kPrimaryColor,
                      iconColor: kGreyColor,
                      textColor: kPrimaryColor,
                      text: 'Map',
                    ),
                    GButton(
                      icon: Iconsax.scan,
                      iconActiveColor: kPrimaryColor,
                      iconColor: kGreyColor,
                      textColor: kPrimaryColor,
                      text: 'Camera',
                    ),
                    GButton(
                      icon: Iconsax.user,
                      iconActiveColor: kPrimaryColor,
                      iconColor: kGreyColor,
                      textColor: kPrimaryColor,
                      text: 'Profile',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
            )));
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

