class_name DraggableSource extends TextureRect

var drag = false
@onready var new_viewport = get_node("../../../../../SubViewportContainer/SubViewport")

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
    if Input.is_mouse_button_pressed(1):
      position = get_global_mouse_position() - size/2
    if Input.is_action_just_released("lmb"):
      queue_free()

func _get_drag_data(at_position: Vector2) -> Variant:
  var preview = self.duplicate(8)
  preview.position = -at_position
  preview.drag = true
  # preview.enable_collision()
    
  
  var drag_preview = Control.new()
  drag_preview.add_child(preview)
  new_viewport.add_child(drag_preview)
  
  return {
    "type": "CREATE_LAMBDA",
    "offset": -at_position,
    "dragged": preview
  }

func enable_collision() ->  void:
  $Area2D/CollisionShape2D.set_deferred("disabled", false)
func disable_collision() ->  void:
  $Area2D/CollisionShape2D.set_deferred("disabled", true) 

func get_collisions() -> Array[Area2D]:
  return $Area2D.get_overlapping_areas()
