# frozen_string_literal: true

# This task is created because railway is precompiling assets even though it is not necessary
namespace :assets do
  task 'precompile' do
    puts 'Not pre-compiling assets...'
  end
end
