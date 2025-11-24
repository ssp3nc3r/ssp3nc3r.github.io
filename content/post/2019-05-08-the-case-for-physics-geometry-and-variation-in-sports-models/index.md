---
title: The case for physics, geometry, and variation in sports models
author: Scott Spencer
date: '2019-05-08'
slug: the-case-for-physics-geometry-and-variation-in-sports-models
categories:
  - Bayesian
  - Physics
  - Geometry
  - Trigonometry
  - Variation
  - Sports
tags: []
comments: no
images: ~
---

**Traditional machine learning** of sports performance often overlooks the physical constraints of the game, making models prone to identifying patterns driven by selection bias rather than actual game dynamics. Machine learning models may overfit to confounding variables, generating predictions that are not generalizable or realistic without grounding predictions in the known physics and geometry of sports, including baseball.

**Physics, geometry, and trigonometry** govern ***all movement*** in sports performance, like baseball---from the ball's trajectories off the mound or in the outfield to player positioning, rounding bases, throws, and ball contact with bats, dirt, and grass. Players, coaches, and managers make decisions based on these physical realities. Ignoring them in data models risks producing outputs that don't align with how the game is actually played.

### The Dangers of Summary Statistics as Predictors

Machine learning approaches often rely on **summary statistics** like FIP (Fielding Independent Pitching) or OPS (On-base Plus Slugging) as predictors. While these summaries simplify complex data, they come with significant drawbacks.

1.  **Loss of Granularity**: Summary statistics as predictors condense multiple underlying variables into a single number, masking important nuances. For example, FIP aggregates outcomes but doesn't capture critical factors like pitch velocity, spin rate, or sequencing that directly influence those outcomes. By reducing this complexity, the model misses important context.

2.  **Bias and Self-Selection**: Summarized data as predictors can also obscure selection biases inherent in observational data. A pitcher's FIP might reflect an overall average, but it may miss context-specific performance shifts, such as how that pitcher fares against certain batters or in high-pressure situations. These biases become exacerbated when machine learning models attempt to learn from overly aggregated data.

3.  **Masking True Drivers**: By summarizing the data as predictors, models often pick up correlations without understanding the underlying mechanisms. This leads to misleading conclusions, making it difficult for teams to identify **why** a player succeeds or struggles in a particular context.

### The Problem with Overfitting and Spurious Correlations

**Overfitting** is a common issue in machine learning when models latch onto noisy patterns in the data, producing highly specific predictions that don't hold up in new contexts. In baseball, where observational data contains noise due to countless variables, machine learning models can identify spurious correlations unrelated to actual gameplay. For instance, a model might attribute a pitcher's success to pitch type without considering fatigue or pitch sequence, leading to erroneous conclusions.

Without incorporating physics or geometric constraints, machine learning models risk suggesting impossible player movements or unrealistic pitch outcomes. This misalignment with the game's physical dynamics undermines the model's utility in real-world decision-making.

### Bayesian Models Provide More Interpretability

A major limitation of many data-driven models is their **lack of interpretability**. Machine learning models often act as "black boxes," offering predictions without explaining the mechanisms behind them. For example, a machine learning model might predict a high probability of a pitcher performing well under certain conditions but offer little insight into whether this is due to pitch speed, batter behavior, or field positioning.

By contrast, **Bayesian models** grounded in physics provide clear interpretability. They explain the interactions between physical variables---pitch velocity, spin, and batter reaction times---and give decision-makers actionable insights about **why** specific outcomes occur. This leads to a more informed understanding of performance and clearer, data-driven decision-making.

### Preserving Variation and Uncertainty in Bayesian Models

Traditional models that rely on acronym-statistics, such as FIP, often **underestimate the inherent uncertainty** in performance metrics. These summary statistics provide a single number for a player's performance, but they don't capture variability or account for extreme scenarios. This simplification can lead to overconfident predictions.

On the other hand, **Bayesian models** that incorporate raw measures **preserve the natural variation** within these measures, enabling a better understanding of performance. The uncertainty modeled by these Bayesian approaches reflects the real-world randomness and variability inherent in baseball, allowing for probabilistic predictions that better represent reality.

### Stan: Incorporating Physical, Geometric, and Trigonometric Constraints

Stan provides a flexible and powerful framework to implement **Bayesian models** that incorporate the physical, geometric, and trigonometric constraints governing sports like baseball. This allows for more realistic and actionable predictions. Specifically:

-   **Preserving Raw Data Variation**: By modeling relationships between raw physical measures like pitch speed, spin rate, and release angle, Stan preserves the inherent variation in the data, offering more accurate predictions than summary statistics, which mask key details.

-   **Modeling Physical Constraints**: Stan allows for direct coding of physical laws into the model. For example, pitch trajectories governed by gravity, or the limits of a player's reaction time, can be explicitly modeled to ensure predictions are physically plausible and generalizable.

-   **Simulating Hypothetical Scenarios**: One of Stan's key strengths is the ability to **simulate outcomes under hypothetical scenarios**. For example, a team might want to simulate how a batter will perform against a pitcher they haven't faced before. By incorporating the full uncertainty of the posterior distribution, Stan models can realistically predict performance based on physical constraints, past data, and probabilistic outcomes. This offers a reliable framework for **in-game decision-making** and strategic planning.

### Conclusion

By relying on simplified summary statistics and ignoring the physical constraints governing baseball, traditional machine learning models risk producing misleading predictions that don't generalize to real gameplay. These models are prone to overfitting, spurious correlations, and black-box outputs that provide little insight into underlying game dynamics.

In contrast, **Bayesian models** that integrate physical, geometric, and trigonometric laws offer several key advantages:

-   They maintain the full variation in raw data, preserving important details that explain **why** specific outcomes occur.

-   They ensure predictions are grounded in the physical realities of the game, producing results that are both interpretable and actionable.

-   They allow teams to simulate hypothetical scenarios with confidence, knowing the models respect the physical constraints and natural variation of the game.

For decision-makers in professional sports like baseball, this approach provides more reliable insights, enabling better-informed strategies and more effective decisions both on and off the field.
