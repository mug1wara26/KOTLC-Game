extends VBoxContainer

var placeholder = null
@onready var placeholder_scene = preload("res://lambda_elements/placeholder.tscn")
@onready var lambda_application = load("res://lambda_elements/application/application.tscn")
@onready var lambda = preload("res://lambda_elements/lambda/lambda.tscn")

@export var dot_spacing := 4.0
@export var dot_length := 2.0
@export var border_color := Color.BLACK
@export var border_width := 1.0

func _draw():
    var size = get_size()
    _draw_dotted_line(Vector2(0, 0), Vector2(size.x, 0))
    _draw_dotted_line(Vector2(size.x, 0), Vector2(size.x, size.y))
    _draw_dotted_line(Vector2(size.x, size.y), Vector2(0, size.y))
    _draw_dotted_line(Vector2(0, size.y), Vector2(0, 0))

func _draw_dotted_line(from_pos: Vector2, to_pos: Vector2):
    var dir = (to_pos - from_pos).normalized()
    var length = from_pos.distance_to(to_pos)
    var current_pos = from_pos
    var drawn = 0.0

    while drawn < length:
        var end_pos = current_pos + dir * min(dot_length, length - drawn)
        draw_line(current_pos, end_pos, border_color, border_width)
        drawn += dot_spacing
        current_pos = from_pos + dir * drawn


func _on_area_down_area_entered(area: Area2D) -> void:
  placeholder = placeholder_scene.instantiate()
  add_child(placeholder)

func _on_area_down_area_exited(area: Area2D) -> void:
  remove_child(placeholder)


func _on_area_down_create_lambda() -> void:
  var application = lambda_application.instantiate()
  print(application)
  application.add_expression(lambda.instantiate())
  add_child(application)
