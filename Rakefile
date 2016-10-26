require 'yaml'
require 'cucumber'
require 'browserstack/local'
require 'cucumber/rake/task'

def run_tests(config_file, test_type, test_name, parallel_test=false)
  wait_pids = []
  config = YAML.load_file(config_file)
  config["browser_caps"].length.times.to_a.each do |index|
    wait_pids << fork do
      ENV["TEST_TYPE"] = test_type
      ENV["TEST_INDEX"] = index.to_s
      Rake::Task[test_name].reenable
      Rake::Task[test_name].invoke
    end
    wait_pids.delete_if { |pid| Process.wait pid; true } if !parallel_test
  end
  wait_pids.delete_if { |pid| Process.wait pid; true } if parallel_test
end

task :single do |t, args|
  run_tests('./config/single.config.yml', 'single', 'single_test', false)
end

task :local do |t, args|
  bs_local = BrowserStack::Local.new
  bs_local_args = { "key" => ENV['BROWSERSTACK_ACCESS_KEY'] || config['key'] }
  bs_local.start(bs_local_args)

  begin
    run_tests('./config/local.config.yml', 'local', 'local_test', false)
  ensure
    bs_local.stop
  end
end

task :parallel do |t, args|
  run_tests('./config/parallel.config.yml', 'parallel', 'single_test', true)
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
