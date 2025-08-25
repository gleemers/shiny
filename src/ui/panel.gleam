import gleam/list
import types/alignment.{Left}
import types/box_style.{type BoxStyle}
import ui/box.{draw_box_with_title}
import utils/misc.{print_at}
import utils/text.{align_text}

pub fn draw_info_panel(
  x: Int,
  y: Int,
  width: Int,
  height: Int,
  title: String,
  info: List(#(String, String)),
  style: BoxStyle,
) -> Nil {
  draw_box_with_title(x, y, width, height, style, title)

  let max_lines = height - 2
  list.take(info, max_lines)
  |> list.index_map(fn(item, index) {
    let #(key, value) = item
    let line = key <> ": " <> value
    let aligned = align_text(line, width - 2, Left)
    print_at(aligned, x + 1, y + 1 + index)
  })
  |> list.length
  Nil
}
