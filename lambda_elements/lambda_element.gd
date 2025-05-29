class_name LambdaElement extends TextureRect

static var class_string = "LambdaElement"
var dragged: bool = false
var element_scene = preload("res://lambda_elements/lambda_element.tscn")

@onready var new_viewport = get_node("../../../../../SubViewportContainer/SubViewport")
@export var source: bool = false

func _process(_delta: float) -> void:
  if source and dragged:
    if Input.is_mouse_button_pressed(1):
      position = get_global_mouse_position()
    if Input.is_action_just_released("lmb"):
      queue_free()

func _get_drag_data(position):
  # Create a drag preview Control node (TextureRect, for example)
  var texture: LambdaElement = element_scene.instantiate()
  texture.texture = load("res://icon.svg")
  texture.position = -position
  texture.enable_collision()
  texture.dragged = true
  
  var drag_preview = Control.new()
  drag_preview.add_child(texture)
  
  if source:
    texture.source = true
    new_viewport.add_child(drag_preview)
  else:
    set_drag_preview(drag_preview)
  
  self.disable_collision()
  
  
  # Return the drag data as a dictionary (could be expanded later)
  return {
    "type": class_string,
    "offset": -position,
    "source": self
  }

func _notification(what: int) -> void:
  if (what == NOTIFICATION_DRAG_END):
    self.show()

func enable_collision() ->  void:
  $Area2D/CollisionShape2D.set_deferred("disabled", false)
func disable_collision() ->  void:
  $Area2D/CollisionShape2D.set_deferred("disabled", true) 

func _on_area_2d_area_entered(area: Area2D) -> void:
  if not dragged:
    print("area_entered", area)
