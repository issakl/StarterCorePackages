/// starter_core — foundational layer shared by all apps and features.
///
/// Domain entities, data models, use-case/repository contracts, result & error
/// types, base params, shared enums and preference keys. Depend on this from
/// features and from the other `starter_*` packages; it depends on none of them.
library starter_core;

// Entities
export 'entities/base_entity.dart';
export 'entities/name_entity.dart';

// Models
export 'models/api_response.dart';
export 'models/base_model.dart';
export 'models/empty_response.dart';
export 'models/name_model.dart';

// Params
export 'params/base_params.dart';
export 'params/id_param.dart';
export 'params/no_params.dart';
export 'params/page_param.dart';
export 'params/screen_params/profile_image_screen_param.dart';

// Results & error types
export 'results/result.dart';
export 'errors/app_errors.dart';
export 'errors/http_error.dart';

// Contracts
export 'repositories/repository.dart';
export 'usecases/usecase.dart';

// Shared enums
export 'constants/enums/app_options_enum.dart';
export 'constants/enums/error_code_type.dart';
export 'constants/enums/http_method.dart';
export 'constants/enums/languages_enum.dart';
export 'constants/enums/locale_keys_enum.dart';
export 'constants/enums/route_type.dart';
export 'constants/enums/system_type.dart';

// Preference keys
export 'constants/shared_preference/shared_preference_keys.dart';

// Pure utilities
export 'common/type_validators.dart';
export 'common/utils/utility_functions.dart';

// Extensions
export 'common/extensions/base_model_list_extension.dart';
export 'common/extensions/context_extensions.dart';
export 'common/extensions/either_error_model_extension.dart';
export 'common/extensions/extensions.dart';
export 'common/extensions/list_object_extension.dart';
export 'common/extensions/logger_extension.dart';
export 'common/extensions/object_extension.dart';
export 'common/extensions/string_extensions.dart';
