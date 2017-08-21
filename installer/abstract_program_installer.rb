require 'mkmf'

class AbstractProgramInstaller
  def initialize(options = {})
    @options = options
  end

  def bin_exists?(name)
    find_executable0 name
  end
end
