---
title: About the azure_sentinel_alert_rules Resource
platform: azure
---

# azure_sentinel_alert_rules

Use the `azure_sentinel_alert_rules` InSpec audit resource to test properties related to alert_rule for a resource group or the entire subscription.

## Azure REST API version, endpoint, and HTTP client parameters

This resource interacts with api versions supported by the resource provider.
The `api_version` can be defined as a resource parameter.
If not provided, the latest version will be used.
For more information, refer to [`azure_generic_resource`](azure_generic_resource.md).

Unless defined, `azure_cloud` global endpoint, and default values for the HTTP client will be used.
For more information, refer to the resource pack [README](../../README.md).
For api related info : [`Azure alert_rule Docs`](https://docs.microsoft.com/en-us/rest/api/securityinsights/alert-rules/list).
## Availability

### Installation

This resource is available in the [InSpec Azure resource pack](https://github.com/inspec/inspec-azure).
For an example `inspec.yml` file and how to set up your Azure credentials, refer to resource pack [README](../../README.md#Service-Principal).

## Syntax

An `azure_sentinel_alert_rules` resource block returns all Azure alert_rule, either within a Resource Group (if provided), or within an entire Subscription.

    ```ruby
    describe azure_sentinel_alert_rules(resource_group: 'example', workspace_name: 'fn') do
      #...
    end
    ```
`resource_group` and `workspace_name` must be given as parameters.


## Parameters

| Name                           | Description                                                                       |
    |--------------------------------|-----------------------------------------------------------------------------------|
| resource_group                 | Azure resource group that the targeted resource resides in. `MyResourceGroup`     |
| workspace_name | Azure workspace Name for which alert_rule are being retrieved.|

## Properties

| Property        | Description                                            | Filter Criteria<superscript>*</superscript> |
    |-----------------|---------------------------------------------------------|-----------------|
| names           | A list of the unique resource names.                    | `name`          |
| ids             | A list of alert_rule IDs .                       | `id`            |
| properties      | A list of properties for the resource                   | `properties`          |
| types      | A list of types for each resource              | `type`          |
| severities | The list of severity for alerts created by this alert rule.                                 | `severity` |
| displayNames| The List of display name for alerts created by this alert rule. | `displayName` |
| enableds | The list of flags which Determines whether this alert rule is enabled or disabled. | `enabled` |
| kinds| The alert rule kind |`kind`|
| alertRuleTemplateNames| The Name of the alert rule template used to create this rule.|`alertRuleTemplateName`|

<superscript>*</superscript> For information on how to use filter criteria on plural resources refer to [FilterTable usage](https://github.com/inspec/inspec/blob/master/dev-docs/filtertable-usage.md).

## Examples

### Test if properties matches

 ```ruby
      describe azure_sentinel_alert_rules(resource_group: resource_group, workspace_name: workspace_name) do
      its('names') { should include 'BuiltInFusion' }
      its('types') { should include 'Microsoft.SecurityInsights/alertRules' }
      its('kinds') { should include 'Fusion' }
      its('severities') { should include 'High' }
      its('enableds') { should include true }
      its('displayNames') { should include 'Advanced Multistage Attack Detection' }
      its('alertRuleTemplateNames') { should include 'f71aba3d-28fb-450b-b192-4e76a83015c8' }
      end
 ```

### Test if any alert_rule exist in the resource group

 ```ruby
    describe azure_sentinel_alert_rules(resource_group: 'example', workspace_name: 'fn') do
      it { should exist }
    end
 ```
### Test that there aren't any alert_rule in a resource group

 ```ruby
     # Should not exist if no alert_rule are in the resource group
     describe azure_sentinel_alert_rules(resource_group: 'example', workspace_name: 'fake') do
      it { should_not exist }
     end
 ```
## Azure Permissions

Your [Service Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal) must be setup with a `contributor` role on the subscription you wish to test.