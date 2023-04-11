import 'package:flutter/material.dart';
import 'package:teramedik/theme.dart';

import '../splash/splash_screen.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final safePadding = MediaQuery.of(context).padding.top;
    final bodyHeight = deviceHeight - safePadding;
    final bodyWidth = MediaQuery.of(context).size.width;

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
              ),

              // Illustration
              Container(
                height: bodyHeight * 0.4, // 40% device body
                width: bodyWidth * 0.8,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/no-connection.png'),
                  fit: BoxFit.contain,
                )),
              ),

              // Footer
              Container(
                padding: EdgeInsets.only(top: 30),
                height: bodyHeight * 0.4, // 40% device body
                child: Column(
                  children: [
                    Text(
                      'Yahhh, koneksi internetmu hilang!',
                      style: TextStyle(
                        color: colorDark,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Periksa kembali koneksi internetmu,\n dan coba hubungkan kembali',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colorDark.withOpacity(.7),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorGreen,
                          foregroundColor: colorWhite,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SplashScreen()));
                        },
                        child: Text(
                          'Coba Lagi',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
