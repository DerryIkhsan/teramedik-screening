part of 'rumahsakit_bloc.dart';

abstract class RumahSakitEvent {}
class GetRumahSakitEvent extends RumahSakitEvent{}
class GetMoreRumahSakitEvent extends RumahSakitEvent{
  final int page;

  GetMoreRumahSakitEvent({required this.page});
}
class GetDetailRumahSakitEvent extends RumahSakitEvent{
  final int id;

  GetDetailRumahSakitEvent({required this.id});
}
