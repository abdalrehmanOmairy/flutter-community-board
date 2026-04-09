part of 'login_bloc.dart';

typedef LoginState = SealedClassState<Failures, void>;
typedef LoginInitial = SealedClassLoadInitial<Failures, void>;
typedef LoginLoadInProgress = SealedClassLoadInProgress<Failures, void>;
typedef LoginSuccess = SealedClassLoadSuccess<Failures, void>;
typedef LoginFailure = SealedClassLoadFailure<Failures, void>;
