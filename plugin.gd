tool
extends EditorPlugin

func _enter_tree():
  add_autoload_singleton(SubtitleManager.NAME, "res://addons/subtitles/SubtitleManager.gd")
  add_custom_type("SubtitleInterface", "Node", preload("res://addons/subtitles/SubtitleInterface.gd"), preload("res://addons/subtitles/SubtitleInterface.svg"))

func _exit_tree():
  remove_autoload_singleton(SubtitleManager.NAME)
  remove_custom_type("SubtitleInterface")
