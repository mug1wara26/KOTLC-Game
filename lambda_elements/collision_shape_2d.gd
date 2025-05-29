extends CollisionShape2D

@export var source: bool = false

func _ready() -> void:
  if source:
    disabled = true
