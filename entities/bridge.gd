extends Node2D

export (NodePath) var from setget set_from
export (NodePath) var to setget set_to
export (int) var button = 0 setget set_button

func _ready():
	pass

func set_from(f):
    from = f
    update_position()

func set_to(t):
    to = t
    update_position()

func _draw():
    if is_inside_tree():
        draw_line(get_node(from).position, get_node(to).position, Color(1, 1, 1, 0.2), 4.0, true)

func update_position():
    update() # _draw again
    if is_inside_tree() and from and to:
        get_node("button").position = (get_node(from).position + get_node(to).position) / 2

func set_button(v):
    button = v
    if is_inside_tree():
        get_node("button").button = v
