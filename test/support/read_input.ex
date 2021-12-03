defmodule ReadInput do
  def as_numbers(day) do
    "test/inputs/day#{day}.txt"
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(fn s -> {s, s |> String.trim() |> Integer.parse()} end)
    |> Enum.map(fn {string, result} ->
      if match?(:error, result) do
        raise "Unable to parse input as a number: #{string}"
      end

      {num, ""} = result
      num
    end)
  end
end
