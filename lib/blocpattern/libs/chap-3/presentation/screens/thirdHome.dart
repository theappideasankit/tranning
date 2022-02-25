import 'package:day1/blocpattern/libs/chap-3/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class ThirdHome extends StatefulWidget {
  const ThirdHome({Key key,}) : super(key: key);
  @override
  _ThirdHomeState createState() => _ThirdHomeState();
}

class _ThirdHomeState extends State<ThirdHome> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("3 pattern"),
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
                "lo = " + state.counterValue.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            } else if (state.counterValue % 2 == 0) {
              return Text(
                "hw = " + state.counterValue.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            } else if (state.counterValue == 5) {
              return Text(
                "you = " + state.counterValue.toString(),
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
          )
        ],
      ),
    );
  }
}
