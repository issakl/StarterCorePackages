import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:starter_core/errors/app_errors.dart';

class Result<Error extends AppErrors, Data> {
  final Data? data;
  final Error? error;

  /// Whether a value was supplied, even if that value is `null` (e.g. a
  /// `void` response coming from [Result.fromEither]).
  final bool _hasData;

  Result({this.data, this.error})
      : _hasData = data != null,
        assert(data != null || error != null);

  Result._(this.data, this.error, this._hasData);

  /// Bridges a dartz [Either]. A successful `null`/`void` value is still
  /// treated as data.
  factory Result.fromEither(Either<Error, Data> either) => either.fold(
        (error) => Result._(null, error, false),
        (data) => Result._(data, null, true),
      );

  /// checks whether data is available
  bool get hasDataOnly => _hasData && error == null;

  /// checks whether an error is present
  bool get hasErrorOnly => !_hasData && error != null;

  /// checks whether data and error is present
  /// error from network data source and data from cache data source
  bool get hasDataAndError => _hasData && error != null;

  /// returns the error
  factory Result.error(Error error) {
    return Result(
      error: error,
      data: null,
    );
  }

  /// returns just data
  factory Result.data(Data? data) {
    return Result(
      error: null,
      data: data,
    );
  }

  /// returns error and data
  factory Result.dataWithError(Data? data, Error error) {
    return Result(
      error: error,
      data: data,
    );
  }

  /// forwards the error if present else forwards the data
  factory Result.forward(Result _result, Data? data) {
    if (_result.hasErrorOnly) {
      return Result.error(_result.error as Error);
    }

    return Result.data(data);
  }

  /// Cherry pick values
  ///
  /// onError will return error, if present
  /// onNoError will return data if error is not present
  /// onData will return data if data is available
  /// onDataWithError will return data if error is present and data is available
  void pick({
    required Function(Data data) onData,
    required Function(Error error) onError,
    Function(Data data, Error error)? onErrorWithData,
  }) {
    if (hasErrorOnly) {
      onError.call(error!);
    } else if (hasDataOnly) {
      onData.call(data as Data);
    } else {
      onErrorWithData?.call(data as Data, error!);
    }
  }

  /// Same as [pick] but awaits the callbacks, for async handlers.
  Future<void> pickAsync({
    required FutureOr<void> Function(Data data) onData,
    required FutureOr<void> Function(Error error) onError,
    FutureOr<void> Function(Data data, Error error)? onErrorWithData,
  }) async {
    if (hasErrorOnly) {
      await onError(error!);
    } else if (hasDataOnly) {
      await onData(data as Data);
    } else {
      await onErrorWithData?.call(data as Data, error!);
    }
  }
}
