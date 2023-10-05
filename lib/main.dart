import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo_list_app/features/category/data/data_source/category_data.dart';
import 'core/configs/theme_config.dart';
import 'features/intro/presentation/screens/introduction_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'features/main/data/data_source/local/data.dart';
import 'locator.dart';



const taskBoxName="tasks";
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<CategoryData>(CategoryDataAdapter());
  Hive.registerAdapter<Task>(TaskAdapter());

  await Hive.openBox<CategoryData>('CategoryDataAdapter');
  await Hive.openBox<Task>(taskBoxName);
  await setUp();


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
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const[
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales:AppLocalizations.supportedLocales,
            locale: local,
            title: 'Flutter Demo',
            theme: ThemeConfig().getTheme(),
            home:
            // MultiBlocProvider(
            // providers: [
            //   BlocProvider(create:(_)=> locator<TaskListBloc> ()),
            //  ],
            // child:
            IntroductionScreen (selectedLang: (Language newSelectedLanByUser){
              setState(() {
                local= newSelectedLanByUser==Language.en ?Locale("en"):Locale("fa");
              });

            },),
          // )
    );
          // );
        }
}

