extends TextureRect
func _get_drag_data(position):
  # Create a drag preview Control node (TextureRect, for example)
  var drag_preview = TextureRect.new()
  drag_preview.texture = self.texture  # Use the same texture
  set_drag_preview(drag_preview)
  
  # Return the drag data as a dictionary (could be expanded later)
  return {
    "texture": self.texture,
    "source": self
  }
