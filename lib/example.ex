defmodule Example do
  require Integer
  use Application

  @spec start(any(), any()) :: {:error, any()} | {:ok, pid()}
  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def sum_and_average(numbers) do
    sum = Enum.sum(numbers)
    average = sum / length(numbers)
    {sum, average}
  end

  def print_nunbers(numbers) do
    numbers |> Enum.join(" ") |> IO.puts()
  end

  def get_numbers_from_user() do
    IO.puts("Enter numbers separated by spaces: ")
    user_input = IO.gets("") |> String.trim()
    String.split(user_input, " ") |> Enum.map(&String.to_integer/1)
  end

  def main do
    numbers = get_numbers_from_user()
    IO.inspect(sum_and_average(numbers))
    {sum, average} = sum_and_average(numbers)
    IO.puts("Sum: #{sum}, Average: #{average}")
  end
end
