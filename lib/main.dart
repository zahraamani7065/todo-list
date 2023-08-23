// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive_flutter/hive_flutter.dart';


import 'package:todo_list_app/configs/theme_config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo_list_app/features/home/data/local/data.dart';
import 'package:todo_list_app/features/login/widgets/google_sign_in_provider.dart';
import 'features/intro/presentation/screens/introduction_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

const taskBoxName="tasks";
void main() async{
   // WidgetsFlutterBinding.ensureInitialized();
   // await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());

  Hive.registerAdapter(CategoryAdapter());
  await Hive.openBox<Task>(taskBoxName);

  runApp( MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var local=Locale("en");

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      // ChangeNotifierProvider(
      //   create: (BuildContext context) =>GoogleSignInProvider(),
      //   child:
        MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales:AppLocalizations.supportedLocales,
      locale: local,
      title: 'Flutter Demo',
      theme: ThemeConfig().getTheme(),
      home: IntroductionScreen (selectedLang: (Language newSelectedLanByUser){
        setState(() {
          local= newSelectedLanByUser==Language.en ?Locale("en"):Locale("fa");
        });

      },),
    );
    // );
  }
}

