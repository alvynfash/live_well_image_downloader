import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_well_image_downloader/providers.dart';

class LiveWellImageModel {
  final String url;
  String? id;
  String? localPath;
  bool get hasLocalPath => localPath != null;

  LiveWellImageModel({required this.url, this.localPath, this.id});
}

class LiveWellImageList extends StateNotifier<List<LiveWellImageModel>> {
  LiveWellImageList(this.ref, [List<LiveWellImageModel>? initialLiveWellImages])
      : super(initialLiveWellImages ?? []);

  final Ref ref;

  void add(LiveWellImageModel model) {
    state = [...state, model];
  }

  void remove(LiveWellImageModel model) {
    state = [...state..remove(model)];
    ref.read(storageCleanupProvider(model.localPath!));
  }
}
