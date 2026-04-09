import 'package:core/errors.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/entities.dart';

abstract interface class AuthRepositories {
  Stream<UserEntity?> get onAuthStateChange;

  Future<Either<Failures, void>> signup({
    required String email,
    required String password,
    required String username,
  });
  Future<Either<Failures, void>> login({
    required String email,
    required String password,
  });
  Future<Either<Failures, void>> logout();
}
