import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teramedik/models/rumahsakit.dart';

import '../../../bloc/rumahsakit_bloc.dart';
import '../../../theme.dart';
import '../../detail/detail_screen.dart';
import 'package:teramedik/models/rumahsakit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewRS extends StatefulWidget {
  ListViewRS({
    Key? key,
    required this.data,
    required this.isGridView,
  }) : super(key: key);

  final List<RumahSakit> data;
  bool isGridView;

  @override
  State<ListViewRS> createState() => _ListViewRSState();
}

class _ListViewRSState extends State<ListViewRS> {
  ScrollController _scrollController = ScrollController();
  double? _scrollPosition, _maxScrollPosition;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
      _maxScrollPosition = _scrollController.position.maxScrollExtent;

      if (_scrollPosition == _maxScrollPosition) {
        context.read<RumahSakitBloc>().add(GetMoreRumahSakitEvent());
      }
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: widget.data
            .map((e) => GestureDetector(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(id: e.id, isGridView: widget.isGridView),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 300.h,
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
                            image: NetworkImage('${e.image}'),
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
                        height: 200.h,
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
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${e.rumah_sakit}',
                                  style: TextStyle(
                                    fontSize: 40.sp,
                                    fontWeight: FontWeight.w700,
                                    color: colorWhite,
                                  ),
                                ),
                                SizedBox(height: 10.h,),
                                Text(
                                  '${e.id} - ${e.lokasi}',
                                  style: TextStyle(
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.bold,
                                    color: colorWhite,
                                  ),
                                ),
                              ],
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
