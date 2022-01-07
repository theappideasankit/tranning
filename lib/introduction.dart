import 'package:day1/tranning.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:introduction_screen/introduction_screen.dart';

// ignore: use_key_in_widget_constructors
class IntroductionPage extends StatelessWidget {
  final pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w800),
    bodyTextStyle: TextStyle(fontSize: 19.0),
    //pageColor: Colors.blueGrey,
    imagePadding: EdgeInsets.zero,
  );

  Widget _buildImage(String assetImage) {
    return Align(
      child: Image.asset(
        assetImage,
        width: double.infinity,
      ),
      alignment: Alignment.topCenter,
    );
  }

  void _onIntroEnd(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) =>  Tranning()));
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: "Flutter Tranning",
            body: "Flutter Tranning on TheAppIdeas PVt LTD Company",
            image: _buildImage("assets/images/one.png"),
            decoration: pageDecoration),
        PageViewModel(
            title: "LeaningF",
            body: "Something i Learn Flutter this company ",
            image: _buildImage("assets/images/two.png"),
            decoration: pageDecoration),
        PageViewModel(
            title: "Beginner",
            body: "My Internship strating 3rd january",
            image: _buildImage("assets/images/three.png"),
            decoration: pageDecoration),
      ],
      color: Colors.blueGrey,
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: true,
      skip: "skip".text.bold.xl.color(context.accentColor).make(),
      next: const Icon(Icons.arrow_forward_ios),
      done: "Done".text.bold.xl.color(context.accentColor).make(),
    );
  }
}
