import 'package:e_commerce_ui/core/utils/styles/app_styles.dart';
import 'package:e_commerce_ui/features/home/presentation/widgets/custom_container.dart';
import 'package:e_commerce_ui/features/home/presentation/widgets/custom_list_tile.dart';
import 'package:e_commerce_ui/features/home/presentation/widgets/custom_page_view.dart';
import 'package:e_commerce_ui/features/home/presentation/widgets/popular_restaurans_row.dart';
import 'package:e_commerce_ui/features/home/presentation/widgets/services_row.dart';
import 'package:e_commerce_ui/features/home/presentation/widgets/shortcut_row.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody({super.key});
  final PageController myController = PageController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomContainer(userName: 'hepa', address: 'Al Satwa, 81A Street'),
          SizedBox(height: 4),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Services:', style: AppStyles.sans20Bold),
                ServicesRow(),
                SizedBox(height: 20),

                CustomListTile(),
                SizedBox(height: 20),
                Text('Shortcuts:', style: AppStyles.sans20Bold),
                ShortcutsRow(),
                SizedBox(height: 20),
                CustomPageView(myController: myController),
                SizedBox(height: 20),
                Text(
                  'Popular restaurants nearby',
                  style: AppStyles.sans20Bold.copyWith(fontSize: 16),
                ),
                SizedBox(height: 20),

                PopularRestaurantsRow(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
