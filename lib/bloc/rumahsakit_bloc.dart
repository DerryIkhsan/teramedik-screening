import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:teramedik/models/rumahsakitdetail.dart';

import '../models/rumahsakit.dart';

part 'rumahsakit_event.dart';
part 'rumahsakit_state.dart';

class RumahSakitBloc extends Bloc<RumahSakitEvent, RumahSakitState> {
  List<RumahSakit> rumahSakitList = [];
  int _page = 1;

  RumahSakitBloc() : super(RumahSakitInitial()) {
    on<RumahSakitEvent>((event, emit) async {
      if (event is GetRumahSakitEvent) {
        emit(RumahSakitLoading());
        
        String uri = 'https://derryikhsan.masuk.web.id/api/rumahsakit';

        final response = await http.get(Uri.parse(uri));

        var result  = jsonDecode(response.body);
        List data   = result['data'];
        
        rumahSakitList.clear();
        _page = 1;

        data.map((data) => rumahSakitList.add(RumahSakit.fromJson(data))).toList();
        emit(RumahSakitSuccess(rumahSakit: rumahSakitList));
      
      } 
      else if (event is GetMoreRumahSakitEvent) {
        _page++;
        String uri = 'https://derryikhsan.masuk.web.id/api/rumahsakit?page=${_page}';

        final response = await http.get(Uri.parse(uri));

        var result  = jsonDecode(response.body);
        List data = result['data'];

        data.map((data) => rumahSakitList.add(RumahSakit.fromJson(data))).toList();
        emit(RumahSakitSuccess(rumahSakit: rumahSakitList));

      } 
      else if (event is CloseDetailRumahSakitEvent) {
        emit(RumahSakitSuccess(rumahSakit: rumahSakitList));
      }
      else if (event is GetDetailRumahSakitEvent) {
        String id = event.id.toString();
        String uri = 'https://derryikhsan.masuk.web.id/api/rumahsakit/${id}';

        final response = await http.get(Uri.parse(uri));

        var result = jsonDecode(response.body);
        emit(RumahSakitDetailSuccess(rumahSakitDetail: RumahSakitDetail.fromJson(result)));
      }
    });
  }
}
