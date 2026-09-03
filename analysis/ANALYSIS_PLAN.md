# Olist Analysis Plan for the Meesho Case Study

This analysis uses Olist as a public proxy dataset. No result in this folder should be described as Meesho's actual customer metric.

## 1. Customer retention
- Deduplicate customers using `customer_unique_id`.
- Exclude canceled/unavailable orders where appropriate.
- Calculate customers with 1 order vs. 2+ orders.
- Calculate repeat purchase rate.
- Calculate first-to-second purchase time.
- Build 30/60/90-day repeat cohorts with a maturity rule so recent first orders are not treated as failed retention.

## 2. Customer value
- Orders per customer
- Product value / AOV
- Freight as a percentage of product value
- Revenue contribution by frequency segment

## 3. Experience diagnostics
- Delivery lead time
- Late-delivery rate vs. estimated delivery date
- Review score by delivery outcome
- Cancellation/unavailable order rate

## 4. Marketplace diagnostics
- Category-level order and value contribution
- Repeat behaviour by category
- Seller-level delivery/review performance

## 5. Product hypotheses
Use the observed patterns to evaluate:
- Personalized Reorder Journey
- Personalized Value Bundles
- Delivery Trust Score
- Next-Best-Order Incentives

## 6. Validation standard
Separate every finding into:
- Data-derived insight
- Hypothesis
- Proposed product solution
- Experiment metric

Do not claim causality from descriptive comparisons. Use controlled experiments to validate product impact.
