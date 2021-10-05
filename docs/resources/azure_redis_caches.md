---
title: About the azure_redis_caches Resource
platform: azure
---

# azure_redis_caches

Use the `azure_redis_caches` InSpec audit resource to test properties of multiple Azure Redis caches in a resource group or in an entire subscription.

## Azure REST API Version, Endpoint, and HTTP Client Parameters

This resource interacts with API versions supported by the resource provider. You can define the `api_version` as a resource parameter. If not provided, the latest version will be used. For more information, refer to [`azure_generic_resource`](azure_generic_resource.md).

Unless defined, `azure_cloud` global endpoint and default values for the HTTP client will be used. For more information, refer to the resource pack [README](../../README.md).

## Availability

### Installation

This resource is available in the [InSpec Azure resource pack](https://github.com/inspec/inspec-azure). For an example, `inspec.yml` file and how to set up your Azure credentials, refer to resource pack [README](../../README.md#Service-Principal).

## Syntax

An `azure_redis_caches` resource block returns all Azure Redis caches within a Resource Group.

```ruby
describe azure_redis_caches(resource_group: 'RESOURCE_GROUP') do
  #...
end
```

or

```ruby
describe azure_redis_caches(resource_group: 'RESOURCE_GROUP') do
  #...
end
```

## Parameters

The parameter should be provided for a valid query

- `resource_group`

| Name                            | Description                                                                      |
|---------------------------------|----------------------------------------------------------------------------------|
| resource_group                  | Azure resource group that the targeted resource resides in. `MyResourceGroup`    |

## Properties

| Property            | Description                                        | Filter Criteria<superscript>*</superscript> |
|--------------------|----------------------------------------------------|-----------------|
| IDs                | A list of the unique resource IDs.                 | `id`            |
| names              | A list of name for all the Resource names.         | `name`          |
| types              | A list of types for all the resources.             | `type`          |
| locations          | A list of locations for all the resources.         | `location`      |
| properties         | A list of properties all the resources.            | `properties`    |
| tags               | A list of resource tags.                           | `tags`          |
| sku_names          | A list of the types of Redis caches to deploy.     | `sku_name`      |
| sku_capacities     | A list of the sizes of the Redis caches to deploy. | `sku_capacity` |
| sku_families       | A list of the SKU families to use.                 | `sku_family`    |
| instances_ssl_ports| A list of Redis instance SSL Ports.                | `instances_ssl_ports` |
| is_master_instance | A list of Redis instance is_master flag.           | `is_master_instance` |
| is_primary_instance| A list of Redis instance is_primary flag.          | `is_primary_instance` |
| max_clients        | A list of max clients in redis configuration.      | `max_clients`   |
| max_memory_reserves| A list of max memory reserves in Redis configuration.| `max_memory_reserved` |
| max_fragmentation_memory_reserves| A list of max fragmentation memory reserves in redis configuration. | `max_fragmentation_memory_reserved` |
| max_memory_deltas  | A list of max memory deltas in Redis configuration. | `max_memory_delta`|
| provisioning_states| A list of provisioning_states from the properties. | `provisioning_state` |
| redis_versions     | A list of Redis versions from the properties.      | `redis_version` |
| enable_non_ssl_port | A list of Redis caches where the non-SSL Redis server port (6379) is enabled. | `enable_non_ssl_port` |
| public_network_access | A list of public network access from the properties. | `public_network_access` |
| access_keys        | A list of access keys from the properties.         | `access_keys`   |
| host_names         | A list of host names from the properties.           | `host_name`    |
| ports              | A list of ports from the properties.               | `port`         |
| ssl_ports          | A list of SSL ports from the properties.           | `ssl_port`     |
| linked_servers     | A list of linked servers from the Redis caches.      | `linked_servers`|

<superscript>*</superscript> For information on how to use filter criteria on plural resources refer to [FilterTable usage](https://github.com/inspec/inspec/blob/master/dev-docs/filtertable-usage.md).

## Examples

### Loop through Redis Caches by their names

```ruby
azure_redis_caches(resource_group: 'RESOURCE_GROUP').names.each do |name|
  describe azure_redis_cache(name: name) do
    it { should exist }
  end
end
```

### Test that there is Redis cache with a specific string in its names using client-side filtering

```ruby
describe azure_redis_caches(resource_group: 'RESOURCE_GROUP').where { name.include?('spec-client') } do
  it { should exist }
end
```

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

### exists

```ruby
# Should not exist if no redis caches are in the resource group
describe azure_redis_caches(resource_group: 'RESOURCE_GROUP') do
  it { should_not exist }
end

# Should exist if the filter returns at least one redis cache
describe azure_redis_caches(resource_group: 'RESOURCE_GROUP') do
  it { should exist }
end
```

## Azure Permissions

Your [Service Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal) must be set up with a `contributor` role on the subscription you wish to test.
