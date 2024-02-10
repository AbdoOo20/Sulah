import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/resources/locale_keys.g.dart';



class AttachImage extends StatefulWidget {
  final ValueChanged<String> _onAttachImage;


  @override
  State<AttachImage> createState() => _AttachImageState();

  const AttachImage({Key? key,
    required ValueChanged<String> onAttachImage,
  }) : _onAttachImage = onAttachImage, super(key: key);
}

class _AttachImageState extends State<AttachImage> {
  final pickerQu = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: Text(
              tr(LocaleKeys.gallery),
            ),
            onTap: _fromGallery,
          ),
          ListTile(
            leading: const Icon(Icons.photo_camera),
            title: Text(tr(LocaleKeys.camera)),
            onTap: _takesPhoto,
          ),
        ],
      ),
    );
  }

  _takesPhoto() async {
    final pickedFile = await pickerQu.pickImage(source: ImageSource.camera);
    if (pickedFile!=null) {
      Navigator.pop(context);
      widget._onAttachImage(pickedFile.path);
    }
  }

  Future<dynamic> _fromGallery() async {
    final pickedFile = await pickerQu.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Navigator.pop(context);
      widget._onAttachImage(pickedFile.path);
    }
  }



}
showSelectAttachImageMethod(BuildContext context,{ required ValueChanged<String> onAttachImage}){
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AttachImage(onAttachImage: onAttachImage);
      }
  );
}