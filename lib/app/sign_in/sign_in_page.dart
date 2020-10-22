import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app_rf/app/sign_in/sign_in_button.dart';
import 'package:test_app_rf/app/sign_in/social_sign_in_button.dart';
import 'package:test_app_rf/custom_widgets/custom_raised_button.dart';


class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              image: NetworkImage("https://cdn.dribbble.com/users/2229974/screenshots/14431740/media/78dc80935b25bcb3dbb2302883f94c63.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: _buildContent()),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                hintText: 'Login',
                fillColor: Colors.yellow),
          ),
          SizedBox(height: 20.0),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                hintText: 'Password',
                fillColor: Colors.yellow),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: RaisedButton(
                onPressed: () {},
                color: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black)
                ),
                child: Padding(padding: EdgeInsets.only(right: 200),
                    child: Text('Войти', style: TextStyle(fontSize: 30))),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: RaisedButton(
                onPressed: () {},
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black)
                ),
                child: Padding(padding: EdgeInsets.only(right: 10),
                    child: Text('Новый пользователь', style: TextStyle(fontSize: 30))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
