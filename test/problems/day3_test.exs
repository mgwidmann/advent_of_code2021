defmodule AdventOfCode2021.Day3Test do
  use ExUnit.Case
  import AdventOfCode2021.Day3

  test "finish" do
    assert most_least_common([], 12, {7, 5, 8, 7, 5}) |> to_binary() == {"10110", "01001"}
  end

  test "add" do
    assert add("00100", {1, 2, 3, 4, 5}) == {1, 2, 4, 4, 5}
  end

  @practice ~w[00100 11110 10110 10111 10101 01111 00111 11100 10000 11001 00010 01010]
  test "count" do
    assert most_least_common(@practice) |> to_binary() == {"10110", "01001"}
  end

  test "oxygen rating" do
    sums = most_least_common(@practice)
    r = rating(sums, @practice, :most)
    assert r == "10111"
    assert r |> Convertat.from_base(2) == 23
  end

  test "co2 rating" do
    sums = most_least_common(@practice)
    r = rating(sums, @practice, :least)
    assert r == "01010"
    assert r |> Convertat.from_base(2) == 10
  end

  @input ReadInput.as_strings(3)
  test "input" do
    assert most_least_common(@input) |> to_binary() == {"011001010000", "100110101111"}
    {most, least} = most_least_common(@input) |> to_binary()
    assert most |> Convertat.from_base(2) == 1616
    assert least |> Convertat.from_base(2) == 2479
  end

  test "input 2" do
    sums = most_least_common(@input)
    assert rating(sums, @input, :most) |> Convertat.from_base(2) == 1599
    assert rating(sums, @input, :least) |> Convertat.from_base(2) == 3716
  end
end
