import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddPost extends StatefulWidget {
  AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final captionController = TextEditingController();
  // image functionality
  File? _image;

  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> openImagePickerGallery() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.cancel_rounded)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("POST", style: TextStyle(fontSize: 11)),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              controller: captionController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                // border: OutlineInputBorder(
                //     borderRadius: BorderRadius.all(Radius.circular(25.0))),
                hintText: "Add caption",
              ),
            ),
          ),
          // image container
          Container(
            height: size.height * 0.35,
            // width: 80,
            margin: EdgeInsets.only(
              left: size.height * 0.1,
              right: size.height * 0.1,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: _image != null
                ? Image.file(_image!, fit: BoxFit.cover)
                : const SizedBox(),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            height: 2,
            width: 80,
            decoration: const BoxDecoration(color: Colors.black12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    openImagePickerGallery();
                  },
                  icon: const Icon(Icons.add_a_photo_rounded))
            ],
          )
        ],
      ),
    );
  }
}
