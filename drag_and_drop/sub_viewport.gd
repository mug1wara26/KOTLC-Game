extends SubViewport

func _process(delta: float) -> void:
  size = get_parent().size

func _on_sub_viewport_container_drop_data(position, data) -> void:
  var dragged = data["source"]
  var camera_position = get_camera_2d().global_position
  if dragged.source:
    # not 100% if right flag
    dragged = dragged.duplicate(DuplicateFlags.DUPLICATE_USE_INSTANTIATION)
    dragged.source = false
    add_child(dragged)
  dragged.position = position + data["offset"] + camera_position - Vector2(get_viewport().size/2)
  dragged.enable_collision()
