import 'dart:io';

import 'package:change_case/change_case.dart';

Map<String, dynamic> _keyClassNames = {};
late Map<String, dynamic> _jsonConfig;
Map<String, List<String>> _fileNames = {};
String paramName = '';

/// Prepends [imports] (one `import '...';` statement per line) to an
/// existing file's [content], skipping any that are already present. Files
/// like a feature's datasource/repository interface or cubit get appended
/// to on every generator run targeting that feature — without this, running
/// the generator repeatedly (the normal way to add endpoints over time)
/// accumulates duplicate imports.
String _prependMissingImports(String content, String imports) {
  final toAdd = imports
      .split('\n')
      .where((line) => line.trim().isNotEmpty && !content.contains(line))
      .join('\n');
  return toAdd.isEmpty ? content : "$toAdd\n$content";
}

/// [options] is either a single endpoint config (a JSON object) or a batch of
/// them (a JSON array) — config.json supports both so several endpoints can
/// be scaffolded in one run without re-running build_runner for each.
Future<void> generate(dynamic options, {bool runBuildRunner = true}) async {
  final List<Map<String, dynamic>> configs = options is List
      ? options.cast<Map<String, dynamic>>()
      : [options as Map<String, dynamic>];

  for (var i = 0; i < configs.length; i++) {
    if (configs.length > 1) {
      stdout.writeln(
        "\n--- [${i + 1}/${configs.length}] ${configs[i]['requestFunctionName']} ---",
      );
    }
    await _generateOne(configs[i]);
  }

  if (!runBuildRunner) {
    stdout.writeln(
      "Finished Generating Files Successfully 😁 (build_runner skipped)",
    );
    return;
  }

  stdout.writeln("Finished Generating Files Successfully 😁");
  stdout.writeln("Executing build_runner Command ...");
  final process = await Process.run(
    "fvm",
    [
      "flutter",
      "pub",
      "run",
      "build_runner",
      "build",
      "--delete-conflicting-outputs",
    ],
    runInShell: true,
  );
  stdout.writeln(process.stdout);
  stdout.writeln(process.stderr);
  if (process.exitCode != 0) {
    stderr.writeln("build_runner exited with code ${process.exitCode}");
    exitCode = 1;
    return;
  }
  stdout.writeln("Finished Running ✔");
}

Future<void> _generateOne(Map<String, dynamic> options) async {
  _jsonConfig = options;
  paramName = '';
  Map<String, dynamic> response = _jsonConfig['response'];
  if (response.isNotEmpty) {
    await _generateEntity();
    _fileNames.clear();
    _keyClassNames.clear();
    stdout.writeln("Generated Entities ✔");

    await _generateModel();
    _fileNames.clear();
    _keyClassNames.clear();
    stdout.writeln("Generated Models ✔");
  }
  Map<String, dynamic> param = _jsonConfig['param'];
  if (param.isNotEmpty) {
    await _generateParam();
    _fileNames.clear();
    _keyClassNames.clear();
    stdout.writeln("Generated Param ✔");
  }
  await _generateDataSourceInterface();
  stdout.writeln("Generated Data Source Interface ✔");
  await _generateDataSource();
  stdout.writeln("Generated Data Source ✔");
  await _generateRepositoryInterface();
  stdout.writeln("Generated Repository Interface ✔");
  await _generateRepository();
  stdout.writeln("Generated Repository ✔");
  await _generateUseCase();
  stdout.writeln("Generated UseCase ✔");
  await _generateState();
  stdout.writeln("Generated State ✔");
  await _generateCubit();
  stdout.writeln("Generated Cubit ✔");
  paramName = '';
  _fileNames.clear();
  _keyClassNames.clear();
}

Future<void> _generateState() async {
  String featureName = (_jsonConfig["featurePath"] as String).split('/').last;
  String path = (_jsonConfig["featurePath"] as String) +
      "/presentation/state_m/cubit/${featureName}_state.dart";
  String state = _jsonConfig["stateName"].toString().toCamelCase();
  final file = File(path);
  String content = await file.readAsString();
  String toAdd = "\n\tconst factory ${toPascalCase(featureName)}State.$state(";
  bool isList = _jsonConfig['isList'];
  Map<String, dynamic> object = _jsonConfig['response'];
  String objectName =
      object.isNotEmpty ? "${_jsonConfig["responseClassName"]}Entity" : "";
  toAdd += objectName.isNotEmpty
      ? "\n\t\t${isList ? "List<$objectName>" : objectName} ${featureName}Entity,\n"
      : "";
  toAdd += "\t) = ${toPascalCase(state)}State;\n";
  content = content.substring(0, content.lastIndexOf('}')) + toAdd + "}\n";
  await file.writeAsString(content);
}

