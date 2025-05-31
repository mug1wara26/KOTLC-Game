class_name LambdaExpression extends AbstractExpression

var body: Expression = null

func eval() -> void:
  if body != null:
    body.eval()
