import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teramedik/detail_screen.dart';
import 'package:teramedik/login_screen.dart';
import 'package:teramedik/no_connection_screen.dart';
import 'package:teramedik/splash_screen.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class TesPage extends StatefulWidget {
  TesPage({Key? key}) : super(key: key);

  @override
  State<TesPage> createState() => _TesPageState();
}

class _TesPageState extends State<TesPage> {
  bool isGridView = true;

  List<Map<String, String>> data = [
    {
      'nama': 'Rumah Sakit Medika 1',
      'lokasi': 'Bandung',
      'image':
          'https://images.pexels.com/photos/263402/pexels-photo-263402.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'nama': 'Rumah Sakit Medika 2',
      'lokasi': 'Bandung',
      'image':
          'https://images.pexels.com/photos/668300/pexels-photo-668300.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'nama': 'Rumah Sakit Medika 3',
      'lokasi': 'Bandung',
      'image':
          'https://images.pexels.com/photos/9741487/pexels-photo-9741487.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'nama': 'Rumah Sakit Medika 4',
      'lokasi': 'Bandung',
      'image':
          'https://images.pexels.com/photos/10874293/pexels-photo-10874293.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'nama': 'Rumah Sakit Medika 5',
      'lokasi': 'Bandung',
      'image':
          'https://images.pexels.com/photos/1692693/pexels-photo-1692693.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'nama': 'Rumah Sakit Medika 6',
      'lokasi': 'Bandung',
      'image':
          'https://images.pexels.com/photos/263402/pexels-photo-263402.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'nama': 'Rumah Sakit Medika 7',
      'lokasi': 'Bandung',
      'image':
          'https://images.pexels.com/photos/668300/pexels-photo-668300.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'nama': 'Rumah Sakit Medika 8',
      'lokasi': 'Bandung',
      'image':
          'https://images.pexels.com/photos/9741487/pexels-photo-9741487.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'nama': 'Rumah Sakit Medika 9',
      'lokasi': 'Bandung',
      'image':
          'https://images.pexels.com/photos/10874293/pexels-photo-10874293.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'nama': 'Rumah Sakit Medika 10',
      'lokasi': 'Bandung',
      'image':
          'https://images.pexels.com/photos/1692693/pexels-photo-1692693.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'nama': 'Rumah Sakit Medika 11',
      'lokasi': 'Bandung',
      'image':
          'https://images.pexels.com/photos/263402/pexels-photo-263402.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'nama': 'Rumah Sakit Medika 12',
      'lokasi': 'Bandung',
      'image':
          'https://images.pexels.com/photos/668300/pexels-photo-668300.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'nama': 'Rumah Sakit Medika 13',
      'lokasi': 'Bandung',
      'image':
          'https://images.pexels.com/photos/9741487/pexels-photo-9741487.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'nama': 'Rumah Sakit Medika 14',
      'lokasi': 'Bandung',
      'image':
          'https://images.pexels.com/photos/10874293/pexels-photo-10874293.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'nama': 'Rumah Sakit Medika 15',
      'lokasi': 'Bandung',
      'image':
          'https://images.pexels.com/photos/1692693/pexels-photo-1692693.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'nama': 'Rumah Sakit Medika 16',
      'lokasi': 'Bandung',
      'image':
          'https://images.pexels.com/photos/263402/pexels-photo-263402.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'nama': 'Rumah Sakit Medika 17',
      'lokasi': 'Bandung',
      'image':
          'https://images.pexels.com/photos/668300/pexels-photo-668300.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'nama': 'Rumah Sakit Medika 18',
      'lokasi': 'Bandung',
      'image':
          'https://images.pexels.com/photos/9741487/pexels-photo-9741487.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'nama': 'Rumah Sakit Medika 19',
      'lokasi': 'Bandung',
      'image':
          'https://images.pexels.com/photos/10874293/pexels-photo-10874293.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'nama': 'Rumah Sakit Medika 20',
      'lokasi': 'Bandung',
      'image':
          'https://images.pexels.com/photos/1692693/pexels-photo-1692693.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorGrey,
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Teramedik',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: colorGreen,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 20,
                    child: GestureDetector(
                      child: isGridView
                          ? Icon(
                              color: colorGreen,
                              Icons.sort,
                              size: 30,
                            )
                          : Icon(
                              color: colorGreen,
                              Icons.grid_view,
                              size: 30,
                            ),
                      onTap: () {
                        isGridView = !isGridView;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Admin',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: colorDark.withOpacity(.7),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Daftar Rumah Sakit Terbaik',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: colorDark,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            isGridView ? GridViewRS(data: data) : ListViewRS(data: data),
            Container(
              margin: EdgeInsets.only(top: 10, right: 20),
              width: double.infinity,
              height: 30,
              color: colorGrey,
              child: Text(
                'App Version: 1.2.1',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: colorGreen,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewRS extends StatelessWidget {
  const ListViewRS({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Map<String, String>> data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: data
            .map((e) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        padding: EdgeInsets.only(
                          left: 30,
                          top: 30,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage('${e['image']}'),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 3,
                              spreadRadius: 2,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        padding: EdgeInsets.only(
                          left: 30,
                          top: 30,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(.7),
                              Colors.transparent,
                            ],
                          ),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${e['nama']}',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700,
                                    color: colorWhite,
                                  ),
                                ),
                                Text(
                                  '${e['lokasi']}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: colorWhite,
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 20,
                              right: 20,
                              child: Container(
                                width: 70,
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: colorGreen.withOpacity(.7),
                                ),
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: 30,
                                  color: colorWhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class GridViewRS extends StatelessWidget {
  const GridViewRS({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Map<String, String>> data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          children: data
              .map((e) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: colorGreen,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 3,
                            spreadRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              image: DecorationImage(
                                image: NetworkImage('${e['image']}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 20, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${e['nama']}',
                                  style: TextStyle(
                                    color: colorWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '${e['lokasi']}',
                                  style: TextStyle(
                                    color: colorWhite,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        // home: TesPage(),
        // home: DetailScreen(),
        home: SplashScreen(),
        // home: NoConnectionScreen(),
        // home: LoginScreen(),
      );
    });
  }
}
