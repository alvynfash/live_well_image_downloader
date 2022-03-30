import 'package:flutter/material.dart';

import 'add_image_form.dart';

class AddImageFAB extends StatelessWidget {
  const AddImageFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const AddImageForm(),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          isScrollControlled: true,
        );
      },
    );
  }
}
