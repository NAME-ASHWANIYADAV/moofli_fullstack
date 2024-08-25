import 'package:flutter/material.dart';
import 'package:moofli_fullstack/screens/home.dart';



class ProfileCompletionScreen6 extends StatefulWidget {
  @override
  State<ProfileCompletionScreen6> createState() => _ProfileCompletionScreen6State();
}

class _ProfileCompletionScreen6State extends State<ProfileCompletionScreen6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 130),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/skillop_logo_nobg.png',
                  height: 46,
                  width: 46,
                ),
                const Text(
                  "MOOFLI",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Complete your",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                const Text(
                  "Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 360,
                      height: 3,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF108CFF),
                            Color(0xFF0EAB00),
                            Color(0xFFFFB800),
                            Color(0xFFFD0C0C)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 0,
                      height: 3,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFD9D9ED),
                            Color(0xFFD9D9ED),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You are",
                  style: TextStyle(color: Color.fromARGB(255, 95, 95, 95)),
                ),
                SizedBox(width: 4),
                Text(
                  "100%",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 95, 95, 95),
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  "there",
                  style: TextStyle(color: Color.fromARGB(255, 95, 95, 95)),
                ),
              ],
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'LinkedIn Profile',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'UPI Id',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            // ElevatedButton(
            //   onPressed: () {
            //      Navigator.push(context,  MaterialPageRoute(
            //             builder: (context) => home_page()));
            //     // Action on Finish button pressed
            //   },
            //   child: Text('FINISH'),
            //   style: ElevatedButton.styleFrom(
            //     padding: EdgeInsets.symmetric(vertical: 15),
            //     textStyle: TextStyle(fontSize: 18),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            // ),
            Spacer(),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate back
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  
                    SizedBox(
                      height: 41,
                      width: 89,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileCompletionScreen6()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100))),
                        child: Image.asset(
                          'images/next.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  // ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
