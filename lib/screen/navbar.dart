
import 'package:project_akhir/screen/awal.dart';
import 'package:project_akhir/screen/cari.dart';
import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:project_akhir/screen/login.dart';
import 'package:project_akhir/screen/profile_page.dart';
import 'package:project_akhir/screen/utama.dart';


class MainScreen extends StatefulWidget {
  MainScreen({this.locationWeather});
  final String locationWeather;
  @override
  _MainScreenState createState() => _MainScreenState();
}



class _MainScreenState extends State<MainScreen> {

  int selectedIndex = 0;



  final List<Widget> _children = [
    LocationScreen(),
    //Jokes(),
    Umar(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _children[selectedIndex],
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.purple.withOpacity(0.2),
          selectedItemBorderColor: Colors.deepPurple,
          selectedItemBackgroundColor: Colors.white54,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.white,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Beranda',
          ),
          FFNavigationBarItem(
            iconData: Icons.person,
            label: 'Anggota Kelompok',
          ),

        ],
      ),
    );
  }


  Widget _commonStart({
    String labelButton,
    Function(String) submitCallback,
  }){
    return Container(
      height: 50,
      width: 100,
      child: RaisedButton(
        padding: EdgeInsets.all(0),
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (LoginPageFul())),);},
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(143, 148, 251, 1),
                Color.fromRGBO(143, 148, 251, .6),
              ],
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
            child: Text(
              labelButton,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

}
