# Launch Pry with access to the entire Rails stack
rails = File.join(Dir.getwd, 'config', 'environment.rb')

if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails

  if Rails.version[0..0] == "2"
    require 'console_app'
    require 'console_with_helpers'
  elsif Rails.version[0..0].in?(['3', '4', '5'])
    require 'rails/console/app'
    require 'rails/console/helpers'
  else
    warn "[WARN] cannot load Rails console commands (Not on Rails2, Rails3 or Rails4?)"
  end

  # Add Rails console helpers (like `reload!`) to pry
  require 'rails/console/app'
  extend Rails::ConsoleMethods
  p 'Rails Console Helpers loaded'

  # r! to reload Rails console
  def r!
    reload!
  end

  # automatically call `reload` every time a new command is typed
  Pry.hooks.add_hook(:before_eval, :reload_everything) { reload!(false) }

end
