import 'app_errors.dart';

extension AppErrorsMessage on AppErrors {
  /// Human readable message for any error, with a sensible default for
  /// variants that do not carry one.
  String get message => map(
        connectionError: (_) => 'No connection failure',
        internalServerError: (e) => e.message ?? 'Internal server error',
        internalServerWithDataError: (e) =>
            e.message ?? 'Internal server error',
        accountNotVerifiedError: (_) => 'Account not verified',
        badRequestError: (e) => e.message,
        cancelError: (e) => e.message ?? 'Request has been canceled',
        conflictError: (_) => 'Conflict',
        customError: (e) => e.message,
        forbiddenError: (_) => 'Forbidden',
        formatError: (_) => 'Format error',
        loginRequiredError: (_) => 'Login required',
        netError: (_) => 'No connection failure',
        notFoundError: (_) => '404 Not found',
        responseError: (_) => 'Response error',
        screenNotImplementedError: (_) => 'Screen not implemented',
        socketError: (_) => 'Socket error',
        timeoutError: (_) => 'Timeout failure',
        unauthorizedError: (e) => e.message ?? 'Unauthorized',
        unknownError: (e) => e.message ?? 'Unknown http failure',
        guestError: (_) => 'Guest user',
        branchNotSelectedError: (e) => e.message,
        unprocessableEntityError: (e) =>
            e.message.isNotEmpty ? e.message : e.errors.values.join(', '),
        outdatedVersionError: (e) => e.message,
        suspendedAccountError: (e) => e.message,
        deactivatedAccountError: (e) => e.message,
        customHttpError: (e) => e.message ?? 'Unknown http failure',
        serializationError: (e) => '${e.modelName}: ${e.message}',
      );
}

extension UnprocessableEntityErrorX on UnprocessableEntityError {
  String get formattedErrors =>
      errors.entries.map((e) => '${e.key}: ${e.value.join()}').join();
}
