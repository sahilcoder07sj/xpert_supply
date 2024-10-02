import 'package:get_storage/get_storage.dart';
import 'package:tbd_flutter/app/api_repository/loading.dart';
import 'package:tbd_flutter/my_app.dart';
import 'app/data/all.dart';

Future<void> main() async {
  await GetStorage.init();
  Loading.configLoading();
  runApp(MyApp());
}
/// 9r8bgg1631x