import 'dart:convert';
import 'dart:io';

import 'package:starter_codegen/generate_api.dart' as auto_generate;

/// Run from the root of the consuming app (so relative paths in config.json
/// and the trailing build_runner invocation land in the right place):
///   fvm dart run starter_codegen:generate_api
///   fvm dart run starter_codegen:generate_api --config=other_config.json
///   fvm dart run starter_codegen:generate_api --no-build-runner
///
/// config.json may be a single endpoint config (a JSON object) or a batch of
/// them (a JSON array) to scaffold several endpoints in one run.
void main(List<String> arguments) async {
  String configPath = "config.json";
  bool runBuildRunner = true;

  for (final arg in arguments) {
    if (arg.startsWith("--config=")) {
      configPath = arg.substring("--config=".length);
    } else if (arg == "--no-build-runner") {
      runBuildRunner = false;
    } else {
      stderr.writeln("Unknown argument: $arg");
      exitCode = 1;
      return;
    }
  }

  final configFile = File(configPath);
  if (!await configFile.exists()) {
    stderr.writeln("Config file not found: $configPath");
    exitCode = 1;
    return;
  }

  final dynamic options = json.decode(await configFile.readAsString());
  await auto_generate.generate(options, runBuildRunner: runBuildRunner);
}
