import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_akhir/database/ceklogin.dart';
import 'package:project_akhir/database/data.dart';
import 'package:project_akhir/screen/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final HiveDatabase _hive = HiveDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/awalaja.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 210,
              child: Image.asset("assets/icon.png", width:600, height: 600,),
            ),
            Padding(padding: const EdgeInsets.only(bottom: 5)),
            Text(
                "Peramal Yahud",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                )
            ),
            Padding(padding: const EdgeInsets.only(bottom: 30)),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: "Username",
                hintStyle : TextStyle(
                  fontFamily: 'Bebasneue',
                ),
                prefixIcon: Icon(Icons.person ),
                contentPadding: EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                    color: Color(0xff0660a9),
                  ),
                ),
              ),
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'Harus Masukan Username';
                }
              },
            ),
            Padding(padding: const EdgeInsets.only(bottom: 10)),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
                hintStyle : TextStyle(
                  fontFamily: 'Bebasneue',
                ),
                prefixIcon: Icon(Icons.lock),
                contentPadding: EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                    color: Color(0xff0660a9),
                  ),
                ),
              ),
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'Harus Masukan Password';
                }
              },
            ),
            Padding(padding: const EdgeInsets.only(bottom: 25)),
            _buildRegisterButton(),
            Padding(padding: const EdgeInsets.only(bottom: 10)),
            _buildKembaliButton(),
          ],
        ),
      ),
    );
  }


  Widget _commonSubmitButton({
    String labelButton,
    Function(String) submitCallback,
  }){
    return Container(
      height: 50,
      width: 100,
      child: RaisedButton(
        padding: EdgeInsets.all(0),
        onPressed: () {submitCallback(labelButton);},
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
  Widget _buildRegisterButton() {
    return _commonSubmitButton(
      labelButton: "Register",

      submitCallback: (value) {
        if (_usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
          _hive.addData(
              DataModel(
                  username: _usernameController.text,
                  password: _passwordController.text
              )
          );
          _usernameController.clear();
          _passwordController.clear();
          setState(() {});

          Navigator.pop(context);
        }
      },
    );
  }

  Widget _commonKembaliButton({
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
  Widget _buildKembaliButton() {
    return _commonKembaliButton(
      labelButton: "Kembali",


    );
  }
}