class_name App extends Component

var colors = [Color(1,0.670588,0.568627,1), Color(1,0.8,0.501961,1), Color(0.905882,0.929412,0.607843,1), Color(0.505882,0.870588,0.917647,1), Color(0.811765,0.580392,0.854902,1)]
var line_edit_ref: LineEdit

func _init():
	super()
	state.notes = [{
		id="0", 
		note="How to make your personal brand stand out online", 
		created="2022-10-4", 
		color=colors[1], 
		selected=false
	}]

func add(t: String):
	t = t.strip_edges()
	if t == "": return
	state.notes.append({
		id=str(randi_range(0,100000000)), 
		note=t,
		created=Time.get_date_string_from_system(),
		selected=false,
		color=colors[randi_range(0, colors.size()-1)]
	})
	line_edit_ref.text = ""

func on_note_selection_toggled(id):
	var note = state.notes.filter(func(note): return note.id == id)[0]
	note.selected = not note.selected

func delete_selected_notes():
	state.notes = state.notes.filter(func(n): return not n.selected)

func view():
	return\
	margin({preset="full", const_margin_all=10}, [
		vbox({},[
			TopBar.new({notes=state.notes, on_delete_selected_notes=delete_selected_notes}),
			NotesList.new({notes=state.notes, on_note_selection_toggled=on_note_selection_toggled}),
			line_edit({ref="line_edit_ref", preset="expand-h", placeholder_text="Note +", on_text_submitted=add})
		])
	])
