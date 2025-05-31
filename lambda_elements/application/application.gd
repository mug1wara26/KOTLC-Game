extends MarginContainer

@onready var placeholder = preload("res://lambda_elements/placeholder.tscn")

func add_expression(expression: Node):
  $ApplicationContainer.add_child(expression)
  refresh()


@export var dot_spacing := 4.0
@export var dot_length := 2.0
@export var border_color := Color.GREEN
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

const lambda_height = 90

func refresh():
  var num_children = len($ApplicationContainer.get_children())
  if num_children == 0:
    var mid = Vector2(size.x, lambda_height)
    $Area2D.position = mid / 2
    $Area2D/CollisionShape2D.shape.size = mid
  $Area2D/CollisionShape2D.disabled = num_children != 0

func _ready():
  refresh()
