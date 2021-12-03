defmodule AdventOfCode2021.Day2Test do
  use ExUnit.Case
  import AdventOfCode2021.Day2

  test "follow course" do
    assert follow_course(["forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"]) ==
             {15, 10}
  end

  @input ReadInput.as_strings(2)
  test "puzzle input" do
    # {1890, 1172}
    {horizontal, depth} = follow_course(@input)
    assert horizontal * depth == 2_215_080
  end
end
