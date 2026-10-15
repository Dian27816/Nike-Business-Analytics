# Nike Sales Intelligence: KPIs, User Stories & Acceptance Criteria

**Project:** Nike Sales Dashboard (Power BI), page "Performance Drivers"
**Author:** Dian Jain | **Status:** Draft v1 (Oct 2026)

**Business problem (one line):** Nike management wants to see regional and product-level sales performance, so it can find underperforming segments and decide where to focus revenue effort.

> Reference values below come from the dashboard with **Quarter = Q4** selected. When the data or the selection changes, the values change; the *rules* stay the same.

---

## 1. KPI Definitions

| # | KPI | Formula | Why it matters | Main user | Where on dashboard |
|---|-----|---------|----------------|-----------|--------------------|
| K1 | **Total Revenue** | Sum of Revenue for the selected filters | Headline measure of sales performance | Business Head | Card (Q4: 275.41K) |
| K2 | **Total Units** | Total units sold for the selected filters | Separates volume from price effects | Sales Manager | Card (Q4: 47) |
| K3 | **Average Selling Price (ASP)** | Total Revenue ÷ Total Units | Shows whether revenue comes from volume or pricing | Marketing Manager | Card (Q4: 5,859.80) |
| K4 | **Profit Margin %** | Average of the dataset's Profit Margin(%) column for the selected orders | Shows how profitable the selected orders are | Business Head | Card (Q4: 15.54%) |
| K5 | **Revenue Growth % (QoQ)** | (Revenue − Revenue in previous quarter) ÷ Revenue in previous quarter | Shows momentum; spots acceleration or decline | Business Head | Card + Quarterly table (Q4: 81.16%) |
| K6 | **Regional Contribution % (Revenue)** | Region revenue ÷ Total revenue of all regions in view | Shows which markets drive sales and which lag | Regional Manager | Bar chart (Q4: Pune 27.26%, Delhi 7.18%) |
| K7 | **Product Contribution % (Revenue)** | Product revenue ÷ Total revenue of all products in view | Shows which products carry the business | Marketing Manager | Bar chart (Q4: Zoom Freak 15.98%) |
| K8 | **Regional Contribution % (Profit)** | Region profit ÷ Total profit of all regions in view | Compared with K6, shows where a region earns more or less profit than its revenue share suggests | Regional Manager | Table (Q4: Pune 31.66%) |

**Notes**
- Profit Margin % uses the dataset's own Profit Margin(%) column (profit as a percentage of cost, averaged across orders), so it reads higher than total profit ÷ total revenue (13.48% for the year).
- Contribution KPIs always add up to 100% across the items shown. A single contribution on its own (e.g. a card with no region/product breakdown) always shows 100% and is meaningless, so contribution is shown only against a breakdown.
- Growth % needs a quarter selected. With a full year selected the "previous quarter" shifts the whole period back one quarter, so the result is not meaningful. Q1 shows blank because there is no earlier quarter.

---

## 2. User Stories

| ID | Priority |
|----|----------|
| US-01 | Must |
| US-02 | Must |
| US-03 | Must |
| US-04 | Should |
| US-05 | Should |
| US-06 | Must |
| US-07 | Should |

### US-01: Headline performance
**As a** Business Head, **I want** to see total revenue, units, average selling price and profit margin at the top of the page, **so that** I can judge overall performance in a few seconds.

**Acceptance criteria**
- **Given** the Performance Drivers page is open, **when** it loads, **then** four cards show Total Revenue, Total Units, ASP and Profit Margin %.
- **Given** Quarter = Q4 is selected, **when** I read the cards, **then** ASP equals Total Revenue ÷ Total Units (275,410.79 ÷ 47 = 5,859.80).
- **Given** Quarter = Q4 is selected, **when** I read the cards, **then** Profit Margin % equals the average of the Profit Margin(%) column for the 24 Q4 orders (15.54%).

### US-02: Regional revenue comparison
**As a** Regional Sales Manager, **I want** to compare each region's share of revenue, **so that** I can identify underperforming markets.

