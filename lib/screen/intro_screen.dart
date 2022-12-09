import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/constants.dart';
import 'package:flutter_demo/screen/welcome_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../constants/shared_preference.dart';
import '../widgets/text_widgets.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IntroScreen();
  }
}

class _IntroScreen extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    //this is a page decoration for intro screen
    PageDecoration pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          color: Colors.white), //tile font size, weight and color
      bodyTextStyle: TextStyle(fontSize: 19.0, color: Colors.white),
      //body text size and color
      // descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      //decription padding
      imagePadding: EdgeInsets.all(20), //image padding
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.orange,
            Colors.deepOrangeAccent,
            Colors.green,
            Colors.redAccent,
          ],
        ),
      ), //show linear gradient background of page
    );
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      //main background of screen
      pages: [
        //set your page view here
        buildPageViewModel(pageDecoration, intro_title1, intro_description1,
            "assets/images/logo.png"),
        buildPageViewModel(pageDecoration, intro_title2, intro_description2,
            "assets/images/user_icon.png"),
        buildPageViewModel(pageDecoration, intro_title3, intro_description3,
            "assets/images/bin.png"),
        //add more screen here
      ],
      onDone: () => goLoginPage(context), //go to home page on done
      onSkip: () => goLoginPage(context), // You can override on skip
      showSkipButton: true,
      //skipFlex: 0,
      nextFlex: 0,
      skip: const Text(
        'Skip',
        style: TextStyle(color: color1),
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: color1,
      ),
      done: const Text(
        'Getting Stated',
        style: TextStyle(fontWeight: FontWeight.w600, color: color1),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0), //size of dots
        color: color2, //color of dots
        activeSize: Size(22.0, 10.0),
        activeColor: color1, //color of active dot
        activeShape: RoundedRectangleBorder(
          //shave of active dot
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  PageViewModel buildPageViewModel(PageDecoration pageDecoration, String title,
      String description, String image) {
    return PageViewModel(
      title: "",
      bodyWidget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            introImage(image),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.70,
              child: Text(
                description,
                textAlign: TextAlign.center,
                maxLines: 3,
                style: const TextStyle(
                  color: TEXT_ICON_TAG,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.88,
                child: AppLargeText(
                  text: title,
                  color: TEXT_LABEL,
                )),
          ],
        ),
      ),
      // image: Container(
      //     margin: new EdgeInsets.only(top: 100),
      //     child: introImage(image)),
      // decoration: pageDecoration,
    );
  }

  void goLoginPage(context) {
    Auth.setIsIntroCheck("1");
    // Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context){
    //       return WelcomeScreen();
    //     }
    //     ), (Route<dynamic> route) => false);
    //Navigate to home page and remove the intro screen history
    //so that "Back" button wont work.

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WelcomeScreen();
        },
      ),
    );
  }

  Widget introImage(String assetName) {
    //widget to show intro image
    Size size = MediaQuery.of(context).size;
    return Align(
      child: Image.asset(
        '$assetName',
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.height * 0.30,
      ),
      // child:SvgPicture.asset(
      //   "assets/icons/chat.svg",
      //   height: size.height * 0.45,
      // ),
      alignment: Alignment.center,
    );
  }
}
