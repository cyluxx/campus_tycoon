import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Tile extends PositionComponent {
  late TileType _type;

  set type(TileType type) {
    _type = type;
    _setColor();
  }

  final Paint _paint = Paint();

  Tile({required TileType type}) {
    this.type = type;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), _paint);
  }

  _setColor() {
    switch (_type) {
      case TileType.ground:
        _paint.color = Colors.white;
        return;
      case TileType.wall:
        _paint.color = Colors.black;
        return;
    }
  }
}

enum TileType { ground, wall }
