import gleam/io
import gleam/string
import types/alignment.{type Alignment, Center, Left, Right}
import types/box_style.{type BoxStyle, Double, Rounded, Single, Thick}

pub fn overwrite_with_padding(old_text: String, new_text: String) -> Nil {
  let old_length = string.length(old_text)
  let new_length = string.length(new_text)
  let padding_needed = case old_length > new_length {
    True -> old_length - new_length
    False -> 0
  }
  let padding = string.repeat(" ", padding_needed)
  io.print("\r" <> new_text <> padding)
}

pub fn get_box_chars(
  style: BoxStyle,
) -> #(String, String, String, String, String, String) {
  case style {
    Single -> #("┌", "┐", "└", "┘", "─", "│")
    Double -> #("╔", "╗", "╚", "╝", "═", "║")
    Rounded -> #("╭", "╮", "╰", "╯", "─", "│")
    Thick -> #("┏", "┓", "┗", "┛", "━", "┃")
  }
}

pub fn align_text(text: String, width: Int, alignment: Alignment) -> String {
  let text_length = string.length(text)
  case text_length >= width {
    True -> string.slice(text, 0, width)
    False -> {
      let padding = width - text_length
      case alignment {
        Left -> text <> string.repeat(" ", padding)
        Right -> string.repeat(" ", padding) <> text
        Center -> {
          let left_pad = padding / 2
          let right_pad = padding - left_pad
          string.repeat(" ", left_pad) <> text <> string.repeat(" ", right_pad)
        }
      }
    }
  }
}
