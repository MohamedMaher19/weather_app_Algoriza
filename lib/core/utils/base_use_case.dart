import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failure.dart';

abstract class BaseUseCase<T, Params> {
  Future<Either<Failure, T>> execute( Params params);
}

class NoParams extends Equatable{
  const NoParams();
  @override
  List<Object> get props => [];
}