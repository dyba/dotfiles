Pry.config.history_file = "~/.pry_history"

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

# Pry::Commands.command /^$/, 'repeat last command' do
#   pry_instance.run_command Pry.history.to_a.last
# end

# Set the current theme
# needs the pry-theme gem
# Pry.config.theme = 'zenburn'

require 'rb-readline'
# Need to check for presence of `fzf` command
if defined?(RbReadline)
  # tac reverses the history to preserve latest first
  # awk is used to make sure the history contains only uniqs (non adjacent)
  # first awk command trims leading and trailing whitespace to reduce matches
  # tiebreak gives precedence to the most recent history
  def RbReadline.rl_reverse_search_history(sign, key)
    # Should check for presence of fzf command before you run this
    rl_insert_text `tac ~/.pry_history | awk '{$1=$1};1' | awk '!x[$0]++' | fzf --tiebreak=index | tr '\n' ' '`
  end
end

# require "awesome_print"
