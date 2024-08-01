extends TextureRect
var typer  : Tween
var is_typing : bool = false

@export var character_duration = 0.08
@onready var text_box = %TextBox
@onready var portrait = %Portrait

func _ready():
	Events.request_show_dialog.connect(type_dialog)
	
#	type_dialog("Hello, welcome to test world", load("res://Characters/ElizabethCharacter.tres"))
#	await Events.dialog_finished
#	type_dialog("Hello, welcome to test world", load("res://Characters/StumpyCharacter.tres"))
#	await Events.dialog_finished
#
func _unhandled_input(event):
	if not visible:return
	if event.is_action_pressed("ui_accept"):
		if is_typing:
			is_typing = false
			if typer is Tween : typer.kill()
			text_box.visible_ratio = 1
		else:
			hide()
			get_viewport().set_input_as_handled()
			get_tree().paused = false
			Events.emit_signal("dialog_finished")
			
			

func set_visible_characters (index):
	var is_new_character = index > text_box.visible_characters
	text_box.visible_characters = index
	
func type_dialog(bbcode,character):
	is_typing = true
	portrait.texture = character.portrait
	get_tree().paused = true
	show()
	text_box.bbcode_text = bbcode
	#await get_tree().process_frame #must wait for character total count to be accurate
	var total_characters = text_box.text.length()
	var duration = total_characters *character_duration
	
	typer = create_tween()
	typer.tween_method(set_visible_characters, 0, total_characters, duration)
	await typer.finished
	is_typing = false
	

