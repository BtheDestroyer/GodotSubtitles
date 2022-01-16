extends RichTextLabel

export var prefix = "[center]"
export var suffix = "[/center]"

onready var manager = get_node(SubtitleManager.PATH)
onready var animationStateMachine = $AnimationTree["parameters/playback"]

func _process(delta : float):
  var has_lines = len(manager.lines) > 0
  if has_lines:
    animationStateMachine.travel("Open")
    var text : String
    for line in manager.lines:
      text += line.text + "\n"
    text.erase(len(text) - 1, 1)
    if self.bbcode_enabled:
      self.bbcode_text = prefix + text + suffix
    else:
      self.text = prefix + text + suffix
  else:
    animationStateMachine.travel("Closed")
