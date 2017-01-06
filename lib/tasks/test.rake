namespace :test do

  task :units => 'test:prepare' do
    $: << 'test'
    Minitest.rake_run(['test/models', 'test/helpers', 'test/unit'])
  end

  task :functionals => 'test:prepare' do
    $: << 'test'
    Minitest.rake_run(['test/controllers', 'test/mailers'])
  end
  
  task :integration  => 'test:prepare' do
    $: << 'test'
    Minitest.rake_run(['test/integration'])
  end

  task :integration_ie  => 'test:prepare' do
    $: << 'test'

    $selenium_capabilities = {
        :platform => 'Windows 7',
        :browserName => 'internet explorer',
        :version => '11.0',
        'tunnel-identifier' => ENV['TRAVIS_JOB_NUMBER']
    }

    Minitest.rake_run(['test/integration'])
  end

  task :integration_edge  => 'test:prepare' do
    $: << 'test'

    $selenium_capabilities = {
        :platform => 'Windows 10',
        :browserName => 'MicrosoftEdge',
        :version => '14.14393',
        'tunnel-identifier' => ENV['TRAVIS_JOB_NUMBER']
    }

    Minitest.rake_run(['test/integration'])
  end

  task :integration_chrome  => 'test:prepare' do
    $: << 'test'

    $selenium_capabilities = {
        :platform => 'Windows 10',
        :browserName => 'Chrome',
        :version => '54',
        'tunnel-identifier' => ENV['TRAVIS_JOB_NUMBER']
    }

    Minitest.rake_run(['test/integration'])
  end

  task :integration_firefox  => 'test:prepare' do
    $: << 'test'

    $selenium_capabilities = {
        :platform => 'Windows 10',
        :browserName => 'Firefox',
        :version => '50',
        'tunnel-identifier' => ENV['TRAVIS_JOB_NUMBER']
    }

    Minitest.rake_run(['test/integration'])
  end

  task :integration_opera  => 'test:prepare' do
    $: << 'test'

    $selenium_capabilities = {
        :platform => 'Windows 7',
        :browserName => 'Opera',
        :version => '12.12',
        'tunnel-identifier' => ENV['TRAVIS_JOB_NUMBER']
    }

    Minitest.rake_run(['test/integration'])
  end

  task :integration_safari  => 'test:prepare' do
    $: << 'test'

    $selenium_capabilities = {
        :platform => 'macOS 10.12',
        :browserName => 'Safari',
        :version => '10.0',
        'tunnel-identifier' => ENV['TRAVIS_JOB_NUMBER']
    }

    Minitest.rake_run(['test/integration'])
  end
end