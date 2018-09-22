extends Node2D

onready var jumpTween = get_node("jumpTween")
onready var plop = get_node("plop")

func jump(t):
    jumpTween.interpolate_property(self, "position", position, t, 0.5, Tween.TRANS_EXPO, Tween.EASE_OUT)
    jumpTween.start()
    plop.play()
