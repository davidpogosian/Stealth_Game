class_name Interactable
extends StaticBody3D

signal interacted(user)

@export var prompt_message = "Interact"
@export var prompt_action = "interact"

func get_prompt():
	# find key name ( like "E" ) from InputMap based on prompt_action 
	var key_name = ""
	for action in InputMap.get_actions():
		var action_events = InputMap.action_get_events( prompt_action )
		for event in action_events:
			if event is InputEventKey:
				key_name = OS.get_keycode_string( event.physical_keycode )
	return prompt_message + "\n[" + key_name + "]"

func interact(user):
	emit_signal("interacted", user)
