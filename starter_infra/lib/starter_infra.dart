/// starter_infra — shared infrastructure / IO layer.
///
/// Dio networking stack, remote datasource base, and local key-value storage.
/// Depends on starter_core. App-specific config and behaviour are injected
/// through [NetworkRuntime] instead of imported.
library starter_infra;

// Networking
export 'net/net.dart';
export 'net/http_client.dart';
export 'net/api_url.dart';
export 'net/interceptor.dart';
export 'net/http_overrides.dart';
export 'net/models_factory.dart';
export 'net/network_headers.dart';
export 'net/network_runtime.dart';
export 'net/response_validators/response_validator.dart';
export 'net/response_validators/default_response_validator.dart';
export 'net/response_validators/list_response_validator.dart';
export 'net/response_validators/test_response_validator.dart';
export 'net/create_model_interceptor/create_model.interceptor.dart';

// Datasource base
export 'datasources/remote_data_source.dart';

// Local storage
export 'local_storage.dart';
