require_relative '../views/orders_view'

class OrdersController
  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @view = OrdersView.new
  end


  def add
    # ask meal id
    meal_id = @view.ask_meal_id
    meal = @meal_repository.find(meal_id)
    # ask customer id
    customer_id = @view.ask_customer_id
    customer = @customer_repository.find(customer_id)
    # ask employee id
    employee_id = @view.ask_employee_id
    employee = @employee_repository.find(employee_id)
    # Instantiate order
    order = Order.new(meal: meal, employee: employee, customer: customer)
    # Add to repo
    @order_repository.add(order)


  end

end