require 'application'

ApplicationController.prepend_view_path(File.join(File.dirname(__FILE__), 'app', 'views'))

model_path = File.join(directory, 'app', 'models')
$LOAD_PATH << model_path
ActiveSupport::Dependencies.load_paths << model_path

controller_path = File.join(directory, 'app', 'controllers')
#$LOAD_PATH << controller_path
#ActiveSupport::Dependencies.load_paths << controller_path
#config.controller_paths << controller_path

$LOAD_PATH.insert(0, controller_path)
ActiveSupport::Dependencies.load_paths.insert(0, controller_path)
config.controller_paths.insert(0, controller_path)
