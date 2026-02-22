import 'package:flutter/material.dart';
import 'package:w4_practice/2_download_app/notifier.dart';
import 'package:w4_practice/2_download_app/ui/screens/downloads/widgets/download_tile.dart';
import '../../theme/theme.dart';

class DownloadsScreen extends StatelessWidget {
  final Notifier notifier;
  const DownloadsScreen({super.key, required this.notifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: notifier.theme.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text(
            "Downloads",
            style: AppTextStyles.heading.copyWith(
              color: notifier.theme.color,
            ),
          ),

          SizedBox(height: 50),

          // TODO - Add the Download tiles
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10,),
                itemCount: notifier.controllers.length,
                itemBuilder: (context, index) =>
                    DownloadTile(controller: notifier.controllers[index])),
              ),
            ),
        ],
      ),
    );
  }
}
