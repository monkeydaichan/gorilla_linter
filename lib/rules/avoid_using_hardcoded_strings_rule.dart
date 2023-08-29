import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class AvoidUsingHardcodedStrings extends DartLintRule {
  const AvoidUsingHardcodedStrings() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_using_hardcoded_strings',
    problemMessage:
        'Avoid using hardcoded strings in Text widgets. Use i18n or similar internationalization techniques instead.',
    errorSeverity: ErrorSeverity.WARNING,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addInstanceCreationExpression((node) {
      final createdType = node.constructorName.type.type;
      if ((createdType.toString() == 'Text' ||
              createdType.toString() == 'AutoSizeText') &&
          node.argumentList.arguments.isNotEmpty &&
          node.argumentList.arguments.first is StringLiteral) {
        reporter.reportErrorForNode(_code, node, []);
      }
    });
  }
}
