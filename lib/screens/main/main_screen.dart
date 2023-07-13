import 'package:admin/screens/files/files_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/side_menu.dart';
import 'package:admin/screens/welcome/welcome_screen.dart';
import 'components/menu_state.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/screens/announcements/announcements_screen.dart';
import 'package:admin/screens/videos/video_screen.dart';

import 'package:admin/responsive.dart';
import 'package:admin/controllers/MenuAppController.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(),
              ),
            Visibility(
              visible: Provider.of<WelcomeState>(context).homeLoaded,
              child: Expanded(
                flex: 5,
                child: WelcomeScreen(),
              ),
            ),
            Visibility(
              visible: Provider.of<DashboardState>(context).dashboardClicked,
              child: Expanded(
                flex: 5,
                child: DashboardScreen(),
              ),
            ),
            Visibility(
              visible:
                  Provider.of<AnnouncementsState>(context).announcementsLoaded,
              child: Expanded(
                flex: 5,
                child: AnnouncementsScreen(),
              ),
            ),
            Visibility(
              visible: Provider.of<FilesState>(context).filesLoaded,
              child: Expanded(
                flex: 5,
                child: FilesScreen(),
              ),
            ),
            Visibility(
              visible: Provider.of<VideoState>(context).videoLoaded,
              child: Expanded(
                flex: 5,
                child: VideoScreen(),
              ),
            ),
            Visibility(
              visible: Provider.of<CurriculumState>(context).curriculumLoaded,
              child: Expanded(
                flex: 5,
                child: WelcomeScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
