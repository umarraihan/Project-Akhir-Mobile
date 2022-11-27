import 'package:flutter/material.dart';
import 'package:project_akhir/screen/login.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(

          image: DecorationImage(
            image: AssetImage('assets/awalfix.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: TweenAnimationBuilder( // Title Animation
                child: Text(
                  "Peramal Yahud ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 70,
                      height: 1.0,
                      fontFamily: "BebasNeue"),
                ),
                tween: Tween<double>(begin: 0, end: 1),
                duration: Duration(milliseconds: 500),
                builder: (BuildContext context, double _value, child) {
                  return Opacity(
                    opacity: _value,
                    child: Padding(
                      padding: EdgeInsets.only(top: _value * 20),
                      child: child,
                    ),
                  );
                },
              ),
            ),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                
                image: DecorationImage(
                    image: AssetImage('images/40.png'), fit: BoxFit.fill),
              ),
            ),
            TweenAnimationBuilder( // Button Animation
              child: Padding(
                padding:  EdgeInsets.only(bottom: 20),
                child: Container(
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
                          "Coba",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(milliseconds: 500),
              builder: (BuildContext context, double _value, child) {
                return Opacity(
                  opacity: _value,
                  child: Padding(
                    padding: EdgeInsets.only(top: _value * 30),
                    child: child,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
