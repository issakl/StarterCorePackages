import 'package:starter_core/errors/app_errors.dart';

import '../network_runtime.dart';
import 'response_validator.dart';

class ListResponseValidator extends ResponseValidator {
  @override
  void processData(dynamic data) {
    if (!(data is List)) {
      error = AppErrors.customError(
          message: NetworkRuntime.strings.notValidResponse);
      errorMessage = NetworkRuntime.strings.notValidResponse;
    }
  }
}
