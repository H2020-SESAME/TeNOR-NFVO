#
# TeNOR - HOT Generator
#
# Copyright 2014-2016 i2CAT Foundation, Portugal Telecom Inovação
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
class WaitCondition < Resource

  # Initializes Wait Condition object
  #
  # @param [String] resource_name the resource name
  # @param [String] handle_name a reference to the wait condition handle used to signal this wait condition
  # @param [Integer] count the number of seconds to wait for the correct number of signals to arrive
  def initialize(resource_name, handle_name, timeout)
    @type = 'OS::Heat::WaitCondition'
    @properties = {'handle' => {'get_resource' => handle_name}, 'timeout' => timeout}
    super(resource_name, @type, @properties)
  end
end