import ffi/get_line
import gleam/int
import gleam/io
import gleam/list
import gleam/string

pub fn prompt(question: String) -> String {
  io.print(question <> ": ")
  get_line.get_line("") |> string.trim
}

pub fn confirm(question: String) -> Bool {
  let answer = prompt(question <> " (y/n)")
  case string.lowercase(answer) {
    "y" | "yes" -> True
    _ -> False
  }
}

pub fn select_option(question: String, options: List(String)) -> String {
  io.println(question)
  list.index_map(options, fn(option, index) {
    io.println(int.to_string(index + 1) <> ". " <> option)
  })

  let choice = prompt("Select option")
  let options_length = list.length(options)
  case int.parse(choice) {
    Ok(num) if num > 0 && num <= options_length -> {
      case list.drop(options, num - 1) |> list.first {
        Ok(option) -> option
        Error(_) -> ""
      }
    }
    _ -> ""
  }
}
