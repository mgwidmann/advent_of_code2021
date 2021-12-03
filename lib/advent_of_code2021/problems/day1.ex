defmodule AdventOfCode2021.Day1 do
  @spec count_depth_increases(nonempty_list, {number, number, number} | nil, number) :: number
  def count_depth_increases(list, prev \\ nil, increases \\ 0)

  def count_depth_increases([first, second, third | rest], nil, increases) do
    count_depth_increases([second, third | rest], {first, second, third}, increases)
  end

  def count_depth_increases([first, second, third | rest], {prev1, prev2, prev3}, increases)
      when first + second + third > prev1 + prev2 + prev3 do
    count_depth_increases([second, third | rest], {first, second, third}, increases + 1)
  end

  def count_depth_increases([first, second, third | rest], _prev, increases) do
    count_depth_increases([second, third | rest], {first, second, third}, increases)
  end

  def count_depth_increases([_first, _second], _prev, increases), do: increases
  def count_depth_increases([_first], _prev, increases), do: increases
  def count_depth_increases([], _prev, increases), do: increases
end
