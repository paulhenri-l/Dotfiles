class Symlinks
  def initialize
    @owner_dir = File.expand_path '~'
  end

  def install!
    symlink [
      {old: 'global_ag_ignore', new: '.ag_ignore'}
    ]
  end

  private
  def symlink(list)
    list.each do |symlink|
      old = File.absolute_path("files/#{symlink[:old]}")
      new = "#{@owner_dir}/#{symlink[:new]}"

      unless File.exists? new or Dir.exists? new or File.symlink? new
        FileUtils.ln_s old, new
      end
    end
  end
end
