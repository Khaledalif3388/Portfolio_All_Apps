import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
class Certificates extends StatelessWidget {
  const Certificates({Key? key});

  @override
  Widget build(BuildContext context) {
    var myItems = [
      "lib/Assets/images/marks.jpg",
      "lib/Assets/images/rb.jpg",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Certificates"),
        backgroundColor: Colors.teal, // Set the app bar color
      ),
      body: Container(
        color: Colors.black, // Set the background color to black
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles();

                if(result != null) {
                  PlatformFile file = result.files.first;

                  myItems.add(file.path!);

                  setState(() {});
                }
              },
              child: Text("Upload"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: myItems.length,
                itemBuilder: (context, index) {
                  return CertificateImage(imagePath: myItems[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void setState(Null Function() param0) {
}

class CertificateImage extends StatelessWidget {
  final String imagePath;

  const CertificateImage({Key? key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4, // Add elevation for a card-like appearance
        child: Column(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover, // Set the image fit mode
            ),
          ],
        ),
      ),
    );
  }
}
