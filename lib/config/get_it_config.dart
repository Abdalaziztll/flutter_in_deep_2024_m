import 'package:get_it/get_it.dart';
import 'package:inrto_to_statemanagement/service/cat_service.dart';

GetIt core = GetIt.instance;

init() {
  core.registerSingleton(CatServiceImp());
}
