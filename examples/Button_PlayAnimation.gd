extends Button

onready var animationPlayer = $AnimationPlayer

func _on_Button_pressed():
  print("Playing animation...")
  animationPlayer.play("Play")
  animationPlayer.get_animation("Play").loop = false
