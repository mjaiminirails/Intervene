ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end
    
    columns do
      column do
        panel "Unpublished Service Providers" do
          ul do
            ServiceProvider.where(published: false).each do |prov|
              li link_to(prov.name, admin_service_provider_path(prov))
            end
          end  # end of ul
        end  # end of panel
      end  # end of column

      column do 
        panel "Published Service Providers" do
          ul do 
            ServiceProvider.where(published: true).each do |prov|
              li link_to(prov.name, admin_service_provider_path(prov))
            end
          end  # end of ul
        end  # end of panel
      end  # end of column
    end

  end
end

