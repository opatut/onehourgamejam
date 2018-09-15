tool
extends VBoxContainer

export (String) var value setget set_value 
export (String) var label
export (bool) var rightAlign 

onready var popTween = get_node("popTween")
onready var valueNode = get_node("value")
onready var labelNode = get_node("label")


func set_value(v):
    if popTween and value != v:
        popTween.interpolate_property(valueNode, "rect_scale", Vector2(0, 0), Vector2(1, 1), 0.5, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
        popTween.start()
    value = v 

func _process(delta):
    valueNode.align = Label.ALIGN_LEFT if not rightAlign else Label.ALIGN_RIGHT
    labelNode.align = Label.ALIGN_LEFT if not rightAlign else Label.ALIGN_RIGHT
    labelNode.rect_pivot_offset.x = labelNode.rect_size.x if rightAlign else 0

    if value:
        valueNode.text = value

    if label:
        labelNode.text = label 
