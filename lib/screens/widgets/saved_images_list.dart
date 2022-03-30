import 'package:flutter/material.dart';
import 'package:live_well_image_downloader/models/live_well_image_model.dart';
import 'package:live_well_image_downloader/screens/widgets/live_well_image_tile.dart';

class SavedImagesList extends StatelessWidget {
  const SavedImagesList({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<LiveWellImageModel> images;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: images.length,
      itemBuilder: (context, index) => LiveWellImageTile(model: images[index]),
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 8),
      padding: const EdgeInsets.symmetric(vertical: 16),
    );
  }
}
