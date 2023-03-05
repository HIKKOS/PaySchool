import 'package:get/get.dart';

class UpdatePhotoController extends GetxController {
  // ignore: non_constant_identifier_names
  var isProficPicPathSet = false.obs;
  // ignore: non_constant_identifier_names
  var profilePicPath = "".obs;

  void setProfileImagePath(String path) {
    profilePicPath.value = path;
    isProficPicPathSet.value = true;
    
  }
}