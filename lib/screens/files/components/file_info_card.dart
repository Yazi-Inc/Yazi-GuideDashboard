import 'package:admin/models/RecentFile.dart';
import 'package:flutter/material.dart';

class FileInfoCard extends StatelessWidget {
  const FileInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final RecentFile info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 111,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(info.thumbnail!.toString()),
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Spacer(),
              Text(
                info.title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              Text(
                info.size!,
                maxLines: 1,
                // overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
