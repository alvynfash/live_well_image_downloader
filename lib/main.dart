import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'screens/home_screen.dart';
import 'screens/image_viewer_screen.dart';

void main() {
  runApp(
    const ProviderScope(child: LiveWellApp()),
  );
}

class LiveWellApp extends StatelessWidget {
  const LiveWellApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        ImageViewerScreen.routeName: (_) => const ImageViewerScreen(),
      },
    );
  }
}
