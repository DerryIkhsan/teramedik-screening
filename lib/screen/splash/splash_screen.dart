import 'dart:async';

import 'package:flutter/material.dart';
import 'package:teramedik/screen/no_connection/no_connection_screen.dart';
import 'package:teramedik/theme.dart';

import '../login/login_screen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // cek koneksi
  _checkConnection() async {
    bool result = await InternetConnectionChecker().hasConnection;

    if (result == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => NoConnectionScreen()));
    }
  }

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      _checkConnection();

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => NoConnectionScreen()));

      timer.cancel();
    });
  //   // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final safePadding = MediaQuery.of(context).padding.top;
    final bodyHeight = deviceHeight - safePadding;

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: colorGrey,
          body: Column(
            children: [
              // Header
              Container(
                height: bodyHeight * 0.2, // 20% device body
                child: Column(
                  children: [
                    SizedBox(
                      height: 70.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/healthcare.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Teramedik',
                          style: TextStyle(
                            color: colorGreen,
                            fontSize: 60.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Aplikasi SIMRS No. 1 Di Indonesia',
                      style: TextStyle(
                        color: colorDark,
                        fontSize: 35.sp,
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
                )),
              ),

              // Footer
              Container(
                height: bodyHeight * 0.2, // 20% device body
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Powered by, ',
                      style: TextStyle(
                        color: colorDark,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Terakorp Indonesia',
                      style: TextStyle(
                        color: colorDark,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
