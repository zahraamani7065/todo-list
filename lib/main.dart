import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo_list_app/features/category/data/data_source/category_data.dart';
import 'package:todo_list_app/features/main/domain/entity/data_entity.dart';
import 'package:todo_list_app/features/main/presentation/%20block/task_list_bloc.dart';
import 'package:todo_list_app/features/main/presentation/screens/home_screen.dart';
import 'core/configs/theme_config.dart';
import 'features/intro/presentation/screens/introduction_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'features/main/data/data_source/local/data.dart';
import 'locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


const taskBoxName="tasks";
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
   // WidgetsFlutterBinding.ensureInitialized();
   // await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  // Hive.registerAdapter(CategoryColorAdapter());
  // Hive.registerAdapter(CategoryNameAdapter());
  Hive.registerAdapter(CategoryDataAdapter());
  // Hive.registerAdapter(CategoryIconAdapter());
  await setUp();
  await Hive.openBox<DataEntity>(taskBoxName);

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

