import 'package:e_commerce_ui/features/home/data/models/restaurant_model.dart';
import 'package:e_commerce_ui/features/home/domain/repo/restaurant_repo.dart';
import 'package:e_commerce_ui/features/home/presentation/manager/bloc/res/restaurant_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final RestaurantRepo restaurantRepo;
  RestaurantBloc(this.restaurantRepo) : super(RestaurantInitial()) {
    on<GetRestaurantsEvent>((event, emit) async {
      emit(RestaurantLoading());

      final restaurants = await restaurantRepo.getRestaurants();

      if (restaurants.isNotEmpty) {
        emit(RestaurantSuccess(restaurants));
      } else {
        emit(RestaurantFailure(error: "No restaurants found, check your internet connection and try again"));
      }
    });
  }
}
