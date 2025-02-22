function draw_window_update() {
	// draw_window_update()
	var x1, y1, a, n, fullstr, str, strb;
	windowanim = 1
	if (theme = 3) draw_set_alpha(windowalpha)
	if (window = w_update && theme != 3) windowopen = 1
	fullstr = changelogstr
	if (fullstr = 0) {
		if (language != 1) show_message("Changelist not found!")
		else show_message("找不到更新历史！")
		if (window = w_update) {
	        window = w_greeting
	    } else {
	        window = 0
	    }
		return 0
	}
	x1 = floor(rw / 2 - 250)
	y1 = floor(rh / 2 - 200) + windowoffset
	draw_window(x1, y1, x1 + 500, y1 + 400)
	draw_theme_font(font_main_bold)
	
	if (language != 1) {
	if (RUN_FROM_IDE != 1) {
		draw_text_dynamic(x1 + 8, y1 + 8, "Changelist (You're running from the IDE!)")
	} else {
		if (window = w_update) draw_text_dynamic(x1 + 8, y1 + 8, "Update")
		else draw_text_dynamic(x1 + 8, y1 + 8, "Changelist")
	}
	} else {
	if (RUN_FROM_IDE != 1) {
		draw_text_dynamic(x1 + 8, y1 + 8, "更新历史（正在IDE中运行！）")
	} else {
		if (window = w_update) draw_text_dynamic(x1 + 8, y1 + 8, "更新")
		else draw_text_dynamic(x1 + 8, y1 + 8, "更新历史")
	}
	}
	
	draw_theme_font(font_main)
	if (language != 1) {
		if (window = w_update) {
			draw_text_dynamic(x1 + 32, y1 + 32, "Thank you for upgrading to version " + version + "!")
		}
	} else {
		if (window = w_update) {
			draw_text_dynamic(x1 + 32, y1 + 32, "感谢你更新到" + version + "版本！")
		}
	}
	draw_area(x1 + 16, y1 + 58, x1 + 487, y1 + 357)
	n = string_count("\n", fullstr) 
	for (a = 0; a < n; a += 1) {
	    str[a] = string_copy(fullstr, 1, string_pos("\n", fullstr) - 1)
	    strb[a] = 0
	    if (string_char_at(str[a], 1) = "C") strb[a] = 1
	    fullstr = string_delete(fullstr, 1, string_pos("\n", fullstr))
	}
	for (a = sb_val[update_scrollbar]; a < sb_val[update_scrollbar] + 18; a += 1) {
	    if (a >= n) break
	    if (strb[a]) draw_theme_font(font_main_bold)
	    else draw_theme_font(font_main)
	    draw_text(x1 + 32, y1 + 64 + 16 * (a - sb_val[update_scrollbar]), str[a])
	}
	draw_theme_font(font_main)
	draw_scrollbar(update_scrollbar, x1 + 470, y1 + 60, 12, 22, n, 0, 1)
	if (draw_button2(x1 + 16, y1 + 365, 96, condstr(language != 1, "Older versions...", "Older versions..."))) {
		open_url("https://hielkeminecraft.github.io/OpenNoteBlockStudio/changelog")
	}
	if (draw_button2(x1 + 487 - 72, y1 + 365, 72, condstr(language != 1, "OK", "确认")) && (windowopen = 1 || theme != 3)) {
	    if (window = w_update) {
	        window = w_greeting
			save_settings() // Save new version number
	    } else {
	        windowclose = 1
	    }
	}
	if (array_length(text_mouseover) = 0) window_set_cursor(cr_default)
}
