defmodule AdventOfCode2021.Day3 do
  @type counts() ::
          tuple()

  @spec most_least_common([String.t()], non_neg_integer(), counts()) :: {binary, binary}
  def most_least_common(report, count \\ 0, sums \\ {})

  def most_least_common([line | rest], count, sums) do
    most_least_common(rest, count + 1, add(line, sums))
  end

  def most_least_common([], count, sums) do
    most = sums
    |> Tuple.to_list()
    |> Enum.map(fn total ->
      if(total > count / 2, do: "1", else: "0")
    end)
    |> Enum.join("")

    {most, invert(most)}
  end

  def invert(string) do
    string = Regex.replace(~r/0/, string, "Z")
    string = Regex.replace(~r/1/, string, "0")
    Regex.replace(~r/Z/, string, "1")
  end

  @spec add(
          String.t(),
          counts(),
          non_neg_integer()
        ) :: counts()
  def add(string, sums, n \\ 0)

  def add("1" <> rest, sums, n) do
    val = ((sums |> Tuple.to_list() |> Enum.at(n)) || 0) |> Kernel.+(1)
    add(rest, insert(sums, n, val), n + 1)
  end

  def add(<<_::8, rest::bitstring>>, sums, n) do
    add(rest, insert(sums, n), n + 1)
  end

  def add("", sums, _), do: sums

  def insert(sums, n, val \\ nil)
  def insert(sums, n, val) do
    if val do
      update_fn = if(tuple_size(sums) <= n, do: &Tuple.insert_at/3, else: &Kernel.put_elem/3)
      update_fn.(sums, n, val)
    else
      insert(sums, n, if(tuple_size(sums) > n, do: elem(sums, n), else: 0))
    end
  end
end
