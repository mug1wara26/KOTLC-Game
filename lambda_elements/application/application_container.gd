extends HBoxContainer

@onready var placeholder = preload("res://lambda_elements/placeholder.tscn")
@onready var lambda = preload("res://lambda_elements/lambda/lambda.tscn")
@onready var center = get_node("/root/Main/VBoxContainer/Game/SubViewportContainer/SubViewport/Center")

func add_sibiling(sibling: Control, index: int, left_or_right: int) -> void:
  add_child(sibling)
  move_child(sibling, index+ (0 if left_or_right < 0 else 1))
  if left_or_right < 0:
    get_parent().position.x -= sibling.size.x + 4
    
func remove_sibling(sibling, left_or_right: int) -> void:
  remove_child(sibling)
  if left_or_right < 0:
    get_parent().position.x += sibling.size.x + 4

func add_placeholder(index: int, left_or_right: int) -> Control:
  var c = placeholder.instantiate()
  add_sibiling(c, index, left_or_right)
  return c

func remove_placeholder(c: Control, left_or_right: int) -> void:
  remove_sibling(c, left_or_right)

func add_lambda(index: int, left_or_right: int) -> void:
  var c = lambda.instantiate()
  add_sibiling(c, index, left_or_right)
