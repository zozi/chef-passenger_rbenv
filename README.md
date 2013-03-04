# passenger_rbenv

Cookbook for installing passenger with rbenv.

## Attributes

* `node[:passenger][:version]` - The version of the passenger gem to install.

* `node[:passenger][:ruby][:root]` - The root directory of the selected ruby version install. Defaults to the rbenv global version from a system install.
* `node[:passenger][:ruby][:version]` - The ruby version you wish to use with passenger. Automatically set based off of `node[:passenger][:ruby][:root]`.
* `node[:passenger][:ruby][:binary]` - Path to the ruby binary. Automatically set based off of `node[:passenger][:ruby][:root]`.
* `node[:passenger][:ruby][:gems_dir]` - Path to where rubygems are installed for the selected version of ruby. Automatically set based off of `node[:passenger][:ruby][:root]`.

* `node[:passenger][:root_path]` - Root directory of the passenger gem.
* `node[:passenger][:module_path]` - Path to the passenger module for apache.

## License

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0.

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
