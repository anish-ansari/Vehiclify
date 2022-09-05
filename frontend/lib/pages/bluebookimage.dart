import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlueBookImage extends StatefulWidget {
  @override
  _BlueBookImageState createState() => _BlueBookImageState();
}

class _BlueBookImageState extends State<BlueBookImage> {

  File bluebookimage;
  String bluebookimagepath;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadImage();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bule Book Image'),
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) => MyBottomNavigationBar()));
          },
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 30.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton.icon(
                onPressed: () async {

                  final img =
                  await ImagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    bluebookimage = img;
                  });
                },
                label: const Text('Choose Image'),
                icon: const Icon(Icons.image),
              ),
              FlatButton.icon(
                onPressed: () async {
                  final img =
                  await ImagePicker.pickImage(source: ImageSource.camera);
                  setState(() {
                    bluebookimage = img;
                  });
                },
                label: const Text('Take Photo'),
                icon: const Icon(Icons.camera),
              ),
            ],
          ),


          Expanded(
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () {
                    saveImage(bluebookimage.path);

                  },
                  label:  Text('Save Image'),
                  icon:  Icon(Icons.save),
                )
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(bottom :30.0, left: 20.0 , right:20.0 ),
            child: bluebookimagepath!=null ?
               Column(
                children: [
                  Image.file(File(bluebookimagepath))
                ],
               ):

            bluebookimage != null ?
                 Column(
                  children: [
                     Image.file(File(bluebookimage.path
                    ))

//                  FlatButton.icon(
//                    onPressed: () {
//                      setState(() {
//                        bluebookimage = null;
//                      });
//                    },
//                    label: const Text('Remove Image'),
//                    icon: const Icon(Icons.close),
//                  )
                  ],
                )
                :
              const SizedBox(),
          ),
        ],
      ),
    );
  }

  void saveImage(path) async{
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    saveimage.setString("bluebookimagepath", path);

  }

  void LoadImage() async{
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    setState(() {
      bluebookimagepath = saveimage.get("bluebookimagepath");
    });

  }
}