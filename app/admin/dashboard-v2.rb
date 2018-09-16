ActiveAdmin.register_page 'Dashboard Beta' do
  content title: 'Dashboard Beta' do
    react_component 'Dashboard', Admin::DashboardPropsPresenter.props
  end
end
