
defmodule HighSchoolSweetheart do
  def first_letter(name) do
    cleaned = String.replace(name, ~r/[\n\s]/, "")
    String.at(cleaned, 0)
  end

  def initial(name) do
    first_initial = String.upcase(first_letter(name))
    "#{first_initial}."
  end

  def initials(full_name) do
    [first_name, last_name] = String.split(full_name, " ")
    first_initial = initial(first_name)
    last_initial = initial(last_name)
    "#{first_initial} #{last_initial}"
  end

  def pair(full_name1, full_name2) do
    # ❤-------------------❤
    # |  X. X.  +  X. X.  |
    # ❤-------------------❤

    initials1 = initials(full_name1)
    initials2 = initials(full_name2)
    """
    ❤-------------------❤
    |  #{initials1}  +  #{initials2}  |
    ❤-------------------❤
    """
  end
end

IO.puts(HighSchoolSweetheart.first_letter("Jane"))
IO.puts(HighSchoolSweetheart.initial("Robert"))
IO.puts(HighSchoolSweetheart.initials("Lance Green"))
IO.puts(HighSchoolSweetheart.pair("Blake Miller", "Riley Lewis"))


"""
https://exercism.org/tracks/elixir/exercises/high-school-sweetheart


Instructions
In this exercise, you are going to help high school sweethearts profess their love on social media by generating an ASCII box with their initials:

❤-------------------❤
|  J. K.  +  M. B.  |
❤-------------------❤
1. Get the name's first letter
Implement the HighSchoolSweetheart.first_letter/1 function. It should take a name and return its first letter. It should clean up any unnecessary whitespace from the name.

HighSchoolSweetheart.first_letter("Jane")
# => "J"
2. Format the first letter as an initial
Implement the HighSchoolSweetheart.initial/1 function. It should take a name and return its first letter, uppercase, followed by a dot. Make sure to reuse HighSchoolSweetheart.first_letter/1 that you defined in the previous step.

HighSchoolSweetheart.initial("Robert")
# => "R."
3. Split the full name into the first name and the last name
Implement the HighSchoolSweetheart.initials/1 function. It should take a full name, consisting of a first name and a last name separated by a space, and return the initials. Make sure to reuse HighSchoolSweetheart.initial/1 that you defined in the previous step.

HighSchoolSweetheart.initials("Lance Green")
# => "L. G."
4. Put the initials inside of the ASCII box
Implement the HighSchoolSweetheart.pair/2 function. It should take two full names and return the initials inside an ASCII box. You don't need to draw the box yourself - make use of the box included in the code comment. Make sure to reuse HighSchoolSweetheart.initials/1 that you defined in the previous step.

HighSchoolSweetheart.pair("Blake Miller", "Riley Lewis")
# => """
# ❤-------------------❤
# |  B. M.  +  R. L.  |
# ❤-------------------❤
# """
"""
