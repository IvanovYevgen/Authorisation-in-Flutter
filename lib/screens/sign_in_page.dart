import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_rf/common_widgets/text_fild.dart';
import 'package:test_app_rf/screens/registration_page.dart';
import 'package:test_app_rf/service_size/size_config.dart';
import '../common_widgets/my_raised_button.dart';
import 'notes.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  checkLoginAndPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String log = prefs.getString('login');
    String pass = prefs.getString('password');

    if ((log == emailController.text) && (pass == passwordController.text)) {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => NotesPage()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RegistrationPage()));
    }
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
                "https://cdn.dribbble.com/users/2229974/screenshots/14431740/media/78dc80935b25bcb3dbb2302883f94c63.png"),
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
                'Sign in',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: myHight * 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: myHight * 5),
              MyTextFild(
                myHight: myHight,
                myHintText: 'Login',
                myFillColor: Colors.yellow,
                myController: emailController,
              ),
              SizedBox(height: myHight * 5),
              MyTextFild(
                myHight: myHight,
                myHintText: 'Password',
                myFillColor: Colors.yellow,
                myController: passwordController,
              ),
              SizedBox(height: myHight * 1.47),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: SizedBox(
                  width: myWidth * 18,
                  height: myHight * 16,
                  child: MyRaisedButton(
                      myWidth: myWidth,
                      myHight: myHight,
                      myFunction: checkLoginAndPassword,
                      myColor: Colors.blueGrey,
                      textString: 'Войти'),
                ),
              ),
              SizedBox(height: myHight * 2),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: SizedBox(
                  width: myWidth * 18,
                  height: myHight * 16,
                  child: MyRaisedButton(
                    myWidth: myWidth,
                    myHight: myHight,
                    myFunction: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationPage()));
                    },
                    myColor: Colors.orange,
                    textString: 'Регистрация',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // backgroundColor: Colors.grey[200],
    );
  }
}
