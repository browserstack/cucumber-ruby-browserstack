require 'rake'
require 'parallel'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:single) do |task|
  ENV['CONFIG_NAME'] ||= 'single'
  task.cucumber_opts = ['--format=pretty', 'features/sample.feature']
end

task default: :single

Cucumber::Rake::Task.new(:local) do |task|
  task.cucumber_opts = ['--format=pretty', 'features/sample.feature', 'CONFIG_NAME=local']
end

task :parallel do |_t, _args|
  @num_parallel = 4

  Parallel.map([*1..@num_parallel], in_processes: @num_parallel) do |task_id|
    ENV['TASK_ID'] = (task_id - 1).to_s
    ENV['name'] = 'parallel_test'
    ENV['CONFIG_NAME'] = 'parallel'

    Rake::Task['single'].invoke
    Rake::Task['single'].reenable
  end
end

task :test do |_t, _args|
  Rake::Task['single'].invoke
  Rake::Task['single'].reenable
  Rake::Task['local'].invoke
  Rake::Task['parallel'].invoke
end
