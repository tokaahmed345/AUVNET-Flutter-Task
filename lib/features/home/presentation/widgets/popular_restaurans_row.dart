import 'package:e_commerce_ui/core/utils/colors/app_colors.dart';
import 'package:e_commerce_ui/features/home/presentation/manager/bloc/res/restaurant_bloc.dart';
import 'package:e_commerce_ui/features/home/presentation/widgets/popular_restaurants_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularRestaurantsRow extends StatelessWidget {
  const PopularRestaurantsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.blue),
          );
        } else if (state is RestaurantSuccess) {
          final restaurants = state.restaurants;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: restaurants.length,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: PopularRestaurantsComponent(
                      restRestaurantLogo: restaurant.image,
                      restRestaurantName: restaurant.name,
                      restRestaurantDuration: restaurant.duration,
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is RestaurantFailure) {
          return Center(
            child: Text(
              state.error,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.grey33Color),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
