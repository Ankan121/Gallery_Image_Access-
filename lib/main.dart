import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main(){
  runApp(myapp());
}
class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Gallary Image Access'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/phone.jpg"),
                      radius: 100,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children:[ _imageFile != null ?  CircleAvatar(
                      radius: 100,//*** aita holo camera or gelary theke neya pic er size***
                      backgroundImage: FileImage(_imageFile!),
                    ) :
                    Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/phone.jpg"),
                        radius: 100,
                      ),
                    ),
                      //mage.file(File(_imageFile!.path)
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 110,
                  child: InkWell(
                    onTap: ()async{
                      final ImagePicker picker = ImagePicker(); // Pick an image.
                      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                      print(image);
                      print(image?.name);
                      print(image?.path);
                      print("here i have print image path");
                      setState(() {
                        _imageFile=File(image!.path);

                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(Icons.camera,size: 40,color: Colors.white,),),),)
              ],
            ),
          ],
        ),
        ),
      );

  }
}
