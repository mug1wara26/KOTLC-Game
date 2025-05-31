extends HBoxContainer

@onready var placeholder = preload("res://lambda_elements/placeholder.tscn")
# @onready var center = get_node("/root/Main/VBoxContainer/Game/SubViewportContainer/SubViewport/Center")

func add_left_right(this: Node, sibling: Node, left: bool) -> void:
  if left:
    add_child(sibling)
    move_child(sibling, this.get_index())
    get_parent().position.x -= sibling.size.x + 4
  else:
    this.add_sibling(sibling)

func remove_left_right(sibling: Node, left: bool) -> void:
  remove_child(sibling)
  if left:
    get_parent().position.x += sibling.size.x + 4

func add_placeholder(this: Node, left: bool) -> Control:
  var c = placeholder.instantiate()
  add_left_right(this, c, left)
  return c

func remove_placeholder(c: Control, left: bool) -> void:
  remove_left_right(c, left)

func add_node(this: Node, node: Node, left: bool) -> void:
  add_left_right(this, node, left)
  get_parent().refresh()
