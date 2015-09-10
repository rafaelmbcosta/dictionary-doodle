# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'simplecov'
require 'webmock/rspec'

# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!
WebMock.disable_net_connect!(allow_localhost: true)

if ENV['RAILS_ENV'] == 'test'
  require 'simplecov'
  SimpleCov.start 'rails'
  puts "required simplecov"
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  config.before(:each) do
   body_success = "<?xml version='1.0' encoding='UTF-8'?>
      <entry_list version='1.0'>
        <entry id='car'><ew>car</ew><subj>VH-1a#VH-1b#RR-1b#AV-1c#AE-3</subj><hw>car</hw><sound><wav>car00001.wav</wav><wpr>!k@r</wpr></sound><pr>ˈkär, <it>dialect also</it> ˈkȯr, ˈkyär</pr><fl>noun</fl><et>Middle English <it>carre,</it> from Anglo-French, from Latin <it>carra,</it> plural of <it>carrum,</it> alteration of <it>carrus,</it> of Celtic origin; akin to Old Irish &amp; Middle Welsh <it>carr</it> vehicle; akin to Latin <it>currere</it> to run</et><def><date>14th century</date> <sn>1</sn> <dt> :a vehicle moving on wheels: as</dt>  <sn>a</sn> <ssl>archaic</ssl> <dt>:<sx>carriage</sx> <sx>chariot</sx></dt>  <sn>b</sn> <dt>:a vehicle designed to move on rails (as of a railroad)</dt>  <sn>c</sn> <dt>:<sx>automobile</sx> </dt> <sn>2</sn> <dt>:the passenger compartment of an elevator</dt> <sn>3</sn> <dt>:the part of an airship or balloon that carries the passengers and cargo</dt></def></entry>
        <entry id='CAR'><ew>CAR</ew><subj>AE</subj><hw>CAR</hw><fl>abbreviation</fl><def><dt>civil air regulations</dt></def></entry>
        <entry id='car bomb'><ew>car bomb</ew><subj>WX</subj><hw>car bomb</hw><fl>noun</fl><def><date>1972</date><dt>:an explosive device concealed in an automobile for use as a weapon of terrorism</dt></def></entry>
        <entry id='car coat'><ew>car coat</ew><subj>CL</subj><hw>car coat</hw><fl>noun</fl><def><date>1958</date><dt>:a three-quarter-length overcoat</dt></def></entry>
        <entry id='car park'><ew>car park</ew><hw>car park</hw><fl>noun</fl><def><date>1926</date><sl>chiefly British</sl><dt>:a lot or garage for parking</dt></def></entry>
        <entry id='car pool'><ew>car pool</ew><subj>TN</subj><hw>car pool</hw><fl>noun</fl><def><date>1942</date><dt>:an arrangement in which a group of people commute together by car</dt> <sd>also</sd> <dt>:the group entering into such an arrangement</dt></def></entry>
        <entry id='car seat'><ew>car seat</ew><subj>AV</subj><hw>car seat</hw><fl>noun</fl><def><date>1968</date><dt>:a portable seat for an infant or a small child that attaches to an automobile seat and holds the child safely</dt></def></entry>
        <entry id='car wash'><ew>car wash</ew><hw>car wash</hw><fl>noun</fl><def><date>1948</date><dt>:an area or structure equipped with facilities for washing automobiles</dt></def></entry>
        <entry id='bar car'><ew>bar car</ew><subj>RR</subj><hw>bar car</hw><fl>noun</fl><def><date>1945</date><dt>:<sx>club car</sx></dt></def></entry>
        <entry id='bumper car'><ew>bumper car</ew><subj>ET</subj><hw>bumper car</hw><fl>noun</fl><def><date>1959</date><dt>:a small electric car made to be driven around in an enclosure and to be bumped into others (as at an amusement park)</dt></def></entry>
      </entry_list>"

   body_fail = "<?xml version='1.0' encoding='UTF-8'?>
      <entry_list version='1.0'>
        <suggestion>fermi</suggestion>
        <suggestion>ferine</suggestion>
        <suggestion>firma</suggestion>
        <suggestion>foram</suggestion>
        <suggestion>forum</suggestion>
        <suggestion>vermi-</suggestion>
        <suggestion>formee</suggestion>
        <suggestion>affirm</suggestion>
        <suggestion>firm</suggestion>
        <suggestion>fermium</suggestion>
        <suggestion>Fromm</suggestion>
        <suggestion>varium</suggestion>
        <suggestion>fermion</suggestion>
        <suggestion>frame</suggestion>
        <suggestion>forma</suggestion>
        <suggestion>A-frame</suggestion>
        <suggestion>forme</suggestion>
        <suggestion>form-</suggestion>
        <suggestion>from</suggestion>
        <suggestion>Ephraim</suggestion>
      </entry_list>"

   stub_request(:get, "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/car?key=22db59d8-2b84-4309-849e-50978735b453").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'www.dictionaryapi.com', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => body_success, :headers => {})



   stub_request(:get, "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/ferrim?key=22db59d8-2b84-4309-849e-50978735b453").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'www.dictionaryapi.com', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => body_fail, :headers => {})

  end

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!
end
