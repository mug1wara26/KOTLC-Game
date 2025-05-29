class_name LambdaElement extends TextureRect

static var class_string = "LambdaElement"
@export var source: bool = false

func _get_drag_data(position):
  # Create a drag preview Control node (TextureRect, for example)
  var texture = TextureRect.new()
  texture.texture = self.texture  # Use the same texture
  texture.position = -position
  var drag_preview = Control.new()
  drag_preview.add_child(texture)
  set_drag_preview(drag_preview)
  self.hide()
  # Return the drag data as a dictionary (could be expanded later)
  return {
    "type": class_string,
    "offset": -position,
    "dragged": self
  }

func _notification(what: int) -> void:
  if (what == NOTIFICATION_DRAG_END):
    self.show()
