tool
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
        get_node("../..").onClickIsland(self)

func _draw():
    circ(Vector2(0, 0), 32, Color(0, 1, 0), 2.0, 16)

func circ(c, r, col, w=1.0, seg=r/2):
    for x in seg:
        var from = c + Vector2(r, 0).rotated(1.0 * x / seg * 2 * PI)
        var to = c + Vector2(r, 0).rotated((x+1.0) / seg * 2 * PI)
        draw_line(from, to, col, w, true)

func _process(delta):
    life += delta

    starNode.rotation = life * 0.1
    starNode.visible = star
	
