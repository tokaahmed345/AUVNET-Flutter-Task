import 'package:e_commerce_ui/features/home/data/models/advertise_model.dart';
import 'package:e_commerce_ui/features/home/domain/repo/advertise_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdvertisesRepositoryImpl implements AdvertiseRepo {
  final SupabaseClient supabase;

  AdvertisesRepositoryImpl({required this.supabase});

  @override
  Future<List<AdvertiseModel>> getAdvertises() async {
    try {
      final response = await supabase.from('advertises').select();

      final advertises =
          (response as List)
              .map(
                (item) => AdvertiseModel.fromJson(item as Map<String, dynamic>),
              )
              .whereType<AdvertiseModel>()
              .toList();

      return advertises;
    } catch (e) {
      return [];
    }

    
  }
}
