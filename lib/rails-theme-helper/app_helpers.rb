app_path = File.expand_path('../../../app', __FILE__)
helpers_path = "#{app_path}/helpers"
$LOAD_PATH.unshift helpers_path unless $LOAD_PATH.include? helpers_path

require 'rails_theme/layout_helper.rb'
require 'rails_theme/bootstrap_helper.rb'
