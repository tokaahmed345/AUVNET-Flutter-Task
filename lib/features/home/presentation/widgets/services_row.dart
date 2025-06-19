import 'package:e_commerce_ui/core/utils/colors/app_colors.dart';
import 'package:e_commerce_ui/features/home/presentation/manager/bloc/service/service_bloc.dart';
import 'package:e_commerce_ui/features/home/presentation/widgets/services_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesRow extends StatelessWidget {
  const ServicesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceBloc, ServiceState>(
      builder: (context, state) {
        if (state is ServiceLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.blue),
          );
        } else if (state is ServiceSuccess) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: state.services.length,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
            ),
            itemCount: state.services.length,
            itemBuilder: (context, index) {
              final service = state.services[index];
              return ServicesComponent(
                serviceImage: service.image,
                serviceBadgeText: service.discount,
                serviceTitle: service.name,
              );
            },
          );
        } else if (state is ServiceFailure) {
          return  Center(
            child: Text(
              state.error,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.grey33Color),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
