import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:day1/App1/CustomWidgets/custom.dart';
import 'package:day1/App1/core/store.dart';
import 'package:day1/App1/utils/routes.dart';
import 'package:day1/blocpattern/bloc/login_bloc.dart';
import 'package:day1/blocpattern/bloc/register_bloc.dart';
import 'package:day1/blocpattern/libs/chap-3/logic/cubit/internet_cubit.dart';
import 'package:day1/blocpattern/libs/chap-3/presentation/router/appRouter.dart';
import 'package:day1/splashscreen.dart';
import 'package:day1/tranning.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'App1/Screens/cartproducts.dart';
import 'App1/Screens/homepage.dart';
import 'App1/Screens/login.dart';
import 'blocpattern/libs/chap-3/logic/cubit/counter_cubit.dart';
import 'introduction.dart';

void main() async {
  final CounterState counterState1 = CounterState(counterValue: 1);
  final CounterState counterState2 = CounterState(counterValue: 1);
  print(counterState1 == counterState2);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(VxState(store: MyStore(), child:  MyApp(appRouter: AppRouter(), connectivity: Connectivity(),)));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

   MyApp({this.appRouter, this.connectivity});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        Provider<LoginBloc>(create: (context) => LoginBloc()),
        Provider<RegisterBloc>(create: (context) => RegisterBloc())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<InternetCubit>(create: (context) => InternetCubit(connectivity: connectivity)),
          BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
        ],
        child: MaterialApp(
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          theme: CustomWidget.lightTheme(context),
          darkTheme: CustomWidget.darkTheme(context),
          initialRoute: MyRoute.Splash,
          onGenerateRoute: appRouter.onGenerateRoute,
          routes: {
            MyRoute.HomeRoute: (context) => const HomePage(),
            MyRoute.LoginRoute: (context) => const LoginScreen(),
            MyRoute.CartRoute: (context) => const CartProducts(),
            MyRoute.TranningApps: (context) => Tranning(),
            MyRoute.Splash: (context) => const SplashScreen(),
            MyRoute.IntroScrenn: (context) => IntroductionPage()
          },
        ),
      ),
    );
  }
}
