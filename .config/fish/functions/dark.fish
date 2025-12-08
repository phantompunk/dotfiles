function dark --description 'Enables a dark theme for Fish, Nvim, and Kitty'
  # Set theme for Nvim
  set -xU THEME dark

  # Set theme for Bat
  set -xU BAT_THEME "TwoDark"

  # Set theme for Kitty
  kitty +kitten themes Tokyo Night

  # Set theme for Fish
  fish_config theme choose fish\ default 
end
