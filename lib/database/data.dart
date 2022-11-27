import 'package:hive/hive.dart';
part '../database/modeldata.dart';

@HiveType(typeId: 1)
class DataModel {

  DataModel({this.username,this.password});

  @HiveField(0)
  String username;

  @HiveField(1)
  String password;

  @override
  String toString() {
    return 'DataModel{username: $username, password: $password}';
  }
}