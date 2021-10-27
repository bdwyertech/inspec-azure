---
title: About the azure_power_bi_app Resource
platform: azure
---

# azure_power_bi_app

Use the `azure_power_bi_app` InSpec audit resource to test the properties related to Azure Power BI apps.

## Azure REST API version, Endpoint, and HTTP Client Parameters

This resource interacts with API versions supported by the resource provider. The `api_version` is defined as a resource parameter.
If not provided, the latest version is used. For more information, refer to [`azure_generic_resource`](azure_generic_resource.md).

Unless defined, `azure_cloud` global endpoint and default values for the HTTP client are used. For more information, refer to the resource pack [README](../../README.md).

## Availability

### Installation

This resource is available in the [InSpec Azure resource pack](https://github.com/inspec/inspec-azure). For an example, `inspec.yml` file and how to set up your Azure credentials, refer to resource pack [README](../../README.md#Service-Principal).

## Syntax

`app_id` is a required parameter.

```ruby
describe azure_power_bi_app(app_id: 'APP_ID') do
  it  { should exist }
end
```

## Parameters

`app_id` _(required)_

The app ID.

## Properties

| Property                            | Description                                                      |
|-------------------------------------|------------------------------------------------------------------|
| id                                  | The app ID.                                                      |
| name                                | The app name.                                                    |
| description                         | The app description.                                             |
| publishedBy                         | The app publisher.                                               |
| lastUpdate                          | The last time the app was updated.                               |

For properties applicable to all resources, such as `type`, `name`, `id`, and `properties`, refer to [`azure_generic_resource`](azure_generic_resource.md#properties).

Also, refer to [Azure documentation](https://docs.microsoft.com/en-us/rest/api/power-bi/apps/get-app) for other properties available.

## Examples

### Test that the Power BI app is published by inspec-devs

```ruby
describe azure_power_bi_app(app_id: 'APP_ID')  do
  its('publishedBy') { should eq 'inspec-devs' }
end
```

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [Universal Matchers page](/inspec/matchers/).

### exists

```ruby
# If the Azure Power BI app is found, it will exist
describe azure_power_bi_app(app_id: 'APP_ID')  do
  it { should exist }
end
# if the Azure Power BI app is not found, it will not exist
describe azure_power_bi_app(app_id: 'APP_ID')  do
  it { should_not exist }
end
```

## Azure Permissions

This API does not support Service Principal Authentication. Use your Active Directory account access tokens to access this resource.
Your Active Directory account must be set up with an `App.Read.All` role on the Azure Power BI workspace you wish to test.
