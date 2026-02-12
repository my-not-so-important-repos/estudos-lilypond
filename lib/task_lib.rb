

def send_to_my_microkorg2 (midi)
  system("aplaymidi --port 20 #{midi}")
end



def para_cada_arquivo (glob = '*.ly')
  files = Dir[glob]
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




