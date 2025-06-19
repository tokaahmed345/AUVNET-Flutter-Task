import 'package:e_commerce_ui/features/home/data/models/advertise_model.dart';

abstract class AdvertiseRepo {
  Future<List<AdvertiseModel>> getAdvertises();
}
