# whatever node type ur using
extends Something

# use ur prefered way of storing these variables i prefer export
@export var dialogue_resource : DialogueResource
@export var dialogue_start: String = "start"


func action() -> void:
	dialogueManager.show_example_dialogue_ballon(dialogue_resource, dialogue_start)

