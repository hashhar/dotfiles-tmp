# Check multiple passwords in a plain-text file.
# Usage: ruby pwned-multi.rb <file>

require 'open-uri'
require 'digest'

password_filename = ARGV.first
if !password_filename
  $stderr.puts 'Password file expected. Exiting.'
  exit 1
end

passwords = File.readlines(password_filename).map(&:chomp)
if passwords.empty?
  $stderr.puts 'No passwords. Exiting.'
  exit 1
end

puts "The 5-character prefix of each password's SHA-1 hash will be sent."
puts "For details, see https://www.troyhunt.com/ive-just-launched-pwned-passwords-version-2/"

hashes = passwords.map { |password| Digest::SHA1.hexdigest(password).upcase }
prefixes = hashes.map { |hash| hash[0...5] }
urls = prefixes.map { |prefix| "https://api.pwnedpasswords.com/range/#{prefix}" }

puts "Requests will be made to the following URLs:\n#{urls.join("\n")}"
print "Continue (y/n)? "

if $stdin.gets.strip.downcase[0] != 'y'
  puts 'Canceled.'
  exit
end

hashes.zip(prefixes, urls).each.with_index do |(hash, prefix, url), index|
  pwned = open(url) do |response|
    Hash[response.each_line.map { |line|
      suffix, count = line.strip.split(':')
      [(prefix + suffix).upcase, count.to_i]
    }]
  end

  print "Password on line #{index + 1} (SHA-1 hash #{hash}) "
  count = pwned[hash]
  if count
    puts "has been pwned. Seen #{count} time#{count == 1 ? '' : 's'}."
  else
    puts "has not been pwned."
  end
end