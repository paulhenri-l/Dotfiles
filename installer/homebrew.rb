class HomeBrew
  def install!
    # brew tap --list (Check of tap already installed)
    puts 'Adding hombrew/homebrew-php'
    system "brew tap homebrew/homebrew-php"
  end
end
