import 'package:flutter/material.dart';
import '../../constants/colors.dart';
// import 'package:flutter_login/flutter_login.dart';
// import 'package:flutter_login/theme.dart';
// import '../get_started_screen/first_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  String? _email, _password;

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your email address';
        }
        if (!RegExp('[a-zA-Z0-9\\._]+@[a-z]+\\.[a-z]+').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
      onSaved: (value) {
        _email = value!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      obscureText: !_showPassword,
      decoration: InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          suffixIcon: IconButton(
            icon: Icon(
              _showPassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
          )),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your password';
        }
        if (value.length < 6) {
          return 'Password should be at least 6 characters long.';
        }
        return null;
      },
      onSaved: (value) {
        _password = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    
    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: Center(
        child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: mediaQuery.size.width * 0.9,
          height: mediaQuery.size.height * 0.95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: mediaQuery.size.width * 0.15,
                  ),
                  const SizedBox(width: 40),
                  // Expanded(
                  Text(
                    'خدا کا کلام',
                    style: TextStyle(
                      color: appPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Jameel Noori Nastaleeq Kasheeda',
                      fontSize: 50,
                    ),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                  // ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'توریت زبور اور انجیل پر مبنی کورسز',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Jameel Noori Nastaleeq Kasheeda',
                  fontSize: 30,
                ),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(20.0),
                width: mediaQuery.size.height * 0.5,
                height: mediaQuery.size.height * 0.6,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: tSecondaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: tSecondaryColor,
                      spreadRadius: 5,
                      blurRadius: 15,
                    ),
                  ],
                ),
                // child: Image.asset(
                //   'assets/sun_logo.png',
                //   width: mediaQuery.size.width * 0.5,
                // ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      _buildEmail(),
                      const SizedBox(height: 20),
                      _buildPassword(),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            // AuthenticateUser(_email, _password);
                          }
                        },
                        child: Text('Log In'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),),
    );
  }
}
