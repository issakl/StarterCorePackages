import 'package:starter_core/errors/app_errors.dart';
import 'package:starter_infra/net/response_validators/response_validator.dart';

class DefaultResponseValidator extends ResponseValidator {
  @override
  void processData(dynamic data) {
    if (!(data['json']['data']["succeed"] ?? false)) {
      error = AppErrors.customError(message: data['json']['data']["message"]);
      errorMessage = data['json']['data']["message"];
    }
  }
}
