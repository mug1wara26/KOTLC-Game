extends Control

func _ready() -> void:
  var source_vbox = get_node("../../../../ScrollContainer/CenterContainer/MarginContainer/VBoxContainer")
  source_vbox.set_drag_preview_signal.connect(_set_drag_preview)
  
func _set_drag_preview(drag_preview: Control):
  set_drag_preview(drag_preview)
