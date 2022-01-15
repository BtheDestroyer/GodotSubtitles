extends Node

onready var manager = get_node(SubtitleManager.PATH)

func add_line(text : String, life_time : float, speaker : String = ""):
  var line = SubtitleLine.new(text, life_time)
  line.speaker = speaker
  manager.add_line(line)

func clear_lines():
  manager.clear_lines()
