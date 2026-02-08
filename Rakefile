
require_relative '../lib/task_lib'


task :render_all do
  para_cada_arquivo_ly do |f|
    system "lilypond '#{f}'"
    system("lilypond --png #{f}")
    system("lilypond --svg #{f}")
  end
end

task :clear do
  #files = Dir['*.ly']
  #files.each 
  para_cada_arquivo_ly do |f|
    basename = File.basename(f, '.ly')
    erase_if_exists("#{basename}.png")
    erase_if_exists("#{basename}.svg")
    erase_if_exists("#{basename}.pdf")
    erase_if_exists("#{basename}.midi")
  end
  #File.remove()
end

task :default => [:render_all]
