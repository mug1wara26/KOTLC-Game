extends Marker2D
const MOVE_SPEED = 1000
func _process(delta: float) -> void:
  var velocity = Vector2.ZERO
  if Input.is_action_pressed("move_right"):
    velocity.x = -1
  if Input.is_action_pressed("move_left"):
    velocity.x = 1
  if Input.is_action_pressed("move_up"):
    velocity.y = 1
  if Input.is_action_pressed("move_down"):
    velocity.y = -1
  
  
  if velocity.length() > 0:
    velocity = velocity.normalized() * MOVE_SPEED
    global_position += velocity * delta
