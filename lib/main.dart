import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:day1/App1/CustomWidgets/custom.dart';
import 'package:day1/App1/core/store.dart';
import 'package:day1/App1/utils/routes.dart';
import 'package:day1/blocWithApi/cubit/todos_cubit.dart';
import 'package:day1/blocWithApi/data/repos.dart';
import 'package:day1/blocWithApi/presentation/routerr/routes.dart';
import 'package:day1/blocpattern/bloc/login_bloc.dart';
import 'package:day1/blocpattern/bloc/register_bloc.dart';
import 'package:day1/blocpattern/libs/chap-3/logic/cubit/internet_cubit.dart';
import 'package:day1/blocpattern/libs/chap-3/logic/cubit/settings_cubit.dart';
import 'package:day1/blocpattern/libs/chap-3/logic/utility/app_bloc_abserver.dart';
import 'package:day1/blocpattern/libs/chap-3/presentation/router/appRouter.dart';
import 'package:day1/multiBlocProvider/multi_bloc_provider.dart';
import 'package:day1/splashscreen.dart';
import 'package:day1/tranning.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'App1/Screens/cartproducts.dart';
import 'App1/Screens/homepage.dart';
import 'App1/Screens/login.dart';
import 'blocpattern/libs/chap-3/logic/cubit/counter_cubit.dart';
import 'introduction.dart';

/*class MyClass extends Equatable {
  final int value;

  MyClass({this.value});
  @override
  // TODO: implement props
  List<Object> get props => [];
}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  BlocObserver observer = AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HydratedBlocOverrides.runZoned(
      () => runApp(
            VxState(
                store: MyStore(),
                child: MyApp(
                  appRouter: AppRoutes(),
                  connectivity: Connectivity(),
                  repository: Repository(),
                )),
          ),
      blocObserver: observer,
      storage: storage);
}

class MyApp extends StatelessWidget {
  final AppRoutes appRouter;
  final Connectivity connectivity;
  final Repository repository;

  MyApp({this.appRouter, this.connectivity, this.repository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginBloc>(create: (context) => LoginBloc()),
        Provider<RegisterBloc>(create: (context) => RegisterBloc())
      ],
      child: MultiBlocsPro(
        repository: repository,
        connectivity: connectivity,
        child: MaterialApp(
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          theme: CustomWidget.lightTheme(context),
          darkTheme: CustomWidget.darkTheme(context),
          initialRoute: MyRoute.Splash,
          onGenerateRoute: appRouter.omGenerateRoute,
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
