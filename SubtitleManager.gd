extends Node

class_name SubtitleManager

const NAME = "Subtitle_Manager"
const PATH = "/root/%s" % NAME

var lines = []

func add_line(line : SubtitleLine):
  lines.append(line)

func clear_lines():
  lines.clear()

func set_lines(lines : Array):
  lines = lines.duplicate()

func _process(delta : float):
  # Decrement life time of all lines by delta
  var i = 0
  while i < len(lines):
    lines[i].life_time -= delta
    if lines[i].life_time <= 0.0:
      lines.remove(i)
    else:
      i += 1
