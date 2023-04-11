import 'dart:async';

import 'package:flutter/material.dart';
import 'package:teramedik/theme.dart';

import '../home/home_screen.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 3), (timer){
      // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

      timer.cancel();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final safePadding = MediaQuery.of(context).padding.top;
    final bodyHeight = deviceHeight - safePadding;

    return SafeArea(
      child: Scaffold(
        backgroundColor: colorGrey,
        body: Column(
          children: [
            // Header
            Container(
              height: bodyHeight * 0.2, // 20% device body
              child: Column(
                children: [
                  SizedBox(height: 70,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/healthcare.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      SizedBox(width: 10),

                      Text('Teramedik',
                        style: TextStyle(
                          color: colorGreen,
                          fontSize: 42,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text('Aplikasi SIMRS No. 1 Di Indonesia',
                    style: TextStyle(
                      color: colorDark,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Illustration
            Container(
              height: bodyHeight * 0.6, // 60% device body
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/medicine.png'),
                  fit: BoxFit.contain,
                )
              ),
            ),

            // Footer
            Container(
              height: bodyHeight * 0.2, // 20% device body
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Powered by, ',
                    style: TextStyle(
                      color: colorDark,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text('Terakorp Indonesia',
                    style: TextStyle(
                      color: colorDark,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}