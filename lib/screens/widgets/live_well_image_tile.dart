import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_well_image_downloader/providers.dart';
import 'package:live_well_image_downloader/models/live_well_image_model.dart';
import 'package:live_well_image_downloader/screens/image_viewer_screen.dart';

class LiveWellImageTile extends HookConsumerWidget {
  const LiveWellImageTile({
    Key? key,
    required this.model,
  }) : super(key: key);

  final LiveWellImageModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) => _removeImage(ref),
      direction: DismissDirection.endToStart,
      child: ListTile(
        title: Text(model.id!),
        subtitle: Text(model.localPath!),
        onTap: () => _viewImage(context),
      ),
      background: Container(
        color: Colors.red,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.centerRight,
        child: const Padding(
          padding: EdgeInsets.only(right: 32),
          child: Icon(
            Icons.delete,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _removeImage(WidgetRef ref) {
    ref.read(imagesProvider.notifier).remove(model);
  }

  void _viewImage(BuildContext context) {
    Navigator.pushNamed(
      context,
      ImageViewerScreen.routeName,
      arguments: model,
    );
  }
}
