// lib/core/di/injection.dart

import 'package:e_commerce_ui/features/home/data/repo/advertise_repo_imp.dart';
import 'package:e_commerce_ui/features/home/data/repo/restaurant_repo_imp.dart';
import 'package:e_commerce_ui/features/home/data/repo/services_repo_imp.dart';
import 'package:e_commerce_ui/features/home/domain/repo/advertise_repo.dart';
import 'package:e_commerce_ui/features/home/domain/repo/restaurant_repo.dart';
import 'package:e_commerce_ui/features/home/domain/repo/services_repo.dart';
import 'package:e_commerce_ui/features/home/presentation/manager/bloc/advertise/advertise_bloc.dart';
import 'package:e_commerce_ui/features/home/presentation/manager/bloc/res/restaurant_bloc.dart';
import 'package:e_commerce_ui/features/home/presentation/manager/bloc/service/service_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final ml = GetIt.instance;

Future<void> init() async {
  ml.registerLazySingleton<ServicesRepo>(
    () => ServicesRepositoryImpl(supabase: Supabase.instance.client),
  );

  ml.registerLazySingleton<AdvertiseRepo>(
    () => AdvertisesRepositoryImpl(supabase: Supabase.instance.client),
  );

  ml.registerLazySingleton<RestaurantRepo>(
    () => RestaurantRepositoryImpl(supabase: Supabase.instance.client),
  );

  ml.registerFactory(() => ServiceBloc(ml()));
  ml.registerFactory(() => AdvertiseBloc(ml()));
  ml.registerFactory(() => RestaurantBloc(ml()));
}
