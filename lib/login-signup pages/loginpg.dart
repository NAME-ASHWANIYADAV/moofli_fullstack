import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moofli_fullstack/screens/home.dart';
import 'package:http/http.dart' as http;
import 'package:moofli_fullstack/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
    static const String routeName = '/auth-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  //  Auth _auth = Auth.signup;
  final AuthService authService = AuthService();
  
  // final _signUpFormKey = GlobalKey<FormState>();
  // final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  // Future<void> loginUser(String email, String password) async {
  //   final url = 'http://10.0.2.2:2024/api/user/login';

  //   final response = await http.post(
  //     Uri.parse(url),
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: json.encode({
  //       'email': email,
  //       'password': password,
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     final responseData = json.decode(response.body);
  //     // Handle successful login (e.g., save token, navigate to home page)
  //     print('Login successful: ${responseData['message']}');
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => home_page()),
  //     );
  //   } else {
  //     final errorData = json.decode(response.body);
  //     // Handle login error
  //     setState(() {
  //       _errorMessage = errorData['message'];
  //     });
  //     print('Login failed: ${errorData['message']}');
  //   }
  // }

  Future signInUser() async {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.red, Colors.green, Colors.blue],
              ).createShader(bounds),
              child: Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: Icon(Icons.visibility),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.green, Colors.blue],
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(2.0),
              child: ElevatedButton(
                onPressed: () async {
                 
                  // final email = _emailController.text;
                  // final password = _passwordController.text;
                  await signInUser();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 120.0),
                ),
                child: ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [Colors.red, Colors.green, Colors.blue],
                  ).createShader(bounds),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text('Not Registered Yet? '),
            TextButton(
              onPressed: () {},
              child: Text('SIGN UP'),
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Text("OR"),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Image.network(
                'https://developers.google.com/identity/images/g-logo.png',
                height: 24.0,
              ),
              label: Text('Login with Google'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
