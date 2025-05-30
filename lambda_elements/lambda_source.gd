class_name LambdaSource extends Control

static var type = "LambdaSource"
const preview_scene = preload("res://lambda_elements/lambda_element.tscn")

func _get_drag_data(pos):
  var preview = preview_scene.instantiate()
  preview.position = -pos
  # preview.enable_collision()
  
  var drag_preview = Control.new()
  print(preview.visible)
  drag_preview.add_child(preview)
  set_drag_preview(drag_preview)
  
  return {
    "type": type,
    "offset": -pos,
    "source": preview
  }
