import gleam/float
import gleam/int
import gleam/string

pub fn progress_bar(current: Int, total: Int, width: Int) -> String {
  let progress = case total {
    0 -> 0.0
    _ -> int.to_float(current) /. int.to_float(total)
  }
  let filled = float.round(progress *. int.to_float(width))
  let filled_str = string.repeat("█", filled)
  let empty_str = string.repeat("░", width - filled)
  let percentage = float.round(progress *. 100.0)
  "[" <> filled_str <> empty_str <> "] " <> int.to_string(percentage) <> "%"
}
