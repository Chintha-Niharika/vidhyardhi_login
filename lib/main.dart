import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'forgotpass.dart';
import 'ProfilePage.dart';
import 'RegisterPage.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 200.0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://image.freepik.com/free-vector/learning-management-system-abstract-concept-illustration-educational-technology-online-learning-delivery-software-application-training-course-tutoring-program-access_335657-3474.jpg'),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          body: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[800],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formkey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                'SIGN IN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ), //Button Row
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 35.0, vertical: 3.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.white,
                                        width: 1,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        /*child: Padding(
                                          padding: const EdgeInsets.all(2.0),*/
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please Enter Email';
                                            }
                                            String p =
                                                "^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                                            RegExp regExp = new RegExp(p);

                                            if (regExp.hasMatch(value)) {
                                              return null;
                                            } else {
                                              return 'Email not valid';
                                            }
                                          },
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            icon: Icon(
                                              Icons.email,
                                              size: 30.0,
                                              color: Colors.blueGrey,
                                            ),
                                            hintText: 'abc123@example.com',
                                          ),
                                        ),
                                      ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ), //email and phone no
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 35.0, vertical: 3.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.white,
                                        width: 1,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        /*child: Padding(
                                          padding: const EdgeInsets.all(2.0),*/
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Required';
                                            }
                                          },
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            icon: Icon(
                                              Icons.lock,
                                              size: 30.0,
                                              color: Colors.blueGrey,
                                            ),
                                            hintText: 'password',
                                          ),
                                        ),
                                      ),
                                      //  ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Row(children: [
                                SizedBox(
                                  width: 25,
                                ),
                          Theme(
                              data: ThemeData(unselectedWidgetColor: Colors.white),
                              child: Checkbox(value: checkBoxValue,
                                  onChanged: (newValue){
                                setState(() {
                          checkBoxValue=!checkBoxValue;
                           });}
                              ),),
                                /*Checkbox(
                                    value: checkBoxValue,
                                    onChanged: (newValue){
                                      setState(() {
                                        checkBoxValue=!checkBoxValue;
                                      });
                                    }
                                    ),*/
                                Text(
                                  'Remember me',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                )
                              ]),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 40,
                                width: 220,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                  ),
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfilePage()),
                                      );
                                    } else {
                                      print('Unsuccessful');
                                    }
                                  },
                                  child: Text(
                                    'SIGN IN',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 200),
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ForgotPass()),
                                    );
                                  },
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                      /*style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                                      overlayColor: MaterialStateProperty.all(Colors.white),
                                    ),*/
                                      onPressed: () {
                                        print("apply online");
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.blueGrey,
                                          side:
                                              BorderSide(color: Colors.white)),
                                      child: Text(
                                        'Apply Online',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                  ElevatedButton(
                                      onPressed: () {
                                        print('Online Result');
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.blueGrey,
                                          side:
                                              BorderSide(color: Colors.white)),
                                      child: Text(
                                        'Online Result',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))
                                ],
                              ) //password
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
