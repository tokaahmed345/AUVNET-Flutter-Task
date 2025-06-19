import 'package:e_commerce_ui/features/home/data/models/restaurant_model.dart';
import 'package:e_commerce_ui/features/home/domain/repo/restaurant_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RestaurantRepositoryImpl implements RestaurantRepo {
  final SupabaseClient supabase;

  RestaurantRepositoryImpl({required this.supabase});

  @override
  Future<List<RestaurantModel>> getRestaurants() async {
    try {
      final response = await supabase.from('restaurants').select();

      final restaurants =
          (response as List)
              .map(
                (item) => RestaurantModel.fromJson(item as Map<String, dynamic>),
              )
              .whereType<RestaurantModel>()
              .toList();

      return restaurants;
    } catch (e) {
      return [];
    }

    
  }
}
