
import 'package:flutter/material.dart';
import 'package:project_akhir/database/ceklogin.dart';
import 'package:project_akhir/screen/navbar.dart';
//import 'package:project_akhir/screen/navbar.dart.dart';
//import 'package:project_mobile_individu/Helper/hiveDatabase.dart';
import 'daftar.dart';

class LoginPageFul extends StatefulWidget {
  const LoginPageFul({Key key}) : super(key: key);

  @override
  _LoginPageFulState createState() => _LoginPageFulState();
}

class _LoginPageFulState extends State<LoginPageFul> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form != null) {
      if (form.validate()) {
        print('Berhasil');
      } else {
        print('Gagal');
      }
    }
  }
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/awalbgt.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8), BlendMode.dstATop),
        ),),
        child: Form(
          key: _formKey,
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
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person ),
                  contentPadding: EdgeInsets.all(8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      color: Color(0xff0660a9),
                    ),
                  ),
                ),
                validator: (value) => value.isEmpty ? 'Username Tidak Boleh Kosong ':null,
              ),
              Padding(padding: const EdgeInsets.only(bottom: 10)),
              TextFormField(
                obscureText: _isHidden,
                controller: _passwordController,
    decoration: InputDecoration(
    labelText: 'Password',
    prefixIcon: Icon(Icons.lock),
      suffixIcon: IconButton(
        onPressed: _toggleVisibility,
        icon: _isHidden
            ? Icon(Icons.visibility)
            : Icon(Icons.visibility_off),),
      contentPadding: EdgeInsets.all(8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Color(0xff0660a9),
        ),
      ),
    ),
                validator: (value) => value.isEmpty ? 'Password Tidak Boleh Kosong' : null,
              ),
              Padding(padding: const EdgeInsets.only(bottom: 20)),
              _buildLoginButton(),
              Padding(padding: const EdgeInsets.only(bottom: 10)),
              _buildRegisterButton(),
            ],
          ),
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

  Widget _buildLoginButton() {
    return _commonSubmitButton(

      labelButton: "Masuk",
      submitCallback: (value) {
        validateAndSave();
        String currentUsername = _usernameController.value.text;
        String currentPassword = _passwordController.value.text;

        _processLogin(currentUsername, currentPassword);
      },
    );
  }

  void _processLogin(String username, String password) async {
    final HiveDatabase _hive = HiveDatabase();
    bool found = false;

    found = _hive.checkLogin(username, password);

    if(!found) showAlertDialog(context);
    else{
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      );
      SnackBar snackBar = SnackBar(
        duration: Duration(seconds : 2),
        behavior: SnackBarBehavior.floating,
        shape:
        RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
        backgroundColor:  Color(0xff0660a9),
        content: Text("Login Berhasil!",style: TextStyle(fontFamily: 'Bebasneue'),),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Widget _buildRegisterButton() {
    return _commonSubmitButton(
      labelButton: "Daftar",

      submitCallback: (value) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SignUp(),
          ),
        );
      },
    );
  }
}

showAlertDialog(BuildContext context) {


  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape:
    RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
    title: Text("Gagal Masuk Aplikasi!",style: TextStyle(fontFamily: "Bebasneue",fontWeight: FontWeight.bold),),
    content: Text("Password atau Username Salah"),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


