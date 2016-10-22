require 'yaml'
require 'cucumber'
require 'browserstack/local'
require 'cucumber/rake/task'

task :single do |t, args|
  config = YAML.load_file('./config/single.config.yml')
  config["browser_caps"].length.times.to_a.each do |index|
    ENV["TEST_TYPE"] = "single"
    ENV["TEST_INDEX"] = index.to_s
    Rake::Task["single_test"].reenable
    Rake::Task["single_test"].invoke
  end
end

task :local do |t, args|
  bs_local = BrowserStack::Local.new
  bs_local_args = { "key" => ENV['BROWSERSTACK_ACCESS_KEY'] || config['key'] }
  bs_local.start(bs_local_args)

  begin
    config = YAML.load_file('./config/local.config.yml')
    config["browser_caps"].length.times.to_a.each do |index|
      ENV["TEST_TYPE"] = "local"
      ENV["TEST_INDEX"] = index.to_s
      Rake::Task["local_test"].reenable
      Rake::Task["local_test"].invoke
    end
  ensure
    bs_local.stop
  end
end

task :parallel do |t, args|
  config = YAML.load_file('./config/parallel.config.yml')
  wait_pids = []
  config["browser_caps"].length.times.to_a.each do |index|
    wait_pids << fork do
      ENV["TEST_TYPE"] = "parallel"
      ENV["TEST_INDEX"] = index.to_s
      Rake::Task["single_test"].reenable
      Rake::Task["single_test"].invoke
    end
  end

  wait_pids.delete_if { |pid| Process.wait pid; true }
end

Cucumber::Rake::Task.new(:single_test) do |t|
  t.cucumber_opts = "features --tags @SingleTest --format pretty"
end

Cucumber::Rake::Task.new(:local_test) do |t|
  t.cucumber_opts = "features --tags @LocalTest --format pretty"
end

task :test do |t, args|
  Rake::Task["single"].invoke
  Rake::Task["local"].invoke
  Rake::Task["parallel"].invoke
end