Future<void> _generateCubit() async {
  String featureName = (_jsonConfig["featurePath"] as String).split('/').last;
  String path = (_jsonConfig["featurePath"] as String) +
      "/presentation/state_m/cubit/${featureName}_cubit.dart";
  String state = _jsonConfig["stateName"].toString().toCamelCase();
  String function = _jsonConfig["requestFunctionName"].toString().toCamelCase();
  Map<String, dynamic> object = _jsonConfig['response'];
  final file = File(path);
  String content = await file.readAsString();
  String param = paramName.isNotEmpty ? "$paramName param" : "";
  String toAdd = "\n\tvoid $function($param) async {\n";
  toAdd +=
      "\t\temit(const ${toPascalCase(featureName)}State.${featureName}Loading());\n\n";
  toAdd +=
      "\t\tfinal result = await getIt<${toPascalCase(function)}UseCase>()(${param.isEmpty ? "NoParams()" : "param"});\n\n";
  toAdd += "\t\tresult.pick(\n";
  toAdd += "\t\t\tonData: (data) {\n";
  toAdd +=
      "\t\t\t\temit(${object.isEmpty ? "const " : ""}${toPascalCase(featureName)}State.$state(${object.isEmpty ? "" : "data"}));\n";
  toAdd += "\t\t\t},\n";
  toAdd += "\t\t\tonError: (error) {\n";
  toAdd +=
      "\t\t\t\temit(${toPascalCase(featureName)}State.${featureName}Error(error, () => $function(${param.isEmpty ? "" : "param"})));\n";
  toAdd += "\t\t\t},\n";
  toAdd += "\t\t);\n";
  toAdd += "\t}\n";
  String imports =
      "import '../../../domain/usecase/${classFileName(toPascalCase(function), "usecase")}';\n"
      "${paramName.isNotEmpty ? "import '../../../data/param/${paramName.toSnakeCase()}.dart';\n" : ""}"
      "${object.isNotEmpty ? "import '../../../domain/entity/${_jsonConfig["responseClassName"].toString().toSnakeCase()}/${classFileName(_jsonConfig["responseClassName"], 'entity')}';\n" : ""}";
  content = _prependMissingImports(
    content.substring(0, content.lastIndexOf('}')) + toAdd + "}\n",
    imports,
  );
  await file.writeAsString(content);
}

Future<void> _generateUseCase() async {
  String featureName = (_jsonConfig["featurePath"] as String).split('/').last;
  String function = _jsonConfig["requestFunctionName"].toString().toCamelCase();
  Map<String, dynamic> object = _jsonConfig['response'];
  bool isList = _jsonConfig['isList'];
  String objectName = object.isNotEmpty
      ? "${_jsonConfig["responseClassName"]}Entity"
      : "EmptyResponse";
  String imports = "import 'package:injectable/injectable.dart';\n\n"
      "import 'package:starter_core/errors/app_errors.dart';\n"
      "import 'package:starter_core/results/result.dart';\n"
      "import 'package:starter_core/usecases/usecase.dart';\n";
  imports += paramName.isEmpty
      ? "import 'package:starter_core/params/no_params.dart';\n"
      : "";
  imports += object.isEmpty
      ? "import 'package:starter_core/models/empty_response.dart';\n"
      : "import '../entity/${_jsonConfig["responseClassName"].toString().toSnakeCase()}/${classFileName(_jsonConfig["responseClassName"], 'entity')}';\n";
  imports += paramName.isNotEmpty
      ? "import '../../data/param/${paramName.toSnakeCase()}.dart';\n"
      : "";
  imports += "import '../repository/i${featureName}_repository.dart';\n";
  String param = paramName.isNotEmpty ? "$paramName param" : "NoParams param";
  String content =
      "\n@singleton\nclass ${toPascalCase(function)}Usecase extends UseCase<${isList ? "List<$objectName>" : objectName}, ${paramName.isEmpty ? "NoParams" : paramName}> {\n";
  content += "\tfinal I${toPascalCase(featureName)}Repository repository;\n\n";
  content += "\t${toPascalCase(function)}Usecase(this.repository);\n\n";
  content +=
      "\t@override\n\tFuture<Result<AppErrors, ${isList ? "List<$objectName>" : objectName}>> call($param) async {\n";
  content +=
      "\t\treturn await repository.$function(${paramName.isNotEmpty ? "param" : ""});\n";
  content += "\t}\n}\n";
  content = imports + content;
  String path = (_jsonConfig["featurePath"] as String) +
      "/domain/usecase/${classFileName(toPascalCase(function), "usecase")}";
  final file = await File(path).create(recursive: true);
  await file.writeAsString(content);
}

