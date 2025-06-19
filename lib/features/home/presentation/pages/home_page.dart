import 'package:e_commerce_ui/core/di/injection.dart';
import 'package:e_commerce_ui/core/utils/colors/app_colors.dart';
import 'package:e_commerce_ui/features/home/presentation/manager/bloc/advertise/advertise_bloc.dart';
import 'package:e_commerce_ui/features/home/presentation/manager/bloc/advertise/advertise_event.dart';
import 'package:e_commerce_ui/features/home/presentation/manager/bloc/res/restaurant_bloc.dart';
import 'package:e_commerce_ui/features/home/presentation/manager/bloc/res/restaurant_event.dart';
import 'package:e_commerce_ui/features/home/presentation/manager/bloc/service/service_bloc.dart';
import 'package:e_commerce_ui/features/home/presentation/manager/bloc/service/service_event.dart';
import 'package:e_commerce_ui/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:e_commerce_ui/features/home/presentation/widgets/home_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ml<ServiceBloc>()..add(GetServicesEvent()),
        ),
        BlocProvider(
          create: (context) => ml<AdvertiseBloc>()..add(GetAdvertsEvent()),
        ),
        BlocProvider(
          create: (context) => ml<RestaurantBloc>()..add(GetRestaurantsEvent()),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: HomePageBody(),
        bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}
