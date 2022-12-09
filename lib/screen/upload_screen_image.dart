import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UploadImageScreen extends StatefulWidget {
  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  ImagePicker picker = ImagePicker();
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    image = await picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      //update UI
                    });
                  },
                  child: Text("Pick Image")),
              image == null ? Container() : Image.file(File(image!.path)),
              ElevatedButton(
                  onPressed: () async {
                    print("object" + image!.path);
                    File file = File(image!.path);
                    _asyncFileUpload(file);
                  },
                  child: Text("Save")),
            ],
          )),
    );
  }

  _asyncFileUpload(File file) async {
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest(
        "POST", Uri.parse("http://108.61.86.172:8000/child/create-child-info"));
    //add text fields
    request.fields["payload"] = "text";
    request.fields["parent_uid"] = "SzV6qmR7XGVyI8DSv2Zo4QDef8O2";
    request.fields["name"] = "text";
    request.fields["age"] = "text";
    request.fields["allergies"] = "text";
    request.fields["notes"] = "text";
    //create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath("kid_photo", file.path);
    //add multipart to request
    request.files.add(pic);
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
  }
}
