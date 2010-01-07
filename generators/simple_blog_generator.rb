class SimpleBlogGenerator < Rails::Generator::Base
  def initialize(runtime_args, runtime_options = {})
    super
    @models_array = runtime_args.dup
  end
  
  def manifest
    record do |m|
      m.directory 'db/migrate'
      
      m.migration_template 'post_migration.rb', 'db/migrate', :migration_file_name => "create_posts"
      m.migration_template 'comment_migration.rb', 'db/migrate', :migration_file_name => "create_comments"
    end
  end
  
  ##################################################
  protected
  
  def banner
    "Usage: #{$0} simple_blog"
  end
end
