# Jordan0day on startupkc slack
defmodule Crap5 do
  def calc(num_points) do
    time_start = :os.system_time(:milli_seconds)
    :random.seed(:os.timestamp)
    collection = Enum.map(1..num_points, fn (_) -> :random.uniform() * 100 end)
    sample_size = 15 * 60

    {first, rest} = Enum.split(collection, sample_size)
    sum = Enum.sum(first)
    avg = sum / sample_size

    averages = foldish(first, [], rest, sum, sample_size, [avg])

    # averages = do_foldish(collection, samples)

    time_end = :os.system_time(:milli_seconds)

    IO.puts "Crap5 test"
    IO.puts "Averages (#{length averages}): #{inspect averages}"
    IO.puts "total time: #{time_end - time_start}"
  end

  defp foldish(_, _, [], _, _, averages) do
    Enum.reverse(averages)
  end

  defp foldish([], current_sample, rest, prev_sum, sample_size, averages) do
    foldish(Enum.reverse(current_sample), [], rest, prev_sum, sample_size, averages)
  end

  defp foldish([h_first | first], current_sample, [h_rest | rest], prev_sum, sample_size, averages) do
    new_sum = prev_sum - h_first + h_rest
    avg = new_sum / sample_size

    foldish(first, [h_rest] ++ current_sample, rest, new_sum, sample_size, [avg] ++ averages)
  end
end

Crap5.calc(100_000)
