import 'package:bloc/bloc.dart';
import 'package:core/errors.dart';
import 'package:domain/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/sealed_class_state.dart';

part 'signup_event.dart';
part 'signup_state.dart';

@injectable
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc({required SignupUseCase signupUseCase})
    : _signupUseCase = signupUseCase,
      super(const SignupInitial()) {
    on<SignupRequested>(_signupRequested);
  }
  final SignupUseCase _signupUseCase;

  Future<void> _signupRequested(
    SignupRequested event,
    Emitter<SignupState> emit,
  ) async {
    emit(const SignupLoadInProgress());
    final result = await _signupUseCase(
      SignupParams(
        email: event.email,
        password: event.password,
        username: event.username,
      ),
    );

    result.fold(
      (failure) => emit(SignupFailure(failure: failure)),
      (_) => emit(const SignupSuccess(data: null)),
    );
  }
}
