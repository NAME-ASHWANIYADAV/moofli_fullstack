import 'package:flutter/material.dart';

class VerificationAuthPage extends StatefulWidget {
  const VerificationAuthPage({super.key});

  @override
  State<VerificationAuthPage> createState() => _VerificationAuthPageState();
}

class _VerificationAuthPageState extends State<VerificationAuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon:const  Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: const Text('Sign up', style: TextStyle(color: Colors.purple)),
      ),


      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('We just sent a verification code to your email id and mobile number...'
          ,style: TextStyle(fontSize: 20, color: Colors.black),
          ),
           const SizedBox(height: 40),
           Text('Code sent on Email ID',style: TextStyle(fontSize: 20, color: Colors.black)
           ),
            const SizedBox(height: 20),
            Row(
              children:<Widget> [
                
                TextButton(
                onPressed: () {
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(60, 60),
                  shape:const  CircleBorder(
                    eccentricity:1,
                  ),
                ),
                child: const Text('3'),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(60, 60),
                  shape: const CircleBorder(
                    eccentricity: 1,
                  ),
                ),
                child: const Text('8'),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                 minimumSize: const Size(60, 60),
                  shape:const  CircleBorder(
                    eccentricity: 1,
                  ),
                ),
                child: const Text('7'),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                 minimumSize: const Size(60, 60),
                  shape: const CircleBorder(
                    eccentricity: 1,
                  ),
                ),
                child: const Text('1'),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(60, 60),
                  shape: const CircleBorder(
                    eccentricity: 1,
                  ),
                ),
                child: const Text('4'),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(60, 60),
                  shape:const CircleBorder(
                    eccentricity: 1,
                  ),
                ),
                child: const Text('2'),
              ),

              ],
            ),
            const  SizedBox(height: 40),
           const Text('Code sent on Mobile Number',
           style: TextStyle(fontSize: 20, color: Colors.black)
           ),
            const SizedBox(height: 20),
            Row(
              children: [
                TextButton(
                onPressed: () {
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(60, 60),
                  shape:const  CircleBorder(
                    eccentricity:1,
                  ),
                ),
                child: const Text('6'),
              ),
              const SizedBox(width: 20),
             TextButton(
                onPressed: () {
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(60, 60),
                  shape:const  CircleBorder(
                    eccentricity:1,
                  ),
                ),
                child: const Text('1'),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                 minimumSize: const Size(60, 60),
                  shape:const  CircleBorder(
                    eccentricity:1,
                  ),
                ),
                child: const Text('5'),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(60, 60),
                  shape:const  CircleBorder(
                    eccentricity:1,
                  ),
                ),
                child: const Text('5'),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(60, 60),
                  shape: const CircleBorder(
                    eccentricity: 1,
                  ),
                ),
                child: const Text('4'),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(60, 60),
                  shape: const CircleBorder(
                    eccentricity: 1,
                  ),
                ),
                child: const Text('9'),
              ),
        
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                 padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onPressed: () {
                // Handle sign up
              },
              child: const Text('Done', style: TextStyle(color: Colors.white)),
            ),
        
        ],
        ),
      ),

     


    );
  }
}