defmodule Day4 do
  require FileReader
  def main() do
    part_1
  end

  def part_1 do
    FileReader.get_file(4, true)
    |> Enum.with_index
    |> Enum.each(fn {x, i} -> IO.puts("#{i}, #{x}") end)
  end

#   def valid_fields do
#     {:byr,}
#   end
#   byr (Birth Year)
# iyr (Issue Year)
# eyr (Expiration Year)
# hgt (Height)
# hcl (Hair Color)
# ecl (Eye Color)
# pid (Passport ID)
# cid (Country ID)

end