import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:payschool/Controllers/update_photo_controller.dart';
import 'package:payschool/DTOs/TutorDto.dart';
import 'package:payschool/data/Config.dart';
import 'package:http/http.dart' as http;
import 'package:payschool/providers/tutor_provider.dart';
import 'package:payschool/widgets/form_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class avatarProfile extends StatelessWidget {
  final url = UrlValue.baseUrl;
  Future _getIMG() async {
    final baseurl = UrlValue.baseUrl;
    // ignore: prefer_const_declarations
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile?.path == null) return;
    var file = XFile(pickedFile!.path);
    updatePhotoController.setProfileImagePath(file.path);
    final url = Uri.parse('$baseurl/fotos');
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    final request = http.MultipartRequest('POST', url);
    request.headers.addAll(
        {"Content-Type": "application/json", "x-token": token.toString()});

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
  }

  final String id;
  avatarProfile({super.key, required this.id});
  UpdatePhotoController updatePhotoController =
      Get.put(UpdatePhotoController());
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 95,
        height: 95,
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {
            _getIMG();
          },
          child: Obx(() => CircleAvatar(
              radius: 45,
              backgroundColor: Colors.transparent,
              backgroundImage: updatePhotoController.isProficPicPathSet.value ==
                      true
                  ? FileImage(File(updatePhotoController.profilePicPath.value))
                      as ImageProvider
                  : NetworkImage('$url/fotos/$id'))),
        ));
  }
}
