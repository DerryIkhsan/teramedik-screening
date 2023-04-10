import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'rumahsakit_event.dart';
part 'rumahsakit_state.dart';

class RumahSakitBloc extends Bloc<RumahSakitEvent, RumahSakitState> {
  RumahSakitBloc() : super(RumahSakitInitial()){
    on<RumahSakitEvent>((event, emit) async {
      emit(RumahSakitLoading());

      final response = await http.get(Uri.parse('localhost:8000/api/rumahsakit'));

      print(response);
    });
  }
}
