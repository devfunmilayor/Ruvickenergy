// @dart=2.9
import 'package:flutter/material.dart';
import 'components/onboarding_item_info.dart';

class MainOnboardingScreen extends StatefulWidget {
  const MainOnboardingScreen({Key key}) : super(key: key);

  @override
  _MainOnboardingScreenState createState() => _MainOnboardingScreenState();
}

class _MainOnboardingScreenState extends State<MainOnboardingScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> _progressAnimation;
  AnimationController _progressAnimcontroller;
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  PageController pageController = PageController(initialPage: 0);
  int _current = 0;

  var isPreviousVisible = true;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    _progressAnimcontroller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    _progressAnimation =
        Tween<double>(begin: 0, end: 0).animate(_progressAnimcontroller);

    _setProgressAnim(414, 1);
  }

  double growStepWidth, beginWidth, endWidth = 0.0;
  int totalPages = 3;

  _setProgressAnim(double maxWidth, int curPageIndex) {
    print('$maxWidth');
    setState(() {
      growStepWidth = maxWidth / totalPages;
      beginWidth = growStepWidth * (curPageIndex - 1);
      endWidth = growStepWidth * curPageIndex;

      beginWidth = beginWidth / 360.0 * 1;
      endWidth = endWidth / 360 * 1;
      print('$beginWidth $endWidth');

      _progressAnimation = Tween<double>(begin: beginWidth, end: endWidth)
          .animate(_progressAnimcontroller);
    });

    _progressAnimcontroller.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var maxWidth = size.width;
    _current < 1
        ? setState(() {
            isPreviousVisible = false;
          })
        : setState(() {
            isPreviousVisible = true;
          });

    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          PageView(
            physics: BouncingScrollPhysics(),
            onPageChanged: (i) {
              onChangedFunction(i);
              _progressAnimcontroller.reset();
              _setProgressAnim(maxWidth, i + 1);
            },
            controller: pageController,
            children: <Widget>[
              Container(
                child: OnboardingItem(
                    "1.png",
                    "Quick & Easy Search",
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero, condimentum ante diam etiam cursus lacus arcu.",
                    pageController),
              ),
              Container(
                child: OnboardingItem(
                    "2.png",
                    "Scan QR Code To Checkin",
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero, condimentum ante diam etiam cursus lacus arcu.",
                    pageController),
              ),
              Container(
                child: OnboardingItem(
                    "3.png",
                    "Keep Track of all activities",
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero, condimentum ante diam etiam cursus lacus arcu.",
                    pageController),
              ),
            ],
          ),
          Positioned(
            top: 15,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextButton(
                  onPressed: () => skipFunction(),
                  child: Text(
                    "Skip",
                    style: TextStyle(color: Color(0xFFEF7E1F)),
                  )),
            ),
          ),
          Positioned(
            bottom: 25,
            right: 10,
            left: 10,
            child: AnimatedProgressBar(
              animation: _progressAnimation,
              onTapAction: (){
                nextFunction();
              },
            ),
          ),
          // Positioned(
          //   bottom: 32,
          //   left: 10,
          //   right: 28,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //     child: Container(
          //       child: Row(
          //         mainAxisSize: MainAxisSize.max,
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: <Widget>[
          //           Visibility(
          //             child: InkWell(
          //                 onTap: () => previousFunction(),
          //                 child: Text("Previous")),
          //             visible: isPreviousVisible,
          //           ),
          //           InkWell(
          //               onTap: () => nextFunction(),
          //               child: Icon(Icons.arrow_forward)),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    ));
  }

  onChangedFunction(int index) {
    setState(() {
      _current = index;
    });
  }

  nextFunction() {
    if (_current < 2) {
      pageController.nextPage(duration: _kDuration, curve: _kCurve);
    } else {
      // Navigator.pushNamed(context, '/signup');
    }
  }

  previousFunction() {
    pageController.previousPage(duration: _kDuration, curve: _kCurve);
  }

  skipFunction() {
//		pageController.jumpToPage(2);
//     Navigator.pushNamed(context, '/signup');
  }
}

class AnimatedProgressBar extends AnimatedWidget {
  final Function onTapAction;
  AnimatedProgressBar({Key key, Animation<double> animation, this.onTapAction})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return Center(
      child: GestureDetector(
        onTap: onTapAction,
        child: Stack(
          children: [
            RotatedBox(
              quarterTurns: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,

                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(-2.0, -2.0),
                      blurRadius: 5.0,
                      spreadRadius: 10.0,
                      color: Color(0xFFEF7E1F).withOpacity(0.1),
                    )
                  ],
                ),
                width: 90,
                height: 90,
                child: CircularProgressIndicator(
                  strokeWidth: 5.0,
                  value: animation.value,
                  backgroundColor: Color(0xFFEF7E1F).withOpacity(.1),
                  valueColor: AlwaysStoppedAnimation(Color(0xFFEF7E1F)),
                ),
              ),
            ),
            Positioned(
              left: 5,
              right: 5,
              top: 5,
              bottom: 5,
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color(0xFFEF7E1F),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
