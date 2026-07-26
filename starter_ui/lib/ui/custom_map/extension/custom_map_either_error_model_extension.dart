import 'package:dartz/dartz.dart';
import 'package:starter_core/errors/app_errors.dart';
import 'package:starter_core/models/base_model.dart';
import 'package:starter_ui/ui/custom_map/api/datasource/map_result.dart';

extension customMapEitherErrorModel<Error extends AppErrors, Model extends BaseModel>
    on Either<Error, Model> {
  MapResult<Error, Model> get result {
    if (this.isRight()) {
      return MapResult(data: (this as Right<Error, Model>).value);
    } else
      return MapResult(error: (this as Left<Error, Model>).value);
  }
}
