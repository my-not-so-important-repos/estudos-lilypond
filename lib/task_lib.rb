
def para_cada_arquivo_ly
  files = Dir['*.ly']
  files.each do |filename|
    if block_given?
      yield(filename)
    else
      raise NotImplementedError
    end
  end
end



def erase_if_exists(filename)
  if File.exist?(filename)
    puts "Erasing #{filename}"
    FileUtils.rm(filename)
  end
end