Future<void> _generateParam({
  String? className,
  Map<String, dynamic>? map,
  String? fatherClassName,
}) async {
  String name =
      className ?? _jsonConfig["requestFunctionName"].toString().toCamelCase();
  name = toPascalCase(name);
  if (paramName.isEmpty) paramName = name + "Param";
  _fileNames[name] = [];
  Map<String, dynamic> response = map ?? _jsonConfig['param'];
  String configPath = _jsonConfig["featurePath"];
  String content = "";
  content += "class ${name}Param extends BaseParams {";
  content += _getVariablesAndConstructor(response, name, null);
  content += _getParamClassContent(response);
  content += "\n}\n";
  String imports = "";
  _fileNames[name]?.forEach((element) {
    imports += "import '$element';\n";
  });
  if (imports.isNotEmpty) {
    content = imports + "\n" + content;
  }
  content =
      "import 'package:starter_core/params/base_params.dart';\n\n" + content;
  String fileName = classFileName(name, "param");
  if (fatherClassName != null) _fileNames[fatherClassName]?.add(fileName);
  String path = configPath + "/data/param/" + fileName;
  final file = await File(path).create(recursive: true);
  await file.writeAsString(content);
}

String _getParamClassContent(Map<String, dynamic> map) {
  String content = "\n\n\t@override\n\tMap<String, dynamic> toMap() => {\n";
  map.forEach((key, value) {
    content += "\t\t\"$key\": ${_getToMapConverter(key, value)},\n";
  });
  content += "\t};";
  return content;
}

Future<void> _generateRepositoryInterface() async {
  String featureName = (_jsonConfig["featurePath"] as String).split('/').last;
  String path = (_jsonConfig["featurePath"] as String) +
      "/domain/repository/i${featureName}_repository.dart";
  final file = File(path);
  String content = await file.readAsString();
  String function = _jsonConfig["requestFunctionName"].toString().toCamelCase();
  Map<String, dynamic> object = _jsonConfig['response'];
  bool isList = _jsonConfig['isList'];
  String objectName = object.isNotEmpty
      ? "${_jsonConfig["responseClassName"]}Entity"
      : "EmptyResponse";
  String param = paramName.isNotEmpty ? paramName + " param" : "";
  String toAdd =
      "\n\tFuture<Result<AppErrors, ${isList ? "List<$objectName>" : objectName}>> $function($param);\n";
  String import = object.isNotEmpty
      ? "import '../entity/${_jsonConfig["responseClassName"].toString().toSnakeCase()}/${classFileName(_jsonConfig["responseClassName"], "entity")}';\n"
      : "import 'package:starter_core/models/empty_response.dart';\n";
  import += paramName.isNotEmpty
      ? "import '../../data/param/${paramName.toSnakeCase()}.dart';\n"
      : "";
  content = _prependMissingImports(
    content.substring(0, content.lastIndexOf('}')) + toAdd + "}\n",
    import,
  );
  await file.writeAsString(content);
}

