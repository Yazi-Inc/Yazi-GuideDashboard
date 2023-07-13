import 'package:flutter/material.dart';

class DashboardState extends ChangeNotifier {
  bool _dashboardClicked = false;

  bool get dashboardClicked => _dashboardClicked;

  set dashboardClicked(bool value) {
    _dashboardClicked = value;
    notifyListeners();
  }
}

class WelcomeState extends ChangeNotifier {
  bool _homeLoaded = true;

  bool get homeLoaded => _homeLoaded;

  set homeLoaded(bool value) {
    _homeLoaded = value;
    notifyListeners();
  }
}

class AnnouncementsState extends ChangeNotifier {
  bool _announcementsLoaded = false;

  bool get announcementsLoaded => _announcementsLoaded;

  set announcementsLoaded(bool value) {
    _announcementsLoaded = value;
    notifyListeners();
  }
}

class FilesState extends ChangeNotifier {
  bool _filesLoaded = false;

  bool get filesLoaded => _filesLoaded;

  set filesLoaded(bool value) {
    _filesLoaded = value;
    notifyListeners();
  }
}

class VideoState extends ChangeNotifier {
  bool _videoLoaded = false;

  bool get videoLoaded => _videoLoaded;

  set videoLoaded(bool value) {
    _videoLoaded = value;
    notifyListeners();
  }
}

class CurriculumState extends ChangeNotifier {
  bool _curriculumLoaded = false;

  bool get curriculumLoaded => _curriculumLoaded;

  set curriculumLoaded(bool value) {
    _curriculumLoaded = value;
    notifyListeners();
  }
}
