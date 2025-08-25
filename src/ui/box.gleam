import gleam/list
import gleam/string
import types/alignment.{type Alignment, Center, Left}
import types/box_style.{type BoxStyle}
import ui/progress.{progress_bar}
import utils/misc.{print_at}
import utils/text.{align_text, get_box_chars}

pub fn draw_box(x: Int, y: Int, width: Int, height: Int, style: BoxStyle) -> Nil {
  let #(tl, tr, bl, br, h, v) = get_box_chars(style)

  print_at(tl <> string.repeat(h, width - 2) <> tr, x, y)

  list.range(1, height - 2)
  |> list.each(fn(row) {
    print_at(v, x, y + row)
    print_at(v, x + width - 1, y + row)
  })

  print_at(bl <> string.repeat(h, width - 2) <> br, x, y + height - 1)
}

pub fn draw_box_with_title(
  x: Int,
  y: Int,
  width: Int,
  height: Int,
  style: BoxStyle,
  title: String,
) -> Nil {
  draw_box(x, y, width, height, style)

  let #(_, _, _, _, _h, _) = get_box_chars(style)
  let title_padded = " " <> title <> " "
  let title_length = string.length(title_padded)

  case title_length < width - 2 {
    True -> {
      let title_x = x + { width - title_length } / 2
      print_at(title_padded, title_x, y)
    }
    False -> Nil
  }
}

pub fn fill_box(
  x: Int,
  y: Int,
  width: Int,
  height: Int,
  fill_char: String,
) -> Nil {
  let fill_line = string.repeat(fill_char, width)
  list.range(0, height - 1)
  |> list.each(fn(row) { print_at(fill_line, x, y + row) })
}

pub fn draw_text_in_box(
  x: Int,
  y: Int,
  width: Int,
  height: Int,
  style: BoxStyle,
  title: String,
  content: List(String),
  alignment: Alignment,
) -> Nil {
  draw_box_with_title(x, y, width, height, style, title)

  let content_width = width - 2
  let content_y_start = y + 1
  let max_lines = height - 2

  list.take(content, max_lines)
  |> list.index_map(fn(line, index) {
    let aligned_line = align_text(line, content_width, alignment)
    print_at(aligned_line, x + 1, content_y_start + index)
  })
  |> list.length
  Nil
}

pub fn draw_menu_box(
  x: Int,
  y: Int,
  width: Int,
  title: String,
  options: List(String),
  selected: Int,
  style: BoxStyle,
) -> Nil {
  let height = list.length(options) + 2
  draw_box_with_title(x, y, width, height, style, title)

  list.index_map(options, fn(option, index) {
    let prefix = case index == selected {
      True -> "> "
      False -> "  "
    }
    let line = prefix <> option
    let aligned = align_text(line, width - 2, Left)
    print_at(aligned, x + 1, y + 1 + index)
  })
  |> list.length
  Nil
}

pub fn draw_progress_box(
  x: Int,
  y: Int,
  width: Int,
  title: String,
  current: Int,
  total: Int,
  style: BoxStyle,
) -> Nil {
  draw_box_with_title(x, y, width, 4, style, title)

  let bar = progress_bar(current, total, width - 4)
  print_at(align_text(bar, width - 2, Center), x + 1, y + 2)
}
