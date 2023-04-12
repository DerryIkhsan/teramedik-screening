import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teramedik/theme.dart';

import '../home/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Widget showNotif({required String message}) {
    return Container(
      padding: EdgeInsets.all(5),
      width: double.infinity,
      height: 60.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$message',
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  _setUser(String user) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    setState(() {
      _prefs.setString('user', user);
    });
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Header
                Container(
                  height: bodyHeight * 0.15, // 20% device body
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 10.w),
                          Text(
                            'Login Form',
                            style: TextStyle(
                              color: colorGreen,
                              fontSize: 60.sp,
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
                  height: bodyHeight * 0.35, // 30% device body
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/fingerprint.png'),
                    fit: BoxFit.contain,
                  )),
                ),

                // Footer
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: bodyHeight * 0.35, // 40% device body
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: userController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'Silahkan masukkan username anda',
                          hintStyle: TextStyle(
                            fontSize: 28.sp,
                          ),
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            fontSize: 28.sp,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: passController,
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: 'Silahkan masukkan password anda',
                          hintStyle: TextStyle(
                            fontSize: 28.sp,
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontSize: 28.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorGreen,
                          foregroundColor: colorWhite,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: () async {
                          final response = await http.post(
                              Uri.parse(
                                  'https://derryikhsan.masuk.web.id/api/login'),
                              body: {
                                'name': userController.text.toString(),
                                'password': passController.text.toString(),
                              });

                          // response after call api
                          Map<String, dynamic> result = await jsonDecode(response.body);

                          if (result.containsKey('token')) {

                            _setUser(userController.text.toString());

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.green.withOpacity(.7),
                                content: showNotif(message: 'Login Berhasil'),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.red.withOpacity(.7),
                                content: showNotif(
                                    message:
                                        "Error : Username atau password salah"),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w700,
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
      ),
    );
  }
}
