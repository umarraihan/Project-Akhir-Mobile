
import 'package:flutter/material.dart';
import 'package:project_akhir/screen/navbar.dart';


class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  List<CityScreen> _list = [];
  var loading = false;
  Future<Null> _fetchData() async {
    setState(() {
      loading = true;
    });
  }
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      TextButton(
                                        onPressed: () async {
                                          String typedName = await Navigator.push(
                                            context, MaterialPageRoute(builder: (context) {
                                                return CityScreen();
                                              },
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.search ,
                                          color: Colors.white,
                                          size: 50.0,
                                        ),
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
                                      'Telusuri Daerah ' ,
                                      style: TextStyle(
                                        color: isDarkMode ? Colors.white : Colors.black,
                                        fontSize: size.height * 0.06,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.03,
                                  ),
                                  child: SafeArea(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(20.0),
                                          child: TextField(
                                            style: TextStyle(color: Colors.black),
                                            decoration: const InputDecoration(

                                              hintText: "Masukan Nama Daerah",
                                              hintStyle : TextStyle(
                                                fontFamily: 'Raleway',
                                              ),
                                              prefixIcon: Icon(Icons.search ),
                                              contentPadding: EdgeInsets.all(8),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                                borderSide: BorderSide(
                                                  color: Color(0xff0660a9),
                                                ),
                                              ),
                                            ),

                                            onChanged: (value) {
                                              cityName = value;
                                            },
                                          ),
                                        ),
                                        _buildCariButton(),

                                      ],
                                    ),
                                  ),
                                ),
                              ]),) ]),))));
  }

  Widget _commonCariButton({
    String labelButton,
    Function(String) submitCallback,
  }){
    return Container(
      height: 50,
      width: 100,
      child: RaisedButton(
        padding: EdgeInsets.all(0),
        onPressed: () {Navigator.pop(context, cityName); },
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
  Widget _buildCariButton() {
    return _commonCariButton(
      labelButton: "Cari Daerah",


    );
  }
}
