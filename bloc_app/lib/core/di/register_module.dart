import 'package:domain/auth.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:data_supabase/auth.dart';
import '../../features/auth/presentation/blocs/authentication/authentication_bloc.dart';
import '../config/router/app_router.dart';

@module
abstract class RegisterModule {
  @singleton
  SupabaseClient get supabaseClient => Supabase.instance.client;
  @singleton
  GoRouter router(AuthenticationBloc authBloc) => createRouter(authBloc);

  @LazySingleton(as: AuthRemoteDataSource)
  SupabaseAuthRemoteDataSource get authRemoteDataSource;

  @LazySingleton(as: AuthRepositories)
  AuthRepositoryImpl get authRepository;

  // --- Domain Layer (UseCases) Registration (Injectable - factory) ---
  // auth
  @injectable
  SignupUseCase get signupUseCase;
  @injectable
  LoginUseCase get loginUseCase;

  @injectable
  LogoutUseCase get logoutUseCase;
}
