import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../bloc/rumahsakit_bloc.dart';
import '../../theme.dart';
import 'components/gridview_rs.dart';
import 'components/listview_rs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  bool closeDetailRumahSakitEvent;
  bool isGridView;

  HomeScreen(
      {Key? key,
      this.closeDetailRumahSakitEvent = false,
      this.isGridView = true})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  bool isGridView = true;
  String? _user = 'Guest';

  @override
  void initState() {
    // TODO: implement initState
    if (widget.closeDetailRumahSakitEvent) {
      closeDetailRumahSakitEvent();
    }

    setState(() {
      isGridView = widget.isGridView;
    });

    _getUser();
    super.initState();
  }

  closeDetailRumahSakitEvent() {
    context.read<RumahSakitBloc>().add(CloseDetailRumahSakitEvent());
  }

  _getUser() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    setState(() {
      _user = StringUtils.capitalize('${_prefs.getString('user')}');
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
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<RumahSakitBloc>().add(GetRumahSakitEvent());
            },
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/healthcare.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'Teramedik',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 50.sp,
                              fontWeight: FontWeight.w500,
                              color: colorGreen,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 100.h,),
                      Positioned(
                        right: 20,
                        child: GestureDetector(
                          child: isGridView
                              ? Icon(
                                  color: colorGreen,
                                  Icons.sort,
                                  size: 50.sp,
                                )
                              : Icon(
                                  color: colorGreen,
                                  Icons.grid_view,
                                  size: 50.sp,
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
                  height: 10.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, ${_user}',
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w500,
                          color: colorDark.withOpacity(.7),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Daftar Rumah Sakit Terbaik',
                        style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w700,
                          color: colorDark,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),

                // Bloc Build RS
                BlocBuilder<RumahSakitBloc, RumahSakitState>(
                  builder: (context, state) {
                    if (state is RumahSakitLoading) {
                      return Container(
                        height: bodyHeight * .7,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    if (state is RumahSakitSuccess) {
                      return (isGridView
                          ? GridViewRS(
                              data: state.rumahSakit,
                              isGridView: isGridView,
                            )
                          : ListViewRS(
                              data: state.rumahSakit,
                              isGridView: isGridView,
                            ));
                    }

                    return Center(
                      child: Text('No data'),
                    );
                  },
                ),

                Container(
                  margin: EdgeInsets.only(top: 10, right: 20),
                  width: double.infinity,
                  height: 60.h,
                  color: colorGrey,
                  child: Text(
                    'App Version: 1.2.3',
                    style: TextStyle(
                      fontSize: 24.sp,
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
