extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_start_pressed():
	$AnimationPlayer.play_backwards("Start")
	yield($AnimationPlayer,"animation_finished")
	get_tree().change_scene("res://src/Game.tscn")


func _on_setting_pressed():
	$UI/Menu/AnimationPlayer.play("ShowSetting")


func _on_HowToPlay_pressed():
	OS.alert("""
按住 ↑ ↓ ← → 进行飞机的移动，子弹会自动进行发射，按 Enter/Space 进行炸弹发射。
子弹和炸弹补给会在战斗中发放，有一定间隔时间。
祝您游戏愉快！
""", "游戏玩法")


func _on_Quit_pressed():
	get_tree().quit()


func _on_BGM_pressed():
	pass # Replace with function body.


func _on_SFX_pressed():
	pass # Replace with function body.


func _on_Back_pressed():
	$UI/Menu/AnimationPlayer.play_backwards("ShowSetting")
