import 'package:equatable/equatable.dart';

class TicTac extends Equatable {
  TicTac({required this.id, required this.value});
  int id;
  String value;

  @override
  List<Object> get props => [id, value];
}
