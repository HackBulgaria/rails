# encoding: utf-8

center <<-END
  \e[1mThe Final Lecture\e[0m


  Genadi Samokovarov, Stanislav Gatev


  2015
END

center <<-END
  \e[1mRaities & Configuration\e[0m


  Genadi Samokovarov, Stanislav Gatev


  2015
END

center <<-END

     ▄▄▄▄▀▀▀▀▀▀▀▀▄▄▄▄▄▄        
     █                  ▀▀▄    
    █                      █   
   █      ▄██▀▄▄     ▄▄▄    █  
 ▄▀ ▄▄▄  █▀▀▀▀▄▄█   ██▄▄█    █ 
█    ▄ ▀▄▄▄▀        █         █
█    █▀▄▄     █▀    ▀▄  ▄▀▀▀▄ █
 █    █▄ █▀▄▄ ▀ ▀▀ ▄▄▀    █  █ 
  █   ▀▄▀█▄▄ █▀▀▀▄▄▄▄▀▀█▀██ █  
   █    ██  ▀█▄▄▄█▄▄█▄████ █   
    █    ▀▀▄ █   █ █▀██████ █  
     ▀▄     ▀▀▄▄▄█▄█▄█▄█▄▀  █  
       ▀▄▄                   █ 
          ▀▀▄▄               █ 
              ▀▄▄▄▄▄        █  

END

section "Railties Overview" do
  block <<-END
    Railtie is the core of the Rails framework and provides several hooks to
    extend Rails and/or modify the initialization process.
  END

  block <<-END
    Every major component of Rails is a Railtie.

    Each of them is responsible for their own initialization. This makes Rails
    itself absent of any component hooks, allowing other components to be used
    in place of any of the Rails defaults.
  END

  block <<-END
    Developing a Rails extension does \e[1mnot\e[0m require any implementation of
    Railtie, but if you need to interact with the Rails framework during
    or after boot, then Railtie is needed.
  END

  block <<-END
    For example, an extension doing any of the following would require Railtie:

      * creating initializers

      * configuring a Rails framework for the application (setting a generator)

      * adding config.* keys to the environment

      * setting up a subscriber with ActiveSupport::Notifications

      * adding rake tasks
  END
end

section "Creating your Railtie" do
  block <<-END
    To extend Rails using Railtie, create a Railtie class which inherits
    from Rails::Railtie within your extension's namespace. This class must be
    loaded during the Rails boot process.
  END

  block <<-END
    The following example demonstrates an extension which can be used with or
    without Rails.
  END

  code <<-END
    # lib/my_gem/railtie.rb
    module MyGem
      class Railtie < Rails::Railtie
      end
    end

    # lib/my_gem.rb
    require 'my_gem/railtie' if defined?(Rails)
  END
end

section "Initializers" do
  block <<-END
    class MyRailtie < Rails::Railtie
      initializer "my_railtie.configure_rails_initialization" do
        # some initialization behavior
      end
    end
  END

  block <<-END
    If specified, the block can also receive the application object, in case
    you need to access some application specific configuration, like
    middleware:
  END

  code <<-END
    class MyRailtie < Rails::Railtie
      initializer "my_railtie.configure_rails_initialization" do |app|
        app.middleware.use MyRailtie::Middleware
      end
    end
  END

  block <<-END
    Finally, you can also pass :before and :after as option to initializer, in
    case you want to couple it with a specific step in the initialization
    process.
  END
end

section "Configuration" do
  block <<-END
    Inside the Railtie class, you can access a config object which contains
    configuration shared by all railties and the application:
  END

  code <<-END
    class MyRailtie < Rails::Railtie
      # Customize the ORM
      config.app_generators.orm :my_railtie_orm

      # Add a to_prepare block which is executed once in production
      # and before each request in development.
      config.to_prepare do
        MyRailtie.setup!
      end
    end
  END
end

section "Application & Engine Relation" do
  block <<-END
    A Rails::Engine is nothing more than a Railtie with some initializers
    already set.
  END

  block <<-END
    A Rails application is actually just a "supercharged" engine, with the
    Rails::Application class inheriting a lot of its behavior from Rails::Engine.
  END

  block <<-END
    Engines can also be isolated from their host applications. This means that
    an application is able to have a path provided by a routing helper such as
    articles_path and use an engine also that provides a path also called
    articles_path, and the two would not clash. Along with this, controllers,
    models and table names are also namespaced. You'll see how to do this later
    in this guide.
  END
end

section "The End" do
  # Nothing here.
end
