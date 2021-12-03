defmodule AdventOfCode2021.Day2 do
  def follow_course(course, horizontal \\ 0, depth \\ 0)

  def follow_course(["forward " <> x | rest], horizontal, depth) when depth >= 0 do
    num = to_num(x)
    follow_course(rest, horizontal + num, depth)
  end

  def follow_course(["down " <> x | rest], horizontal, depth) when depth >= 0 do
    num = to_num(x)
    follow_course(rest, horizontal, depth + num)
  end

  def follow_course(["up " <> x | rest], horizontal, depth) when depth >= 0 do
    num = to_num(x)
    follow_course(rest, horizontal, depth - num)
  end

  def follow_course([], horizontal, depth), do: {horizontal, depth}

  defp to_num(string) do
    case Integer.parse(string) do
      {num, ""} ->
        num

      :error ->
        raise "Unable to parse string: #{inspect(string)}"

      {_num, extra} ->
        raise "Left over part of stirng when parsing integer! #{inspect(extra)}"
    end
  end
end
