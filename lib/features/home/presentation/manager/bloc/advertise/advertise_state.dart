part of 'advertise_bloc.dart';

sealed class AdvertiseState {}

final class AdvertiseInitial extends AdvertiseState {}
final class AdvertiseLoading extends AdvertiseState {}
final class AdvertiseSuccess extends AdvertiseState{
  final List<AdvertiseModel> adverts;

  AdvertiseSuccess(this.adverts);
}
final class AdvertiseFailure extends AdvertiseState{
  final String error;

  AdvertiseFailure(this.error);
}
