require 'rake'
require 'fileutils'

SDK_CMD = 'bundle exec browserstack-sdk exec cucumber features/sample.feature'.freeze

# Run with the alternate config at config/<name>.yml. The SDK only reads
# ./browserstack.yml, so we swap it in for the duration of the run and
# restore the parallel default afterwards (even on failure).
def run_with_config(alt_path)
  raise "missing #{alt_path}" unless File.exist?(alt_path)
  FileUtils.cp('browserstack.yml', 'browserstack.yml.bak')
  FileUtils.cp(alt_path, 'browserstack.yml')
  sh SDK_CMD
ensure
  FileUtils.mv('browserstack.yml.bak', 'browserstack.yml') if File.exist?('browserstack.yml.bak')
end

task default: :parallel

# Parallel run: uses the committed browserstack.yml (4 platforms).
task :parallel do
  sh SDK_CMD
end

# Single run: 1 platform.
task :single do
  run_with_config('config/browserstack.single.yml')
end

# Local run: 1 platform + BrowserStack Local tunnel.
task :local do
  run_with_config('config/browserstack.local.yml')
end
