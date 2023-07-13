import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';

import '../../../constants.dart';

class AnnouncementList extends StatelessWidget {
  const AnnouncementList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _fetchAnnouncements(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Map<String, dynamic>> announcements = snapshot.data ?? [];

          return Container(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: announcements.map((announcement) {
                DateTime date = (announcement['date'] as Timestamp).toDate();
                String formattedDate = DateFormat('dd MMMM yyyy').format(date);

                String subTitle = announcement['subTitle'] ?? '';

                return Card(
                  color: Colors.white,
                  shape: Border(bottom: BorderSide(width: 0.15)),
                  elevation: 0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        announcement['title'] ?? '',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8),
                                      ),
                                      Icon(
                                        Icons.circle,
                                        color: Colors.red,
                                        size: 10,
                                      ),
                                      Spacer(),
                                      Text(
                                        formattedDate,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(height: 10),
                                  ExpandableText(
                                    subTitle,
                                    trim: 1,
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    readMoreText: 'Show More',
                                    readLessText: 'Show Less',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }

  Future<List<Map<String, dynamic>>> _fetchAnnouncements() async {
    String parentCollection = 'guide_resources';
    String parentDocument = 'CVXWgvl4GZprqt07N1yW';
    String subcollection = 'announcement';

    CollectionReference<Map<String, dynamic>> subcollectionRef =
        FirebaseFirestore.instance
            .collection(parentCollection)
            .doc(parentDocument)
            .collection(subcollection);

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await subcollectionRef.orderBy('date', descending: true).get();

    List<Map<String, dynamic>> announcements = [];
    snapshot.docs.forEach((DocumentSnapshot<Map<String, dynamic>> doc) {
      Map<String, dynamic>? data = doc.data();

      announcements.add(data!);
    });

    return announcements;
  }
}
