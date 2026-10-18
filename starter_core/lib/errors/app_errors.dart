import 'package:freezed_annotation/freezed_annotation.dart';

import '../constants/enums/error_code_type.dart';
import 'http_error.dart';

part 'app_errors.freezed.dart';

@freezed
class AppErrors with _$AppErrors {
  @Implements<HttpError>()
  const factory AppErrors.connectionError() = ConnectionError;

  @Implements<HttpError>()
  const factory AppErrors.internalServerError({String? message}) =
      InternalServerError;

  @Implements<HttpError>()
  const factory AppErrors.internalServerWithDataError(
    int errorCode, {
    String? message,
    required ErrorCodeType type,
  }) = InternalServerWithDataError;

  const factory AppErrors.accountNotVerifiedError() = AccountNotVerifiedError;

  /// BadRequestError extends HttpError
  @Implements<HttpError>()
  const factory AppErrors.badRequestError({@Default("") String message}) =
      BadRequestError;

  /// CancelError extends BaseError
  const factory AppErrors.cancelError(String? message) = CancelError;

  /// ConflictError extends HttpError
  @Implements<HttpError>()
  const factory AppErrors.conflictError() = ConflictError;

  /// CustomError extends BaseError
  const factory AppErrors.customError({@Default("") String message}) =
      CustomError;

  /// ForbiddenError extends HttpError
  @Implements<HttpError>()
  const factory AppErrors.forbiddenError() = ForbiddenError;

  /// FormatError extends BaseError
  const factory AppErrors.formatError() = FormatError;

  /// LoginRequiredError extends BaseError
  const factory AppErrors.loginRequiredError() = LoginRequiredError;

  /// NetError extends ConnectionError
  @Implements<HttpError>()
  const factory AppErrors.netError() = NetError;

  /// NotFoundError extends HttpError
  @Implements<HttpError>()
  const factory AppErrors.notFoundError(String requestedUrlPath) =
      NotFoundError;

  /// ResponseError extends HttpError
  @Implements<HttpError>()
  const factory AppErrors.responseError() = ResponseError;

  /// ScreenNotImplementedError extends BaseError
  const factory AppErrors.screenNotImplementedError() =
      ScreenNotImplementedError;

  /// SocketError extends ConnectionError
  @Implements<HttpError>()
  const factory AppErrors.socketError() = SocketError;

  /// TimeoutError extends ConnectionError
  @Implements<HttpError>()
  const factory AppErrors.timeoutError() = TimeoutError;

  /// UnauthorizedError extends HttpError
  @Implements<HttpError>()
  const factory AppErrors.unauthorizedError({String? message}) =
      UnauthorizedError;

  /// UnknownError extends ConnectionError
  @Implements<HttpError>()
  const factory AppErrors.unknownError({String? message}) = UnknownError;

  /// GuestError
  const factory AppErrors.guestError() = GuestError;

  /// Server asked the user to pick a branch (HTTP 405).
  /// [branches] holds the raw JSON of the selectable branches.
  @Implements<HttpError>()
  const factory AppErrors.branchNotSelectedError({
    @Default("") String message,
    @Default([]) List<Map<String, dynamic>> branches,
  }) = BranchNotSelectedError;

  /// Validation failure (HTTP 422); [errors] maps field name to messages.
  @Implements<HttpError>()
  const factory AppErrors.unprocessableEntityError({
    @Default({}) Map<String, List<String>> errors,
    @Default("") String message,
  }) = UnprocessableEntityError;

  /// App version is no longer supported by the server (HTTP 423).
  @Implements<HttpError>()
  const factory AppErrors.outdatedVersionError({@Default("") String message}) =
      OutdatedVersionError;

  /// Account suspended (HTTP 430).
  @Implements<HttpError>()
  const factory AppErrors.suspendedAccountError(
      {@Default("") String message}) = SuspendedAccountError;

  /// Account deactivated (HTTP 431).
  @Implements<HttpError>()
  const factory AppErrors.deactivatedAccountError(
      {@Default("") String message}) = DeactivatedAccountError;

  /// Any other app-specific status code carrying its own message.
  @Implements<HttpError>()
  const factory AppErrors.customHttpError(int responseCode, {String? message}) =
      CustomHttpError;

  /// A response could not be (de)serialized into [modelName].
  const factory AppErrors.serializationError({
    required String modelName,
    @Default("") String message,
  }) = SerializationError;
}
