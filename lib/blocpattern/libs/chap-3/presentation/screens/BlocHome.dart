import 'package:day1/blocpattern/libs/chap-3/constants/enums.dart';
import 'package:day1/blocpattern/libs/chap-3/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../customButton.dart';
import '../../logic/cubit/counter_cubit.dart';

class BlocHome extends StatefulWidget {
  const BlocHome({Key key}) : super(key: key);

  @override
  State<BlocHome> createState() => _BlocHomeState();
}

class _BlocHomeState extends State<BlocHome> {
  GlobalKey<ScaffoldState> blockHomeKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext blocHomeContext) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (internetCubitContext, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.wifi) {
          BlocProvider.of<CounterCubit>(internetCubitContext).increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.mobile) {
          BlocProvider.of<CounterCubit>(internetCubitContext).decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bloc pattern"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<InternetCubit, InternetState>(
                builder: (internetCubitBuilderContext, state) {
              if (state is InternetConnected &&
                  state.connectionType == ConnectionType.wifi) {
                return "wifi".text.xl3.make();
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.mobile) {
                return "Mobile".text.xl3.make();
              } else if (state is InternetDisconnected) {
                return "Disconnected".text.xl3.make();
              }
              return const Center(child: CircularProgressIndicator());
            }),
            BlocConsumer<CounterCubit, CounterState>(
                listener: (counterCubitListenerContext, state) {
              if (state.wasIncremented == true) {
                // ignore: deprecated_member_use
                Scaffold.of(counterCubitListenerContext)
                    // ignore: deprecated_member_use
                    .showSnackBar(const SnackBar(
                  content: Text("Incremented"),
                  duration: Duration(milliseconds: 300),
                ));
              } else if (state.wasIncremented == false) {
                // ignore: deprecated_member_use
                Scaffold.of(counterCubitListenerContext)
                    // ignore: deprecated_member_use
                    .showSnackBar(const SnackBar(
                  content: Text("Decremented"),
                  duration: Duration(milliseconds: 300),
                ));
              }
              // ignore: missing_return
            }, builder: (BuildContext counterCubitBuilderContext, state) {
              if (state.counterValue < 0) {
                return Text(
                  "Ankit = " + state.counterValue.toString(),
                  style:
                      Theme.of(counterCubitBuilderContext).textTheme.headline4,
                );
              } else if (state.counterValue % 2 == 0) {
                return Text(
                  "Chauhan = " + state.counterValue.toString(),
                  style:
                      Theme.of(counterCubitBuilderContext).textTheme.headline4,
                );
              } else if (state.counterValue == 5) {
                return Text(
                  "Is = " + state.counterValue.toString(),
                  style:
                      Theme.of(counterCubitBuilderContext).textTheme.headline4,
                );
              } else {
                return Text(
                  "Flutter developer =" + state.counterValue.toString(),
                  style:
                      Theme.of(counterCubitBuilderContext).textTheme.headline4,
                );
              }
            }),
            10.heightBox,
            Builder(builder: (context) {
              final counterState = context.watch<CounterCubit>().state;
              final internetState = context.watch<InternetCubit>().state;

              if (internetState is InternetConnected &&
                  internetState.connectionType == ConnectionType.mobile) {
                return "Counter: ${counterState.counterValue.toString()} Internet: Mobile"
                    .text
                    .xl
                    .make();
              } else if (internetState is InternetConnected &&
                  internetState.connectionType == ConnectionType.wifi) {
                return "Counter: ${counterState.counterValue.toString()} Internet: Wifi"
                    .text
                    .xl
                    .make();
              } else {
                return "Counter: ${counterState.counterValue.toString()} Internet: Disconnected"
                    .text
                    .xl
                    .make();
              }
            }),
            10.heightBox,
            Builder(builder: (context) {
              final counterValue = context
                  .select((CounterCubit cubit) => cubit.state.counterValue);
              return "Counter: ${counterValue.toString()}".text.xl.make();
            }),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    //BlocProvider.of<CounterCubit>(context).increment();
                    context.read<CounterCubit>().increment();
                  },
                  tooltip: "increment",
                  child: const Icon(Icons.add),
                  heroTag: const Text('Bloc patter'),
                ),
                FloatingActionButton(
                  onPressed: () {
                    // BlocProvider.of<CounterCubit>(context).decrement();
                    context.read<CounterCubit>().decrement();
                  },
                  tooltip: "Decrement",
                  child: const Icon(Icons.remove),
                  heroTag: const Text('Bloc patter'),
                ),
              ],
            ),
            20.heightBox,
            CustomButtonW(
              text: "2nd Screen",
              onTap: () {
                Navigator.of(blocHomeContext)
                    .pushNamed('/second', arguments: blockHomeKey);
              },
            ), 20.heightBox,
            CustomButtonW(
              text: "Settings",
              onTap: () {
                Navigator.of(blocHomeContext)
                    .pushNamed('/settings', arguments: blockHomeKey);
              },
            ),
          ],
        ),
      ),
    );
  }
}
