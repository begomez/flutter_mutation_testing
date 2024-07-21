import 'dart:io';

void main() async => _mutateSourceCode();

Future<void> _mutateSourceCode() async {
  // Path to the file you want to mutate
  String filePath = 'lib/my_app.dart';

  // Read the original file content
  String originalContent = await File(filePath).readAsString();

  // Introduce a simple mutation (e.g., change an increment to a decrement)
  String mutatedContent =
      originalContent.replaceFirst('_counter++', '_counter--');

  mutatedContent = mutatedContent.replaceAll('==', '!=');

  mutatedContent = mutatedContent.replaceAll('_counter = 0', '_counter = 10');

  // Write the mutated content to the file
  await File(filePath).writeAsString(mutatedContent);

  // Run the tests
  var result = await Process.run('flutter', ['test']);

  print('Test Output: ${result.stdout}');
  print('Test Errors: ${result.stderr}');

  // Restore the original content
  await File(filePath).writeAsString(originalContent);
}
