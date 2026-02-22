import 'package:flutter/material.dart';
import 'package:w4_practice/2_download_app/ui/theme/theme.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  // TODO
  double get downloadedSize =>
      (controller.ressource.size * (controller.progress / 100)) * 100;
  double get downloadProgress => controller.progress * 100;

  IconData get tileIcon {
    if (controller.status == DownloadStatus.notDownloaded) {
      return Icons.download;
    } else if (controller.status == DownloadStatus.downloading) {
      return Icons.downloading;
    } else if (controller.status == DownloadStatus.downloaded) {
      return Icons.folder;
    }
    return Icons.download;
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder:(context, child) => ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(controller.ressource.name),
        subtitle: controller.status == DownloadStatus.notDownloaded
            ? SizedBox(height: 10)
            : Row(
                children: [
                  Text("${downloadProgress.toStringAsFixed(1)}% completed - "),
                  Text(
                    "${downloadedSize.toStringAsFixed(1)} of ${controller.ressource.size.toStringAsFixed(1)} MB",
                  ),
                ],
              ),
        trailing: IconButton(
          onPressed: controller.startDownload,
          icon: Icon(tileIcon, color: AppColors.iconNormal),
        ),
      ),
    );
  }
}
