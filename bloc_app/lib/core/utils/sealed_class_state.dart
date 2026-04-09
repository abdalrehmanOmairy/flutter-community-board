import 'package:equatable/equatable.dart';

sealed class SealedClassState<F, T> extends Equatable {
  const SealedClassState();

  const factory SealedClassState.initial() = SealedClassLoadInitial<F, T>;
  const factory SealedClassState.loadInProgress({T? prevData}) =
      SealedClassLoadInProgress<F, T>;
  const factory SealedClassState.loadSuccess({required T data}) =
      SealedClassLoadSuccess<F, T>;
  const factory SealedClassState.loadFailure({
    required F failure,
    T? prevData,
  }) = SealedClassLoadFailure<F, T>;

  @override
  List<Object?> get props => [];
}

final class SealedClassLoadInitial<F, T> extends SealedClassState<F, T> {
  const SealedClassLoadInitial();

  @override
  String toString() => 'Initial<$F,$T>';
}

final class SealedClassLoadInProgress<F, T> extends SealedClassState<F, T> {
  const SealedClassLoadInProgress({this.prevData});

  final T? prevData;
  @override
  String toString() => 'Loading<$F,$T>(prevData: $prevData)';

  @override
  List<Object?> get props => [prevData];
}

final class SealedClassLoadSuccess<F, T> extends SealedClassState<F, T> {
  const SealedClassLoadSuccess({required this.data});

  final T data;

  @override
  String toString() => 'Success<$F,$T>(data: $data)';

  @override
  List<Object?> get props => [data];
}

final class SealedClassLoadFailure<F, T> extends SealedClassState<F, T> {
  const SealedClassLoadFailure({required this.failure, this.prevData});

  final F failure;
  final T? prevData;

  @override
  String toString() {
    return 'Failure<$F,$T>(failure: $failure, prevData: $prevData)';
  }

  @override
  List<Object?> get props => [failure, prevData];
}

extension SealedClassStateDataUtils<F, T> on SealedClassState<F, T> {
  T? get currentOrPreviousData {
    return switch (this) {
      SealedClassLoadInProgress(prevData: final prev) => prev,
      SealedClassLoadSuccess(data: final data) => data,
      SealedClassLoadFailure(prevData: final prev) => prev,
      _ => null,
    };
  }

  bool get hasData => currentOrPreviousData != null;
}
