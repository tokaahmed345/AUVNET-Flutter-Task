part of 'restaurant_bloc.dart';

sealed class RestaurantState {}

final class RestaurantInitial extends RestaurantState {}
final class RestaurantLoading extends RestaurantState {}
final class RestaurantSuccess extends RestaurantState {
  final List<RestaurantModel> restaurants;

  RestaurantSuccess(this.restaurants);
}
final class RestaurantFailure extends RestaurantState {
  final String error;

  RestaurantFailure({required this.error});
}
