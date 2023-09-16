extends Sprite2D

@export var alive: Event

signal enter

func _ready():
	alive.register(self)

func _process(_delta):
	pass

func _input(event: InputEvent):
	if event.is_action_released("ui_accept"):
		alive.trigger()
