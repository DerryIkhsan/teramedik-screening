import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
    {'nama': 'Rumah Sakit Medika 1', 'lokasi': 'Bandung'},
    {'nama': 'Rumah Sakit Medika 2', 'lokasi': 'Bandung'},
    {'nama': 'Rumah Sakit Medika 3', 'lokasi': 'Bandung'},
    {'nama': 'Rumah Sakit Medika 4', 'lokasi': 'Bandung'},
    {'nama': 'Rumah Sakit Medika 5', 'lokasi': 'Bandung'},
    {'nama': 'Rumah Sakit Medika 6', 'lokasi': 'Bandung'},
    {'nama': 'Rumah Sakit Medika 7', 'lokasi': 'Bandung'},
    {'nama': 'Rumah Sakit Medika 8', 'lokasi': 'Bandung'},
    {'nama': 'Rumah Sakit Medika 9', 'lokasi': 'Bandung'},
    {'nama': 'Rumah Sakit Medika 10', 'lokasi': 'Bandung'},
    {'nama': 'Rumah Sakit Medika 11', 'lokasi': 'Bandung'},
    {'nama': 'Rumah Sakit Medika 12', 'lokasi': 'Bandung'},
    {'nama': 'Rumah Sakit Medika 13', 'lokasi': 'Bandung'},
    {'nama': 'Rumah Sakit Medika 14', 'lokasi': 'Bandung'},
    {'nama': 'Rumah Sakit Medika 15', 'lokasi': 'Bandung'},
    {'nama': 'Rumah Sakit Medika 16', 'lokasi': 'Bandung'},
    {'nama': 'Rumah Sakit Medika 17', 'lokasi': 'Bandung'},
    {'nama': 'Rumah Sakit Medika 18', 'lokasi': 'Bandung'},
    {'nama': 'Rumah Sakit Medika 19', 'lokasi': 'Bandung'},
    {'nama': 'Rumah Sakit Medika 20', 'lokasi': 'Bandung'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Teramedik'),
          centerTitle: true,
          actions: [
            GestureDetector(
              child: isGridView
                  ? Icon(
                      Icons.sort,
                      size: 30,
                    )
                  : Icon(
                      Icons.grid_view,
                      size: 30,
                    ),
              onTap: () {
                isGridView = !isGridView;
                setState(() {});
              },
            ),
            SizedBox(width: 20),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 10,),
            isGridView ? GridViewRS(data: data) : ListViewRS(data: data),
            Container(
              padding: EdgeInsets.only(top: 20, right: 20),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 50,
              color: Colors.blue,
              child: Text(
                'Ver. 1.2.1',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
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
            .map((e) => Container(
                  height: 200,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: EdgeInsets.only(left: 30, top: 30),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${e['nama']}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('${e['lokasi']}'),
                        ],
                      ),

                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: Icon(Icons.arrow_forward, size: 30),
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
              .map((e) => Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black12,
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
                            color: Colors.blue,
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
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text('${e['lokasi']}'),
                            ],
                          ),
                        ),
                      ],
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
        debugShowCheckedModeBanner: false,
        home: TesPage(),
      );
    });
  }
}