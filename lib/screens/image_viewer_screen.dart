import 'dart:io';

import 'package:flutter/material.dart';
import 'package:live_well_image_downloader/models/live_well_image_model.dart';

class ImageViewerScreen extends StatelessWidget {
  const ImageViewerScreen({Key? key}) : super(key: key);

  static const routeName = '/imageViewer';

  @override
  Widget build(BuildContext context) {
    final model =
        ModalRoute.of(context)!.settings.arguments as LiveWellImageModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.id!,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      body: Image.file(File(model.localPath!)),
    );
  }
}
