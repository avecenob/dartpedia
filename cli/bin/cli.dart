import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:command_runner/command_runner.dart';

const version = '0.0.1';

void main(List<String> arguments) async { // main is now async and awaits the runner.
  var runner = CommandRunner(); // Create an instance of the command runner.
  await runner.run(arguments); // Run the command runner, awaiting its Future<void>.
}