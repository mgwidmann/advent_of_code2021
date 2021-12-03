defmodule ReadInput do
  def as_numbers(day) do
    day
    |> as_strings()
    |> Enum.map(fn s -> {s, s |> Integer.parse()} end)
    |> Enum.map(fn {string, result} ->
      if match?(:error, result) do
        raise "Unable to parse input as a number: #{string}"
      end

      {num, ""} = result
      num
    end)
  end

  def as_strings(day) do
    "test/inputs/day#{day}.txt"
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(&String.trim(&1))
  end
end
