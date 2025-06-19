import 'package:e_commerce_ui/core/utils/assets/app_assets.dart';
import 'package:e_commerce_ui/features/home/presentation/widgets/shortcuts_component.dart';
import 'package:flutter/material.dart';

class ShortcutsRow extends StatelessWidget {
  const ShortcutsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ShortcutsComponent(
          shortcutImage: AppAssets.pastOrdericon,
          shortcutName: 'Past\norders',
        ),
        ShortcutsComponent(
          shortcutImage: AppAssets.supersavericon,
          shortcutName: 'Super\nSaver',
        ),
    
        ShortcutsComponent(
          shortcutImage: AppAssets.mustTriesIcon,
          shortcutName: 'Must-tries',
        ),
        ShortcutsComponent(
          shortcutImage: AppAssets.giveBackIcon,
          shortcutName: 'Give Back',
        ),
        ShortcutsComponent(
          shortcutImage: AppAssets.bestSellersIcon,
          shortcutName: 'Best\nSellers',
        ),
      ],
    );
  }
}