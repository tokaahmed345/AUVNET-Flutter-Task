import 'package:e_commerce_ui/features/home/data/models/service_model.dart';
import 'package:e_commerce_ui/features/home/domain/repo/services_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ServicesRepositoryImpl implements ServicesRepo {
  final SupabaseClient supabase;

  ServicesRepositoryImpl({required this.supabase});

  @override
  Future<List<ServiceModel>> getServices() async {
    try {
      final response = await supabase.from('services').select();

      final services =
          (response as List)
              .map(
                (item) => ServiceModel.fromJson(item as Map<String, dynamic>),
              )
              .whereType<ServiceModel>()
              .toList();

              

      return services;
    } catch (e) {
      return [];
    }
  }
}
