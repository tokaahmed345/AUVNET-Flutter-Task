import 'package:e_commerce_ui/features/home/data/models/service_model.dart';

abstract class ServicesRepo {
  Future<List<ServiceModel>> getServices();
}
