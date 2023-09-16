extends Resource
class_name EventListener

@export var event_type: Event
@export var target: String = "on_event"

var owner

func register(caller: Node):
	assert(event_type, caller.to_string() + " Must specify an event type to listen for")
	assert(target, caller.to_string() + " Must specify a target function")
	
	owner = caller
	
	EventServer.register(self)

func on_event():
	pass