**Acceptance criteria**
- **Given** Quarter = Q4 is selected, **when** I view "Regional Contribution by Revenue", **then** all six regions appear, sorted from highest to lowest share.
- **Given** the same view, **when** I read the chart, **then** Pune is highest (27.26%) and Delhi is lowest (7.18%).
- **Given** no region slicer is applied, **when** I add up the bars, **then** they total 100%.

### US-03: Quarter-on-quarter growth
**As a** Business Head, **I want** to see revenue growth against the previous quarter, **so that** I can tell whether sales are accelerating or slowing.

**Acceptance criteria**
- **Given** Quarter = Q4 is selected, **when** I view the growth card and the quarterly table, **then** both show 81.16%.
- **Given** Q4 revenue is 275,410.79 and Q3 revenue is 152,023.44, **when** growth is calculated, **then** (275,410.79 − 152,023.44) ÷ 152,023.44 = 81.16%.
- **Given** Quarter = Q1 is selected, **when** I read Revenue Growth %, **then** it shows blank, because there is no earlier quarter.
- **Given** the growth value is shown, **when** I read it, **then** it appears in percentage format (e.g. 81.16%), not as a decimal.

### US-04: Product contribution
**As a** Marketing Manager, **I want** to see each product's share of revenue, **so that** I can decide which products to promote and which to review.

**Acceptance criteria**
- **Given** Quarter = Q4 is selected, **when** I view "Product Contribution by Revenue", **then** products are ranked from highest to lowest share.
- **Given** the same view, **when** I read the chart, **then** Zoom Freak is highest (15.98%) and Flex Trainer is lowest (3.29%).
- **Given** I choose a Product Category (e.g. Running), **when** the chart updates, **then** only products in that category appear.

### US-05: Profit versus revenue by region
**As a** Business Head, **I want** to compare each region's share of profit with its share of revenue, **so that** I can find regions that sell a lot but earn little.

**Acceptance criteria**
- **Given** Quarter = Q4 is selected, **when** I view "Regional Contribution by Profit", **then** the table shows Region, Sum of Profit and profit contribution %, with a Total row of 100.00% and profit of 38,149.95.
- **Given** the revenue chart and the profit table are both visible, **when** I compare a region across them, **then** I can see the gap (e.g. Pune: 27.26% of revenue vs 31.66% of profit; Mumbai: 9.44% vs 5.94%).
- **Given** both visuals are titled, **when** I read them, **then** one says "by Revenue" and the other says "by Profit", so they cannot be confused.

### US-06: Filtering
**As a** Sales Manager, **I want** to filter by quarter, region and product category, **so that** I can look at only the segment I manage.

**Acceptance criteria**
- **Given** I select a Quarter, Region or Product Category in a slicer, **when** the selection is applied, **then** all cards, charts and tables on the page update together.
- **Given** I clear all slicers, **when** the page refreshes, **then** the full-year totals are shown.
- **Given** a single region is selected, **when** I view the contribution charts, **then** the numbers still make sense (no errors or blank visuals).

### US-07: Trust in the numbers
**As a** BI / Data team member, **I want** every dashboard KPI to match an independent SQL calculation, **so that** stakeholders can trust the dashboard.

**Acceptance criteria**
- **Given** the same filters (e.g. Q4), **when** I run the SQL for revenue, units, profit, and revenue by region, **then** the results match the dashboard values.
- **Given** a mismatch is found, **when** I investigate, **then** the cause is documented (filter, rounding, or definition) and fixed before release.

---

## 3. Traceability

| Story | KPIs used | Dashboard visual |
|-------|-----------|------------------|
| US-01 | K1, K2, K3, K4 | Top cards |
| US-02 | K1, K6 | Regional Contribution by Revenue (bar) |
| US-03 | K1, K5 | Growth card + Quarterly Revenue Growth (table) |
| US-04 | K1, K7 | Product Contribution by Revenue (bar) |
| US-05 | K4, K6, K8 | Regional Contribution by Profit (table) |
| US-06 | All | Quarter, Region and Product Category slicers |
| US-07 | All | SQL-Analysis.sql (Oct 14) |
