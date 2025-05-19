{ pkgs, ... }:
{
  enable = true;

  config = {
    focus_follows_mouse = "off";
    mouse_follows_focus = "off";
    window_placement    = "second_child";
    window_opacity      = "on";
    top_padding         = 6;
    bottom_padding      = 6;
    left_padding        = 6;
    right_padding       = 6;
    window_gap          = 6;
    layout              = "bsp";
  };
}
