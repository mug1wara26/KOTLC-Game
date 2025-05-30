class_name LambdaElement extends TextureRect

var drag_offset = null

func _process(_delta: float) -> void:
  if drag_offset != null:
    print("_process")
    if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
      print("pos update")
      position = get_global_mouse_position() - drag_offset
    if Input.is_action_just_released("lmb"):
      drag_offset = null

func enable_collision() ->  void:
  $Area2D/CollisionShape2D.set_deferred("disabled", false)
func disable_collision() ->  void:
  $Area2D/CollisionShape2D.set_deferred("disabled", true) 

func _on_area_2d_area_entered(area: Area2D) -> void:
  if drag_offset != null:
    print("area_entered", area)
