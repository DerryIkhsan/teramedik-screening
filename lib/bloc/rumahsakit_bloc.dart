import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../models/rumahsakit.dart';

part 'rumahsakit_event.dart';
part 'rumahsakit_state.dart';

class RumahSakitBloc extends Bloc<RumahSakitEvent, RumahSakitState> {
  RumahSakitBloc() : super(RumahSakitInitial()){
    on<RumahSakitEvent>((event, emit) async {
      emit(RumahSakitLoading());

      if(event is GetRumahSakitEvent){
        String uri = 'http://192.168.166.39:8000/api/rumahsakit';

        final response = await http.get(Uri.parse(uri));

        var result = jsonDecode(response.body);
        emit(RumahSakitSuccess(rumahSakit: rumahSakitFromJson(json.encode(result['data']))));
      }
      else if(event is GetMoreRumahSakitEvent){
        String page = event.page.toString();
        String uri  = 'http://192.168.166.39:8000/api/rumahsakit?page=${page}';

        final response = await http.get(Uri.parse(uri));

        var result = jsonDecode(response.body);
        emit(RumahSakitSuccess(rumahSakit: rumahSakitFromJson(json.encode(result['data']))));

        // print(result['data']);
        print(uri);
        print(event);
      }
      

      
    });
  // RumahSakitBloc() : super(RumahSakitInitial()){
  //   on<RumahSakitEvent>((event, emit) async {
  //     emit(RumahSakitLoading());

  //     String uri = 'http://192.168.166.39:8000/api/rumahsakit';

  //     final response = await http.get(Uri.parse(uri));

  //     var result = jsonDecode(response.body);
  //     emit(RumahSakitSuccess(rumahSakit: rumahSakitFromJson(json.encode(result['data']))));

  //     print(result['data']);
  //     print(uri);
  //   });
  }
}
