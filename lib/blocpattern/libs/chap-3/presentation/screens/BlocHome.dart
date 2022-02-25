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
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener:  (context, state){
        if(state is InternetConnected && state.connectionType == ConnectionType.wifi){
          BlocProvider.of<CounterCubit>(context).increment();
        }
        else if(state is InternetConnected && state.connectionType == ConnectionType.mobile){
          BlocProvider.of<CounterCubit>(context).decrement();
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Bloc pattern"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<InternetCubit, InternetState>(builder: (context, state){
                if(state is InternetConnected && state.connectionType == ConnectionType.wifi){
                  return "wifi".text.xl3.make();
                }
                else if(state is InternetConnected && state.connectionType == ConnectionType.mobile){
                  return "Mobile".text.xl3.make();
                }else if(state is InternetDisconnected){
                  return "Disconnected".text.xl3.make();
                }
                return const Center(child: CircularProgressIndicator());
              }),
              BlocConsumer<CounterCubit, CounterState>(listener: (context, state) {
                if (state.wasIncremented == true) {
                  // ignore: deprecated_member_use
                  Scaffold.of(context).showSnackBar(const SnackBar(
                    content: Text("Incremented"),
                    duration: Duration(milliseconds: 300),
                  ));
                } else if (state.wasIncremented == false) {
                  // ignore: deprecated_member_use
                  Scaffold.of(context).showSnackBar(const SnackBar(
                    content: Text("Decremented"),
                    duration: Duration(milliseconds: 300),
                  ));
                }
                // ignore: missing_return
              }, builder: (BuildContext context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    "Ankit = " + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    "Chauhan = " + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    "Is = " + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    "Flutter developer =" + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              }),
              10.heightBox,
           /*   Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    tooltip: "increment",
                    child: const Icon(Icons.add),
                    heroTag: const Text('Bloc patter'),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    tooltip: "Decrement",
                    child: const Icon(Icons.remove),
                    heroTag: const Text('Bloc patter'),
                  ),
                ],
              ),*/
              10.heightBox,
              CustomButtonW(
                text: "2nd Screen",
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('/second', arguments: blockHomeKey);
                },
              ),

            ],
          ),
        ),

    );
  }
}
