class Zsh
  def initialize
    @source_line = "source #{File.absolute_path('files/zshrc')}"
    @owner_zshrc = File.open(File.expand_path('~/.zshrc'), 'a+')
  end

  def install!
    insert_line! unless already_inserted?
  end

  private
  def already_inserted?
    @owner_zshrc.each_line.any? { |line| line.include? @source_line }
  end

  def insert_line!
    @owner_zshrc.puts ''
    @owner_zshrc.puts '# Sourcing Dotfiles zsh config'
    @owner_zshrc.puts @source_line
  end
end
