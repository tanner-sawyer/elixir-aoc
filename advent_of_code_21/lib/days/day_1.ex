defmodule AdventOfCode21.Day1 do

#  Better answers

  def main() do
    args = FileReader.get_file(1, false) 
    |> Enum.map(&String.to_integer/1)
    IO.puts(part1(args))
    IO.puts(part2(args))
  end

  def part1(args) do
    args
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.filter(fn [a, b] -> b > a end)
    |> Enum.count()
  end

  def part2(args) do
    args
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum(&1))
    |> part1
  end

  #My attempts
  def answers do
    IO.puts(part_1())
    IO.puts(part_2())
  end

  def part_1 do
    Map.put(%{ count: 0 }, :list, FileReader.get_file(1, false) |> Enum.map(&String.to_integer/1))
    |> compare(nil)
  end

  def compare(data = %{ list: [] }, _) do #done
    data.count
  end

  def compare(data = %{ list: [h | t] }, _ = nil) do #first time
    compare(%{ 
      data |
      list: t
    }, h)
  end

  def compare(data = %{ list: [h | t] }, prev) when h > prev do #comparison
    compare(%{
      data |
      count: data.count + 1,
      list: t
    }, h)
  end

  def compare(data = %{ list: [h | t] }, prev) when h < prev do
    compare(%{
      data |
      list: t
    }, h)
  end

  def part_2 do
    Map.put(%{ count: 0 }, :list, FileReader.get_file(1, false) |> Enum.map(&String.to_integer/1))
    |> slideCompare(nil, nil, nil)
  end

  
  def slideCompare(data = %{ list: [] }, _a, _b, _c) do # over
    data.count
  end

  def slideCompare(data = %{ list: [h | t] }, a, b, c) when a == nil or b == nil or c == nil or h == nil do # over
    slideCompare(%{
      data |
      list: t
    }, h, a, b)
  end

  def slideCompare(data = %{ list: [h | t] }, a, b, c) when (b + c + h) > (a + b + c) do
    slideCompare(%{
      data |
      count: data.count + 1,
      list: t
    }, h, a, b)
  end


  def slideCompare(data = %{ list: [h | t] }, a, b, c) when (b + c + h) < (a + b + c) do
    slideCompare(%{
      data |
      list: t
    }, h, a, b)
  end

end