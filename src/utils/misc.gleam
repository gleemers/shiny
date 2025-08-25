import ffi/get_line
import gleam/erlang/process
import gleam/int
import gleam/io

pub fn sleep(time: Int) {
  process.sleep(time)
}

pub fn print_at(text: String, x: Int, y: Int) -> Nil {
  let escape_seq =
    "\u{001B}[" <> int.to_string(y) <> ";" <> int.to_string(x) <> "H"
  io.print(escape_seq <> text)
}

pub fn clear_screen() -> Nil {
  io.print("\u{001B}[2J\u{001B}[H")
}

pub fn clear_line() -> Nil {
  io.print("\u{001B}[2K\r")
}

pub fn hide_cursor() -> Nil {
  io.print("\u{001B}[?25l")
}

pub fn show_cursor() -> Nil {
  io.print("\u{001B}[?25h")
}

pub fn move_cursor_up(lines: Int) -> Nil {
  io.print("\u{001B}[" <> int.to_string(lines) <> "A")
}

pub fn move_cursor_down(lines: Int) -> Nil {
  io.print("\u{001B}[" <> int.to_string(lines) <> "B")
}

pub fn overwrite_line(new_text: String) -> Nil {
  clear_line()
  io.print(new_text)
}

pub fn read_line(prompt: String) -> String {
  get_line.get_line(prompt)
}
