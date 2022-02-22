import 'package:flutter/material.dart';


class OnboardingItem extends StatefulWidget {
  final String image, title, subTitle;
  final PageController pageController;

  const OnboardingItem(
      this.image, this.title, this.subTitle, this.pageController);

  @override
  _OnboardingItemState createState() => _OnboardingItemState();
}

class _OnboardingItemState extends State<OnboardingItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: size.height * .15,
              ),
              Container(
                // decoration: BoxDecoration(
                //     color: Color(0xffEFF0F6),
                //     borderRadius: BorderRadius.circular(20)
                // ),

                child: Image(
                  image: AssetImage("assets/images/onboard" + widget.image),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: size.width * 0.9,
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFFEF7E1F),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: size.width * 0.9,
                  child: Text(
                    widget.subTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFFA3A09D),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ]),
      ),
    );
  }
}