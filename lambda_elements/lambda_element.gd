class_name LambdaElement extends TextureRect

static var class_string = "LambdaElement"
@export var source: bool = false

var element_scene = preload("res://lambda_elements/lambda_element.tscn")

func _get_drag_data(pos):
  # Create a drag preview Control node (TextureRect, for example)
  var preview: LambdaElement = element_scene.instantiate()
  preview.texture = self.texture  # Use the same texture
  preview.position = -pos
  preview.enable_collision()
  
  if source:
    preview.source = true
    
  var drag_preview = Control.new()
  drag_preview.add_child(preview)
  set_drag_preview(drag_preview)
  
  # Return the drag data as a dictionary (could be expanded later)
  return {
    "type": class_string,
    "offset": -pos,
    "source": self
  }

func _notification(what: int) -> void:
  if (what == NOTIFICATION_DRAG_END):
    self.show()

func enable_collision() ->  void:
  $Area2D/CollisionShape2D.set_deferred("disabled", false) 


func _on_area_2d_area_entered(area: Area2D) -> void:
  print("area_entered")
