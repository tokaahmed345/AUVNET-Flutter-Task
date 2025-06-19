part of 'service_bloc.dart';

sealed class ServiceState {}

final class ServiceInitial extends ServiceState {}

final class ServiceLoading extends ServiceState {}

final class ServiceSuccess extends ServiceState {
  final List<ServiceModel> services;

  ServiceSuccess(this.services);
}

final class ServiceFailure extends ServiceState {
  final String error;

  ServiceFailure(this.error);
}
