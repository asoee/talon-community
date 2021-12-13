-
# uncomment user.talon_populate_lists tag to activate talon-specific lists of actions, scopes, modes etcetera. 
# Do not enable this tag with dragon, as it will be unusable.
# with conformer, the latency increase may also be unacceptable depending on your cpu
# see https://github.com/knausj85/knausj_talon/issues/600
tag(): user.talon_populate_lists

talent check updates: menu.check_for_updates()
talent restart: user.exec("talon-restart")
talent open log: menu.open_log()
talent open rebel: menu.open_repl()
talent home: menu.open_talon_home()
talent copy context pie: user.talon_add_context_clipboard_python()
talent copy context: user.talon_add_context_clipboard()
talent copy name:
    name = app.name()
    clip.set_text(name)  
talent copy executable:
    executable = app.executable()
    clip.set_text(executable)
talent copy bundle:
    bundle = app.bundle()
    clip.set_text(bundle)
talent copy title: 
    title = win.title()
    clip.set_text(title)
talent dump version: 
    result = user.talon_version_info()
    print(result)
talent insert version: 
    result = user.talon_version_info()
    user.paste(result)
talent dump context: 
    result = user.talon_get_active_context()
    print(result)
^talent test last$:
    phrase = user.history_get(1)
    user.talon_sim_phrase(phrase)
^talent test numb <number_small>$:
    phrase = user.history_get(number_small)
    user.talon_sim_phrase(phrase)
^talent test <phrase>$:
    user.talon_sim_phrase(phrase)
# requires user.talon_populate_lists tag. do not use with dragon
^talent debug action {user.talon_actions}$: 
    user.talon_action_find("{user.talon_actions}")
# requires user.talon_populate_lists tag. do not use with dragon
^talent debug list {user.talon_lists}$:
    user.talon_debug_list(talon_lists)
# requires user.talon_populate_lists tag. do not use with dragon
^talent copy list {user.talon_lists}$:
    user.talon_copy_list(talon_lists)
^talent debug tags$:
    user.talon_debug_tags()
^talent debug modes$:
    user.talon_debug_modes()
# requires user.talon_populate_lists tag. do not use with dragon
^talent debug scope {user.talon_scopes}$:
    user.talon_debug_scope(talon_scopes)
# requires user.talon_populate_lists tag. do not use with dragon
^talent debug setting {user.talon_settings}$:
    user.talon_debug_setting(talon_settings)
^talent debug all settings$: 
    user.talon_debug_all_settings()
^talent debug active app$: 
    result = user.talon_get_active_application_info()
    print("**** Dumping active application **** ")
    print(result)
    print("***********************")
^talent copy active app$:
    result = user.talon_get_active_application_info()
    clip.set_text(result)
