#!/bin/bash

# Get the names of the two files to compare.
chezmoiSpell="$HOME/.local/share/chezmoi/dot_config/nvim/spell/en.utf-8.add"
configSpell="$HOME/.config/nvim/spell/en.utf-8.add"

# Check if the two files exist.
if [ ! -f "$chezmoiSpell" ]; then
  echo "Error: The first file \"$chezmoiSpell\" does not exist."
  exit 1
fi

if [ ! -f "$configSpell" ]; then
  echo "Error: The second file \"$configSpell\" does not exist."
  exit 1
fi

# Compare the two files.
diff "$chezmoiSpell" "$configSpell" > /dev/null 2>&1

# Check if the two files are different.
if [ $? -eq 1 ]; then
  # The two files are different. Ask the user if they want to continue.
  echo "Neovim's spell file ($configSpell) has changed."
  read -p "Do you want to replace chezmoi's spell file? [y/N] " answer

  if [ "$answer" != "y" ]; then
    echo "Exiting the script."
    exit 0
  else
    echo "Sorting and removing duplicates..."
    sort -u $configSpell -o $configSpell
    chmod 644 $configSpell # Fix up file permissions
    echo "Updating chezmoi's spell file..."
    cp $configSpell $chezmoiSpell
    exit 0
  fi
fi

