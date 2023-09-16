#EventServer Singleton
extends Node

var registered_events: Array
var registered_listeners: Array

var event_network: Dictionary

const event_prototype = preload("res://addons/event_system/event_object.gd")
const event_listener_prototype = preload("res://addons/event_system/event_listener_object.gd")


func register(resource: Resource):
	if resource is event_prototype:
		var event: Event = resource

		if event not in registered_events:
			registered_events.append(event)

			if not event_network.has(event.name):
				event_network.merge({event.name: []})

			print(event_network)
			return true

	elif resource is event_listener_prototype:
		var event_listener:EventListener = resource

		if event_listener not in registered_listeners:
			registered_listeners.append(event_listener)

			if event_network.has(event_listener.event_type.name):
				var arr: Array = event_network[event_listener.event_type.name]

				if not arr.has(event_listener):
					event_network[event_listener.event_type.name].append(event_listener)

			else:
				event_network.merge({event_listener.event_type.name: [event_listener]})
			
			print(event_network)
			return true
	
	print(event_network)
	return false

func trigger(event: Event, caller: Node):
	pass
