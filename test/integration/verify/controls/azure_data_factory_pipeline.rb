resource_group = input('resource_group', value: nil)
factory_name = input('df_name', value: nil)
pipelines_name = input('df_pipeline_name', value: nil)
control 'azure_data_factory_pipeline' do

  describe azure_data_factory_pipeline(resource_group: resource_group, factory_name: factory_name, pipeline_name: pipelines_name) do
    it { should exist }
    its('name') { should eq pipelines_name }
    its('type') { should eq 'Microsoft.DataFactory/factories/pipelines' }
  end

  describe azure_data_factory_pipeline(resource_group: resource_group, factory_name: 'fake', pipeline_name: pipelines_name) do
    it { should_not exist }
  end

  describe azure_data_factory_pipeline(resource_group: 'fake', factory_name: factory_name, pipeline_name: pipelines_name) do
    it { should_not exist }
  end
end
