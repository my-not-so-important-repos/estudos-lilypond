

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



task :render_all do
  para_cada_arquivo_ly do |f|
    system "lilypond  --png --pdf '#{f}'"
    system("lilypond --svg #{f}")
  end
end

task :clear do
  #files = Dir['*.ly']
  #files.each 
  para_cada_arquivo_ly do |f|
    basename = File.basename(f, '.ly')
    FileUtils.rm("#{basename}.png")
    FileUtils.rm("#{basename}.svg")
    FileUtils.rm("#{basename}.pdf")
  end
  #File.remove()
end

task :default => [:render_all]
