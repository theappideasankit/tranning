import 'package:day1/blocpattern/libs/chap-3/logic/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: "Settings".text.bold.make()),
      body: BlocListener<SettingsCubit, SettingsState>(
        listener: (context, state) {
          final notificationSnackBar = SnackBar(
              duration: const Duration(milliseconds: 700),
              content:
                  "App = ${state.appNotification.toString().toUpperCase()} Email = ${state.emailNotification.toString().toUpperCase()}"
                      .text
                      .make());
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(notificationSnackBar);
        },
        child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
          return Column(
            children: [
              SwitchListTile(
                value: state.appNotification,
                onChanged: (newValue) {
                  context.read<SettingsCubit>().toggleAppNotification(newValue);
                },
                title: "App Notification".text.xl.make(),
              ),
              SwitchListTile(
                value: state.emailNotification,
                onChanged: (newValue) {
                  context
                      .read<SettingsCubit>()
                      .toggleEmailNotification(newValue);
                },
                title: "Email Notification".text.xl.make(),
              )
            ],
          );
        }),
      ),
    );
  }
}
