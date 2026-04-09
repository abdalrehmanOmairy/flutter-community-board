import 'package:core/errors.dart';
import 'package:core/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import '../repositories/auth_repositories.dart';

class LoginParams extends Equatable {
  LoginParams({required this.email, required this.password});

  final String email;
  final String password;

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}

class LoginUseCase implements UseCases<void, LoginParams> {
  LoginUseCase({required AuthRepositories authRepositories})
    : _authRepositories = authRepositories;

  final AuthRepositories _authRepositories;

  @override
  Future<Either<Failures, void>> call(LoginParams params) async {
    return await _authRepositories.login(
      email: params.email,
      password: params.password,
    );
  }
}
