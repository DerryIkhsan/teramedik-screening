import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teramedik/theme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../bloc/rumahsakit_bloc.dart';
import '../home/home_screen.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final RumahSakitBloc _rumahSakitBloc = RumahSakitBloc();

  void launchMap(String address) async {
    String query = Uri.encodeComponent(address);
    Uri googleUrl =
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$query");

    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    context.read<RumahSakitBloc>().add(GetDetailRumahSakitEvent(id: widget.id));

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
          body: BlocBuilder<RumahSakitBloc, RumahSakitState>(
            builder: (context, state) {
              if (state is RumahSakitLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is RumahSakitDetailSuccess) {
                print(state.rumahSakitDetail);

                return Column(
                  children: [
                    // Background Image
                    Container(
                      height: bodyHeight * 0.4, // 40% device body
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                          image: NetworkImage(
                            '${state.rumahSakitDetail.image}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(getRumahSakitEvent: true,)));
                        },
                        child: Stack(
                          children: [
                            Positioned(
                              top: 20,
                              left: 20,
                              child: Container(
                                width: 70,
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: colorGreen.withOpacity(.7),
                                ),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                  color: colorWhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: bodyHeight * 0.1, // 10% device body
                      width: double.infinity,
                      color: colorGreen,
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${state.rumahSakitDetail.rumah_sakit}',
                                  style: TextStyle(
                                    color: colorWhite,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '${state.rumahSakitDetail.lokasi}',
                                  style: TextStyle(
                                    color: colorWhite,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: bodyHeight * 0.5, // 50% device body
                      width: double.infinity,
                      color: colorGrey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // start icon
                            Container(
                              margin: EdgeInsets.all(30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // ignore: deprecated_member_use
                                      launch("tel://022 1234 1234");
                                    },
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: colorGreen,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.phone,
                                          size: 30,
                                          color: colorWhite,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      launchMap('Kota Bandung');
                                    },
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: colorGreen,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.pin_drop,
                                          size: 30,
                                          color: colorWhite,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // ignore: deprecated_member_use
                                      launch(
                                          'mailto:derryikhsan@yahoo.co.id?subject=Send From Teramedik Apps');
                                    },
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: colorGreen,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.mail,
                                          size: 30,
                                          color: colorWhite,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // end icon

                            // title
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                '${state.rumahSakitDetail.rumah_sakit}',
                                style: TextStyle(
                                  color: colorDark,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            // end title

                            SizedBox(
                              height: 20,
                            ),

                            // description
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                '${state.rumahSakitDetail.deskripsi}',
                                style: TextStyle(
                                  color: colorDark,
                                  fontSize: 16,
                                  wordSpacing: 1,
                                  letterSpacing: .5,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            // end description
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }

              return Center(
                child: Text('No data'),
              );
            },
          ),
        ),
      ),
    );
  }
}
