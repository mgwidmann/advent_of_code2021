defmodule AdventOfCode2021.Day1 do

  @spec count_depth_increases(nonempty_list, number | nil, number) :: number
  def count_depth_increases(list, prev \\ nil, increases \\ 0)
  def count_depth_increases([depth | rest], nil, increases) do
    count_depth_increases(rest, depth, increases)
  end
  def count_depth_increases([depth | rest], prev, increases) when depth > prev do
    count_depth_increases(rest, depth, increases + 1)
  end
  def count_depth_increases([depth | rest], _prev, increases) do
    count_depth_increases(rest, depth, increases)
  end
  def count_depth_increases([], _prev, increases), do: increases

end
