#
# TeNOR - VNFD Validator
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
require_relative 'spec_helper'

RSpec.describe VnfdValidator do
	def app
		VnfdValidator
	end

	describe 'POST /vnfds' do
		context 'given an invalid content type' do
			let(:response) { post '/vnfds', {vendor: 'ptin'}.to_json, rack_env={'CONTENT_TYPE' => 'application/x-www-form-urlencoded'} }

			it 'responds with a 415' do
				expect(response.status).to eq 415
			end

			it 'response body should be empty' do
				expect(response.body).to be_empty
			end
		end

		context 'given an invalid VNFD' do
			let(:response) { post '/vnfds', {vendor: 'ptin'}.to_json, rack_env={'CONTENT_TYPE' => 'application/json'} }

			it 'responds with a 400' do
				expect(response.status).to eq 400
			end

			it 'response body should contain a Hash (errors)' do
				expect(response.body).to be_a String
			end

		end

		context 'given a valid VNFD' do
			let(:response) { post '/vnfds', JSON.parse(File.read(File.expand_path("../../assets/samples/vnfd_example.json", __FILE__))).to_json, rack_env={'CONTENT_TYPE' => 'application/json'} }

			it 'responds with a 200' do
				expect(response.status).to eq 200
			end

			it 'response body should be empty' do
				expect(response.body).to be_empty
			end
		end
	end
end