import 'package:admin/models/RecentFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import 'package:admin/screens/files/components/my_fields.dart';

class CompleteFiles extends StatefulWidget {
  const CompleteFiles({
    Key? key,
  }) : super(key: key);

  @override
  _CompleteFilesState createState() => _CompleteFilesState();
}

class _CompleteFilesState extends State<CompleteFiles> {
  bool isGridView = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Recent",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Spacer(),
              SizedBox(
                child: IconButton(
                  icon: isGridView
                      ? Icon(Icons.grid_view)
                      : Icon(Icons.list_outlined),
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      isGridView = !isGridView;
                    });
                  },
                ),
              ),
            ],
          ),
          !isGridView
              ? SizedBox(
                  child: DataTable(
                    columnSpacing: defaultPadding,
                    columns: [
                      DataColumn(
                        label: Text("Name"),
                      ),
                      DataColumn(
                        label: Text("Date Created"),
                      ),
                      DataColumn(
                        label: Text("Size"),
                      ),
                    ],
                    rows: List.generate(
                      demoRecentFiles.length,
                      (index) => recentFileDataRow(demoRecentFiles[index]),
                    ),
                  ),
                )
              : SizedBox(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                MyFiles(),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon!,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.size!)),
    ],
  );
}
