class_name AbstractExpression

func _init():
  if self.get_script() == AbstractExpression:
    push_error("Cannot instantiate abstract class AbstractExpression directly.")

func eval() -> void:
  push_error("eval() must be implemented by a subclass of AbstractExpression")
