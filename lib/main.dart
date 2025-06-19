import 'dart:developer';

import 'package:e_commerce_ui/core/di/injection.dart';
import 'package:e_commerce_ui/core/utils/constants/constants.dart';
import 'package:e_commerce_ui/core/utils/router/app_router.dart';
import 'package:e_commerce_ui/features/authentication/domain/entities/user_entity.dart';
import 'package:e_commerce_ui/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // hive init
  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  await Hive.openBox(userBoxKey);
  await Hive.openBox(serviceBoxKey);
  await Hive.openBox(restaurantBoxKey);
  await Hive.openBox(advertiseBoxKey);

  // firebase init
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      log('User is currently signed out!');
    } else {
      log('User is signed in!');
    }
  });

  await supa.Supabase.initialize(
    url: "https://nmqxucwdeegblphzrbep.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5tcXh1Y3dkZWVnYmxwaHpyYmVwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAyNTU1NjAsImV4cCI6MjA2NTgzMTU2MH0.z2hhyYdMTaQsDZfcvEPl7TtSTTwYLQJtE7EiYSQLsts",
  );
  await init();

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const SimpleEcommerceApp());
}

class SimpleEcommerceApp extends StatelessWidget {
  const SimpleEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
