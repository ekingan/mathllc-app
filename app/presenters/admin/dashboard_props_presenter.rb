module Admin
  class DashboardPropsPresenter

    def self.props
      new.props
    end

    def props
      clients.map do |client|
        { name: client.name
        }
      end
    end

    def clients
      Client.all
    end

  end
end
