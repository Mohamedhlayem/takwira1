import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:koora/home.dart';
import 'package:koora/sign_up.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var  _formKey = GlobalKey<FormState>();
  TextEditingController _Email = TextEditingController();
  TextEditingController _Password = TextEditingController();
  final storage = const FlutterSecureStorage();
  Future<void> loginUser(String email, String password, BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/login'), 
      headers: {
        'flutter': 'true',
      },
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      var code = responseData['code'];
      var responseText = responseData['response'];
      if (code == 1 || code == 2 || code == 3) {
        print(responseText);
      } else {
        String jsonString = jsonEncode(responseText);
        await storage.write(key: 'jwt_token', value: responseData['token']);
        await storage.write(key : 'user' , value : jsonString); // Save token securely
        String? token = await storage.read(key: 'jwt_token'); // Retrieve token
        print('wawa $token');
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Home()),
        );
      }
    } else {
      print('Login failed: ${response.body}');
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double a = 0;

    double width(double width) {
      a = width / 430;
      return screenWidth * a;
    }

    double height(double height) {
      a = height / 932;
      return screenHeight * a;
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/4aw.png',
            fit: BoxFit.cover,
          ),
          Container(
            margin: EdgeInsets.only(top: height(350)),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Color.fromRGBO(0, 0, 0, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Image.asset(
            'assets/images/smoke.png',
            fit: BoxFit.cover,
            opacity: const AlwaysStoppedAnimation(0.15),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(width(20), 0, width(20), width(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height(230)),
                    child: Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: const Color(0xFFF1EED0),
                        fontSize: width(32),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: width(80)),
                  Form(
                    key: _formKey,
                    child: Column(
                    children: [
                      TextField(
                        controller: _Email,
                        style: const TextStyle(color: Color(0xFFF1EED0)),
                        decoration: InputDecoration(
                          hintText: 'User name Or Email Or Phone Number',
                           hintStyle: TextStyle(
                          color: const Color(0xFFBEBCA5),
                          fontSize: width(16),
                          fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _Password,
                    obscureText: true,
                    style: const TextStyle(color: Color(0xFFF1EED0)),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: const Color(0xFFBEBCA5),
                        fontSize: width(16),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),

                    ],
                  )),
                  
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: const Color(0xFFF1EED0),
                        fontSize: width(16),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xFFF1EED0),
                      backgroundColor:
                          const Color(0xFF599068), // button's shape
                    ),
                    onPressed: () {
                       if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        loginUser(_Email.text, _Password.text, context);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(width(13)),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: const Color(0xFFF1EED0),
                          fontSize: width(16),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ),
                          );
                        },
                        child: Text(
                          'Register here',
                          style: TextStyle(
                            color: const Color(0xff599068),
                            fontSize: width(16),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Image.asset('assets/images/google.png'),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Sign In with Google',
                                  style: TextStyle(
                                    color: const Color(0xFFF1EED0),
                                    fontSize: width(16),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      OutlinedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Image.asset('assets/images/facebook.png'),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Sign In with Facebook',
                                  style: TextStyle(
                                    color: const Color(0xFFF1EED0),
                                    fontSize: width(16),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
