extends Control

@export var drag_element: PackedScene
@export var to_create: PackedScene
@export var viewport: SubViewport

func _get_drag_data(at_position: Vector2) -> Variant:
  var preview = drag_element.instantiate()
  preview.position = -at_position
  preview.drag = true
  # preview.enable_collision()
  
  var drag_preview = Control.new()
  drag_preview.add_child(preview)
  viewport.add_child(drag_preview)
  
  return {
    "type": "CREATE",
    "offset": -at_position,
    "dragged": preview,
    "create": to_create
  }
