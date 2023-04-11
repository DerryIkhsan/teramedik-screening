import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teramedik/models/rumahsakit.dart';

import '../../../bloc/rumahsakit_bloc.dart';
import '../../../theme.dart';
import '../../detail/detail_screen.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';


class ListViewRS extends StatefulWidget {
  ListViewRS({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<RumahSakit> data;

  @override
  State<ListViewRS> createState() => _ListViewRSState();
}

class _ListViewRSState extends State<ListViewRS> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 100.0;
  

  _ListViewRSState() {
    _scrollController.addListener(_onScroll);
  }

  void _onScroll(){
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    
    if (maxScroll - currentScroll <= _scrollThreshold) {
      context.read<RumahSakitBloc>().add(GetMoreRumahSakitEvent(page: 3));

      print('tahu');
    }
    
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
                        builder: (context) => DetailScreen(id: e.id),
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
                                  '${e.rumah_sakit}',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700,
                                    color: colorWhite,
                                  ),
                                ),
                                Text(
                                  '${e.lokasi}',
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
