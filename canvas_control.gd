extends Control

func _process(_delta: float) -> void:
  size = get_viewport().size

func _can_drop_data(position, data) -> bool:
  return (typeof(data) == TYPE_DICTIONARY 
    && data.get("type") == LambdaElement.class_string)

func _drop_data(position, data):
  print(data)
  var dragged: LambdaElement = data["dragged"]
  if dragged.source:
    # not 100% if right flag
    dragged = dragged.duplicate(DuplicateFlags.DUPLICATE_USE_INSTANTIATION)
    dragged.source = false
    add_child(dragged)
  dragged.position = position + data["offset"]
