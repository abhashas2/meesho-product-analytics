# Data Source & Methodology

## Primary dataset

**Brazilian E-Commerce Public Dataset by Olist** — public, anonymised e-commerce data covering about 100,000 orders from 2016–2018. It includes orders, customers, order items, payments, reviews, products, sellers and delivery information.

Source: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

## Why this dataset?

The Meesho case study is a product strategy exercise, while Meesho's internal customer-level transaction data is not public. Olist is therefore used as a **proxy dataset** to test the analytical questions and demonstrate the workflow.

The analysis will focus on:

- Repeat purchase behaviour
- First-to-second purchase conversion
- Customer value and order frequency
- Delivery performance and customer reviews
- Freight economics
- Category-level repeat behaviour

## Critical join for retention analysis

Use `customer_unique_id` from the customers table to identify the same underlying customer across orders. The Olist data documentation distinguishes this from `customer_id`, which is assigned to individual orders; `customer_unique_id` is the field intended to identify customers who made repurchases.

## Important limitation

Findings derived from Olist describe **Olist's dataset**, not Meesho's actual customer behaviour. Any Meesho recommendation is a strategic hypothesis and must not be presented as an internal Meesho finding.

## Data handling

Raw CSV files are intentionally not committed to this repository. Download the dataset from the original source and place local files in this folder for analysis. Follow the dataset's CC BY-NC-SA 4.0 licence terms.
