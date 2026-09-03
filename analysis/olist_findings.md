# Olist Analytical Findings

> **Scope:** These are calculated from the public Olist Brazilian e-commerce dataset and are used as an analytical proxy for the Meesho product case. They are **not Meesho metrics**.

## Dataset audit

| Table | Rows |
|---|---:|
| Customers | 99,441 |
| Orders | 99,441 |
| Order items | 112,650 |
| Payments | 103,886 |
| Reviews | 99,224 |
| Products | 32,951 |
| Sellers | 3,095 |
| Geolocation | 1,000,163 |
| Category translation | 71 |

## Retention baseline

For a clean baseline, repeat purchase is calculated among customers with at least one **delivered** order, using `customer_unique_id` to represent a person across orders.

- Eligible delivered customers: **93,358**
- Customers with 2+ delivered orders: **2,801**
- Repeat Purchase Rate: **3.00%**

This is an Olist benchmark, not a Meesho retention rate.

## First-to-second purchase timing

Among the 2,801 repeat customers:

- Second purchase within 30 days: **1,412 (50.4%)**
- Within 60 days: **1,707 (60.9%)**
- Within 90 days: **1,907 (68.1%)**
- Median time to second purchase: **29.0 days**

### Product implication

The first-to-second purchase window is a useful activation/retention journey to test. A reorder surface and relevant next-order prompts should be evaluated against a control group rather than assumed to cause retention.

## Delivery experience

Among delivered orders with both actual and estimated delivery dates:

- Late vs estimated delivery: **8.11%**
- Median purchase-to-delivery time: **10.2 days**
- Mean purchase-to-delivery time: **12.6 days**

Average review score was materially lower for late deliveries:

- On-time: **4.29 / 5**
- Late: **2.57 / 5**

### Product implication

This supports investigating a seller/order reliability signal. The proposed **Delivery Trust Score** should be treated as a product hypothesis and validated for incremental conversion and trust impact.

## Customer value diagnostic

Average first delivered-order gross value (item price + freight):

- One-time customers: **160.73**
- Repeat customers: **145.19**

This does **not** mean repeat customers are less valuable. The comparison is only the first-order value and should not be interpreted as CLV. A complete value analysis should include subsequent orders and contribution margin.

## Category repeat behaviour

Among categories with at least 100 customers in the first-category cohort, the highest observed same-category repeat rates included:

| Category | Customers | Same-category repeat rate |
|---|---:|---:|
| home_appliances | 703 | 3.84% |
| drinks | 292 | 3.42% |
| fashion_bags_accessories | 1,798 | 3.39% |
| bed_bath_table | 9,145 | 3.37% |
| computers_accessories | 6,557 | 2.82% |
| sports_leisure | 7,515 | 2.69% |
| furniture_decor | 6,317 | 2.42% |
| health_beauty | 8,678 | 1.80% |

These rates are descriptive and should not be presented as Meesho category rates.

## Product hypotheses supported by the proxy data

1. **Personalized Reorder Journey:** The measurable first-to-second purchase window makes reorder friction a testable retention opportunity.
2. **Personalized Value Bundles:** Category and purchase behaviour can be used to test complementary-product recommendations and AOV impact.
3. **Delivery Trust Score:** The large review-score gap between late and on-time orders supports testing a transparent reliability signal.
4. **Next-Best-Order Incentives:** Use experimentation to determine whether targeted incentives create incremental repeat orders after accounting for incentive cost.

## Caveats

- Olist is a Brazilian marketplace dataset, not Meesho data.
- The dataset is historical and does not contain Meesho product, pricing or experimentation data.
- Repeat purchase definitions, eligibility windows and revenue definitions should be agreed before production use.
- Recommendations are hypotheses; causal impact requires controlled experiments.
