---
title: About the azure_data_lake_analytics_resource Resource
platform: azure
---

# azure_data_lake_analytics_resource

Use the `azure_data_lake_analytics_resource` InSpec audit resource to test properties related to datalake analytics for a resource group or the entire subscription.

## Azure REST API version, endpoint and http client parameters

This resource interacts with api versions supported by the resource provider.
The `api_version` can be defined as a resource parameter.
If not provided, the latest version will be used.
For more information, refer to [`azure_generic_resource`](azure_generic_resource.md).

Unless defined, `azure_cloud` global endpoint, and default values for the http client will be used.
For more information, refer to the resource pack [README](../../README.md). 

## Availability

### Installation

This resource is available in the [InSpec Azure resource pack](https://github.com/inspec/inspec-azure). 
For an example `inspec.yml` file and how to set up your Azure credentials, refer to resource pack [README](../../README.md#Service-Principal).

## Syntax

An `azure_data_lake_analytics_resource` resource block returns all Azure datalake analytics, either within a Resource Group (if provided), or within an entire Subscription.
```ruby
describe azure_data_lake_analytics_resource do
  #...
end
```
or
```ruby
describe azure_data_lake_analytics_resource(resource_group: 'my-rg') do
  #...
end
```
## Parameters

- `resource_group` (Optional)

## Properties

|Property       | Description                                                                          | Filter Criteria<superscript>*</superscript> |
|---------------|--------------------------------------------------------------------------------------|-----------------|
| names           | A list of the names.                                                   | `name`            |
| types      | A list of types all the datalake analytics.                                | `type`       |

<superscript>*</superscript> For information on how to use filter criteria on plural resources refer to [FilterTable usage](https://github.com/inspec/inspec/blob/master/dev-docs/filtertable-usage.md).
  
## Examples

### Test If Any datalake analytics Exist in the Resource Group
```ruby
describe azure_data_lake_analytics_resources(resource_group: resource_group) do
  its('names') { should include account_name }
end
describe azure_data_lake_analytics_resources(resource_group: resource_group) do
  its('provisioning_states') { should include('Succeeded') }
end

describe azure_data_lake_analytics_resources(resource_group: resource_group) do
  its('types') { should include 'Microsoft.DataLakeAnalytics/accounts'}
end

```

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

### exists
```ruby
# Should not exist if no datalake analytics are in the resource group
describe azure_data_lake_analytics_resource(resource_group: 'MyResourceGroup') do
  it { should_not exist }
end
```
## Azure Permissions

Your [Service Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal) must be setup with a `contributor` role on the subscription you wish to test.
