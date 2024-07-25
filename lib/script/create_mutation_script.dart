import 'package:mutation_test_example/script/mutation_runner_v1.dart';

void main() async => await MutationRunnerV1().testMutation(
      targetPath: "lib/my_app.dart",
    );