Future<void> _generateDataSourceInterface() async {
  String featureName = (_jsonConfig["featurePath"] as String).split('/').last;
  String path = (_jsonConfig["featurePath"] as String) +
      "/data/datasource/i${featureName}_remote.dart";
  final file = File(path);
  String content = await file.readAsString();
  String function = _jsonConfig["requestFunctionName"].toString().toCamelCase();
  Map<String, dynamic> object = _jsonConfig['response'];
  bool isList = _jsonConfig['isList'];
  String objectName = object.isNotEmpty
      ? "${_jsonConfig["responseClassName"]}Model"
      : "EmptyResponse";
  String param = paramName.isNotEmpty ? paramName + " param" : "";
  String toAdd =
      "\n\tFuture<Either<AppErrors, ${isList ? "List<$objectName>" : objectName}>> $function($param);\n";
  // The impl file (a `part of` this one) references APIUrls and, for
  // empty-response requests, PrimativeCreateModelInterceptor — both are
  // imported here since impl shares this library's import scope.
  String import = "import 'package:starter_infra/net/api_url.dart';\n";
  import += object.isNotEmpty
      ? "import '../model/${_jsonConfig["responseClassName"].toString().toSnakeCase()}/${classFileName(_jsonConfig["responseClassName"], "model")}';\n"
      : "import 'package:starter_core/models/empty_response.dart';\n"
          "import 'package:starter_infra/net/create_model_interceptor/primative_create_model_interceptor.dart';\n";
  import += paramName.isNotEmpty
      ? "import '../param/${paramName.toSnakeCase()}.dart';\n"
      : "";
  content = _prependMissingImports(
    content.substring(0, content.lastIndexOf('}')) + toAdd + "}\n",
    import,
  );
  await file.writeAsString(content);
}

Future<void> _generateRepository() async {
  String featureName = (_jsonConfig["featurePath"] as String).split('/').last;
  String path = (_jsonConfig["featurePath"] as String) +
      "/domain/repository/${featureName}_repository.dart";
  final file = File(path);
  String content = await file.readAsString();
  String function = _jsonConfig["requestFunctionName"].toString().toCamelCase();
  Map<String, dynamic> object = _jsonConfig['response'];
  bool isList = _jsonConfig['isList'];
  String objectName = object.isNotEmpty
      ? "${_jsonConfig["responseClassName"]}Entity"
      : "EmptyResponse";
  String param = paramName.isNotEmpty ? paramName + " param" : "";
  String toAdd =
      "\n\t@override\n\tFuture<Result<AppErrors, ${isList ? "List<$objectName>" : objectName}>> $function($param) async {\n";
  toAdd +=
      "\t\treturn ${object.isEmpty ? "executeForNoEntity" : isList ? "executeForList" : "execute"}(\n";
  toAdd +=
      "\t\t\tremoteResult: await remoteDataSource.$function(${paramName.isNotEmpty ? "param" : ""}),\n";
  toAdd += '\t\t);\n\t}\n';
  content = content.substring(0, content.lastIndexOf('}')) + toAdd + "}\n";
  await file.writeAsString(content);
}

Future<void> _generateDataSource() async {
  Map<String, dynamic> object = _jsonConfig['response'];
  String featureName = (_jsonConfig["featurePath"] as String).split('/').last;
  String path = (_jsonConfig["featurePath"] as String) +
      "/data/datasource/${featureName}_remote.dart";
  final file = File(path);
  String content = await file.readAsString();
  String function = _jsonConfig["requestFunctionName"].toString().toCamelCase();
  bool isList = _jsonConfig['isList'];
  String objectName = object.isNotEmpty
      ? "${_jsonConfig["responseClassName"]}Model"
      : "EmptyResponse";
  String param = paramName.isNotEmpty ? paramName + " param" : "";
  String toAdd =
      "\n\t@override\n\tFuture<Either<AppErrors, ${isList ? "List<$objectName>" : objectName}>> $function($param) async {\n";
  String httpMethod = _jsonConfig["httpMethod"].toString().toUpperCase();
  String url = _jsonConfig["apiUrl"];
  String paramType = _jsonConfig['paramType'].toString().toLowerCase();
  toAdd += "\t\treturn await ${isList ? "listRequest" : "request"}(\n";
  toAdd += "\t\t\tconverter: (json) => $objectName.fromMap(json),\n";
  toAdd += "\t\t\tmethod: HttpMethod.$httpMethod,\n";
  toAdd += "\t\t\turl: APIUrls.$url,\n";
  if (param.isNotEmpty) {
    toAdd += paramType.startsWith("query")
        ? "\t\t\tqueryParameters: param.toMap(),\n"
        : paramType.startsWith("body")
            ? "\t\t\tbody: param.toMap(),\n"
            : "\t\t\theaders: param.toMap(),\n";
  }
  if (object.isEmpty) {
    toAdd +=
        "\t\t\tcreateModelInterceptor: const PrimativeCreateModelInterceptor(),\n";
  }
  toAdd += '\t\t);\n\t}\n';
  content = content.substring(0, content.lastIndexOf('}')) + toAdd + "}\n";
  await file.writeAsString(content);
}

