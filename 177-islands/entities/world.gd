extends Node2D

onready var Island = preload("res://entities/island.tscn")
onready var Bridge = preload("res://entities/bridge.tscn")

const WIDTH = 800
const HEIGHT = 600
const MAX_JUMP = 250

onready var playerNode = get_node("../player")
onready var islands = get_node("islands")
onready var bridges = get_node("bridges")
var playerIsland
var timeLeft

func _ready():
    randomize()
    generate()

const BUTTONS = [KEY_Q, KEY_W, KEY_E, KEY_R]

func _input(e):
    if e is InputEventKey and e.pressed:
        var idx = BUTTONS.find(e.scancode)
        if idx != -1:
            press_button(idx)

func press_button(idx):
    pass


func get_bridges_from(node):
    birdget

func generate():
    for child in islands.get_children():
        child.queue_free()

    timeLeft = 5

    var i = Island.instance()
    i.position = Vector2(0, 0)
    islands.add_child(i)
    playerIsland = i

    for x in 12:
        i = Island.instance()

        for x in 2:
            i.position = Vector2(rand_range(-WIDTH/2, WIDTH/2), rand_range(-HEIGHT/2, HEIGHT/2))
            i.star = randf() < 0.5
            var too_close = false
            var too_far = true
            for child in islands.get_children():
                var dist =(i.position - child.position).length()
                if  dist < 100:
                    too_close = true

                if dist < MAX_JUMP:
                    too_far = false

            if not too_close and not too_far:
                islands.add_child(i)
                break

    var islandNodes = islands.get_children()
    for i in range(len(islandNodes)):
        for j in range(i, len(islandNodes)):
            var dist = (islandNodes[i].position - islandNodes[j].position).length()
            if dist < MAX_JUMP:
                var b = Bridge.instance()
                bridges.add_child(b)
                b.from = b.get_path_to(islandNodes[i])
                b.to = b.get_path_to(islandNodes[j])



func _process(delta):
    timeLeft  -= delta

    if timeLeft <= 0:
        lose()

    get_node("../../guiCanvas/gui/starsLeft").value = str(count_stars())

    var minutes = (int(ceil(timeLeft)) % 60) / 60
    var seconds = int(ceil(timeLeft)) - 60 * minutes
    get_node("../../guiCanvas/gui/timeLeft").value = "%d:%02d" % [minutes, seconds]

func onClickIsland(island):
    if playerIsland != island:
        var dist = (playerIsland.position - island.position).length()
        if dist <= MAX_JUMP:
            playerNode.jump(island.position)
            playerIsland = island

            if island.star:
                island.star = false
                timeLeft += 1

                if count_stars() == 0:
                    win()


func count_stars():
    var c = 0
    for child in islands.get_children():
        if child.star:
            c += 1
    return c

func win():
    get_tree().change_scene("res://scenes/win.tscn")

func lose():
    get_tree().change_scene("res://scenes/lose.tscn")
