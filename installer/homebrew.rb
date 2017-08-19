class HomeBrew
  def install!
    puts 'Adding hombrew/homebrew-php'
    system "brew tap homebrew/homebrew-php"
  end
end
