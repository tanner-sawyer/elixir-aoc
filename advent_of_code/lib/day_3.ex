defmodule Day3 do
  require FileReader

  def main() do
    IO.puts(part_1())
    IO.puts(part_2())
  end

  def part_1 do
    FileReader.get_file(3)
    |> Enum.with_index
    |> Enum.filter(fn {x, i} -> tree_collision(x,i) end)
    |> length
  end

  def tree_collision(row, index) do
    path_location = index * 3
    if(path_location >= String.length(row)) do
      location = rem(path_location, String.length(row))
      if String.at(row, location) == "#" do
        true
      else
        false
      end
    else
      if String.at(row, path_location) == "#" do
        true
      else  
        false
      end
    end
  end
  

  def part_2 do
    FileReader.get_file(3)
    |> Enum.with_index
    |> all_tree_collisions
    |> multiply
  end

  def multiply(arr) do
    [a, b, c, d, e] = arr
    a * b * c * d * e
  end
  
  def all_tree_collisions(indexed_mountain) do
    Enum.map(slopes, fn {right, down} -> 
      if down == 2 do
        FileReader.get_file(3)
        |> Enum.take_every(2)
        |> Enum.with_index
        |> Enum.filter( fn {row, index} -> 
          find_collision(index, row, right)
        end)
        |> length
        
      else
        Enum.filter(indexed_mountain, fn {row, index} -> 
          find_collision(index, row, right)
        end)
        |> length
      end
    end)
  end

  def find_collision(index, row, right) do
    path_location = (index) * right
    if(path_location >= String.length(row)) do
      location = rem(path_location, String.length(row))
      if String.at(row, location) == "#" do
        true
      else
        false
      end
    else
      if String.at(row, path_location) == "#" do
        true
      else  
        false
      end
    end
  end

  def slopes do
    [ 
      {1, 1},
      {3, 1},
      {5, 1},
      {7, 1},
      {1, 2},
    ]
  end
end

