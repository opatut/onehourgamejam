tool
extends VBoxContainer

export (String) var value setget set_value 
export (String) var label setget set_label
export (bool) var rightAlign  setget set_right_align

onready var popTween = get_node("popTween")
onready var valueNode = get_node("value")
onready var labelNode = get_node("label")


func set_value(v):
    if value != v:
        if popTween:
            popTween.interpolate_property(valueNode, "rect_scale", Vector2(0, 0), Vector2(1, 1), 0.5, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
            popTween.start()
        value = v 
        refresh()

func set_label(l):
    if label != l:
        label = l
        refresh()

func set_right_align(r):
    if rightAlign != r:
        rightAlign = r
        refresh()

func refresh():
    valueNode.align = Label.ALIGN_LEFT if not rightAlign else Label.ALIGN_RIGHT
    labelNode.align = Label.ALIGN_LEFT if not rightAlign else Label.ALIGN_RIGHT
    valueNode.rect_pivot_offset.x = valueNode.rect_size.x if rightAlign else 0

    if value:
        valueNode.text = value

    if label:
        labelNode.text = label 
