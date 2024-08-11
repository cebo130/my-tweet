import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {this.webImage,
      this.containerOpacity,
      this.userName,
      this.subUserName,
      this.tweet,
      this.defImage,
      this.imageFile});
  final String? webImage;
  final double? containerOpacity;
  final String? userName;
  final String? subUserName;
  final String? tweet;
  final String? defImage;
  final File? imageFile;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScreenshotController screenshotController = ScreenshotController();

  Future<void> _takeScreenshot() async {
    try {
      final Uint8List? screenshot = await screenshotController.capture();
      if (screenshot != null) {
        final result = await ImageGallerySaver.saveImage(screenshot);
        print("Screenshot saved to gallery: $result");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Screenshot saved to gallery")),
        );
      }
    } catch (e) {
      print("Error taking screenshot: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to take screenshot")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GestureDetector(
        onDoubleTap: _takeScreenshot,
        child: Screenshot(
          controller: screenshotController,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.webImage!),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: myWidth * 0.92,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(widget.containerOpacity!),
                      border: Border.all(
                        color:
                            Colors.white.withOpacity(widget.containerOpacity!),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: widget.imageFile == null
                                  ? NetworkImage(widget.defImage!)
                                  : FileImage(widget.imageFile!)
                                      as ImageProvider,
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      widget.userName!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Icon(
                                      Icons.verified,
                                      color: Colors.blue,
                                      size: 20,
                                    ),
                                  ],
                                ),
                                Text(
                                  widget.subUserName!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            widget.tweet!,
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
