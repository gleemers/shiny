import gleam/io
import shiny.{
  center, clear_screen, confirm, double, draw_box, draw_text_in_box, hide_cursor,
  left, print_at, read_line, rounded, select_option, show_cursor, single, thick,
}

pub fn main() -> Nil {
  demo()
}

pub fn demo() -> Nil {
  clear_screen()
  draw_text_in_box(
    20,
    1,
    40,
    5,
    double,
    "Shiny",
    ["An advanced TUI Components for Gleam", "Press Enter to start the demo"],
    center,
  )
  read_line("")
  clear_screen()
  let show_more = confirm("Would you like to see individual component demos?")
  case show_more {
    True -> component_showcase()
    False -> {
      clear_screen()
      draw_text_in_box(25, 10, 30, 4, rounded, "Thanks!", ["Goodbye!"], center)
    }
  }
}

fn component_showcase() -> Nil {
  clear_screen()
  io.println("Box Styles:")
  io.println("")
  draw_box(5, 3, 15, 4, single)
  print_at("Single", 7, 5)
  draw_box(25, 3, 15, 4, double)
  print_at("Double", 27, 5)
  draw_box(45, 3, 15, 4, rounded)
  print_at("Rounded", 47, 5)
  draw_box(65, 3, 15, 4, thick)
  print_at("Thick", 67, 5)
  read_line("")

  clear_screen()
  draw_text_in_box(
    10,
    2,
    60,
    8,
    single,
    "Text Alignment",
    ["Left aligned text"],
    left,
  )
  draw_text_in_box(
    10,
    12,
    60,
    8,
    double,
    "Center Alignment",
    ["This text is centered", "Multiple lines", "All centered!"],
    center,
  )
  read_line("")

  clear_screen()
  hide_cursor()

  let options = [
    "Box Drawing",
    "Progress Bars",
    "Loading Animations",
    "Text Alignment",
    "Menu Systems",
  ]

  let selected_text = select_option("Select Your Favorite Feature", options)

  show_cursor()

  clear_screen()
  draw_text_in_box(
    15,
    8,
    50,
    6,
    thick,
    "You Selected!",
    [
      "Your favorite feature is:",
      selected_text,
      "Great choice!",
    ],
    center,
  )
  read_line("")

  clear_screen()
  draw_text_in_box(
    15,
    8,
    50,
    6,
    thick,
    "Thank You!",
    [
      "You've seen all the advanced features!",
      "Now build an amazing TUI app that shines!",
      "Have a good day!",
    ],
    center,
  )
  io.println("\n")
  read_line("")
  Nil
}
