import 'package:day1/Task2/models/user_model.dart';

abstract class Repository{

  Future<List<UserModel>> getUsersList();
  Future<String> patchUsers(UserModel userModel);
  Future<String> putUsers(UserModel userModel);
  Future<String> deleteUsers(UserModel userModel);
  Future<String> postUsers(UserModel userModel);





}