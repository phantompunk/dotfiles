function light --description 'Enables a light theme for Fish, Nvim, and Kitty'
  # Set theme for Nvim
  set -xU theme light

  # Set theme for Bat
  set -xU BAT_THEME "OneHalfLight"

  # Set theme for Kitty
  kitty +kitten themes Catppuccin-Latte 

  # Set theme for Fish
  fish_config theme choose fish\ default
end
