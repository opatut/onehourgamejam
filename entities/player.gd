extends Node2D

onready var jumpTween = get_node("jumpTween")
onready var plop = get_node("plop")

func jump(t):
    print(jumpTween, position, t)
    jumpTween.interpolate_property(self, "position", position, t, 0.2, Tween.TRANS_QUART, Tween.EASE_OUT)
    jumpTween.start()
    plop.play()
