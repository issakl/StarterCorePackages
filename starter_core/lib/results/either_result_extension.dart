import 'package:dartz/dartz.dart';

import '../errors/app_errors.dart';
import 'result.dart';

extension EitherToResult<E extends AppErrors, T> on Either<E, T> {
  /// Converts this [Either] into a [Result] so callers can use `pick`.
  Result<E, T> toResult() => Result.fromEither(this);
}
