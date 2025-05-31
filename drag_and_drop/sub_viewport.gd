extends SubViewport

const lambda_application = preload("res://lambda_elements/application/application.tscn")
const lambda = preload("res://lambda_elements/lambda/lambda.tscn")

func _process(delta: float) -> void:
  size = get_parent().size

func _on_sub_viewport_container_drop_data(pos, data) -> void:
  var camera_position = get_camera_2d().global_position

  var adjusted = pos + camera_position - Vector2(get_viewport().size/2)
  if data["type"] == "CREATE_LAMBDA":
    var dragged: DraggableSource = data["dragged"]
    var collisions: Array[Area2D] = dragged.get_collisions()
    if len(collisions) == 0:
      var application = lambda_application.instantiate()
      application.position = adjusted
      application.add_expression(lambda.instantiate())
      add_child(application)
    else:
      var colliding = collisions[0]
      # We expect all area2ds to implement this function
      colliding.drop_data(data)
  else:
    var dragged: LambdaElement = data["source"]
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