Future<void> _generateEntity({
  String? className,
  Map<String, dynamic>? map,
  String? fatherClassName,
}) async {
  String name = className ?? _jsonConfig["responseClassName"];
  _fileNames[name] = [];
  Map<String, dynamic> response = map ?? _jsonConfig['response'];
  String configPath = _jsonConfig["featurePath"];
  String content = "";
  content += "class ${name}Entity extends BaseEntity {";
  content +=
      _getVariablesAndConstructor(response, name, false, isRequired: true);
  content += _getEntityToString("${name}Entity", response);
  content += _getEntityCopyWith("${name}Entity", response);
  content += _getEntityClassContent(response);
  content += "\n}\n";
  String imports = "";
  _fileNames[name]?.forEach((element) {
    imports += "import '$element';\n";
  });
  if (imports.isNotEmpty) {
    content = imports + "\n" + content;
  }
  content =
      "import 'package:starter_core/entities/base_entity.dart';\n\n" + content;
  String fileName =
      name.split(RegExp(r'(?=[A-Z])')).join('_').toLowerCase() + "_entity.dart";
  if (fatherClassName != null) _fileNames[fatherClassName]?.add(fileName);
  String path = configPath +
      "/domain/entity/${_jsonConfig["responseClassName"].toString().toSnakeCase()}/" +
      fileName;
  final file = await File(path).create(recursive: true);
  await file.writeAsString(content);
}

Future<void> _generateModel({
  String? className,
  Map<String, dynamic>? map,
  String? fatherClassName,
}) async {
  String name = className ?? _jsonConfig["responseClassName"];
  _fileNames[name] = [];
  Map<String, dynamic> response = map ?? _jsonConfig['response'];
  String configPath = _jsonConfig["featurePath"];
  String content = "";
  content += "class ${name}Model extends BaseModel<${name}Entity> {";
  content += _getVariablesAndConstructor(response, name, true);
  content += _getModelClassContent(response, name);
  content += "\n}\n";
  String imports = "";
  _fileNames[name]?.forEach((element) {
    imports += "import '$element';\n";
  });
  if (imports.isNotEmpty) {
    content = imports + "\n" + content;
  }
  String classFileName =
      name.split(RegExp(r'(?=[A-Z])')).join('_').toLowerCase();
  content = "import 'dart:convert';\n\n"
          "import 'package:starter_core/common/extensions/extensions.dart';\n"
          "import 'package:starter_core/common/type_validators.dart';\n"
          "import 'package:starter_core/models/base_model.dart';\n"
          "import '../../../domain/entity/${_jsonConfig["responseClassName"].toString().toSnakeCase()}/${classFileName}_entity.dart';\n\n" +
      content;
  String fileName = "${classFileName}_model.dart";
  if (fatherClassName != null) _fileNames[fatherClassName]?.add(fileName);
  String path = configPath +
      "/data/model/${_jsonConfig["responseClassName"].toString().toSnakeCase()}/" +
      fileName;
  final file = await File(path).create(recursive: true);
  await file.writeAsString(content);
}

String _getModelClassContent(Map<String, dynamic> map, String className) {
  String content =
      "\n\n\tfactory ${className}Model.fromMap(Map<String, dynamic>? map) =>\n\t\t${className}Model(";
  map.forEach((key, value) {
    content += "\n\t\t\t${key.toCamelCase()}: ${_getMapConverter(key, value)},";
  });
  content += "\n\t\t);";
  content += "\n\n\tfactory ${className}Model.fromJson(String map) =>";
  content += "\n\t\t\t${className}Model.fromMap(json.decode(map));";
  content +=
      "\n\n\t@override\n\t${className}Entity toEntity() => ${className}Entity(";
  map.forEach((key, value) {
    content +=
        "\n\t\t${key.toCamelCase()}: ${key.toCamelCase()}${_getToEntityFromType(value)}${_typeCheck(value.runtimeType)},";
  });
  content += "\n\t);";
  return content;
}

