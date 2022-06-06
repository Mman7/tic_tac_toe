import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac/tic_tac_provider.dart';
import 'tic_tac.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GameTemplate extends StatefulWidget {
  const GameTemplate({Key? key}) : super(key: key);

  @override
  State<GameTemplate> createState() => _GameTemplateState();
}

class _GameTemplateState extends State<GameTemplate> {
  late List? list;
  String round = 'o';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    list = Provider.of<TicTacProvider>(context).getData;

    return Column(children: [
      Text(
        'The current round is $round',
        style: TextStyle(fontSize: 25.sp),
      ),
      GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        shrinkWrap: true,
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: TicTacBlock(data: list?[index]),
          );
        },
      ),
    ]);
  }
}
