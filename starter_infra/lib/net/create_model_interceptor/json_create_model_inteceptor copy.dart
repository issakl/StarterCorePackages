import 'package:starter_infra/net/create_model_interceptor/create_model.interceptor.dart';

class JsonCreateModelInterceptor extends CreateModelInterceptor {
  const JsonCreateModelInterceptor();
  @override
  T getModel<T>(dynamic Function(dynamic) modelCreator, dynamic json) {
    /// Encode json then Decode it to ensure json is Map
    return modelCreator(json['json']['data']);
  }
}
