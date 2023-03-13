import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../Handler/camera.dart';

class TakeImage extends StatefulWidget {
  const TakeImage({Key? key}) : super(key: key);

  @override
  State<TakeImage> createState() => _TakeImageState();
}

class _TakeImageState extends State<TakeImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          onPressed: () async {
            await availableCameras().then((value) => Navigator.push(context,
                MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));
          },
          child: const Text("Verify Now"),
        )),
      ),
    );
  }
}
