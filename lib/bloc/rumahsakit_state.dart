part of 'rumahsakit_bloc.dart';

abstract class RumahSakitState {}

class RumahSakitInitial extends RumahSakitState {}
class RumahSakitLoading extends RumahSakitState {}
class RumahSakitSuccess extends RumahSakitState {
  final List<RumahSakit> rumahSakit;

  RumahSakitSuccess({required this.rumahSakit});
}
