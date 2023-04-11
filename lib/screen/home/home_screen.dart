import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/rumahsakit_bloc.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    context.read<RumahSakitBloc>().add(GetRumahSakitEvent());

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
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<RumahSakitBloc>().add(GetRumahSakitEvent());
            },
            child: Column(
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

                // Bloc Build RS
                BlocBuilder<RumahSakitBloc, RumahSakitState>(
                  builder: (context, state) {
                    if (state is RumahSakitLoading) {
                      return Container(
                        height: deviceHeight * .7,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    if (state is RumahSakitSuccess) {
                      return (isGridView
                          ? GridViewRS(data: state.rumahSakit)
                          : ListViewRS(data: state.rumahSakit));
                    }

                    return Center(
                      child: Text('No data'),
                    );
                  },
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorGreen,
                    foregroundColor: colorWhite,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    context
                        .read<RumahSakitBloc>()
                        .add(GetMoreRumahSakitEvent(page: 2));
                    print('clicked');
                  },
                  child: Text(
                    'Get More',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
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
        ),
      ),
    );
  }
}
