extends Node

@onready var rich_text_label: RichTextLabel = $container/RichTextLabel
@onready var button: Button = $container/Button

var character_file_path: String = "res://docs/characters.txt"
var story_file_path: String = "res://docs/story.txt"

var arr = [story_file_path, character_file_path]
var count = 0

func _read_file(pathway: String) -> void:
	var file := FileAccess.open(pathway, FileAccess.READ)
	if file == null:
		push_error("Failed to open file. Error code: " + str(FileAccess.get_open_error()))
		return

	var content := file.get_as_text()
	rich_text_label.text = content

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_read_file(story_file_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	count += 1
	if count >= arr.size():
		rich_text_label.text = "EOF"
		return
	_read_file(arr[count])
