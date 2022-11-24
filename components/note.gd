class_name Note extends Component

var control_ref:Control

func component_ready():
	var tween = control_ref.create_tween() as Tween
	tween.tween_property(control_ref, "modulate:a", 1.0, 0.3).from(0.0).set_trans(Tween.TRANS_CUBIC)


func on_selection_toggled():
	call_method(props.on_selection_toggled, [props.data.id])

func component_will_die():
	print("bye")

func view():
	return\
	control({ref="control_ref", preset="expand-h", custom_minimum_size=Vector2(180,180)},[
		margin({preset="full", const_margin_all=6}, [
			box({padding=20, background_color=props.data.color, border_width=6 if props.data.selected else 0, border_radius=10},[
				vbox({}, [
					label({preset="expand note_text", text=props.data.note}),
					label({preset="expand-h note_date", text=props.data.created})
				])
			])
		]),
		button({on_pressed=on_selection_toggled, preset="top-right", text="(x)" if props.data.selected else "(  )"}),
	])
