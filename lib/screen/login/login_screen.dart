import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:teramedik/bloc/rumahsakit_bloc.dart';
import 'package:teramedik/theme.dart';

import '../home/home_screen.dart';
import 'package:http/http.dart' as http;

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
      height: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$message',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
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
                        controller: userController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'Silahkan masukkan username anda',
                          labelText: 'Username',
                        ),
                      ),
                      TextFormField(
                        controller: passController,
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock),
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
                        onPressed: () async {
                          final response = await http.post(
                              Uri.parse('http://192.168.166.39:8000/api/login'),
                              body: {
                                'name': userController.text.toString(),
                                'password': passController.text.toString(),
                              });

                          // response after call api
                          Map<String, dynamic> result =
                              jsonDecode(response.body);

                          if (result.containsKey('token')) {
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
                                    message: "Error : Username atau password salah"),
                              ),
                            );
                          }
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
      ),
    );
  }
}
