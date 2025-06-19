
import 'package:e_commerce_ui/features/home/data/models/restaurant_model.dart';

abstract class RestaurantRepo {
  Future<List<RestaurantModel>> getRestaurants();
}
