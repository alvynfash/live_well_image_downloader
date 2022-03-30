import 'package:hooks_riverpod/hooks_riverpod.dart';

class Url extends StateNotifier<String> {
  Url() : super('');

  void update(String text) => state = text;
}
