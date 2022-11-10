module ApplicationHelper

  def invoice_number(invoice)
    first_name = invoice.user.first_name[0]
    last_name = invoice.user.last_name[0]
    initials = "#{first_name}#{last_name}"
    invoices_count = Invoice.where(user_id: current_user).count
    if invoices_count < 10
      invoice_num = "0#{invoices_count}"
    else 
      invoice_num = invoices_count
    end
    return "F#{invoice.date.strftime("%Y%m%d")}#{initials}#{invoice_num}"
  end 

  def total_price(quantity, price)
    return quantity.to_i * price.to_i
  end
end