String _getToEntityFromType(dynamic value) {
  if (value == null) return "";
  final type = value.runtimeType;

  switch (type) {
    case List:
      if ((value as List).isEmpty || !isObject(value.first.runtimeType)) {
        return "";
      }
      return ".toListEntity()";
    case int:
    case num:
    case double:
    case bool:
    case String:
    case DateTime:
      return "";
    default:
      return "?.toEntity()";
  }
}

String _typeCheck(Type? type) {
  switch (type) {
    case List:
    case String:
    case bool:
    case DateTime:
      return "";
    case int:
    case num:
    case double:
      return " ?? 0";
    default:
      return "";
  }
}

String _getEntityToString(
  String className,
  Map<String, dynamic> map,
) {
  String content = "\n\n\t@override\n\tString toString() => \"\"\"$className(";
  map.forEach((key, value) {
    content += "\n\t\t\t${key.toCamelCase()}: \$${key.toCamelCase()},";
  });
  content += "\n\t)\"\"\";";
  return content;
}

String _getEntityCopyWith(
  String className,
  Map<String, dynamic> map,
) {
  String content = "\n\n\t$className copyWith({";
  map.forEach((key, value) {
    if (value == null) {
      content += "\n\t\tObject? ${key.toCamelCase()},";
    } else if (value is String && DateTime.tryParse(value) != null) {
      content += "\n\t\tDateTime? ${key.toCamelCase()},";
    } else if (isObject(value.runtimeType)) {
      content +=
          "\n\t\t${_addNullCheck(_keyClassNames[key] + "Entity")} ${key.toCamelCase()},";
    } else if (value.runtimeType == List) {
      if ((value as List).isEmpty || !isObject(value.first.runtimeType)) {
        content +=
            "\n\t\t${_addNullCheck(_getStringFromType(value.runtimeType, false) + "<" + (value.isEmpty ? "dynamic" : _getStringFromType(value.first.runtimeType, true)) + ">")} ${key.toCamelCase()},";
      } else {
        content +=
            "\n\t\t${_addNullCheck(_getStringFromType(value.runtimeType, false) + "<" + _keyClassNames[key] + "Entity" + ">")} ${key.toCamelCase()},";
      }
    } else {
      content +=
          "\n\t\t${_addNullCheck(_getStringFromType(value.runtimeType, false))} ${key.toCamelCase()},";
    }
  });
  content += "\n\t}) {";
  content += "\n\t\treturn $className(";
  map.forEach((key, value) {
    content +=
        "\n\t\t\t${key.toCamelCase()}: ${key.toCamelCase()} ?? this.${key.toCamelCase()},";
  });
  content += "\n\t\t);";
  content += "\n\t}";
  return content;
}

String _addNullCheck(String stringToFormat) {
  if (stringToFormat.isNotEmpty &&
      stringToFormat[stringToFormat.length - 1] != "?") {
    return stringToFormat + "?";
  }
  return stringToFormat;
}

String _getEntityClassContent(Map<String, dynamic> map) {
  String content = "\n\n\t@override\n\tList<Object?> get props => [";
  map.forEach((key, value) {
    content += "\n\t\t\t${key.toCamelCase()},";
  });
  content += "\n\t];";
  return content;
}

