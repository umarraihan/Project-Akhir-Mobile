import 'package:project_akhir/database/inisiasi.dart';
import 'package:project_akhir/screen/awal.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_akhir/database/data.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initiateLocalDB();
  SharedPreference().getLoginStatus().then((status) {
    runApp(MaterialApp

      (debugShowCheckedModeBanner:false,
        home: StartScreen()));
  });
  // runApp(const MyApp());
}

void initiateLocalDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>("data");
}