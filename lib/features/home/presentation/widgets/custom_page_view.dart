import 'package:e_commerce_ui/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:e_commerce_ui/features/home/presentation/manager/bloc/advertise/advertise_bloc.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.myController});

  final PageController myController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertiseBloc, AdvertiseState>(
      builder: (context, state) {
        if (state is AdvertiseLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is AdvertiseSuccess) {
          final images = state.adverts.map((advert) => advert.image).toList();
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 180,
                child: PageView.builder(
                  controller: myController,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      images[index],
                      fit: BoxFit.fill,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: myController,
                    count: images.length,
                    effect: SlideEffect(
                      spacing: 8.0,
                      dotWidth: 8,
                      dotHeight: 8,
                      paintStyle: PaintingStyle.fill,
                      dotColor: AppColors.greyD95Color,
                      activeDotColor: AppColors.purpleColor,
                    ),
                  ),
                ),
              ),
            ],
          );
        }

        if (state is AdvertiseFailure) {
          return Center(
            child: Text(
              state.error,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.grey33Color),
            ),
          );
        }

        // Initial or unexpected state
        return const SizedBox();
      },
    );
  }
}
