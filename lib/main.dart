import 'package:campus_tycoon/model/board.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();

  Flame.device.fullScreen();
  Flame.device.setOrientation(DeviceOrientation.portraitUp);

  runApp(GameWidget(game: CampusTycoon()));
}

class CampusTycoon extends FlameGame {
  @override
  Future onLoad() async {
    await super.onLoad();

    add(
      Board()
        ..position = size / 2
        ..width = size.x
        ..height = size.y
        ..anchor = Anchor.center,
    );
  }
}
