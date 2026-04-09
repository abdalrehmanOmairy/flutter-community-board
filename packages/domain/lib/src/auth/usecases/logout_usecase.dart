import 'package:core/errors.dart';
import 'package:core/usecase.dart';
import 'package:fpdart/fpdart.dart';
import '../repositories/auth_repositories.dart';

class LogoutUseCase implements UseCases<void, NoParams> {
  LogoutUseCase({required AuthRepositories authRepositories})
    : _authRepositories = authRepositories;

  final AuthRepositories _authRepositories;

  @override
  Future<Either<Failures, void>> call(NoParams params) async {
    return await _authRepositories.logout();
  }
}
