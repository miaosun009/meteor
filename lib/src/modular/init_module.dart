import '../../meteor.dart';
import 'meteor_base.dart';

class InitModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton<MeteorNavigator>((i) => MeteorNavigatorImpl()),
    Bind.lazySingleton<MeteorBase>((i) => MeteorBaseImpl(i())),
  ];
}