import 'package:flutter/material.dart';
import 'package:teramedik/theme.dart';

import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final safePadding = MediaQuery.of(context).padding.top;
    final bodyHeight = deviceHeight - safePadding;

    return SafeArea(
      child: Scaffold(
        backgroundColor: colorGrey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Container(
                height: bodyHeight * 0.15, // 20% device body
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        SizedBox(width: 10),

                        Text(
                          'Login Form',
                          style: TextStyle(
                            color: colorGreen,
                            fontSize: 42,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Illustration
              Container(
                height: bodyHeight * 0.3, // 40% device body
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/fingerprint.png'),
                  fit: BoxFit.contain,
                )),
              ),

              // Footer
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                height: bodyHeight * 0.4, // 40% device body
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Silahkan masukkan username anda',
                        labelText: 'Username',
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Silahkan masukkan password anda',
                        labelText: 'Password',
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorGreen,
                        foregroundColor: colorWhite,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
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
