import 'dart:async';

import 'package:core/errors.dart';
import 'package:domain/auth.dart';
import 'package:fpdart/fpdart.dart';

import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepositories {
  const AuthRepositoryImpl({required AuthRemoteDataSource authDataSource})
    : _authDataSource = authDataSource;

  final AuthRemoteDataSource _authDataSource;
  @override
  Stream<UserEntity?> get onAuthStateChange {
    final controller = StreamController<UserEntity?>();
    final subscription = _authDataSource.onAuthStateChange.listen(
      (userModel) {
        controller.add(userModel);
      },
      onError: ((e) {
        print("Error in onAuthStateChange: $e");
        controller.add(null);
      }),
    );

    controller.onCancel = () {
      subscription.cancel();
    };
    return controller.stream;
  }

  @override
  Future<Either<Failures, void>> signup({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      await _authDataSource.signup(
        email: email,
        password: password,
        username: username,
      );
      return const Right(null);
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure(message: e.message));
    } on NetworkException {
      return const Left(NetworkFailure());
    } on UnknownException catch (e) {
      return Left(UnknownFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failures, void>> login({
    required String email,
    required String password,
  }) async {
    try {
      await _authDataSource.login(email: email, password: password);
      return const Right(null);
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure(message: e.message));
    } on NetworkException {
      return const Left(NetworkFailure());
    } on UnknownException catch (e) {
      return Left(UnknownFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failures, void>> logout() async {
    try {
      await _authDataSource.signOut();

      return const Right(null);
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure(message: e.message));
    } on NetworkException {
      return const Left(NetworkFailure());
    } on UnknownException catch (e) {
      return Left(UnknownFailure(message: e.message));
    }
  }
}
