defmodule FileReader do

  def get_file(day, space) do
    delimiter = if space, do: "/n/n", else: "/n"
    IO.puts(delimiter)
    path = Path.expand("./inputs/day_#{day}.txt") 
    if File.exists?(path) do
      File.read!(path)
      |> String.split(delimiter, trim: true)
    end
  end

end
