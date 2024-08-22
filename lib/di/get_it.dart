import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:studentmanegement/di/get_it.config.dart';


final getIt = GetIt.instance;

@InjectableInit(asExtension: true, preferRelativeImports: true)
configdependency() async {
  getIt.init();
}
