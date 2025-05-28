extends Control
func _can_drop_data(position, data) -> bool:
  return true


func _drop_data(position, data):
  if typeof(data) == TYPE_DICTIONARY:
    print(data)
    var source: TextureRect = data["source"]
    var new_tex_rect: TextureRect = TextureRect.new()
    new_tex_rect.texture = source.texture
    new_tex_rect.position = position
    new_tex_rect.size = source.size  # Set to desired size
    new_tex_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE  # So it doesn’t interfere
    add_child(new_tex_rect)
