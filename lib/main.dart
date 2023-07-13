import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'screens/main/components/menu_state.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yazi-Guide Dashboard',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        canvasColor: bgColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuAppController(),
          ),
          ChangeNotifierProvider(
            create: (context) => WelcomeState(),
          ),
          ChangeNotifierProvider(
            create: (context) => DashboardState(),
          ),
          ChangeNotifierProvider(
            create: (context) => AnnouncementsState(),
          ),
          ChangeNotifierProvider(
            create: (context) => FilesState(),
          ),
          ChangeNotifierProvider(
            create: (context) => VideoState(),
          ),
          ChangeNotifierProvider(
            create: (context) => CurriculumState(),
          ),
        ],
        child: MainScreen(),
      ),
    );
  }
}
