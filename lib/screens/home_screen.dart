import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_well_image_downloader/providers.dart';
import 'package:live_well_image_downloader/screens/widgets/loading_indicator.dart';

import 'widgets/saved_images_empty.dart';
import 'widgets/saved_images_list.dart';
import 'widgets/add_image_fab.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = ref.watch(imagesProvider);
    final downloader = ref.watch(urlDownloaderProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('LiveWell Loader')),
      body: Stack(
        children: [
          images.isEmpty
              ? const EmptySavedImages()
              : SavedImagesList(images: images),
          downloader.isLoading
              ? const LoadingIndicator()
              : const SizedBox.shrink(),
        ],
      ),
      floatingActionButton: const AddImageFAB(),
    );
  }
}
