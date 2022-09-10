import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable{
  final String code;
  final String message;

  const ErrorMessageModel({required this.code, required this.message});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      code: json['cod'],
      message: json['message'],
    );
  }

  @override
  List<Object> get props => [code, message];
}