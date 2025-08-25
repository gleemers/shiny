import event/loading
import types/alignment
import types/box_style
import types/state
import ui/animation
import ui/box
import ui/panel
import ui/progress
import ui/prompt
import utils/misc
import utils/text

/// Shiny: a tiny TUI toolkit for Gleam.
///
/// Import `shiny` to access the most common building blocks re-exported
/// from submodules: types, box drawing, prompts, animations, and utils.
///
/// ```gleam
/// import shiny
///
/// pub fn main() {
///   shiny.clear_screen()
///   shiny.draw_box(2, 2, 20, 5, shiny.single)
/// }
/// ```
/// Construct a fresh TUI state.
///
/// ```gleam
/// let state = shiny.new()
/// ```
pub fn new() -> state.TuiState {
  state.TuiState(current_line: "", history: [])
}

/// Shorthand for the `TuiState` record.
pub const tui_state = state.TuiState

/// Left text alignment.
pub const left = alignment.Left

/// Center text alignment.
pub const center = alignment.Center

/// Right text alignment.
pub const right = alignment.Right

/// Single-line box style.
pub const single = box_style.Single

/// Double-line box style.
pub const double = box_style.Double

/// Thick-line box style.
pub const thick = box_style.Thick

/// Rounded-corner box style.
pub const rounded = box_style.Rounded

/// Animated countdown: prints remaining seconds.
///
/// ```gleam
/// shiny.countdown(3)
/// ```
pub const countdown = animation.countdown

/// Spinner animation next to a message.
///
/// ```gleam
/// shiny.loading_animation("Loading", 1200)
/// ```
pub const loading_animation = animation.loading_animation

/// Typewriter effect for a line of text.
///
/// ```gleam
/// shiny.typewriter_effect("Hello", 30)
/// ```
pub const typewriter_effect = animation.typewriter_effect

/// Draw an empty box at position.
///
/// ```gleam
/// shiny.draw_box(2, 2, 20, 5, shiny.single)
/// ```
pub const draw_box = box.draw_box

/// Fill a rectangular area with a character.
///
/// ```gleam
/// shiny.fill_box(2, 3, 10, 2, ".")
/// ```
pub const fill_box = box.fill_box

/// Draw a box with a centered title.
///
/// ```gleam
/// shiny.draw_box_with_title(2, 2, 24, 5, shiny.double, "Demo")
/// ```
pub const draw_box_with_title = box.draw_box_with_title

/// Draw a progress box with a percentage bar.
///
/// ```gleam
/// shiny.draw_progress_box(2, 2, 30, "Build", 7, 10, shiny.rounded)
/// ```
pub const draw_progress_box = box.draw_progress_box

/// Draw a simple vertical menu; `selected` is the index.
///
/// ```gleam
/// shiny.draw_menu_box(2, 2, 20, "Menu", ["One", "Two"], 0, shiny.single)
/// ```
pub const draw_menu_box = box.draw_menu_box

/// Draw text inside a box with alignment.
///
/// ```gleam
/// shiny.draw_text_in_box(2, 2, 28, 6, shiny.single, "Info", ["Line 1", "Line 2"], shiny.center)
/// ```
pub const draw_text_in_box = box.draw_text_in_box

/// Convenience info panel.
pub const draw_info_panel = panel.draw_info_panel

/// Build a progress bar string like "[██░░] 50%".
///
/// ```gleam
/// let bar = shiny.progress_bar(5, 10, 10)
/// ```
pub const progress_bar = progress.progress_bar

/// Yes/No prompt, returns `True` on yes.
///
/// ```gleam
/// let ok = shiny.confirm("Proceed?")
/// ```
pub const confirm = prompt.confirm

/// Select an option by number; returns the chosen string or empty.
///
/// ```gleam
/// let choice = shiny.select_option("Pick", ["A", "B"])
/// ```
pub const select_option = prompt.select_option

/// Ask the user for input; trims the result.
///
/// ```gleam
/// let name = shiny.prompt_user("Name")
/// ```
pub const prompt_user = prompt.prompt

/// Clear the terminal screen and move cursor to home.
pub const clear_screen = misc.clear_screen

/// Clear the current line.
pub const clear_line = misc.clear_line

/// Show the cursor.
pub const show_cursor = misc.show_cursor

/// Hide the cursor.
pub const hide_cursor = misc.hide_cursor

/// Move cursor up by N lines.
pub const move_cursor_up = misc.move_cursor_up

/// Move cursor down by N lines.
pub const move_cursor_down = misc.move_cursor_down

/// Replace the current line with new text.
pub const overwrite_line = misc.overwrite_line

/// Read a line with a prompt (raw, untrimmed).
pub const read_line = misc.read_line

/// Print text at `x,y` (1-based).
pub const print_at = misc.print_at

/// Sleep for `time` milliseconds.
pub const sleep = misc.sleep

/// Align text within a width using an alignment.
///
/// ```gleam
/// let s = shiny.align_text("hi", 6, shiny.right)
/// ```
pub const align_text = text.align_text

/// Box-drawing characters for a given style.
pub const get_box_chars = text.get_box_chars

/// Overwrite a line, padding to hide old characters.
pub const overwrite_with_padding = text.overwrite_with_padding

/// Internal loading loop used by `loading_animation`.
pub const loading_loop = loading.loading_loop
