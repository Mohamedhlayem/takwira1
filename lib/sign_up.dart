import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:koora/home.dart';
import 'package:koora/log_in.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> signup(
      String registeredEmail,
      String phone,
      BuildContext context,
      String fname,
      String lname,
      String username,
      String pass,
      String confirmedpass) async {
    try {
      if (phone != null && phone.isNotEmpty) {
        int phoneNumber = int.parse(phone);

        final response = await http.post(
          Uri.parse('http://localhost:3000/register'),
          headers: {
            'flutter': 'true',
          },
          body: {
            'emailSignUp': registeredEmail,
            'phone': phoneNumber.toString(),
            'fName': fname,
            'lName': lname,
            'username': username,
            'passSignUp': pass
          },
        );

        if (response.statusCode == 200) {
          print('ahla');
          final responseData = jsonDecode(response.body);
          var code = responseData['code'];
          var responseText = responseData['response'];
          if (code == 1 || code == 2 || code == 3 || code == 4) {
            print(responseText);
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
          }
        } else {
          // Handle other types of errors
          print('Error: ${json.decode(response.body)['message']}');
        }
      } else {
        // Handle the case where the phone number is empty or null
        print('Invalid phone number');
      }
    } catch (error) {
      // An error occurred during the HTTP request
      print('Error: $error');
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height(90)),
                      child: Text(
                        'Let\'s get Started',
                        style: TextStyle(
                          color: const Color(0xFFF1EED0),
                          fontSize: width(32),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    TextFormField(
                      controller: _firstNameController,
                      style: const TextStyle(color: Color(0xFFF1EED0)),
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        hintStyle: TextStyle(
                          color: const Color(0xFFBEBCA5),
                          fontSize: width(16),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _lastNameController,
                      style: const TextStyle(color: Color(0xFFF1EED0)),
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        hintStyle: TextStyle(
                          color: const Color(0xFFBEBCA5),
                          fontSize: width(16),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _userNameController,
                      style: const TextStyle(color: Color(0xFFF1EED0)),
                      decoration: InputDecoration(
                        hintText: 'User Name',
                        hintStyle: TextStyle(
                          color: const Color(0xFFBEBCA5),
                          fontSize: width(16),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _phoneNumberController,
                      style: const TextStyle(color: Color(0xFFF1EED0)),
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(
                          color: const Color(0xFFBEBCA5),
                          fontSize: width(16),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a phone number';
                        } else if (value.length != 8 || int.tryParse(value) == null) {
                          return 'Phone number must be 8 digits';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      style: const  TextStyle(color: Color(0xFFF1EED0)),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: const Color(0xFFBEBCA5),
                          fontSize: width(16),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      style: const TextStyle(color: Color(0xFFF1EED0)),
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
                          color: const Color(0xFFBEBCA5),
                          fontSize: width(16),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        } else if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFFF1EED0),
                        backgroundColor: const Color(0xFF599068),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          signup(
                            _emailController.text,
                            _phoneNumberController.text,
                            context,
                            _firstNameController.text,
                            _lastNameController.text,
                            _userNameController.text,
                            _passwordController.text,
                            _confirmPasswordController.text,
                          );

                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.all(width(13)),
                        child: Text(
                          'Sign Up',
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
                          'You already have an account?',
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
                                builder: (context) => const LogIn(),
                              ),
                            );
                          },
                          child: Text(
                            'Log In',
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
                                    'Sign Up with Google',
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
                                    'Sign Up with Facebook',
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
          ),
        ],
      ),
    );
  }
}

