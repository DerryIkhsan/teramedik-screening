part of 'rumahsakit_bloc.dart';

abstract class RumahSakitEvent {}
class GetRumahSakitEvent extends RumahSakitEvent{}
class GetMoreRumahSakitEvent extends RumahSakitEvent{}
class GetDetailRumahSakitEvent extends RumahSakitEvent{
  final int id;

  GetDetailRumahSakitEvent({required this.id});
}
