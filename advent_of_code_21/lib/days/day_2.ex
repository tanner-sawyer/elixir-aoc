defmodule AdventOfCode21.Day2 do

  def main() do
    args = FileReader.get_file(2, false)

    part_1(args)
    part_2(args)
  end

  def part_1(list) do
    moves = %{ horizontal: 0, vertical: 0 }
    splitList = Enum.map(list, fn y -> String.split(y, " ") end)
    %{ horizontal: horizontal, vertical: vertical } = 
      Enum.reduce(splitList, moves, fn [direction, value], move ->
        case direction do
          "forward" -> Map.put(move, :horizontal, move.horizontal + String.to_integer(value))
          "up" -> Map.put(move, :vertical, move.vertical - String.to_integer(value))
          "down" -> Map.put(move, :vertical, move.vertical + String.to_integer(value))
        end
      end)
    IO.puts("Total: #{horizontal * vertical}")

  end

  def part_2(list) do
    moves = %{ horizontal: 0, vertical: 0, aim: 0 }
    splitList = Enum.map(list, fn x -> String.split(x, " ") end)
    %{ horizontal: horizontal, vertical: vertical } = 
      Enum.reduce(splitList, moves, fn [direction, value], move -> 
        case direction do
          "forward" -> 
            move 
            |> Map.put(:horizontal, move.horizontal + String.to_integer(value))
            |> Map.put(:vertical, move.vertical + (move.aim * String.to_integer(value)))
          "up" -> Map.put(move, :aim, move.aim - String.to_integer(value))
          "down" -> Map.put(move, :aim, move.aim + String.to_integer(value))
        end
      end)
    IO.puts("Total: #{horizontal * vertical}")
  end


end
