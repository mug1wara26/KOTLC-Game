class_name LambdaContainer extends MarginContainer

var placeholder = null

func add_placeholder(left_or_right: int) -> Control:
  return get_parent().add_placeholder(self.get_index(), left_or_right)
func remove_placeholder(left_or_right: int) -> void:
  get_parent().remove_placeholder(placeholder, left_or_right)
  
func add_lambda(left_or_right: int) -> void:
  get_parent().add_lambda(self.get_index(), left_or_right)

func _on_area_left_area_entered(area: Area2D) -> void:
  placeholder = add_placeholder(-1)

func _on_area_right_area_entered(area: Area2D) -> void:
  placeholder = add_placeholder(1)

func _on_area_left_area_exited(area: Area2D) -> void:
  remove_placeholder(-1)

func _on_area_right_area_exited(area: Area2D) -> void:
  remove_placeholder(1)
  

func _on_area_left_create_lambda() -> void:
  add_lambda(-1)

func _on_area_right_create_lambda() -> void:
  add_lambda(1)
