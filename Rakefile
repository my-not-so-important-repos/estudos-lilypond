
require_relative 'lib/task_lib'

task :synth do
  para_cada_arquivo('*.midi') do |filename|
    send_to_my_microkorg2(filename)
  end
end

task :abc do
  para_cada_arquivo('*.abc') do |filename|
    system "abc2ly #{filename}"
  end
end



task :ly do
  para_cada_arquivo('*.ly') do |f|
    system("lilypond --png --pdf #{f}")
    system("lilypond --svg #{f}")
  end
end

task :all => [:abc, :ly]

task :clear do
  #files = Dir['*.ly']
  #files.each 
  para_cada_arquivo('*.ly') do |f|
    basename = File.basename(f, '.ly')
    erase_if_exists("#{basename}.png")
    erase_if_exists("#{basename}.svg")
    erase_if_exists("#{basename}.pdf")
    erase_if_exists("#{basename}.midi")
  end
  #File.remove()
end

task :default => [:all]
