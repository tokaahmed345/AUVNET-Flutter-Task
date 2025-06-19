import 'package:e_commerce_ui/core/utils/constants/constants.dart';
import 'package:e_commerce_ui/features/home/data/models/service_model.dart';
import 'package:hive/hive.dart';

class CacheService {
  void saveServices(ServiceModel service ) async {
 
    var box = Hive.box(serviceBoxKey);
    try {
      await box.addAll([service]);
    } catch (e) {
    }
  }

  // Load Service data from Hive
   getService( ) {
     var box = Hive.box(serviceBoxKey);
     
     var services = box.values.toList();
      return services;
    
  }

  void clear() {
  }
}

