import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teramedik/models/rumahsakit.dart';

import '../../../bloc/rumahsakit_bloc.dart';
import '../../../theme.dart';
import '../../detail/detail_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewRS extends StatefulWidget {
  GridViewRS({
    Key? key,
    required this.data,
    required this.isGridView,
  }) : super(key: key);

  final List<RumahSakit> data;
  bool isGridView;

  @override
  State<GridViewRS> createState() => _GridViewRSState();
}

class _GridViewRSState extends State<GridViewRS> {
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
      child: Container(
        margin: EdgeInsets.all(10),
        child: GridView.count(
          controller: _scrollController,
          crossAxisCount: 2,
          children: widget.data
              .map((e) => GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            id: e.id,
                            isGridView: widget.isGridView,
                          ),
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
                            height: 200.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              image: DecorationImage(
                                image: NetworkImage('${e.image}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 10.sp, left: 20.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${e.rumah_sakit}',
                                  style: TextStyle(
                                    color: colorWhite,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 10.h,),
                                Text(
                                  'ID:${e.id} - ${e.lokasi}',
                                  style: TextStyle(
                                    fontSize: 20.sp,
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
