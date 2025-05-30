extends SubViewportContainer

signal drop_data(position, data)


func _can_drop_data(position, data) -> bool:
  if typeof(data) == TYPE_DICTIONARY:
    var dragged: LambdaElement = data.get("dragged")
    return data.get("type") == LambdaSource.type
  return false

func _drop_data(position, data):
  drop_data.emit(position, data)
