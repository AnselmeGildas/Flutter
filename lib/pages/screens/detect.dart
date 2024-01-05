// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';


enum ImageSourceType { gallery, camera }

class DetectPage extends StatelessWidget {
  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15)
            )
          ),
          title: const Text("Détecter les anomalies", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),),
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(64, 212, 0, 1)
        ),
        body: Center(
          child: Column(
            children: [
              MaterialButton(
                color: const Color.fromRGBO(64, 212, 0, 1),
                child: const Text(
                  "Choisir une image depuis la gallerie",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  _handleURLButtonPress(context, ImageSourceType.gallery);
                },
              ),
              MaterialButton(
                color: const Color.fromRGBO(64, 212, 0, 1),
                child: const Text(
                  "Prendre une image avec la Camera",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  _handleURLButtonPress(context, ImageSourceType.camera);
                },
              ),
            ],
          ),
        ));
  }
}



class ImageFromGalleryEx extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final type;
  const ImageFromGalleryEx(this.type);

  @override
  // ignore: no_logic_in_create_state
  ImageFromGalleryExState createState() => ImageFromGalleryExState(type);
}

class ImageFromGalleryExState extends State<ImageFromGalleryEx> {
  // ignore: prefer_typing_uninitialized_variables
  var _image;
  // ignore: prefer_typing_uninitialized_variables
  var imagePicker;
  // ignore: prefer_typing_uninitialized_variables
  var type;

  ImageFromGalleryExState(this.type);

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15)
            )
          ),
          title: Text(type == ImageSourceType.camera
              ? "Image de la Camera"
              : "Image de la Gallery"),
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(64, 212, 0, 1),
          ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 52,
          ),
          Center(
            child: GestureDetector(
              onTap: () async {
                var source = type == ImageSourceType.camera
                    ? ImageSource.camera
                    : ImageSource.gallery;
                XFile image = await imagePicker.pickImage(
                    source: source, imageQuality: 50, preferredCameraDevice: CameraDevice.front);
                setState(() {
                  _image = File(image.path);
                });
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.grey[500]),
                child: _image != null
                    ? Image.file(
                          _image,
                          width: 500.0,
                          height: 500.0,
                          fit: BoxFit.fitHeight,
                        )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[500]),
                        width: 500,
                        height: 500,
                        child: const Icon(
                          Icons.camera_alt,
                          color: Color.fromRGBO(64, 212, 0, 1),
                        ),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

