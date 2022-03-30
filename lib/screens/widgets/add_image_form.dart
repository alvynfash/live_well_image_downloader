import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_well_image_downloader/providers.dart';
import 'package:styled_widget/styled_widget.dart';

class AddImageForm extends StatefulHookConsumerWidget {
  const AddImageForm({Key? key}) : super(key: key);

  @override
  _AddImageFormState createState() => _AddImageFormState();
}

class _AddImageFormState extends ConsumerState<AddImageForm> {
  final _imageUrlRegExp =
      RegExp(r"^(http(s?):)([/|.|\w|\s|-])*\.(?:jpg|gif|png)");

  late GlobalKey<FormState> _addImageFormKey;
  late TextEditingController _imageUrlController;
  late bool _isValidUrl;

  @override
  void initState() {
    _addImageFormKey = GlobalKey<FormState>();
    _imageUrlController = TextEditingController();
    _isValidUrl = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Wrap(
        children: [
          Form(
            key: _addImageFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _imageUrlController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter Image Url',
                    hintText: 'http://',
                  ),
                  onChanged: (text) =>
                      setState(() => _isValidUrl = isValidUrl(text) == null),
                  validator: (text) => isValidUrl(text),
                ),
                ElevatedButton(
                  onPressed: _isValidUrl ? _submit : null,
                  child: const Text('Get it').center().height(50),
                ).padding(vertical: 32),
              ],
            ).padding(all: 24),
          ),
        ],
      ),
    );
  }

  String? isValidUrl(String? text) {
    if (text == null || text.isEmpty) {
      return 'Can\'t be empty';
    }

    if (!_imageUrlRegExp.hasMatch(text)) {
      return 'Invalid url';
    }

    return null;
  }

  _submit() {
    if (_addImageFormKey.currentState!.validate()) {
      Navigator.pop(context);
      ref.read(urlProvider.notifier).update(_imageUrlController.text);
    }
  }
}
