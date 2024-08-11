import 'dart:io';

import 'package:customize/pages/output/homepage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  double containerOpacity = 0.8;
  bool borderSelected = false;
  int selectedIndex = 0;
  String defImage = "https://cdn-icons-png.flaticon.com/512/149/149071.png";
  List<String> beachImage = [
    "https://images.pexels.com/photos/3801091/pexels-photo-3801091.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/1151282/pexels-photo-1151282.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/1142984/pexels-photo-1142984.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/2645245/pexels-photo-2645245.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/2962392/pexels-photo-2962392.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/1078981/pexels-photo-1078981.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/1032650/pexels-photo-1032650.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/165775/pexels-photo-165775.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/24902372/pexels-photo-24902372/free-photo-of-view-of-sand-dunes-and-sea-in-the-background.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/20430721/pexels-photo-20430721/free-photo-of-shrubs-by-the-sunny-beach.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/20505272/pexels-photo-20505272/free-photo-of-fishing-boat-near-the-coast.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/20505301/pexels-photo-20505301/free-photo-of-sun-setting-over-boats-moored-on-a-lakeshore.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/20505309/pexels-photo-20505309/free-photo-of-abstract-sand-shapes-around-water.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/20506078/pexels-photo-20506078/free-photo-of-footprints-on-yellow-beach-on-sea-coast.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/20505302/pexels-photo-20505302/free-photo-of-aerial-view-of-boats-moored-on-a-sandy-lakeshore.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/20499496/pexels-photo-20499496/free-photo-of-boats-on-beach.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/20495883/pexels-photo-20495883/free-photo-of-beach-by-a-sea-with-a-lighthouse-under-a-cloudy-sky.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/20508963/pexels-photo-20508963/free-photo-of-view-of-a-beach-with-dry-grass.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/1770310/pexels-photo-1770310.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/3214944/pexels-photo-3214944.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/20451936/pexels-photo-20451936/free-photo-of-beautiful-view-of-beach-in-nazare-portugal.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/373394/pexels-photo-373394.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/2880802/pexels-photo-2880802.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/4711014/pexels-photo-4711014.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/789549/pexels-photo-789549.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/5864758/pexels-photo-5864758.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/6406719/pexels-photo-6406719.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/15094192/pexels-photo-15094192/free-photo-of-footprints-in-the-sand.jpeg?auto=compress&cs=tinysrgb&w=800",
    "https://images.pexels.com/photos/20484415/pexels-photo-20484415/free-photo-of-wet-sand-on-sea-shore-at-sunset.png?auto=compress&cs=tinysrgb&w=800",
  ];
  List<String> notBeachImages = [
    "https://images.pexels.com/photos/1257860/pexels-photo-1257860.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/1624496/pexels-photo-1624496.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/719396/pexels-photo-719396.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/1122639/pexels-photo-1122639.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/1366919/pexels-photo-1366919.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/1141792/pexels-photo-1141792.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/40465/pexels-photo-40465.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/1624438/pexels-photo-1624438.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/358457/pexels-photo-358457.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/1274260/pexels-photo-1274260.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/2832041/pexels-photo-2832041.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/2486168/pexels-photo-2486168.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/1595655/pexels-photo-1595655.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/1010519/pexels-photo-1010519.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/1214259/pexels-photo-1214259.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/1707215/pexels-photo-1707215.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/2832034/pexels-photo-2832034.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/1598073/pexels-photo-1598073.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/1317365/pexels-photo-1317365.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/1317374/pexels-photo-1317374.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/7276787/pexels-photo-7276787.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/1366913/pexels-photo-1366913.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/1212600/pexels-photo-1212600.jpeg?auto=compress&cs=tinysrgb&w=1200",
  ];
  String selectedWebImage =
      "https://images.pexels.com/photos/3801091/pexels-photo-3801091.jpeg?auto=compress&cs=tinysrgb&w=800";
  bool isEditing = false;
  bool beachSelected = true;
  //bool galaxySelected = false;

  TextEditingController textController1 =
      TextEditingController(text: "UserName");
  TextEditingController textController2 =
      TextEditingController(text: "@Username123");
  TextEditingController textController3 =
      TextEditingController(text: "Add a quote or tweet here");

  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          "myTweet Edit",
          style:
              TextStyle(fontWeight: FontWeight.normal, color: Colors.lightBlue),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: myWidth * 0.95,
                height: myHeight * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(selectedWebImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: myWidth * 0.90,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(
                                containerOpacity), // Adjusting opacity
                            border: Border.all(
                              color: Colors.white.withOpacity(containerOpacity),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(9))),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: _pickImage,
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: _imageFile == null
                                            ? NetworkImage(defImage)
                                            : FileImage(_imageFile!)
                                                as ImageProvider,
                                      ),
                                      Positioned(
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: Colors.lightBlue,
                                        ),
                                        bottom: -10,
                                        left: 23,
                                      ),
                                    ],
                                    clipBehavior: Clip.none,
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            isEditing
                                                ? SizedBox(
                                                    width: 150,
                                                    child: TextField(
                                                      controller:
                                                          textController1,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ),
                                                  )
                                                : Text(
                                                    textController1.text,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                            IconButton(
                                              icon: Icon(
                                                isEditing
                                                    ? Icons.check
                                                    : Icons
                                                        .mode_edit_outline_outlined,
                                                color: Colors.grey,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  isEditing = !isEditing;
                                                });
                                              },
                                            ),
                                            Icon(
                                              Icons.verified,
                                              color: Colors.blue,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        isEditing
                                            ? SizedBox(
                                                width: 150,
                                                child: TextField(
                                                  controller: textController2,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 12,
                                                      color: Colors.blueGrey),
                                                ),
                                              )
                                            : Text(
                                                textController2.text,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12,
                                                    color: Colors.blueGrey),
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            isEditing
                                ? TextField(
                                    controller: textController3,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                    maxLines: 5,
                                  )
                                : Text(
                                    textController3.text,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height:
                              20), // Spacing between the container and the slider
                    ],
                  ),
                ),
              ),
              Slider(
                value: containerOpacity,
                min: 0.0,
                max: 1.0,
                divisions: 100,
                label: (containerOpacity * 100).round().toString(),
                onChanged: (value) {
                  setState(() {
                    containerOpacity = value;
                  });
                },
                activeColor: Colors.lightBlueAccent,
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: myWidth * 0.3,
                      decoration: BoxDecoration(
                          color: beachSelected
                              ? Colors.lightBlueAccent
                              : Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(
                              color: beachSelected
                                  ? Colors.white
                                  : Colors.lightBlueAccent)
                          // color: Colors.lightBlueAccent,
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "beach",
                            style: TextStyle(
                                color: beachSelected
                                    ? Colors.white
                                    : Colors.lightBlueAccent),
                          ),
                          Icon(
                            Icons.beach_access,
                            color: beachSelected
                                ? Colors.white
                                : Colors.lightBlueAccent,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        beachSelected = !beachSelected;
                        //galaxySelected = !galaxySelected;
                      });
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: myWidth * 0.3,
                      decoration: BoxDecoration(
                          color: beachSelected
                              ? Colors.white
                              : Colors.lightBlueAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(
                              color: beachSelected
                                  ? Colors.lightBlueAccent
                                  : Colors.white)
                          // color: Colors.lightBlueAccent,
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "galaxy",
                            style: TextStyle(
                                color: beachSelected
                                    ? Colors.lightBlueAccent
                                    : Colors.white),
                          ),
                          Icon(
                            Icons.nights_stay,
                            color: beachSelected
                                ? Colors.lightBlueAccent
                                : Colors.white,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        beachSelected = !beachSelected;
                        //galaxySelected = !galaxySelected;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 100.0,
                child: Scrollbar(
                  thumbVisibility: true,
                  trackVisibility: true,
                  thickness: 4,
                  showTrackOnHover: true,
                  radius: Radius.circular(30),
                  controller: ScrollController(),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: beachSelected
                        ? beachImage.length
                        : notBeachImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? Colors.lightBlueAccent
                                : Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          child: beachSelected
                              ? Image.network(beachImage[index])
                              : Image.network(notBeachImages[index]),
                        ),
                        onTap: () {
                          setState(() {
                            beachSelected
                                ? selectedWebImage = beachImage[index]
                                : selectedWebImage = notBeachImages[index];
                            selectedIndex = index;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: myWidth * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.lightBlueAccent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Done",
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.double_arrow_sharp,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext _) => HomePage(
                                webImage: selectedWebImage,
                                containerOpacity: containerOpacity,
                                userName: textController1.text,
                                subUserName: textController2.text,
                                tweet: textController3.text,
                                defImage: defImage,
                                imageFile: _imageFile,
                              )));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
