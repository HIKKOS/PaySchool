import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payschool/Controllers/update_photo_controller.dart';
import 'package:payschool/DTOs/TutorDto.dart';
import 'package:payschool/data/Config.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_core/src/get_main.dart';

class avatarProfile extends StatelessWidget {

  Future _getIMG() async {
    final baseurl = UrlValue.baseUrl;
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile?.path == null) return;
    var file = XFile(pickedFile!.path);
    updatePhotoController.setProfileImagePath(file.path);

    final url = Uri.parse('${baseurl}/fotos');
    final request = http.MultipartRequest('POST', url);
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'x-token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJZCI6Ijk1ZWY4NTIwLTI2NjUtNDFiNC04OThlLTc0YjJkMjc1NTgxMCIsInJvbCI6IlR1dG9yIiwiaWF0IjoxNjc4NjgwNzM2fQ.AkOct9Ydnj5RgUMRT9WZ_zKJqK98qmvBSE9_IApV1pI'
    });

    final stream = http.ByteStream(file.openRead());
    final length = await file.length();
    final multipartFile = http.MultipartFile(
      'archivo',
      stream,
      length,
      filename: file.path.split('/').last,
    );
 

    request.files.add(multipartFile);

    await request.send();
    _getFoto();
  }

  _getFoto() {
    return NetworkImage('$url/fotos', headers: {
      "Content-Type": "application/json",
      "x-token":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJZCI6Ijk1ZWY4NTIwLTI2NjUtNDFiNC04OThlLTc0YjJkMjc1NTgxMCIsInJvbCI6IlR1dG9yIiwiaWF0IjoxNjc4NjgwNzM2fQ.AkOct9Ydnj5RgUMRT9WZ_zKJqK98qmvBSE9_IApV1pI"
    });
  }

  final url = UrlValue.baseUrl;
  avatarProfile({
    super.key,
  });
  UpdatePhotoController updatePhotoController =
      Get.put(UpdatePhotoController());
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 80,
        height: 80,
        color: Colors.transparent,
        child: GestureDetector(
            onTap: () {
              _getIMG();
            },
            child: Obx(
              () => CircleAvatar(
                radius: 45,
                backgroundColor: Colors.transparent,
                backgroundImage: updatePhotoController.isProficPicPathSet.value == true?
                       FileImage(File(updatePhotoController.profilePicPath.value))as ImageProvider:
               const AssetImage(
              "assets/images/no-image.jpg")),
            )));
  }
}
