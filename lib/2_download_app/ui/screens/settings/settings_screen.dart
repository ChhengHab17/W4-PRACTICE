import 'package:flutter/material.dart';
import 'package:w4_practice/2_download_app/notifier.dart';

import '../../providers/theme_color_provider.dart';
import '../../theme/theme.dart';
import 'widget/theme_color_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.notifier});
  final Notifier notifier;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: notifier.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text(
            "Settings",
            style: AppTextStyles.heading.copyWith(
              color: notifier.theme.color,
            ),
          ),

          SizedBox(height: 50),

          Text(
            "Theme",
            style: AppTextStyles.label.copyWith(color: AppColors.textLight),
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ThemeColor.values
                .map(
                  (theme) => ThemeColorButton(
                    themeColor: theme,
                    isSelected: theme == notifier.theme,
                    onTap: notifier.onThemeChange
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
