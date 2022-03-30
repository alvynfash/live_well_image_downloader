import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import 'models/url.dart';
import 'models/live_well_image_model.dart';

final urlProvider = StateNotifierProvider<Url, String>((ref) {
  return Url();
});

final imagesProvider =
    StateNotifierProvider<LiveWellImageList, List<LiveWellImageModel>>(
        (ref) => LiveWellImageList(ref, const []));

final urlDownloaderProvider = FutureProvider.autoDispose(
  (ref) async {
    // try {
    //   final url = ref.watch(urlProvider);
    //   if (url.isNotEmpty) {
    //      ref.read(downloaderProvider(url));
    //   }

    //   ref.read(downloaderProvider(url));
    // } catch (e) {
    //   return;
    // }

    final url = ref.watch(urlProvider);
    if (url.isNotEmpty) {
      ref.read(downloaderProvider(url));
    }
  },
);

final downloaderProvider =
    FutureProvider.family.autoDispose((ref, String url) async {
  try {
    final dio = Dio();
    final directory = await getApplicationDocumentsDirectory();
    final id = DateTime.now().millisecondsSinceEpoch;
    final savePath = '${directory.path}/live-well/$id.livewellfile';

    await dio.download(
      url,
      savePath,
      onReceiveProgress: (received, total) {
        // Todo: Display download progress
        // if (total != -1) {
        //   final progress = ((received / total * 100).toStringAsFixed(0) + "%");
        // }
      },
    );
    ref.read(imagesProvider.notifier).add(
          LiveWellImageModel(
            id: 'LiveWell #IMG-$id',
            url: url,
            localPath: savePath,
          ),
        );
  } catch (e) {
    return;
  }
});

final storageCleanupProvider =
    FutureProvider.family.autoDispose((ref, String path) async {
  try {
    await File(path).delete();
    return true;
  } catch (e) {
    return false;
  }
});
