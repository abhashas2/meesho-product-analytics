# Power BI Dashboard Build Specification

## Dashboard title
**Meesho Buyer Retention & Marketplace Growth — Olist Analytical Proxy**

### Purpose
Interactive product analytics dashboard for the Meesho case study. All metrics are calculated from Olist and must be labelled as Olist proxy metrics, not Meesho metrics.

## Page 1 — Executive Retention Overview

### KPI cards
- Eligible delivered customers: 93,358
- Repeat purchase rate (2+ delivered orders): 3.00%
- Repeat customers: 2,801
- Median time to second purchase: 29.0 days
- 90-day second-purchase rate among repeat customers: 68.1%

### Visuals
1. Cohort month vs 30-day repeat rate — line chart.
2. Cohort month vs 90-day repeat rate — line chart.
3. Customer lifecycle funnel: First delivered order → 30-day second purchase → 60-day → 90-day.
4. Top states by delivered orders — horizontal bar chart.
5. Insight panel: first-to-second purchase is a measurable retention journey; test reorder interventions around the observed purchase window.

## Page 2 — Experience & Retention Drivers

### KPI cards
- Late delivery rate: 8.11%
- On-time average review: 4.29/5
- Late average review: 2.57/5
- Median purchase-to-delivery: 10.2 days

### Visuals
1. Late vs on-time review score — clustered columns.
2. Delivery lead-time distribution — histogram.
3. Category repeat rate — ranked bar chart with minimum customer threshold filter.
4. Freight vs first-order value — scatter plot.
5. State filter and category filter.
6. Diagnostic callout: late orders have substantially lower observed review scores; this supports testing, not proving causality of, a reliability signal.

## Required slicers
- Cohort month
- Customer state
- Product category
- Delivery status
- Order status

## Data model
Use these relationships:

customers[customer_id] 1:* orders[customer_id]
customers[customer_unique_id] 1:* customer-level derived table
orders[order_id] 1:* order_items[order_id]
orders[order_id] 1:* order_reviews[order_id]
orders[order_id] 1:* order_payments[order_id]
order_items[product_id] *:1 products[product_id]
order_items[seller_id] *:1 sellers[seller_id]
products[product_category_name] *:1 category_translation[product_category_name]

## Metric definitions

### Repeat Purchase Rate
Customers with 2+ delivered orders / customers with at least 1 delivered order.

### 30/60/90-day second purchase
Customers whose second delivered order occurs within 30/60/90 days of their first delivered order, divided by the relevant first-order customer cohort.

### Late delivery rate
Delivered orders where actual customer delivery date is later than estimated delivery date / delivered orders with both dates available.

### AOV
Order item price + freight at order level / delivered orders.

## Design
Use the existing Meesho case-study palette: green, warm cream/yellow and white; rounded cards; subtle dotted/dashed separators; strong section labels; minimal chart ink; consistent 16:9 layout.

## Data integrity rules
Never present Olist values as Meesho values. Add a small footer: **“Olist public dataset used as analytical proxy; not Meesho internal data.”** Avoid causal language unless an experiment supports it.
