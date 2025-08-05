defmodule LogLevel do
  defp log_code_label_map do
    # Maps log levels to their labels and whether they are supported in legacy apps
    %{
      0 => {:trace, false},
      1 => {:debug, true},
      2 => {:info, true},
      3 => {:warning, true},
      4 => {:error, true},
      5 => {:fatal, false}
    }
  end

  def to_label(level, legacy?) do
    {label, supported} = Map.get(log_code_label_map(), level, {:unknown, false})
    cond do
      legacy? and not supported -> :unknown
      true -> label
    end
  end

  def alert_recipient(level, legacy?) do
    log_label = to_label(level, legacy?)

    cond do
      log_label in [:error, :fatal] -> :ops
      log_label == :unknown and legacy? -> :dev1
      log_label == :unknown and not legacy? -> :dev2
      true -> false
    end
  end
end

IO.puts(LogLevel.to_label(0, false))  # => :trace
IO.puts(LogLevel.to_label(0, true))   # => :unknown
IO.puts(LogLevel.to_label(1, false))  # => :debug
IO.puts(LogLevel.to_label(1, true))   # => :debug
IO.puts(LogLevel.to_label(6, false))  # => :unknown
IO.puts(LogLevel.to_label(6, true))   # => :unknown
IO.puts(LogLevel.alert_recipient(-1, true))  # => :dev1
IO.puts(LogLevel.alert_recipient(0, false))   # => false
IO.puts(LogLevel.alert_recipient(4, true))   # => :ops
IO.puts(LogLevel.alert_recipient(6, true))  # => :dev1
IO.puts(LogLevel.alert_recipient(6, false)) # => :dev2
IO.puts(LogLevel.alert_recipient(2, false))  # => false


"""
Instructions
You are running a system that consists of a few applications producing many logs. You want to write a small program that will aggregate those logs and give them labels according to their severity level. All applications in your system use the same log codes, but some of the legacy applications don't support all the codes.

Log code	Log label	Supported in legacy apps?
0	trace	no
1	debug	yes
2	info	yes
3	warning	yes
4	error	yes
5	fatal	no
other / not supported	unknown	-
1. Determine the log label
Implement the LogLevel.to_label/2 function. It should take an integer code and a boolean flag telling you if the log comes from a legacy app, and return the label of a log line as an atom.

Log codes not specified in the table should return an unknown label. Log codes specified in the table as not supported in legacy apps should also return an unknown label if the log came from a legacy app.

LogLevel.to_label(0, false)
# => :trace

LogLevel.to_label(0, true)
# => :unknown
2. Send an alert
Somebody has to be notified when unexpected things happen.

Implement the LogLevel.alert_recipient/2 function to determine to whom the alert needs to be sent. The function should take an integer code and a boolean flag telling you if the log comes from a legacy app, and return the name of the recipient as an atom.

Use the LogLevel.to_label/2 function from the previous task. If the log label is error or fatal, send the alert to the ops team. If you receive a log with an unknown label from a legacy system, send the alert to the dev1 team, other unknown labels should be sent to the dev2 team. All other log labels can be safely ignored by returning false.

LogLevel.alert_recipient(-1, true)
# => :dev1

LogLevel.alert_recipient(0, false)
# => false
"""
