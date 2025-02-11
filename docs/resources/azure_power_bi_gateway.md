---
title: About the azure_power_bi_gateway Resource
platform: azure
---

# azure_power_bi_gateway

Use the `azure_power_bi_gateway` InSpec audit resource to test the properties related to Azure Power BI gateway.

## Azure REST API version, Endpoint, and HTTP Client Parameters

This resource interacts with API versions supported by the resource provider. The `api_version` is defined as a resource parameter.
If not provided, the latest version is used. For more information, refer to [`azure_generic_resource`](azure_generic_resource.md).

Unless defined, `azure_cloud` global endpoint and default values for the HTTP client are used. For more information, refer to the resource pack [README](../../README.md).

## Availability

### Installation

This resource is available in the [InSpec Azure resource pack](https://github.com/inspec/inspec-azure). For an example, `inspec.yml` file and how to set up your Azure credentials, refer to resource pack [README](../../README.md#Service-Principal).

## Syntax

`gateway_id` is a required parameter.

```ruby
describe azure_power_bi_gateway(gateway_id: 'GATEWAY_ID') do
  it  { should exist }
end
```

## Parameters

`gateway_id` _(required)_

The gateway ID.

## Properties

| Property                            | Description                                                      |
|-------------------------------------|------------------------------------------------------------------|
| id                                  | The gateway ID.                                                  |
| name                                | The gateway name.                                                |
| type                                | The gateway type.                                                |
| publicKey.exponent                  | The public key exponent.                                         |
| publicKey.modulus                   | The public key modulus.                                          |

For properties applicable to all resources, such as `type`, `name`, `id`, and `properties`, refer to [`azure_generic_resource`](azure_generic_resource.md#properties).

Also, refer to [Azure documentation](https://docs.microsoft.com/en-us/rest/api/power-bi/gateways/get-gateway) for other properties available.

## Examples

### Test that the Power BI gateway's exponent is `AQAB`

```ruby
describe azure_power_bi_gateway(gateway_id: 'GATEWAY_ID')  do
  its('publicKey.exponent') { should eq 'AQAB' }
end
```

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [Universal Matchers page](/inspec/matchers/).

### exists

```ruby
# If the Azure Power BI gateway is found, it will exist
describe azure_power_bi_gateway(gateway_id: 'GATEWAY_ID')  do
  it { should exist }
end
# if the Azure Power BI gateway is not found, it will not exist
describe azure_power_bi_gateway(gateway_id: 'GATEWAY_ID')  do
  it { should_not exist }
end
```

## Azure Permissions

Your [Service Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal) must be set up with a `Dataset.Read.All` role on the Azure Power BI Workspace you wish to test.
