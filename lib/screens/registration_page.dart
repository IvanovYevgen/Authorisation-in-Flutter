import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common_widgets/my_raised_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../size_config.dart';
import '../text_fild.dart';
import 'notes.dart';
// import 'notes.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SharedPreferences sharedPreferences;

  setLoginAndPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('login', emailController.text);
    await prefs.setString('password', passwordController.text);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NotesPage()));
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double myHight = SizeConfig.safeBlockHorizontal;
    double myWidth = SizeConfig.safeBlockVertical;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text('Test App'),
        elevation: 2.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://cdn.dribbble.com/users/56427/screenshots/9090895/media/0ef551627a1d2848b8c1b7c2d672927c.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Registration',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: myHight * 10,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: myHight * 5),
              MyTextFild(
                  myController: emailController,
                  myHight: myHight,
                  myHintText: 'Login',
                  myFillColor: Colors.cyan),
              SizedBox(height: myHight * 5),
              MyTextFild(
                  myController: passwordController,
                  myHight: myHight,
                  myHintText: 'Password',
                  myFillColor: Colors.cyan),
              SizedBox(height: myHight * 2),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: myWidth * 18,
                  height: myHight * 16,
                  child: MyRaisedButton(
                    myColor: Colors.blueAccent,
                    myFunction: setLoginAndPassword,
                    myHight: myHight,
                    myWidth: myWidth,
                    textString: 'Новый пользователь',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
