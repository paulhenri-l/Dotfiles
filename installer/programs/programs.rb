require 'mkmf'

module Programs
  class Programs
    def install!
      install_programs [
          {binary: 'ctags', package: 'ctags'},
          {binary: 'ag', package: 'the_silver_searcher'},
          {binary: 'cmake', package: 'cmake'},
          {binary: 'mvim', package: 'mvim'},
          {binary: 'phpctags', package: 'phpctags'},
      ]
    end

    private
    def install_programs(programs)
      programs.each do |prog|
        system("brew install #{prog[:package]}") unless find_executable0 prog[:binary]
      end
    end
  end
end
