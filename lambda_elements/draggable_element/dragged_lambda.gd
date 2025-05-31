class_name DraggedLambda extends TextureRect

var drag = false

func _ready() -> void:
  if drag:
    enable_collision()
    $Area2D/CollisionShape2D.shape.extents = Vector2(1,1)
  else:
    $Area2D/CollisionShape2D.shape = RectangleShape2D.new()
    $Area2D/CollisionShape2D.shape.extents = size/2
    $Area2D.position += size/2

func _process(_delta: float) -> void:
  if drag:
    if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
      position = get_global_mouse_position() - size/2
    if Input.is_action_just_released("lmb"):
      queue_free()

func enable_collision() ->  void:
  $Area2D/CollisionShape2D.set_deferred("disabled", false)
func disable_collision() ->  void:
  $Area2D/CollisionShape2D.set_deferred("disabled", true) 

func get_collisions() -> Array[Area2D]:
  return $Area2D.get_overlapping_areas()
