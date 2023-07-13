import 'package:admin/models/RecentFile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:network_image/network_image.dart';

class FileInfoCard extends StatelessWidget {
  const FileInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final RecentFile info;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _fetchImages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Map<String, dynamic>> images = snapshot.data ?? [];
          return Container(
            padding: EdgeInsets.all(2),
            child: Column(
              children: images.map((image) {
                return TransparentImageCard(
                  width: 200,
                  imageProvider: NetworkImage(image['imageUrl']),
                  title: Text(
                    image['title'] ?? '',
                    style: TextStyle(color: Colors.white),
                  ),
                  // Add the remaining properties of TransparentImageCard as needed
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }

  Future<List<Map<String, dynamic>>> _fetchImages() async {
    String parentCollection = 'guide_resources';
    String parentDocument = 'CVXWgvl4GZprqt07N1yW';
    String subcollection = 'images';

    CollectionReference<Map<String, dynamic>> subcollectionRef =
        FirebaseFirestore.instance
            .collection(parentCollection)
            .doc(parentDocument)
            .collection(subcollection);

    QuerySnapshot<Map<String, dynamic>> snapshot = await subcollectionRef.get();

    List<Map<String, dynamic>> images = [];
    snapshot.docs.forEach((DocumentSnapshot<Map<String, dynamic>> doc) {
      Map<String, dynamic>? data = doc.data();

      images.add(data!);
    });

    return images;
  }
}
