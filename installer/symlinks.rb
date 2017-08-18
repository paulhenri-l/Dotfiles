class Symlinks
  def initialize(owner_dir)
    @owner_dir = owner_dir
  end

  def install!
    symlink [
      {old: 'global_ag_ignore', new: '.ag_ignore'}
    ]
  end

  private
  def symlink(list)
    list.each do |symlink|
      old = File.absolute_path(symlink[:old])
      new = "#{@owner_dir}/#{symlink[:new]}"

      unless File.exist? new or Dir.exist? new
        FileUtils.ln_s old, new
      end
    end
  end
end
