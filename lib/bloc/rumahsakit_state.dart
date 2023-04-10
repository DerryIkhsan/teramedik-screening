part of 'rumahsakit_bloc.dart';

abstract class RumahSakitState {
  RumahSakitState();

  @override
  List<Object> get props => [];
}

class RumahSakitInitial extends RumahSakitState {}
class RumahSakitLoading extends RumahSakitState {}
class RumahSakitSuccess extends RumahSakitState {
  final List<RumahSakit> rumahSakit;

  RumahSakitSuccess({required this.rumahSakit});

  @override
  List<Object> get props => [rumahSakit];
}
