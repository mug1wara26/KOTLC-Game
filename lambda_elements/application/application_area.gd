extends Area2D

func drop_data(data):
  if data["type"] == "CREATE":
    get_parent().add_expression(data["create"].instantiate())
