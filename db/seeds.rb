kevin = User.create(name: "Kevin", email: "Kevin@Kevin.com", password: "password")
kevin2 = User.create(name: "Kevin2", email: "Kevin2@Kevin.com", password: "password")

Expense.create(category: "groceries", user_id: kevin.id)
Expense.create(category: "gas", user_id: kevin.id)
Expense.create(category: "rent", user_id: kevin.id)

kevin2.expenses.create(category: "bills")
kevin2.expenses.create(category: "travel")