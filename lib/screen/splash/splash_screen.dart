// @dart=2.9
import 'package:flutter/material.dart';
import 'package:ruvick_power/utils/constants/route_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);



  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
          Future.delayed(const Duration(milliseconds: 2000), (){
            // Navigator.of(context).pushReplacementNamed('/onboarding');
            Navigator.of(context).pushReplacementNamed(RouteConstant.LOGIN);
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: size.width,
              height: size.height,
              child: Image.asset('assets/images/bg1.jpeg', fit: BoxFit.fill,)),
          Container(
            height: size.height,
            width: size.width,
            color: Colors.black.withOpacity(.85),
          ),
          Positioned(
            left: 5,
            right: 5,
            bottom: size.height * .4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'loginLogo',
                  transitionOnUserGestures: true,
                  child: SizedBox(
                    width: 120,
                    child: Image.asset('assets/images/logo.png', ),
                  ),
                ),
            const SizedBox(height: 10,),
            // SizedBox(
            //   width: 250,
            //   child: Image.asset('assets/logo/logoletter.png', color: Colors.white,),
            // )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
