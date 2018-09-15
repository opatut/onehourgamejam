extends Container

func _input(e):
    if e is InputEventMouseButton and e.pressed:
        get_tree().change_scene("res://scenes/main.tscn")
