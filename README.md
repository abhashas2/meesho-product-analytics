# Meesho Product Analytics Case Study

## Improving Buyer Retention & Marketplace Growth

**Author:** A.S. Abhash  
**Institute:** IIT Bhubaneswar

### Objective

This independent case study investigates how a value-oriented marketplace can increase first-to-second purchase conversion, repeat purchase behaviour and customer lifetime value.

### Important methodology note

Meesho does not provide a public transaction-level dataset suitable for calculating its actual customer retention. Therefore, this project uses the **Brazilian E-Commerce Public Dataset by Olist** as an analytical proxy to demonstrate the SQL, customer analytics and product-thinking methodology. Olist is a real, anonymised e-commerce dataset containing roughly 100,000 orders with customer, order, item, payment, review, product, seller and delivery information.

**The analytical results are Olist results, not Meesho results. Product recommendations are strategic hypotheses for Meesho and are not claims about Meesho's internal product or data.**

### Business question

> How can a marketplace reduce friction between a buyer's first and second purchase while improving customer lifetime value?

### North Star Metric

**Repeat Purchase Rate (2+ Orders)**  
Customers with 2+ completed orders / eligible unique customers

### Supporting metrics

- 30-day repeat purchase rate
- Orders per customer
- AOV and revenue per customer
- Delivery lateness and delivery lead time
- Review score
- Freight as % of order value
- Category repeat behaviour

### Product opportunities

1. **Personalized Reorder Journey** — surface likely repeat purchases with a low-friction Buy Again flow.
2. **Personalized Value Bundles** — recommend complementary products using observed purchase behaviour.
3. **Delivery Trust Score** — expose seller reliability as a transparent confidence signal.
4. **Next-Best-Order Incentives** — test the minimum effective incentive for a predicted next purchase.

### Prioritization

The four opportunities are prioritized using the RICE framework. Scores are strategic assumptions until validated with observed data, experimentation and engineering estimates.

### Tools

SQL • Python • Power BI • Product Analytics • RICE • Experimentation

### Repository

- `data/` — dataset documentation and data dictionary
- `sql/` — analytical SQL queries
- `analysis/` — Python analysis and feature engineering
- `powerbi/` — dashboard files
- `presentation/` — case-study deck
- `screenshots/` — selected visuals

### Data source

Brazilian E-Commerce Public Dataset by Olist: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

Dataset license: CC BY-NC-SA 4.0. Raw data is not committed to this repository; follow the source terms when downloading and using it.
