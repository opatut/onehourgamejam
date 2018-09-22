tool
extends Node2D

export (int) var button = 0 setget set_button

const BUTTONS = ["Q", "W", "E", "R"]

func _ready():
    set_button_label()

func set_button(v):
    button = v
    set_button_label()

func set_button_label(): 
    if is_inside_tree():
        get_node("label").text = BUTTONS[button]


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
