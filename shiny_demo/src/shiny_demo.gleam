import gleam/io
import gleam/list
import shiny.{
  align_text, center, clear_line, clear_screen, confirm, countdown, double,
  draw_box, draw_box_with_title, draw_info_panel, draw_menu_box,
  draw_text_in_box, fill_box, get_box_chars, hide_cursor, left,
  loading_animation, move_cursor_down, move_cursor_up, new, overwrite_line,
  overwrite_with_padding, print_at, progress_bar, prompt_user, read_line, right,
  rounded, select_option, show_cursor, single, sleep, thick, typewriter_effect,
}

pub fn main() -> Nil {
  demo()
}

fn pause(message: String) -> Nil {
  io.println("")
  let _ = read_line(message)
  Nil
}

pub fn demo() -> Nil {
  clear_screen()
  draw_text_in_box(
    18,
    1,
    44,
    5,
    double,
    "Shiny",
    ["Tiny TUI toolkit for Gleam", "Press Enter to start"],
    center,
  )
  pause("")

  let _state = new()

  clear_screen()
  let name = prompt_user("What's your name")
  typewriter_effect("Welcome, " <> name <> "!", 24)
  pause("Press Enter to continue…")

  clear_screen()
  io.println("Box Styles:")
  draw_box(5, 3, 15, 4, single)
  print_at("Single", 7, 5)
  draw_box(25, 3, 15, 4, double)
  print_at("Double", 27, 5)
  draw_box(45, 3, 15, 4, rounded)
  print_at("Rounded", 47, 5)
  draw_box(65, 3, 15, 4, thick)
  print_at("Thick", 67, 5)
  pause("\n\nPress Enter for titled boxes…")

  clear_screen()
  draw_box_with_title(10, 4, 60, 10, rounded, "Filled Area")
  fill_box(11, 8, 58, 5, ".")
  pause("\n\nPress Enter for text panels…")

  clear_screen()
  draw_text_in_box(4, 2, 38, 8, single, "Left", ["This is left aligned"], left)
  draw_text_in_box(
    44,
    2,
    38,
    8,
    double,
    "Center",
    ["This text is centered", "Multiple lines", "All centered!"],
    center,
  )
  print_at("|" <> align_text("align left", 24, left) <> "|", 8, 12)
  print_at("|" <> align_text("align center", 24, center) <> "|", 8, 13)
  print_at("|" <> align_text("align right", 24, right) <> "|", 8, 14)
  pause("\n\nPress Enter for info panel…")

  clear_screen()
  draw_info_panel(
    10,
    4,
    60,
    8,
    "Info Panel",
    [#("User", name), #("Language", "Gleam"), #("Library", "shiny")],
    thick,
  )
  // todo: fix
  // pause("\n\n\n\nPress Enter for progress…")

  // clear_screen()
  // let total = 20
  // let _ =
  //   list.range(0, total)
  //   |> list.each(fn(i) {
  //     draw_progress_box(10, 4, 60, "Building", i, total, rounded)
  //     overwrite_line("")
  //     sleep(80)
  //   })
  pause("\n\n\n\nPress Enter for menu…")

  clear_screen()
  let options = ["Boxes", "Progress", "Animations", "Text", "Menus"]
  let cycles = 2
  let count = list.length(options) * cycles
  let _ =
    list.range(0, count - 1)
    |> list.each(fn(i) {
      let sel = i % list.length(options)
      draw_menu_box(20, 5, 40, "Menu", options, sel, single)
      sleep(140)
    })
  pause("\n\nPress Enter for prompts…")

  clear_screen()
  hide_cursor()
  let picked = select_option("Select your favorite feature", options)
  show_cursor()
  draw_text_in_box(14, 8, 52, 6, thick, "You selected", [picked], center)
  pause("\n\n\n\nPress Enter for confirm prompt…")

  clear_screen()
  let ok = confirm("Do you want to continue")
  let confirm_text = case ok {
    True -> "You chose yes"
    False -> "You chose no"
  }
  draw_text_in_box(14, 8, 52, 6, rounded, "Confirm", [confirm_text], center)
  pause("\n\n\n\nPress Enter for line updates…")

  clear_screen()
  io.println("This line will be replaced…")
  overwrite_line("Replaced line using overwrite_line")
  io.println("")
  let old = "Status: downloading 99%"
  io.println(old)
  overwrite_with_padding(old, "Status: done")
  io.println("")
  pause("\n\nPress Enter for cursor moves…")

  clear_screen()
  io.println("Top line")
  io.println("Bottom line")
  move_cursor_up(2)
  overwrite_line("Top line (edited)")
  move_cursor_down(1)
  overwrite_line("Bottom line (edited)")
  io.println("")
  pause("\n\nPress Enter for animations…")

  clear_line()
  loading_animation("Working…", 1200)
  countdown(3)
  pause("\n\nPress Enter for box chars + progress bar…")

  clear_screen()
  let styles = [single, double, rounded, thick]
  let _ =
    list.index_map(styles, fn(style, idx) {
      let #(tl, tr, bl, br, h, v) = get_box_chars(style)
      let line = "Chars: " <> tl <> tr <> bl <> br <> h <> v
      print_at(line, 6, 3 + idx)
    })
  io.println("")
  io.println("Progress bar strings:")
  io.println(progress_bar(3, 10, 20))
  io.println(progress_bar(7, 10, 20))
  pause("\n\nPress Enter to finish…")

  clear_screen()
  draw_text_in_box(
    22,
    8,
    36,
    5,
    rounded,
    "Thanks!",
    ["Now go make TUIs that shine!"],
    center,
  )
  io.println("\n\n\n\n\n")
  Nil
}
