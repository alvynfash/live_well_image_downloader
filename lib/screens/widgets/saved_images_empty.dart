import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class EmptySavedImages extends StatelessWidget {
  const EmptySavedImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Add images to view them in app')
        .fontSize(18)
        .textAlignment(TextAlign.center)
        .center()
        .padding(horizontal: 16);
  }
}
