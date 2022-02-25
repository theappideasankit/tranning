import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:day1/blocWithApi/cubit/add_cubit.dart';
import 'package:day1/blocWithApi/cubit/category_cubit.dart';
import 'package:day1/blocWithApi/cubit/edit_cubit.dart';
import 'package:day1/blocWithApi/cubit/popular_list_cubit.dart';
import 'package:day1/blocWithApi/cubit/todos_cubit.dart';
import 'package:day1/blocWithApi/data/network_service.dart';
import 'package:day1/blocWithApi/data/repos.dart';
import 'package:day1/blocpattern/libs/chap-3/logic/cubit/counter_cubit.dart';
import 'package:day1/blocpattern/libs/chap-3/logic/cubit/internet_cubit.dart';
import 'package:day1/blocpattern/libs/chap-3/logic/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocsPro extends StatelessWidget {
  final Widget child;

  final Connectivity connectivity;
  Repository repository;
  TodosCubit todosCubit;

  PopularListCubit popularListCubit;
  CategoryCubit categoryCubit;

  MultiBlocsPro({Key key, this.child, this.connectivity, this.repository})
      : super(key: key) {
    repository = Repository(networkServices: NetworkServices());
    todosCubit = TodosCubit(repository: repository);

    popularListCubit = PopularListCubit(dashBoardRepository: repository);
    categoryCubit = CategoryCubit(dashBoardRepository: repository);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity)),
      BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
      BlocProvider.value(value: todosCubit),
      BlocProvider.value(value: popularListCubit),
      BlocProvider.value(value: categoryCubit),
      BlocProvider<AddCubit>(
          create: (context) =>
              AddCubit(repository: repository, todosCubit: todosCubit)),
      BlocProvider<EditCubit>(
          create: (context) =>
              EditCubit(repository: repository, todosCubit: todosCubit)),
      BlocProvider<SettingsCubit>(
        create: (context) => SettingsCubit(),
        lazy: false,
      ),
    ], child: child);
  }
}
