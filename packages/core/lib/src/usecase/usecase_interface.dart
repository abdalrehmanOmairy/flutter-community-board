import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../errors.dart';

abstract interface class UseCases<ReturnType, ParamsType> {
  Future<Either<Failures, ReturnType>> call(ParamsType params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
