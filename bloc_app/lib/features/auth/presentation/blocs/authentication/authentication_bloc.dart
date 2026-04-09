import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:core/usecase.dart';
import 'package:domain/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

@singleton
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthRepositories authRepositories,
    required LogoutUseCase logoutUseCase,
  }) : _authRepositories = authRepositories,
       _logoutUseCase = logoutUseCase,
       super(const AuthenticationState.unknown()) {
    _authSubscription = _authRepositories.onAuthStateChange.listen((user) {
      add(_AuthenticationStatusChanged(user));
    });

    on<_AuthenticationStatusChanged>(_onAuthenticationEvent);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
  }
  final AuthRepositories _authRepositories;
  final LogoutUseCase _logoutUseCase;
  StreamSubscription? _authSubscription;

  void _onAuthenticationEvent(
    _AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) {
    if (event.user != null) {
      emit(AuthenticationState.authenticated(event.user!));
    } else {
      emit(const AuthenticationState.unauthenticated());
    }
  }

  Future<void> _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    await _logoutUseCase(const NoParams());
  }

  @disposeMethod
  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
