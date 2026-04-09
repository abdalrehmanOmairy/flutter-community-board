part of 'signup_bloc.dart';

typedef SignupState = SealedClassState<Failures, void>;
typedef SignupInitial = SealedClassLoadInitial<Failures, void>;
typedef SignupLoadInProgress = SealedClassLoadInProgress<Failures, void>;
typedef SignupSuccess = SealedClassLoadSuccess<Failures, void>;
typedef SignupFailure = SealedClassLoadFailure<Failures, void>;
