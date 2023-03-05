import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola_mundo/Controllers/update_photo_controller.dart';
import 'package:hola_mundo/pages/perfil_page.dart';

import 'package:image_picker/image_picker.dart';

class Camera extends StatelessWidget {
  File? pickedFile;

  ImagePicker imagePicker = ImagePicker();
  UpdatePhotoController updatePhotoController = Get.find();

  Camera({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'PROFILE',
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          leading: IconButton(
            color: Colors.grey,
            onPressed: () {
              Navigator.of(context).pop(MaterialPageRoute(
                builder: (context) => PerfilPage(),
              ));
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Stack(children: [
                  Obx(
                    () => CircleAvatar(
                      backgroundImage:
                          updatePhotoController.isProficPicPathSet.value == true
                              ? FileImage(File(updatePhotoController
                                  .profilePicPath.value)) as ImageProvider
                              : const NetworkImage(
                                  'https://rest-server-node-production-109d.up.railway.app/api/fotos',
                                ),
                      radius: 90,
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: InkWell(
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                            size: 25,
                          ),
                          onTap: () {
                            print('Camera clicked');
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2)),
                                context: context,
                                builder: (context) => bottomsheet(context));
                          },
                        ),
                      ))
                ]),
              )
            ],
          ),
        ));
  }

  Widget bottomsheet(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      color: Colors.transparent,
      child: Column(
        children: [
          const Text(
            'Foto del Perfil',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 20),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 65,
                width: 65,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue),
                child: InkWell(
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  onTap: () {
                    print('Camera');
                    takePhoto(ImageSource.camera);
                  },
                ),
              ),
              Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue),
                child: InkWell(
                  child: const Icon(
                    Icons.image,
                    color: Colors.white,
                    size: 30,
                  ),
                  onTap: () {
                    print('Gallery');
                    takePhoto(ImageSource.gallery);
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    updatePhotoController.setProfileImagePath(pickedFile!.path);
    print(pickedFile);
  }
}
