import event/loading.{loading_loop}
import gleam/int
import gleam/io
import gleam/string
import utils/misc.{clear_line, hide_cursor, overwrite_line, show_cursor, sleep}

pub fn countdown(seconds: Int) -> Nil {
  countdown_loop(seconds)
}

fn countdown_loop(remaining: Int) -> Nil {
  case remaining {
    0 -> {
      overwrite_line("Done!")
      io.println("")
    }
    _ -> {
      overwrite_line("Countdown: " <> int.to_string(remaining))
      sleep(1000)
      countdown_loop(remaining - 1)
    }
  }
}

pub fn typewriter_effect(text: String, delay_ms: Int) -> Nil {
  let chars = string.to_graphemes(text)
  typewriter_loop(chars, "", delay_ms)
  io.println("")
}

fn typewriter_loop(chars: List(String), current: String, delay: Int) -> Nil {
  case chars {
    [] -> Nil
    [char, ..rest] -> {
      let new_current = current <> char
      overwrite_line(new_current)
      sleep(delay)
      typewriter_loop(rest, new_current, delay)
    }
  }
}

pub fn loading_animation(text: String, duration_ms: Int) -> Nil {
  let frames = ["⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"]
  let frame_duration = 80
  let total_frames = duration_ms / frame_duration

  hide_cursor()
  loading_loop(text, frames, 0, total_frames)
  clear_line()
  show_cursor()
}
