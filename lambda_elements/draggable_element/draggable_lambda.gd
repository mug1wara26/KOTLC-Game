class_name LambdaElement extends TextureRect

static var class_string = "LambdaElement"
var drag_offset = null
var element_scene = preload("res://lambda_elements/draggable_element/draggable_lambda.tscn")

var dragged: bool = false
@export var source: bool = false

func _ready() -> void:
  if source and not dragged:
    $Area2D/LambdaCollision.shape = RectangleShape2D.new()
    $Area2D/LambdaCollision.shape.extents = size/2
    $Area2D.position += size/2

func _process(_delta: float) -> void:
  if drag_offset != null:
    print("_process")
    if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
      print("pos update")
      position = get_global_mouse_position() - drag_offset
    if Input.is_action_just_released("lmb"):
      drag_offset = null

func _get_drag_data(pos):
  if source:
    var preview = self.duplicate(8)
    preview.position = -pos
    preview.dragged = true
    # preview.enable_collision()
      
    
    var drag_preview = Control.new()
    drag_preview.add_child(preview)
    set_drag_preview(drag_preview)
    
    # In the future, just return a id representing the type of node
    return {
      "type": class_string,
      "offset": -pos,
      "source": self
    }
  else:
    drag_offset = pos
    return null

func _notification(what: int) -> void:
  if (what == NOTIFICATION_DRAG_END):
    self.show()

func enable_collision() ->  void:
  $Area2D/LambdaCollision.set_deferred("disabled", false)
func disable_collision() ->  void:
  $Area2D/LambdaCollision.set_deferred("disabled", true) 

func _on_area_2d_area_entered(area: Area2D) -> void:
  if drag_offset != null:
    print("area_entered", area)
