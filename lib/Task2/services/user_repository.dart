import 'package:day1/Task2/models/user_model.dart';
import 'package:day1/Task2/services/repository.dart';

class UserRepository implements Repository{

  String dataUrl = '';
  @override
  Future<String> deleteUsers(UserModel userModel) {
    // TODO: implement deleteUsers
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getUsersList() {
    // TODO: implement getUsersList
    throw UnimplementedError();
  }

  @override
  Future<String> patchUsers(UserModel userModel) {
    // TODO: implement patchUsers
    throw UnimplementedError();
  }

  @override
  Future<String> postUsers(UserModel userModel) {
    // TODO: implement postUsers
    throw UnimplementedError();
  }

  @override
  Future<String> putUsers(UserModel userModel) {
    // TODO: implement putUsers
    throw UnimplementedError();
  }

}