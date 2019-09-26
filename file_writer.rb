class FileWriter
  def save(filename:, entry:)
    file = File.open("#{filename}.txt", 'a')
    file.puts(entry)
    file.close
  end
end