String _getVariablesAndConstructor(
  Map<String, dynamic> map,
  String className,
  bool? isModel, {
  bool isRequired = false,
}) {
  String content = "";
  map.forEach((key, value) {
    if (value == null) {
      // Sample had a null for this field — we can't infer a concrete type
      // from a single null, so fall back to a plain nullable field instead
      // of recursing into nested-object generation (which would crash).
      content += "\n\tfinal Object? ${key.toCamelCase()};";
    } else if (value.runtimeType == List &&
        !((value as List).isEmpty
            ? false
            : isObject(value.first.runtimeType))) {
      final type = value.isEmpty
          ? "dynamic"
          : _getStringFromType(value.first.runtimeType, true);
      content += "\n\tfinal List<$type> ${key.toCamelCase()};";
    } else if (value.runtimeType == List || isObject(value.runtimeType)) {
      bool isList = value.runtimeType == List;

      String childName = toPascalCase(key);
      _keyClassNames[key] = childName;
      isModel == null
          ? _generateParam(
              className: childName,
              map: isList
                  ? (map[key] as List).isNotEmpty
                      ? (map[key] as List).first
                      : {}
                  : Map<String, dynamic>.from(map[key]),
              fatherClassName: className,
            )
          : isModel
              ? _generateModel(
                  className: childName,
                  map: isList
                      ? (map[key] as List).isNotEmpty
                          ? (map[key] as List).first
                          : {}
                      : Map<String, dynamic>.from(map[key]),
                  fatherClassName: className,
                )
              : _generateEntity(
                  className: childName,
                  map: isList
                      ? (map[key] as List).isNotEmpty
                          ? (map[key] as List).first
                          : {}
                      : Map<String, dynamic>.from(map[key]),
                  fatherClassName: className,
                );
      if (isList) {
        content +=
            "\n\tfinal List<$childName${isModel == null ? "Param" : isModel ? "Model" : "Entity"}> ${key.toCamelCase()};";
      } else {
        content +=
            "\n\tfinal $childName${isModel == null ? "Param" : isModel ? "Model" : "Entity"}? ${key.toCamelCase()};";
      }
    } else {
      if (value.runtimeType == String &&
          DateTime.tryParse(value as String) != null) {
        content += "\n\tfinal DateTime? ${key.toCamelCase()};";
      } else {
        content +=
            '\n\tfinal ${_getStringFromType(value.runtimeType, isRequired)} ${key.toCamelCase()};';
      }
    }
  });
  content +=
      '\n\n\t$className${isModel == null ? "Param" : isModel ? "Model" : "Entity"}({';
  map.forEach((key, value) {
    content += '\n\t\trequired this.${key.toCamelCase()},';
  });
  content += '\n\t});';
  return content;
}

String _getMapConverter(String key, dynamic value) {
  String mapGetter = "map?[\"$key\"]";
  if (value == null) return mapGetter;
  switch (value.runtimeType) {
    case int:
    case num:
    case double:
      return "numV($mapGetter)";
    case bool:
      return "boolV($mapGetter)";
    case String:
      return DateTime.tryParse(value as String) != null
          ? "dateTimeV($mapGetter)"
          : "stringV($mapGetter)";
    case DateTime:
      return "dateTimeV($mapGetter)";
    case List:
      if ((value as List).isEmpty || !isObject(value.first.runtimeType)) {
        return "$mapGetter == null ? [] : List<${value.isEmpty ? "dynamic" : _getStringFromType(value.first.runtimeType, true)}>.from($mapGetter)";
      }
      return "$mapGetter == null ? [] : List<${_keyClassNames[key].toString().toPascalCase()}Model>.from($mapGetter.map((x) => ${_keyClassNames[key]}Model.fromMap(x)))";
    default:
      return "$mapGetter == null ? null : ${_keyClassNames[key]}Model.fromMap($mapGetter)";
  }
}

String _getToMapConverter(String key, dynamic value) {
  if (value == null) return key.toCamelCase();
  switch (value.runtimeType) {
    case int:
    case num:
    case double:
    case bool:
      return key.toCamelCase();
    case String:
      return DateTime.tryParse(value as String) != null
          ? "${key.toCamelCase()}?.toIso8601String()"
          : key.toCamelCase();
    case DateTime:
      return "${key.toCamelCase()}?.toIso8601String()";
    case List:
      return "${key.toCamelCase()}.map((x) => x.toMap()).toList()";
    default:
      return "${key.toCamelCase()}?.toMap()";
  }
}

String _getStringFromType(Type? type, bool isRequired) {
  switch (type) {
    case List:
      return "List";
    case int:
      return "int${isRequired ? "" : "?"}";
    case num:
      return "num${isRequired ? "" : "?"}";
    case double:
      return "double${isRequired ? "" : "?"}";
    case bool:
      return "bool";
    case DateTime:
      return "DateTime?";
    case String:
      return "String";
    case Object:
      return "Object?";
    default:
      return "Object?";
  }
}

String toPascalCase(String str) => str.toPascalCase();

String classFileName(String str, String suffix) =>
    str.split(RegExp(r'(?=[A-Z])')).join("_").toLowerCase() + "_$suffix.dart";

bool isObject(Type? type) {
  switch (type) {
    case int:
    case num:
    case double:
    case bool:
    case String:
    case DateTime:
    case List:
      return false;
    default:
      return true;
  }
}
