---
title: About the azure_monitor_log_profiles Resource
platform: azure
---

# azure_monitor_log_profiles

Use the `azure_monitor_log_profiles` InSpec audit resource to test properties and configuration of multiple Azure log profiles.

## Azure REST API Version, Endpoint, and HTTP Client Parameters

This resource interacts with API versions supported by the resource provider.
The `api_version` can be defined as a resource parameter.
If not provided, the latest version will be used.
For more information, refer to [`azure_generic_resource`](azure_generic_resource.md).

Unless defined, `azure_cloud` global endpoint and default values for the HTTP client will be used.
For more information, refer to the resource pack [README](../../README.md).

## Availability

### Installation

This resource is available in the [InSpec Azure resource pack](https://github.com/inspec/inspec-azure). 
For an example `inspec.yml` file and how to set up your Azure credentials, refer to resource pack [README](../../README.md#Service-Principal).

## Syntax

An `azure_monitor_log_profiles` resource block returns all Azure log profiles within an entire subscription.
```ruby
describe azure_monitor_log_profiles do
  it { should exist }
end
```
## Parameters

- This resource does not require any parameters.

## Properties

|Property       | Description                                                                          | Filter Criteria<superscript>*</superscript> |
|---------------|--------------------------------------------------------------------------------------|-----------------|
| ids           | A list of the unique resource ids.                                                   | `id`            |
| names         | A list of names of all the resources being interrogated.                             | `name`          |
| properties    | A list of properties for all the resources being interrogated.                       | `properties`    |

<superscript>*</superscript> For information on how to use filter criteria on plural resources refer to [FilterTable usage](https://github.com/inspec/inspec/blob/master/dev-docs/filtertable-usage.md).

## Examples

### Check if a Specific Log Profile is Present
```ruby
describe azure_monitor_log_profiles do
  its('names')  { should include 'my_log_profile' }
end
```
### Filter the Results by the `name` Property if it Includes a Certain String
```ruby
describe azure_monitor_log_profiles.where{ name.include?('production') } do
  it { should exist }
end
```   
### Filter the Results to Include Only Those Log Profiles that Retention Policy is Enabled
```ruby
describe azure_monitor_log_profiles.where{ properties.dig(:retentionPolicy, :enabled) == true } do
  it { should exist }
  its('count') { should be 4 }
end
```   
## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

### exists

The control will pass if the filter returns at least one result. Use `should_not` if you expect zero matches.
```ruby
describe azure_monitor_log_profiles do
  it { should exist }
end
```
## Azure Permissions

Your [Service Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal) must be setup with a `contributor` role on the subscription you wish to test.
