defmodule Day2 do
  require FileReader

  def main_1() do
    FileReader.get_file(2)
    |> Enum.filter(fn x -> test_pass(x) end)
    |> length
    
  end

  def filter_input(line) do
    String.split(line, " ")
  end

  def test_pass(line) do
    [policy, letter, pass] = filter_input(line)
    [min, max] = String.split(policy, "-")
    amount = String.split(pass, String.slice(letter, 0, 1))
    len = length(amount) - 1
    len >= String.to_integer(min) && len <= String.to_integer(max)
  end



  def main_2() do
    FileReader.get_file(2)
    |> Enum.filter(fn x -> test_pass_2(x) end)
    |> length
  end

  def test_pass_2(line) do
    [policy, letter, pass] = filter_input(line)
    [pos_1, pos_2] = String.split(policy, "-")
    char = String.slice(letter, 0, 1)
    first = String.at(pass, String.to_integer(pos_1) - 1)
    second = String.at(pass,String.to_integer(pos_2) - 1)
    (first == char || second == char) && second != first
  end


end




# Day2.main_1()
# Day2.main_2()