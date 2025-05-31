extends SubViewport

const lambda_application = preload("res://lambda_elements/application/application.tscn")

func _process(delta: float) -> void:
  size = get_parent().size

func _on_sub_viewport_container_drop_data(pos, data) -> void:
  var camera_position = get_camera_2d().global_position
  var adjusted = pos + camera_position - Vector2(get_viewport().size/2)
  
  if data["type"] == "CREATE":
    var dragged: DraggedLambda = data["dragged"]
    var collisions: Array[Area2D] = dragged.get_collisions()
    if len(collisions) == 0:
      var application = lambda_application.instantiate()
      application.position = adjusted + data["offset"]
      application.add_expression(data["create"].instantiate())
      add_child(application)
    else:
      var colliding = collisions[0]
      # We expect all area2ds to implement this function
      colliding.drop_data(data)
