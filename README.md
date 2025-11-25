 # Pizza-Sales-Case-Study
This project is a case study that uses SQL to explore and analyze pizza store sales data across four relational tables. It uncovers insights like revenue trends, top-selling pizzas, and category contributions through practical queries ranging from basic to advanced.


---

### Project Structure

The dataset consists of four tables:
1. orders.csv – Master table of all orders  
2. order_details.csv – Line-item details for each pizza ordered  
3. pizzas.csv – Mapping of pizza IDs with size and price  
4. pizza_types.csv – Pizza categories, names, and ingredients  



### Dataset Overview

1. `orders.csv`:- Contains one row per order placed by a customer.

**Columns**:
- order_id: Unique ID of each order  
- date: Order date  
- time: Time when the order was placed  

**What it tells us**:
- Number of orders per day  
- Peak ordering hours  
- Order trends over time  

---

2. `order_details.csv`:- Contains individual items inside each order (line-item details).

**Columns**:
- order_details_id: Unique row ID  
- order_id: Links to orders.csv  
- pizza_id: Links to pizzas.csv  
- quantity: Number of units ordered  

**What it tells us**:
- Number of pizzas sold  
- Quantity distribution  
- Top-selling pizzas  
- Revenue when joined with pizzas table  

---

3. `pizzas.csv`:- Provides size and price information for every pizza variant.

**Columns**:
- pizza_id: Unique pizza variant ID  
- pizza_type_id: Links to pizza_types.csv  
- size: S, M, L, XL, XXL  
- price: Selling price  

**What it tells us**:
- Pricing strategy  
- Revenue calculations  
- Size-wise sales distribution  

---

4. `pizza_types.csv`:- Defines pizza types, names, categories, and ingredients.

**Columns**:
- pizza_type_id: Unique pizza type  
- name: Pizza name  
- category: Classic, Veggie, Chicken, etc.  
- ingredients: Ingredients  

**What it tells us**:
- Category-wise performance  
- Customer preferences  
- Ingredient-based insights  

---

### SQL Questions Covered

**Basic Level**:
- Total number of orders  
- Total revenue  
- Highest-priced pizza  
- Most ordered pizza size  
- Top 5 pizzas by quantity  

**Intermediate Level**:
- Category-wise quantity sold  
- Hour-wise distribution  
- Daily average pizzas ordered  
- Top pizzas by revenue  

**Advanced Level**:
- Revenue contribution %  
- Cumulative revenue  
- Top 3 pizzas by revenue per category  

---

### How to Use
1. Import the datasets into MySQL/PostgreSQL/SQLite  
2. Run the SQL scripts  
3. Analyze the outputs and generate insights  

---

### Key Learning Outcomes
- SQL joins  
- Aggregations  
- KPI calculation  
- Business insights from sales data  
