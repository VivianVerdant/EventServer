extends Resource
class_name Event

@export_group("Event")
@export var name: String
@export var global: bool = false
@export var once: bool = false
@export var properties: Dictionary

var owner

func register(caller: Node):
	assert(name,  caller.to_string() + " Event must be given a valid name")
	
	owner = caller
	
	EventServer.register(self)

func trigger(caller: Node = owner):
	EventServer.trigger(self, caller)
