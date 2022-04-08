import 'dart:math';

import 'package:campus_tycoon/model/tile.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

const boardTileCount = 15;

class Board extends PositionComponent {
  final List<List<Tile>> tiles = [];

  @override
  Future onLoad() async {
    final tileWidth = width / boardTileCount;
    final tileHeight = height / boardTileCount;

    for (int i = 0; i < boardTileCount; i++) {
      for (int j = 0; j < boardTileCount; j++) {
        add(Tile(type: _getRandomTileType())
          ..width = tileWidth
          ..height = tileHeight
          ..x = i * tileWidth
          ..y = j * tileHeight);
      }
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    for (int i = 0; i < tiles.length; i++) {
      for (int j = 0; j < tiles[i].length; j++) {
        tiles[i][j].render(canvas);
      }
    }
  }

  TileType _getRandomTileType() {
    final random = Random().nextInt(2);
    if (random == 0) {
      return TileType.ground;
    }
    return TileType.wall;
  }
}
