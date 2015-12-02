module CustomersHelper
  def skype_link(skype)
    link_to(@customer.skype, "skype:#{@customer.skype}?chat")
  end
end
