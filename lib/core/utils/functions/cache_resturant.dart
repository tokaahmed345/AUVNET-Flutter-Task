import 'package:e_commerce_ui/core/utils/constants/constants.dart';
import 'package:e_commerce_ui/features/home/data/models/restaurant_model.dart';
import 'package:hive/hive.dart';

class CacheResturant {
  void saveServices(RestaurantModel resturant ) async {
 
    var box = Hive.box(restaurantBoxKey);
    try {
      await box.addAll([resturant]);
    } catch (e) {
    }
  }

   getService( ) {
     var box = Hive.box(restaurantBoxKey);
     
     var res = box.values.toList();
      return res;
    
  }

  void clear() {
  }
}

