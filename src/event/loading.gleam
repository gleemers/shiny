import gleam/list
import utils/misc.{overwrite_line, sleep}

pub fn loading_loop(
  text: String,
  frames: List(String),
  current: Int,
  total: Int,
) -> Nil {
  case current < total {
    True -> {
      let frame_index = current % list.length(frames)
      let frame = case list.drop(frames, frame_index) |> list.first {
        Ok(f) -> f
        Error(_) -> "⠋"
      }
      overwrite_line(frame <> " " <> text)
      sleep(80)
      loading_loop(text, frames, current + 1, total)
    }
    False -> Nil
  }
}
