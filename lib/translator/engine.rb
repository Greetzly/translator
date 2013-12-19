module Translator
  class Engine < Rails::Engine
    isolate_namespace Translator
    initializer 'static_assets.load_static_assets' do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/app"
      app.middleware.insert_before(::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/app")

      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
      app.middleware.insert_before(::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public")

      app.middleware.use ::ActionDispatch::Static, "#{root}/vendor"
      app.middleware.insert_before(::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/vendor")
    end
  end
end
