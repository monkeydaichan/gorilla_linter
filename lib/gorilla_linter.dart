import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:gorilla_linter/rules/avoid_using_hardcoded_strings_rule%20copy.dart';
import 'package:gorilla_linter/rules/avoid_using_hardcoded_strings_rule.dart';

PluginBase createPlugin() => _GorillaLinter();

class _GorillaLinter extends PluginBase {
  // For rules
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) {
    return [
      const AvoidUsingHardcodedStrings(),
      const AvoidUsingReturnStringLiteral()
    ];
  }

// For assist
  @override
  List<Assist> getAssists() => [];
}
