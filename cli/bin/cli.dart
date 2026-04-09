import 'package:command_runner/command_runner.dart';

const version = '0.0.1';

void main(List<String> arguments) {
  var runner = CommandRunner()..addCommand(HelpCommand());
  runner.run(arguments);
}
