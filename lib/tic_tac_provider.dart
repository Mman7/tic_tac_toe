import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:tic_tac/model/tic_tac_model.dart';

class TicTacProvider extends ChangeNotifier {
  String x = 'X';
  String o = 'O';
  late String currentRound = o;
  List dataList = [
    TicTac(id: 0, value: 'null'),
    TicTac(id: 1, value: 'null'),
    TicTac(id: 2, value: 'null'),
    TicTac(id: 3, value: 'null'),
    TicTac(id: 4, value: 'null'),
    TicTac(id: 5, value: 'null'),
    TicTac(id: 6, value: 'null'),
    TicTac(id: 7, value: 'null'),
    TicTac(id: 8, value: 'null'),
  ];
  TicTacProvider({dataList});

  get getData => dataList;

  changeRound() => currentRound = currentRound == o ? x : o;

  List winPatterns = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  checkLineUp() {
    winPatterns.forEach((element) {
      var a = dataList[element[0]];
      var b = dataList[element[1]];
      var c = dataList[element[2]];
      if (a.value != 'null' && b.value != 'null' && c.value != 'null') {
        if (a.value == b.value && b.value == c.value) {
          // effect / animation show someone wins
          print('Player $currentRound Won');
        }
      }
    });
  }

  ticTacChange({required data}) {
    // if box is fit let them know
    if (data.value != 'null') return;
    dataList[data.id].value = currentRound;
    checkLineUp();
    changeRound();
    notifyListeners();
  }
}
