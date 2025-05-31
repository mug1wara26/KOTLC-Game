extends Area2D

signal create_lambda()

func drop_data(data: Dictionary) -> void:
  create_lambda.emit()
