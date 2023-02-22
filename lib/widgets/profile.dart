import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserProfile createState() => _UserProfile();
}

class _UserProfile extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return CircularProfileAvatar(
      'https://i.pinimg.com/736x/7a/04/b1/7a04b127016dc1ab33ee0d415874314e.jpg',
      errorWidget: (context, url, error) => Container(
        child: const Icon(Icons.error),
      ),
      placeHolder: (context, url) => Container(
        width: 50,
        height: 50,
        child: const CircularProgressIndicator(),
      ),
      radius: 60,
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
        print('adil');
      },
      cacheImage: true,
      showInitialTextAbovePicture: false,
    );
  }
}
