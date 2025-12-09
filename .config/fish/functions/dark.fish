function dark --description 'Enables a dark theme for Fish, Nvim, and Kitty'
  # Set theme for Nvim
  set -gx THEME dark

  # Set theme for Bat
  set -gx BAT_THEME "TwoDark"

  # Set theme for Kitty
  kitty +kitten themes Tokyo Night

  # Set theme for Fish
  fish_config theme choose fish\ default 
end
