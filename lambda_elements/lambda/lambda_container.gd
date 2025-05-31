class_name LambdaContainer extends MarginContainer

@onready var lambda = preload("res://lambda_elements/lambda/lambda.tscn")
var placeholder = null

func add_placeholder(left: bool) -> Control:
  return get_parent().add_placeholder(self, left)

func remove_placeholder(left: bool) -> void:
  get_parent().remove_placeholder(placeholder, left)
  
func add_lambda(left: bool) -> void:
  get_parent().add_node(self, lambda.instantiate(), left)

func _on_area_left_area_entered(area: Area2D) -> void:
  placeholder = add_placeholder(true)

func _on_area_right_area_entered(area: Area2D) -> void:
  placeholder = add_placeholder(false)

func _on_area_left_area_exited(area: Area2D) -> void:
  remove_placeholder(true)

func _on_area_right_area_exited(area: Area2D) -> void:
  remove_placeholder(false)

func _on_area_left_create_lambda() -> void:
  add_lambda(true)

func _on_area_right_create_lambda() -> void:
  add_lambda(false)
