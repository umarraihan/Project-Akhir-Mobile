import 'package:project_akhir/database/inisiasi.dart';
import 'package:flutter/material.dart';
import 'package:project_akhir/screen/login.dart';
import 'package:project_akhir/screen/navbar.dart';


class Umar extends StatefulWidget {
  @override
  _Umar createState() => _Umar();
}

class _Umar extends State<Umar> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
        body: Center(
            child: Container(
                height: size.height,
                width: size.height,
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.black26 : Colors.white,
                  image: DecorationImage(
                    image: AssetImage('assets/awalu.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.8), BlendMode.dstATop),
                  ),),
                child: SafeArea(
                  child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.01,
                                    horizontal: size.width * 0.05,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () { Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => MainScreen()));
                                        },
                                        child: Icon(
                                          Icons.arrow_back ,
                                          color: Colors.white,
                                          size: 50.0,
                                        ),
                                      ),
                                      Align(
                                        child: Text(
                                          'Peramal Yahud', //
                                          style: TextStyle(
                                            color: isDarkMode
                                                ? Colors.white
                                                : const Color(0xff1D1617),
                                            fontSize: size.height * 0.03,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          SharedPreference().setLogout();
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(builder: (context) => LoginPageFul()),
                                                  (route) => false);
                                        },
                                        icon: Icon(Icons.logout_outlined ,
                                          color: Colors.white,
                                          size: 50.0,),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(

                                  padding: EdgeInsets.only(
                                    top: size.height * 0.03,
                                  ),
                                  child: Align(
                                    child: Text(
                                      'Author\n Umar Raihan Baluwel 12420004 \n' ,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.height * 0.06,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),

                              ]),) ]),))));
  }
}
