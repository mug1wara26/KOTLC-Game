extends MarginContainer

@onready var placeholder = preload("res://lambda_elements/placeholder.tscn")

func add_expression(expression: Control):
  $ApplicationContainer.add_child(expression)
