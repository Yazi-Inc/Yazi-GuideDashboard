import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'menu_state.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _customTileExpanded;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          const ListTile(
            title: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 0, top: 20),
                child: Text(
                  'FILES',
                  style: TextStyle(
                    color: Color.fromARGB(255, 149, 149, 149),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {
              Provider.of<DashboardState>(context, listen: false)
                  .dashboardClicked = true;
              Provider.of<WelcomeState>(context, listen: false).homeLoaded =
                  false;
              Provider.of<AnnouncementsState>(context, listen: false)
                  .announcementsLoaded = false;
              Provider.of<FilesState>(context, listen: false).filesLoaded =
                  false;
              Provider.of<VideoState>(context, listen: false).videoLoaded =
                  false;
              Provider.of<CurriculumState>(context, listen: false)
                  .curriculumLoaded = false;
            },
            isActive: Provider.of<DashboardState>(context).dashboardClicked,
          ),
          DrawerListTile(
            title: "Announcements",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {
              Provider.of<DashboardState>(context, listen: false)
                  .dashboardClicked = false;
              Provider.of<WelcomeState>(context, listen: false).homeLoaded =
                  false;
              Provider.of<AnnouncementsState>(context, listen: false)
                  .announcementsLoaded = true;
              Provider.of<FilesState>(context, listen: false).filesLoaded =
                  false;
              Provider.of<VideoState>(context, listen: false).videoLoaded =
                  false;
              Provider.of<CurriculumState>(context, listen: false)
                  .curriculumLoaded = false;
            },
            isActive:
                Provider.of<AnnouncementsState>(context).announcementsLoaded,
          ),
          DrawerListTile(
            title: "Files",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              Provider.of<DashboardState>(context, listen: false)
                  .dashboardClicked = false;
              Provider.of<WelcomeState>(context, listen: false).homeLoaded =
                  false;
              Provider.of<AnnouncementsState>(context, listen: false)
                  .announcementsLoaded = false;
              Provider.of<FilesState>(context, listen: false).filesLoaded =
                  true;
              Provider.of<VideoState>(context, listen: false).videoLoaded =
                  false;
              Provider.of<CurriculumState>(context, listen: false)
                  .curriculumLoaded = false;
            },
            isActive: Provider.of<FilesState>(context).filesLoaded,
          ),
          ExpansionTile(
            title: Text(
              "Curriculums",
              style: TextStyle(
                color: Provider.of<CurriculumState>(context).curriculumLoaded
                    ? secondaryColor
                    : Colors.black,
                fontWeight:
                    Provider.of<CurriculumState>(context).curriculumLoaded
                        ? FontWeight.bold
                        : FontWeight.normal,
              ),
            ),
            leading: SvgPicture.asset(
              "assets/icons/menu_doc.svg",
              // ignore: deprecated_member_use
              color: Provider.of<CurriculumState>(context).curriculumLoaded
                  ? secondaryColor
                  : Colors.black,
              height: 16,
            ),
            children: const <Widget>[
              ListTile(title: Text('This is tile number 1')),
              ListTile(title: Text('This is tile number 2')),
              ListTile(title: Text('This is tile number 3')),
              ListTile(title: Text('This is tile number 4')),
            ],
            onExpansionChanged: (isExpanded) {
              Provider.of<CurriculumState>(context, listen: false)
                  .curriculumLoaded = isExpanded;
              Provider.of<VideoState>(context, listen: false).videoLoaded =
                  false;
              Provider.of<DashboardState>(context, listen: false)
                  .dashboardClicked = false;
              Provider.of<WelcomeState>(context, listen: false).homeLoaded =
                  false;
              Provider.of<AnnouncementsState>(context, listen: false)
                  .announcementsLoaded = false;
              Provider.of<FilesState>(context, listen: false).filesLoaded =
                  false;
            },
          ),
          DrawerListTile(
            title: "Videos",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              Provider.of<VideoState>(context, listen: false).videoLoaded =
                  true;
              Provider.of<DashboardState>(context, listen: false)
                  .dashboardClicked = false;
              Provider.of<WelcomeState>(context, listen: false).homeLoaded =
                  false;
              Provider.of<AnnouncementsState>(context, listen: false)
                  .announcementsLoaded = false;
              Provider.of<FilesState>(context, listen: false).filesLoaded =
                  false;
              Provider.of<CurriculumState>(context, listen: false)
                  .curriculumLoaded = false;
            },
            isActive: Provider.of<VideoState>(context).videoLoaded,
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.isActive,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: isActive ? secondaryColor : Colors.black,
      tileColor: isActive ? Color.fromARGB(85, 35, 138, 234) : null,
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? secondaryColor : Colors.black,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
