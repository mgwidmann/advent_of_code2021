defmodule AdventOfCode2021.Day1Test do
  use ExUnit.Case
  import AdventOfCode2021.Day1

  test "count depth increases" do
    assert count_depth_increases([199, 200, 208, 210, 200, 207, 240, 269, 260, 263]) == 5
  end

  @input ReadInput.as_numbers(1)
  test "puzzle input" do
    assert count_depth_increases(@input) == 1600
  end
end
