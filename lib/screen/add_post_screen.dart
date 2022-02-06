import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instaclone/utilities/colors.dart';
import 'package:instaclone/utilities/utilities.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;


_selectImage(BuildContext context)async{
  return showDialog(context: context, builder: (context){
    return SimpleDialog(
title: const Text("creat a Post"),
children: [
  SimpleDialogOption(
    padding: const EdgeInsets.all(20),
    child: const Text("Take a Photo"),
    onPressed: ()async {
      Navigator.of(context).pop();
      Uint8List file =await pickImage(ImageSource.camera);
      setState(() {
        _file=file;
      });
    },
  ), SimpleDialogOption(
    padding: const EdgeInsets.all(20),
    child: const Text("Von Gallery"),
    onPressed: ()async {
      Navigator.of(context).pop();
      Uint8List file =await pickImage(ImageSource.gallery);
      setState(() {
        _file=file;
      });
    },
  )
],


    );
  });
}




  @override
  Widget build(BuildContext context) {
    return  _file==null? Center(
       child:IconButton(onPressed: ()=>_selectImage(context), icon:const Icon(Icons.upload),) ,

    ):

     Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){}
        ),
        title: const Text('posten jetzt'),
        centerTitle: false,
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Post",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ))
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1573649481636-f4f97fcba3e0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: "Schreibe etwas...", border: InputBorder.none),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 45,
                width: 45,
                child: AspectRatio(
                  aspectRatio: 487 / 451,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1573649481636-f4f97fcba3e0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
                            fit: BoxFit.fill,
                            alignment: FractionalOffset.topCenter)),
                  ),
                ),
              ), const Divider(),
            ],
          )
        ],
      ),
    );
  }
}
