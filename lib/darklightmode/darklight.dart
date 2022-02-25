import 'package:day1/darklightmode/themeManager.dart';
import 'package:day1/darklightmode/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

ThemeManager _themeManager = ThemeManager();

void mainDarkLight() {
  runApp(MeriApplication());
}

class MeriApplication extends StatefulWidget {
  const MeriApplication({Key key}) : super(key: key);

  @override
  State<MeriApplication> createState() => _MeriApplicationState();
}

class _MeriApplicationState extends State<MeriApplication> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: DarkLight(),
    );
  }
}

class DarkLight extends StatefulWidget {
  const DarkLight({Key key}) : super(key: key);

  @override
  State<DarkLight> createState() => _DarkLightState();
}

class _DarkLightState extends State<DarkLight> {
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? Colors.white : COLOR_PRIMARY,
        title: "DarkLightMode"
            .text
            .color(isDark ? Colors.black : Colors.white)
            .make(),
        actions: [
          Switch(
            value: _themeManager.themeMode == ThemeMode.dark,
            onChanged: (newValue) {
              _themeManager.toggleTheme(newValue);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                "assets/images/items1.png",
                fit: BoxFit.cover,
                width: 120,
                height: 120,
              ),
            ),
            10.heightBox,
            "Ankit Mistry"
                .text
                .textStyle(_textTheme.headline4)
                .color(isDark ? Colors.white : Colors.black)
                .fontWeight(FontWeight.bold)
                .make(),
            10.heightBox,
            "@ankitsayz".text.textStyle(_textTheme.subtitle1).make(),
            10.heightBox,
            "i'm flutter developer".text.make(),
            20.heightBox,
            const TextField(),
            20.heightBox,
            ElevatedButton(child: "Just Click".text.make(), onPressed: () {}),
            20.heightBox,
            ElevatedButton(child: "Click Me".text.make(), onPressed: () {}),
          ],
        ).p(20),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.blue), // For Test
        child: FloatingActionButton(
          backgroundColor: isDark ? Colors.blueGrey : Colors.red,
          child: Icon(
            Icons.add,
            color: isDark ? Colors.white : Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
