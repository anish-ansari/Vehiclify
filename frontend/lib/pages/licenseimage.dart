import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';


class LicenseImage extends StatefulWidget {
  @override
  _LicenseImageState createState() => _LicenseImageState();
}

class _LicenseImageState extends State<LicenseImage> {

  File licenseimage;
  String licenseimagepath;

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
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) => MyBottomNavigationBar()));
          },
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('License Image'),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 30.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton.icon(
                onPressed: () async {
                 pickImage();
                },
                label: const Text('Choose Image'),
                icon: const Icon(Icons.image),
              ),
              FlatButton.icon(
                onPressed: () async {
                  final img =
                  await ImagePicker.pickImage(source: ImageSource.camera);
                  setState(() {
                    licenseimage = img;
                  });
                },
                label: const Text('Take Photo'),
                icon: const Icon(Icons.camera),
              ),
            ],
          ),

//          Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              CircleAvatar(
//                backgroundImage: image!=null?FileImage(image):NetworkImage("https://i.picsum.photos/id/997/200/200.jpg?hmac=J9wMccIJgdwcAV_BlxcoN1N_oKWGt4Wb8EqkKqp-4gE"),
//              )
//            ],
//          ),

          Expanded(
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () {
                    saveImage(licenseimage.path);

                  },
                  label:  Text('Save Image'),
                  icon:  Icon(Icons.save),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom :30.0, left: 20.0 , right:20.0 ),
            child: licenseimagepath!=null ?
               Column(
               children: [
                 Image.file(File(licenseimagepath))

               ],

            ):

            licenseimage != null?
                Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                         Image.file(File(licenseimage.path))

//                  FlatButton.icon(
//                    onPressed: () {
//                      setState(() {
//                        licenseimage = null;
//                      });
//                    },
//                    label:  Text('Remove Image'),
//                    icon:  Icon(Icons.close),
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

  void pickImage() async{
    final img =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      licenseimage = img;
    });


  }

  void saveImage(path) async{
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    saveimage.setString("imagepath", path);

  }

  void LoadImage() async{
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    setState(() {
      licenseimagepath = saveimage.get("imagepath");
    });

  }
}



