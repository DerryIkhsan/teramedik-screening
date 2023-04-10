import 'package:flutter/material.dart';
// import '../screen/detail_screen.dart';
import '../../theme.dart';
import 'components/gridview_rs.dart';
import 'components/listview_rs.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
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
