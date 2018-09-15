extends Area2D

export (bool) var star = false

onready var life = 0

var starNode
var islandNode

func _ready():
    starNode = get_node("star")
    islandNode = get_node("Sprite")

func _input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed: 
        get_node("..").onClickIsland(self)

func _process(delta):
    life += delta

    starNode.rotation = life * 0.1
    starNode.visible = star
	
