tool
extends EditorPlugin

func _enter_tree():
	# Usage Tracking
	# See: https://github.com/BtheDestroyer/GodotArgParse#privacy-notice
	var http = HTTPRequest.new()
	add_child(http)
	var project_hash = ProjectSettings.get_setting("application/config/name").sha256_text()
	http.request("https://pluginstats.brycedixon.dev/", [], true, HTTPClient.METHOD_POST, JSON.print({plugin="Subtitles", project=project_hash}))
	# Usage Tracking
  add_autoload_singleton(SubtitleManager.NAME, "res://addons/subtitles/SubtitleManager.gd")
  add_custom_type("SubtitleInterface", "Node", preload("res://addons/subtitles/SubtitleInterface.gd"), preload("res://addons/subtitles/SubtitleInterface.svg"))

func _exit_tree():
  remove_autoload_singleton(SubtitleManager.NAME)
  remove_custom_type("SubtitleInterface")
