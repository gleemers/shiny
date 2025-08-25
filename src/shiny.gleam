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

// State module
pub fn new() -> state.TuiState {
  state.TuiState(current_line: "", history: [])
}

pub const tui_state = state.TuiState

// Types - Alignment
pub const left = alignment.Left

pub const center = alignment.Center

pub const right = alignment.Right

// Types - Box Style
pub const single = box_style.Single

pub const double = box_style.Double

pub const thick = box_style.Thick

pub const rounded = box_style.Rounded

// UI - Animation
pub const countdown = animation.countdown

pub const loading_animation = animation.loading_animation

pub const typewriter_effect = animation.typewriter_effect

// UI - Box
pub const draw_box = box.draw_box

pub const fill_box = box.fill_box

pub const draw_box_with_title = box.draw_box_with_title

pub const draw_progress_box = box.draw_progress_box

pub const draw_menu_box = box.draw_menu_box

pub const draw_text_in_box = box.draw_text_in_box

// UI - Panel
pub const draw_info_panel = panel.draw_info_panel

// UI - Progress
pub const progress_bar = progress.progress_bar

// UI - Prompt
pub const confirm = prompt.confirm

pub const select_option = prompt.select_option

pub const prompt_user = prompt.prompt

// Utils - Misc
pub const clear_screen = misc.clear_screen

pub const clear_line = misc.clear_line

pub const show_cursor = misc.show_cursor

pub const hide_cursor = misc.hide_cursor

pub const move_cursor_up = misc.move_cursor_up

pub const move_cursor_down = misc.move_cursor_down

pub const overwrite_line = misc.overwrite_line

pub const read_line = misc.read_line

pub const print_at = misc.print_at

pub const sleep = misc.sleep

// Utils - Text
pub const align_text = text.align_text

pub const get_box_chars = text.get_box_chars

pub const overwrite_with_padding = text.overwrite_with_padding

// Event - Loading
pub const loading_loop = loading.loading_loop
