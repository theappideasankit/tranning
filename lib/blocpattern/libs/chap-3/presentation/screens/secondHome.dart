import 'package:day1/blocpattern/libs/chap-3/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../customButton.dart';

class SecondHome extends StatefulWidget {
  const SecondHome({Key key, this.blocHomeKey, this.color}) : super(key: key);
  final GlobalKey<ScaffoldState> blocHomeKey;
  final Color color;

  @override
  _SecondHomeState createState() => _SecondHomeState();
}

class _SecondHomeState extends State<SecondHome> {
  GlobalKey<ScaffoldState> secondScreenKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: secondScreenKey,
      appBar: AppBar(
        title: const Text("2 pattern"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                "hello = " + state.counterValue.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            } else if (state.counterValue % 2 == 0) {
              return Text(
                "how = " + state.counterValue.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            } else if (state.counterValue == 5) {
              return Text(
                "are you = " + state.counterValue.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            } else {
              return Text(
                "Flutter =" + state.counterValue.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            }
          }),
          10.heightBox,
          Row(
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
          ),
          10.heightBox,
          CustomButtonW(
            text: "3nd Screen",
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/third');
            },
          )
        ],
      ),
    );
  }
}
