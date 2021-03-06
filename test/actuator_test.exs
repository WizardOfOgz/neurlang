Code.require_file "../test_helper.exs", __FILE__

defmodule ActuatorTest do
  use ExUnit.Case
	alias Neurlang.Neuron, as: Neuron
	alias Neurlang.Sensor, as: Sensor
	alias Neurlang.Actuator, as: Actuator
	alias Neurlang.ConnectedNode, as: ConnectedNode
	alias Neurlang.Accumulator, as: Accumulator

  test "barrier satisfied" do
		actuator = Actuator.new(pid: :actuatorpid)
		actuator = ConnectedNode.add_inbound_connection( actuator, :neuron_pid )
		barrier = HashDict.new()
		barrier = Dict.put( barrier, :neuron_pid, :fake_input)
		actuator = actuator.barrier( barrier )
		assert Accumulator.is_barrier_satisfied?(actuator) == true
	end


	
end
