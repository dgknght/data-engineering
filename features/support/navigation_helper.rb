module NavigationHelper
  def path_for(page_identifier)
    case page_identifier
    when 'orders' then '/orders'
    else raise "unrecognized page identifier '#{page_identifier}'"
    end
  end
end
World(NavigationHelper)
