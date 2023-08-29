import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class AvoidUsingReturnStringLiteral extends DartLintRule {
  const AvoidUsingReturnStringLiteral() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_using_return_string_literal',
    problemMessage:
        'Avoid using to return strings. Use i18n or similar internationalization techniques instead.',
    errorSeverity: ErrorSeverity.WARNING,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addReturnStatement((node) {
      if (node.expression is StringLiteral) {
        reporter.reportErrorForNode(_code, node, []);
      }
    });
    context.registry.addFunctionExpression((node) {
      if (node.body is ExpressionFunctionBody) {
        var body = node.body as ExpressionFunctionBody;
        if (body.expression is StringLiteral) {
          reporter.reportErrorForNode(_code, body.expression, []);
        }
      }
    });
  }
}
