// @dart=2.9
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter_page_transition/page_transition_type.dart';
import 'screen/home/main_dashboard_screen.dart';
import 'screen/login/main_login_screen.dart';
import 'screen/onboarding/main_onboarding_screen.dart';
import 'screen/signup/sign_up_main.dart';
import 'screen/splash/splash_screen.dart';
import 'utils/constants/route_constant.dart';


final GlobalKey<NavigatorState> navigatorKey =
GlobalKey(debugLabel: "Main Navigator");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp( MyApp(savedThemeMode: savedThemeMode,));
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  final AdaptiveThemeMode savedThemeMode;
  const MyApp({Key key, this.savedThemeMode}) : super(key: key);


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageTransitionType pageTransitionType = PageTransitionType.rippleLeftDown;
  var duration = 400;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            cursorColor: Colors.green,
            // canvasColor: Colors.green,
            fontFamily: 'Inter',
            // primarySwatch: Colors.black,
            inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(color: Color(0xffA0A3BD)),
              hintStyle: TextStyle(color: Colors.grey),
            ),
            primaryTextTheme: const TextTheme(headline1: TextStyle(color: Color(0xFF333333))),
            primaryColor: Colors.white,
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Color(0xFF333333),
              // selectionColor: darkPrimarySwatchColor,
            ),
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
//            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            })),
        title: 'Gym Permit',
        // Start the app with the "/" named route. In this case, the app starts
        // on the Walkthrough1 widget.
        initialRoute: RouteConstant.ROOT,
        onGenerateRoute: (RouteSettings routeSettings) {
          return PageRouteBuilder<dynamic>(
              settings: routeSettings,
              // maintainState: false,
              pageBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                switch (routeSettings.name) {
                  case RouteConstant.DASHBOARD:
                    duration = 400;
                    pageTransitionType =
                        PageTransitionType.rippleLeftDown;
                    return const MainDashboardScreen();

                  case RouteConstant.LOGIN:
                    duration = 400;
                    pageTransitionType =
                        PageTransitionType.rippleLeftDown;
                    return  MainLoginScreen();


                  case RouteConstant.ROOT:
                    duration = 400;
                    pageTransitionType =
                        PageTransitionType.rippleLeftDown;
                    return  const SplashScreen();


                  case RouteConstant.ONBOARDING:
                    duration = 400;
                    pageTransitionType =
                        PageTransitionType.rippleRightUp;
                    return  const MainOnboardingScreen();

                  case RouteConstant.SIGN_UP:
                    duration = 200;
                    pageTransitionType =
                        PageTransitionType.slideParallaxLeft;
                    return const MainSignUpScreen();


                  default:
                    duration = 400;
                    pageTransitionType =
                        PageTransitionType.rippleLeftDown;
                    return const SplashScreen();
                }
              },
              transitionDuration: Duration(milliseconds: duration),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                return effectMap[pageTransitionType](
                    Curves.linear, animation, secondaryAnimation, child);
              });
        });
  }
}

