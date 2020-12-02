defmodule FileReader do

  def get_file(day) do
    path = Path.expand("./inputs/day_#{day}.txt") 
    if File.exists?(path) do
      File.read!(path)
      |> String.split("\n", trim: true)
    end
  end

end
