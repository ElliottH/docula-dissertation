def fdcount(file)
  file.scan(/(<h2 id="description">)/).count
end

def fcount(file)
  file.scan(/(<span class="docstring">)/).count
end

def dcount(file)
  file.scan(/id="[dtv]\d+_def"/).count
end

def grpcount(file)
  file.scan(/(\/\*\*(?:.*?)@[{}](?:.*?)\*\/)/m).count
end

file_list = File.read('output/files.html').scan(/<a .*?>(.*?)<\/a>/).flatten
files = {}

file_list.each do |file|
  source = File.read(file)
  files[file] = [source.scan(/(\/\*\*(?:.*?)\*\/)/m).count]
  html = File.read("output/#{file}.html")

  files[file] << fcount(html) + fdcount(html)
  files[file] << dcount(html)
  files[file] << grpcount(source)
end

puts "File\tDisplayed\tGrouping\tDocstrings"
files.each do |f,v|
  if v[0] > 0
    puts "#{f}\t#{v[1] + v[2]}\t#{v[3]}\t#{[0, v[0] - (v[1] + v[2] + v[3])].max}"
  end
end
