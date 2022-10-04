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

defmodule CoreWeb.ErrorViewTest do
  use CoreWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.json" do
    assert render(CoreWeb.ErrorView, "404.json", []) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500.json" do
    assert render(CoreWeb.ErrorView, "500.json", []) ==
             %{errors: %{detail: "Internal Server Error"}}
  end

  test "renders create_bad_request.json" do
    out = %{
      errors: %{detail: "Failed to create new function: bad request"}
    }

    assert render(CoreWeb.ErrorView, "create_bad_request.json", []) == out
  end

  test "renders create_db_aborted.json" do
    out = %{
      errors: %{
        detail: "Failed to create new function: database error because reason"
      }
    }

    assert render(CoreWeb.ErrorView, "create_db_aborted.json", reason: "reason") == out
  end
end