import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.startcentre,
          children: [
            SizedBox(height: 20.0),
            // Login Text with Underline
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.red, Colors.green, Colors.blue],
              ).createShader(bounds),
              child: Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0,
                      0), // The text color will be overridden by the shader
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // Username TextField
            TextField(
              decoration: InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // Password TextField
            TextField(
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
            // Forgot Password Text
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

            // Gradient Border Button
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.green, Colors.blue],
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(2.0), // Border width
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, // Button color
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
                      color: Colors
                          .white, // The text color will be overridden by the shader
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // Sign Up Text
            Text('Not Registered Yet? '),
            // SizedBox(height: 0.1),
            TextButton(
              onPressed: () {},
              child: Text('SIGN UP'),
            ),
            SizedBox(height: 10.0),
            // Divider
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
            // Google Sign In Button
            ElevatedButton.icon(
              onPressed: () {},
              icon: Image.network(
                'https://developers.google.com/identity/images/g-logo.png', // Replace with your Google logo URL
                height: 24.0,
              ),
              label: Text('Login with Google'),
              style: ElevatedButton.styleFrom(
                // primary: Colors.white,
                foregroundColor: Colors.black,
                padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
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
