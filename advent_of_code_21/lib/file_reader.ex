defmodule FileReader do

  def get_file(day, space) do
    delimiter = if space, do: "\n\n", else: "\n"
    Path.expand("./inputs/day_#{day}.txt") 
    |> read_file(delimiter)

  end
  
  def read_file(path, delimiter) do
    if File.exists?(path) do
      File.read!(path)
      |> String.split(delimiter, trim: true)
    end
  end

end