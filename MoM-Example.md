# Minutes of Meeting: Nike Sales Dashboard Requirements Review

> **Illustrative example.** This is a fictional meeting written to show how I record requirements discussions. The people are represented by role only, and no real meeting took place.

| | |
|---|---|
| **Meeting** | Requirements review: Nike sales dashboard and analysis |
| **Date / time** | 7 October 2026, 45 minutes (illustrative) |
| **Mode** | Video call |
| **Prepared by** | Dian Jain, Business Analyst (facilitator and note-taker) |

## Attendees

| Role | Interest in the project |
|---|---|
| Business Head | Overall growth and profitability |
| Regional Manager | How each region compares with the others |
| Sales Manager | Volume, price and discounting |
| Marketing Manager | Which products to promote or review |
| Data / BI Team member | Accuracy of the numbers and how they are built |

## Agenda

1. Walk through the draft dashboard (Q4 view)
2. Agree KPI definitions
3. Review open questions on the data
4. Confirm scope and next steps

## Discussion

1. **Dashboard walkthrough.** The BA showed the Q4 view: revenue of 275.41K, 47 units, and growth of 81.16% over Q3. The Business Head asked for the growth figure to be easy to read for one quarter at a time.
2. **Profit margin definition.** The Business Head asked which margin the dashboard shows. The Data / BI member explained that the dataset's margin field is profit as a percentage of cost, so it reads higher than profit divided by revenue (13.48% for the year). The group preferred one definition used everywhere.
3. **Growth by quarter.** The Regional Manager asked why growth is blank for Q1. The BA explained there is no earlier quarter to compare with, and that growth is only meaningful when a single quarter is selected.
4. **Budget.** The Sales Manager asked how actual revenue compares with budget. The BA noted that five of six regions are slightly below budget in the draft analysis.
5. **Discounting.** The Marketing Manager asked whether discounts help sales. The Data / BI member said the discount field has no documented unit, so conclusions would be unreliable until it is confirmed.
6. **Regional gaps.** The group noted that Delhi and Mumbai each contribute about 11% of revenue and agreed to look at them first.

## Decisions

| # | Decision |
|---|---|
| D1 | Profit margin = average of the dataset's margin field, used in both the dashboard and the SQL analysis, and documented in the BRD. |
| D2 | Growth is shown with a quarter selected, plus a quarterly table covering all quarters. |
| D3 | Budget comparison is included in the SQL analysis now and added to the dashboard in the next phase. |
| D4 | Delhi and Mumbai are the first regions to review. |

## Action items

| # | Action | Owner | Deadline | Status |
|---|---|---|---|---|
| A1 | Confirm the unit of the discount field with the data owner | Data / BI Team | 9 Oct 2026 | Open |
| A2 | Add the margin definition note to the BRD and the KPI list | Business Analyst | 11 Oct 2026 | Open |
| A3 | Add a budget variance view to the dashboard design | Business Analyst | 14 Oct 2026 | Open |
| A4 | Prepare a short regional comparison for Delhi and Mumbai | Regional Manager | 16 Oct 2026 | Open |
| A5 | Share the discount question list for the next review | Marketing Manager | 16 Oct 2026 | Open |

## Open questions

- What unit does the discount field use (percentage points, fractions, or something else)?
- Is the budget set per region, per product, or both?

**Next meeting:** 16 October 2026 (illustrative), to review the updated dashboard and the discount findings.
