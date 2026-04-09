import 'package:core/errors.dart';
import 'package:core/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/auth_repositories.dart';

class SignupParams extends Equatable {
  const SignupParams({
    required this.email,
    required this.password,
    required this.username,
  });

  final String email;
  final String password;
  final String username;

  @override
  List<Object?> get props => throw UnimplementedError();
}

class SignupUseCase implements UseCases<void, SignupParams> {
  SignupUseCase({required AuthRepositories authRepositories})
    : _authRepositories = authRepositories;

  final AuthRepositories _authRepositories;

  @override
  Future<Either<Failures, void>> call(SignupParams params) async {
    return await _authRepositories.signup(
      email: params.email,
      password: params.password,
      username: params.username,
    );
  }
}
