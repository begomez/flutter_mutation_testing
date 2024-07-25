import 'dart:io';

class MutationRunnerV1 {
  const MutationRunnerV1();

  Future<void> testMutation({
    required String targetPath,
  }) async {
    File targetFile = File(targetPath);

    if (!targetFile.path.endsWith(".dart")) return;

    // Save backup
    String backupContent = await targetFile.readAsString();

    // Add mutants
    String mutationContent =
        backupContent.replaceFirst('_counter++', '_counter--');

    mutationContent = mutationContent.replaceAll('==', '!=');

    mutationContent =
        mutationContent.replaceAll('_counter = 0', '_counter = 10');

    // Write the mutated content to the file
    await File(targetPath).writeAsString(mutationContent);

    // Run the tests
    ProcessResult result = await Process.run('flutter', ['test']);

    print('Test Output: ${result.stdout}');
    print('Test Errors: ${result.stderr}');

    // Restore the original content
    await File(targetPath).writeAsString(backupContent);
  }
}
