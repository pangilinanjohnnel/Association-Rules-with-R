# Market Basket Analysis

## Overview

This project applies **Market Basket Analysis** to identify frequently purchased items and discover relationships between products using **Association Rule Mining**.

The analysis focuses on three main measures:

* **Support** → How common?
* **Confidence** → How often?
* **Lift** → How strong is the association?

---

## 1. Problem / Objective

The objective of this project is to:

* Determine the frequency of individual items.
* Identify frequently occurring item combinations.
* Discover association rules between products.
* Evaluate relationships using **support, confidence, and lift**.

---

## 2. Dataset

**Dataset:** Real Market Data for Association Rules
**Source:** Kaggle
**Dataset size:** 464 transactions × 22 items

**Dataset:** [Real Market Data for Association Rules](https://www.kaggle.com/datasets/rukenmissonnier/real-market-data)

The dataset contains binary transaction data where:

* `1` = item was purchased
* `0` = item was not purchased

### Items

Bread, Honey, Bacon, Toothpaste, Banana, Apple, Hazelnut, Cheese, Meat, Carrot, Cucumber, Onion, Milk, Butter, Shaving Foam, Salt, Flour, Heavy Cream, Egg, Olive, Shampoo, Sugar.

---

## 3. Methodology

### Data Inspection

The dataset was inspected for structure, missing values, and duplicate records.

### Conversion to Transactions

The binary dataset was converted into an `arules` transaction format for association rule mining.

### Item Frequency

Item frequency was analyzed using a minimum support threshold of **0.20**.

The analysis also examined the:

* Top 10 most frequent items
* 10 least frequent items

---

### Association Rule Mining

The **Apriori algorithm** was used to discover association rules.

Parameters:

* Minimum support: **0.20**
* Minimum confidence: **0.50**
* Minimum rule length: **2**
* Maximum rule length: **3**

Rules were then examined and ranked according to:

* Support
* Confidence
* Lift

## 4. Results

### Item Frequency

The most frequently purchased items were:

| Rank | Item   | Relative Frequency |
| ---- | ------ | -----------------: |
| 1    | Banana |               0.44 |
| 2    | Cheese |               0.43 |
| 3    | Bacon  |               0.42 |

The least frequently purchased items were:

| Rank | Item    | Relative Frequency |
| ---- | ------- | -----------------: |
| 1    | Shampoo |               0.36 |
| 2    | Sugar   |               0.36 |
| 3    | Milk    |               0.37 |

---

### Association Rules

The strongest results according to each measure were:

| Measure        | Rule               |  Value | Interpretation                                                                       |
| -------------- | ------------------ | -----: | ------------------------------------------------------------------------------------ |
| **Support**    | Bacon → Banana     | 0.2414 | Bacon and banana occur together in 24.14% of transactions.                           |
| **Confidence** | Butter → Cheese    | 0.5747 | 57.47% of transactions containing butter also contain cheese.                        |
| **Lift**       | Milk → Heavy Cream | 1.3418 | Milk buyers are about 1.34× as likely to buy heavy cream compared with the baseline. |

### Key Interpretation

**Support** measures how common a combination is.

**Confidence** measures how often the consequent appears when the antecedent appears.

**Lift** measures the strength of the association compared with what would be expected by chance.

A lift greater than **1** indicates a positive association between the items.

---

## 5. Visualization

Several visualizations were used to explore the association rules.

### Scatter Plot

The scatter plot compares rules based on measures such as:

* Support
* Confidence
* Lift

Lift was used to provide additional information about the strength of associations.

### Association Graph

A graph visualization was used to show the relationships between items in the rules.

For clearer interpretation, the analysis focused on the **top 10 rules by lift**.

### Specific Rule Analysis

The rules with the highest lift **Milk → Heavy Cream** were also examined to understand:

* What items are related to the antecedent (`Milk`)
* What items lead to the consequent (`Heavy Cream`)

---

## 6. Conclusion

The Market Basket Analysis identified both **frequently purchased items** and **meaningful relationships between products**.

Banana, cheese, and bacon had the highest individual frequencies, while the association-rule analysis identified different relationships depending on the evaluation measure.

Among the discovered rules:

* **Bacon → Banana** had the highest support.
* **Butter → Cheese** had the highest confidence.
* **Milk → Heavy Cream** had the highest lift.

The results demonstrate how Association Rule Mining can be used to uncover purchasing patterns that may not be obvious from individual item frequencies alone.

---

## 7. Learning & Future Improvements

### What I Learned

This project helped develop my understanding of:

* Market Basket Analysis
* Association Rule Mining
* Apriori
* Item frequency
* Support
* Confidence
* Lift
* Association-rule visualization

### Future Improvements

Possible improvements include:

* Experimenting with different support and confidence thresholds.
* Comparing Apriori with other association-rule algorithms such as **ECLAT** or **FP-Growth**.
* Investigating additional rule constraints.
* Exploring a larger and more realistic transaction dataset.
* Applying the discovered patterns to practical business decisions such as product placement or recommendations.

---

## Tools & Technologies

* **R**
* **arules**
* **arulesViz**
* **Kaggle**

## Project Workflow

**Problem → Data → Data Preparation → Item Frequency → Association Rules → Evaluation → Visualization → Conclusion**
