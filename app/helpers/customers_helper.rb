module CustomersHelper
  def skype_link(skype)
    link_to(skype, "skype:#{skype}?chat")
  end
end
