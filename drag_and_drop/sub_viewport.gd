extends SubViewport

const lambda_application = preload("res://lambda_elements/lambda_application.tscn")

func _process(delta: float) -> void:
  size = get_parent().size

func _on_sub_viewport_container_drop_data(pos, data) -> void:
  var dragged: LambdaElement = data["source"]
  var camera_position = get_camera_2d().global_position
  var adjusted = pos + data["offset"] + camera_position - Vector2(get_viewport().size/2)
  if dragged.source:
    # right now, this should always be true
    dragged = dragged.duplicate(DuplicateFlags.DUPLICATE_USE_INSTANTIATION)
    dragged.source = false
    # check if added to existing hbox
    # otherwise:
    var application = lambda_application.instantiate()
    application.position = adjusted
    dragged.position = Vector2.ZERO 
    application.add_child(dragged)
    add_child(application)
  dragged.enable_collision()
