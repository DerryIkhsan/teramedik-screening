part of 'rumahsakit_bloc.dart';

abstract class RumahSakitState {
  RumahSakitState();

  @override
  List<Object?> get props => [];
}

class RumahSakitInitial extends RumahSakitState {}
class RumahSakitLoading extends RumahSakitState {}
class RumahSakitSuccess extends RumahSakitState {
  List<RumahSakit> rumahSakit;

  RumahSakitSuccess({required this.rumahSakit});
}
class RumahSakitDetailSuccess extends RumahSakitState{
  RumahSakitDetail rumahSakitDetail;

  RumahSakitDetailSuccess({required this.rumahSakitDetail});
}
