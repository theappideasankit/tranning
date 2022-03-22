part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final bool appNotification;
  final bool emailNotification;

  SettingsState(
      {@required this.appNotification, @required this.emailNotification});

  SettingsState copyWith({
    bool appNotification,
    bool emailNotification,
  }) {
    return SettingsState(
        appNotification: appNotification ?? this.appNotification,
        emailNotification: emailNotification ?? this.emailNotification);
  }

  @override
  List<Object> get props => [emailNotification, appNotification];

  Map<String, dynamic> toMap() {
    return {
      'appNotification': appNotification,
      'emailNotification': emailNotification,
    };
  }

  factory SettingsState.fromMap(Map<String, dynamic> map) {
    return SettingsState(
      appNotification: map['appNotification'] as bool,
      emailNotification: map['emailNotification'] as bool,
    );
  }

  @override
  String toString() {
    return 'SettingsState{appNotification: $appNotification, emailNotification: $emailNotification}';
  }
}
