defmodule AdventOfCode2021.Day2 do
  def follow_course(course, horizontal \\ 0, depth \\ 0, aim \\ 0)

  def follow_course(["forward " <> x | rest], horizontal, depth, aim) when depth >= 0 do
    num = to_num(x)
    follow_course(rest, horizontal + num, depth + aim * num, aim)
  end

  def follow_course(["down " <> x | rest], horizontal, depth, aim) when depth >= 0 do
    num = to_num(x)
    follow_course(rest, horizontal, depth, aim + num)
  end

  def follow_course(["up " <> x | rest], horizontal, depth, aim) when depth >= 0 do
    num = to_num(x)
    follow_course(rest, horizontal, depth, aim - num)
  end

  def follow_course([], horizontal, depth, aim), do: {horizontal, depth, aim}

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
