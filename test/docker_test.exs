# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

defmodule DockerTest do
  use ExUnit.Case
  alias Worker.Adapters.Containers.Docker

  describe "docker_socket" do
    test "should return socket path when a valid one is present" do
      System.put_env("DOCKER_HOST", "unix:///run/user/1001/docker.sock")
      assert Docker.docker_socket() == "unix:///run/user/1001/docker.sock"
      System.put_env("DOCKER_HOST", "tcp://127.0.0.1:2375")
      assert Docker.docker_socket() == "tcp://127.0.0.1:2375"
    end

    test "should return default value if an incorrect socket path is found" do
      System.put_env("DOCKER_HOST", "test")
      assert Docker.docker_socket() == "unix:///var/run/docker.sock"
    end
  end
end
