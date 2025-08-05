defmodule KitchenCalculator do
  defp get_milliliter_factor(unit) do
    unit_milliliter_map = %{
      :milliliter => 1,
      :cup => 240,
      :fluid_ounce => 30,
      :teaspoon => 5,
      :tablespoon => 15
    }
    Map.get(unit_milliliter_map, unit, nil)
  end

  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter(volume_pair) do
    {unit, volume} = volume_pair
    factor = get_milliliter_factor(unit)
    new_volume = volume * factor
    {:milliliter, new_volume}
  end

  def from_milliliter(volume_pair, unit) do
    {_, milliliters} = to_milliliter(volume_pair)
    factor = get_milliliter_factor(unit)
    unit_volume = milliliters / factor
    {unit, unit_volume}
  end

  def convert(volume_pair, unit) do
    {_, milliliters} = to_milliliter(volume_pair)
    factor = get_milliliter_factor(unit)
    {unit, milliliters / factor}
  end
end

IO.puts(KitchenCalculator.get_volume({:cup, 2.0}))  # => 2.0
IO.puts(KitchenCalculator.to_milliliter({:cup, 2.5}) |> inspect())  # => {:milliliter, 600.0}
IO.puts(KitchenCalculator.from_milliliter({:milliliter, 1320.0}, :cup) |> inspect())  # => {:cup, 5.5}
IO.puts(KitchenCalculator.convert({:teaspoon, 9.0}, :tablespoon) |> inspect())  # => {:tablespoon, 3.0


"""
https://exercism.org/tracks/elixir/exercises/kitchen-calculator

Instructions
While preparing to bake cookies for your friends, you have found that you have to convert some of the measurements used in the recipe. Being only familiar with the metric system, you need to come up with a way to convert common US baking measurements to milliliters (mL) for your own ease.

Use this conversion chart for your solution:

Unit to convert	volume	in milliliters (mL)
mL	1	1
US cup	1	240
US fluid ounce	1	30
US teaspoon	1	5
US tablespoon	1	15
Being a talented programmer in training, you decide to use milliliters as a transition unit to facilitate the conversion from any unit listed to any other (even itself).

1. Get the numeric component from a volume-pair
Implement the KitchenCalculator.get_volume/1 function. Given a volume-pair tuple, it should return just the numeric component.

KitchenCalculator.get_volume({:cup, 2.0})
# => 2.0
2. Convert the volume-pair to milliliters
Implement the KitchenCalculator.to_milliliter/1 function. Given a volume-pair tuple, it should convert the volume to milliliters using the conversion chart.

Use multiple function clauses and pattern matching to create the functions for each unit. The atoms used to denote each unit are: :cup, :fluid_ounce, :teaspoon, :tablespoon, :milliliter. Return the result of the conversion wrapped in a tuple.

KitchenCalculator.to_milliliter({:cup, 2.5})
# => {:milliliter, 600.0}
3. Convert the milliliter volume-pair to another unit
Implement the KitchenCalculator.from_milliliter/2 function. Given a volume-pair tuple and the desired unit, it should convert the volume to the desired unit using the conversion chart.

Use multiple function clauses and pattern matching to create the functions for each unit. The atoms used to denote each unit are: :cup, :fluid_ounce, :teaspoon, :tablespoon, :milliliter

KitchenCalculator.from_milliliter({:milliliter, 1320.0}, :cup)
# => {:cup, 5.5}
4. Convert from any unit to any unit
Implement the KitchenCalculator.convert/2 function. Given a volume-pair tuple and the desired unit, it should convert the given volume to the desired unit.

KitchenCalculator.convert({:teaspoon, 9.0}, :tablespoon)
# => {:tablespoon, 3.0}
"""
