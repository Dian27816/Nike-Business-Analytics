# Weekly Status Update: Nike Sales Analytics

> **Illustrative example.** This is a sample weekly update written to show how I report progress. It is based on the work in this repository, and no real client received it.

| | |
|---|---|
| **Project** | Nike Sales Analytics: SQL analysis and Power BI dashboard |
| **Reporting week** | 12 to 16 October 2026 (illustrative) |
| **Prepared by** | Dian Jain, Business Analyst |
| **Overall status** | **Green**, with one amber risk (see Risks) |

## Summary

Requirements, SQL analysis and the Power BI dashboard are complete, and the dashboard figures were checked against the SQL results. The main open item is confirming how the discount field is measured, which affects how far the discount findings can be trusted.

## Completed this week

- Updated the Business Requirements Document to v1.1 (11 functional requirements, 9 KPIs).
- Wrote 7 user stories with Given/When/Then acceptance criteria.
- Completed 14 SQL queries covering revenue, region and product performance, budget, margin, discounts, seasonality, quarterly growth, ranking and data quality.
- Finished the two-page Power BI dashboard and confirmed its numbers against SQL (for example Q4 revenue 275.41K, growth 81.16%).
- Wrote business recommendations and the architecture diagram.

## Key insights

| Insight | Evidence |
|---|---|
| Sales are concentrated in Q4 | 57% of 2024 revenue, 24 of 40 orders |
| Most regions missed budget, narrowly | 5 of 6 regions below budget (1.3% to 3.5%) |
| Mumbai has the weakest margin | 11.6% average margin, against about 18% for Pune and Delhi |
| Discounts show no revenue benefit | Orders with no discount average about 14.3K, against 5.4K for low-discount orders |

## Risks and issues

| # | Risk or issue | Impact | Mitigation | Owner | Status |
|---|---|---|---|---|---|
| 1 | The unit of the discount field is not documented | Discount findings could be misread | Confirm the unit with the data owner before presenting the discount recommendation | Data / BI Team | **Amber** |
| 2 | The dataset's margin field is profit as a percentage of cost, not revenue | Margin looks higher than profit divided by revenue (13.48%) | Definition documented in the BRD and used consistently in the dashboard and SQL | Business Analyst | Closed |
| 3 | Small sample (40 orders; Q1 has 2 orders) | Shares and growth rates are indicative only | State this limit in all reports; retest on a larger dataset | Business Analyst | Open |

## Decisions needed

- Confirm whether budget variance should move from the SQL analysis onto the dashboard in the next phase.

## Plan for next week

- Get the discount unit confirmed and retest the discount findings.
- Add a budget variance view to the dashboard design.
- Review Delhi (volume) and Mumbai (margin) with the Regional Manager.
- Share the recommendations with stakeholders and capture feedback in the next MoM.

## Metrics

| Item | Planned | Done |
|---|---|---|
| Requirements documents | 1 | 1 |
| User stories | 7 | 7 |
| SQL queries | 14 | 14 |
| Dashboard pages | 2 | 2 |
