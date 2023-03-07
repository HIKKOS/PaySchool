import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:payschool/pages/ScreenCamera/screen_camera.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _UserProfile createState() => _UserProfile();
}

class _UserProfile extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return CircularProfileAvatar(
      'https://rest-server-node-production-109d.up.railway.app/api/fotos',
      errorWidget: (context, url, error) => Container(
        child: const Icon(Icons.error),
      ),
      placeHolder: (context, url) => Container(
        width: 50,
        height: 50,
        child: const CircularProgressIndicator(),
      ),
      radius: 200,
      backgroundColor: Colors.transparent,
      borderWidth: 2,
      initialsText: const Text(
        "AD",
        style: TextStyle(fontSize: 40, color: Colors.white),
      ),
      borderColor: Colors.transparent,
      imageFit: BoxFit.fitHeight,
      elevation: 5.0,
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Camera()));
      },
      cacheImage: true,
      showInitialTextAbovePicture: false,
    );
  }
}
