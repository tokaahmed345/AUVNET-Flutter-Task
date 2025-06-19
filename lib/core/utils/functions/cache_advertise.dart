import 'package:e_commerce_ui/core/utils/constants/constants.dart';
import 'package:e_commerce_ui/features/home/data/models/advertise_model.dart';
import 'package:hive/hive.dart';

class CacheAdvertise {
  void saveServices(AdvertiseModel advertise ) async {
 
    var box = Hive.box(advertiseBoxKey);
    try {
      await box.addAll([advertise]);
    } catch (e) {
    }
  }

  // Load Service data from Hive
   getService( ) {
     var box = Hive.box(advertiseBoxKey);
     
     var advs = box.values.toList();
      return advs;
    
  }

  void clear() {
  }
}

