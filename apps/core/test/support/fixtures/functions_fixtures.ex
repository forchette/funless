# Copyright 2022 Giuseppe De Palma, Matteo Trentin
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

defmodule Core.FunctionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Core.Domain.Functions` context.
  """

  alias Core.Domain.Functions

  @doc """
  Generate a function.
  """
  def function_fixture(attrs \\ %{}) do
    {:ok, function} =
      attrs
      |> Enum.into(%{
        code: "some_code",
        name: "some_name"
      })
      |> Functions.create_function()

    function
  end
end
