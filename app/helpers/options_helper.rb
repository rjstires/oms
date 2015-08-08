module OptionsHelper
# helpers/options_helper.rb
# Returns a dynamic path based on the provided parameters
  def sti_option_path(type = "option", option = nil, action = nil)
    send "#{format_sti(action, type, option)}_path", option
  end

  def format_sti(action, type, option)
    action || option ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_" : ""
  end
end
