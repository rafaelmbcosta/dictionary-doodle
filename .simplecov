SimpleCov.start do
  add_group "Models", "/app/models/"
  add_group "Controllers", "/app/controllers/"
  add_group "Helpers", "/app/helpers/"
  add_group "Views", "/app/views/"

  add_filter "/spec/"
  add_filter "/config/"
  add_filter "/db/"
end
