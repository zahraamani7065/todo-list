import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/features/home/presentation/screens/home_screen.dart';
import 'package:todo_list_app/features/login/widgets/google_sign_in_provider.dart';
import '../../intro/presentation/screens/introduction_screen.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final themeColor = Theme.of(context);
    final localization = AppLocalizations.of(context);
    return SafeArea(
        child: Scaffold(
          backgroundColor: themeColor.backgroundColor,
      appBar: AppBar(
        leading:
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return IntroductionScreen(
                  selectedLang: (Language language) {},
                );
              })); // Navigate back
            },
          ),

      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
                 return HomeScreen();

            }));
            // final provider=Provider.of<GoogleSignInProvider>(context,listen:false );
            // provider.googleSignIn;
          },
          label: Text(localization!.signUpWithGoogle),
          style: ElevatedButton.styleFrom(
              primary: themeColor.colorScheme.onPrimary,
              onPrimary: themeColor.colorScheme.surface,
              minimumSize: Size(width / 2, 50)),
          icon: const FaIcon(
            FontAwesomeIcons.google,
            color: Colors.red,
          ),
        ),
      ),
    ));
  }
}
