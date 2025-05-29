extends SubViewportContainer

signal drop_data(position, data)

func _can_drop_data(position, data) -> bool:
  return (typeof(data) == TYPE_DICTIONARY 
    && data.get("type") == LambdaElement.class_string)

func _drop_data(position, data):
  drop_data.emit(position, data)
