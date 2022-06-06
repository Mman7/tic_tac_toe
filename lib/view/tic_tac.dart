import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac/model/tic_tac_model.dart';

import '../tic_tac_provider.dart';

class TicTacBlock extends StatelessWidget {
  TicTacBlock({Key? key, required this.data}) : super(key: key);
  TicTac data;

  // ignore: prefer_if_null_operators
  formateValue(itemValue) => itemValue == 'null' ? '' : itemValue;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<TicTacProvider>().ticTacChange(data: data);
      },
      child: Container(
        decoration: BoxDecoration(border: Border.all(width: 1)),
        child: Center(child: Text('${formateValue(data.value)}')),
      ),
    );
  }
}
