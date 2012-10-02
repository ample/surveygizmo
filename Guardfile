guard 'rspec', :version => 2 do
  # The spec files themselves changed
  watch(%r{^spec/.+_spec\.rb$})

  # Part of the implementation changed
  watch(%r{^lib/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }

  # The spec helper changed
  watch('spec/helper.rb')  { "spec" }
end
