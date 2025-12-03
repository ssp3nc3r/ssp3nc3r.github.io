---
aliases:
- about-us
- about-hugo
- contact
author:
  name: ssp3nc3r
title: About
---

<img src="/images/profile.jpg" alt="Scott Spencer" class="profile-photo"/>

I build bespoke probabilistic models that transform complex data into strategic insights for elite sports organizations, then communicate those insights through visualizations and decision support tools I design myself. My approach centers on modeling the actual data-generating processes—the physics, geometry, and human decisions that produce observable outcomes—rather than fitting statistical patterns to summary statistics. This generative thinking produces models that are both more accurate and more interpretable for decision-makers.

<ul>

<li><a href="#bayesian-modeling">Bayesian Modeling</a></li>

<li><a href="#teaching-and-curriculum-development">Teaching and Curriculum Development</a></li>

<li><a href="#communication-and-visualization">Communication and Visualization</a></li>

<li><a href="#education--recognition">Education & Recognition</a></li>

<li><a href="#stan-community">Stan Community</a></li>

<li><a href="#lets-connect">Let's Connect</a></li>

</ul>

------------------------------------------------------------------------

## Bayesian Modeling {#bayesian-modeling}

My consulting work spans Major League Baseball and the English Premier League, where I develop custom Stan models that reflect how sports data actually arise. These models inform decisions involving multi-year contracts in the tens of millions, cross-league transfer evaluations, and roster construction strategies where improved player assessment directly impacts competitive outcomes and organizational value. What unifies this work is a commitment to jointly modeling related processes, incorporating domain knowledge as informative structure, and properly propagating uncertainty through to decision-relevant outputs. While my consulting portfolio centers on professional sports, the methodological challenges—selection bias correction, causal inference with observational data, joint process modeling—transfer directly to other contexts I've supported, from customer behavior analytics to health of global fisheries to climate risk mitigation, including modeling how sea level rise and expected flooding impact coastal property valuations.

*Physics-Informed Models.* I build models where physical constraints and human perception govern the likelihood. In baseball, this means modeling umpire calls through the geometry of their viewing position—the "slot" behind the catcher creates asymmetric uncertainty patterns across the strike zone that vary with ball-strike count. Batter swing decisions depend on perceived ball location, which degrades with distance from the eye. These aren't ad hoc adjustments; they're structural features of the model that improve both fit and interpretability.

*Joint Process Models.* Rather than modeling isolated events, I specify how multiple processes combine to generate observations. A pitcher-batter matchup model jointly estimates call probability, swing probability, contact probability, and hit outcomes—each conditional on the others and on game state. A footballer evaluation framework simultaneously incorporates match events, game states, bookmaker odds, manager squad decisions, and cross-league transfer networks to isolate individual contributions from collective performance. These joint specifications capture dependencies that separate models would miss.

*Hierarchical and Multilevel Structures.* Much of my work involves partial pooling across sparse data: player abilities within positions, team effects within leagues, temporal effects within careers. I use hierarchical priors to share information where appropriate while allowing meaningful variation. Recent work includes jointly modeling abilities for over 100,000 individual players across more than 85 leagues spanning a decade of match data, using hierarchical structures to enable cross-league player comparison while maintaining computational tractability.

*Causal Inference and Experimental Design.* I design A/B tests and implement models (*.e.g.*, regression discontinuity) for organizations evaluating interventions. This includes experimental designs where participants are randomly assigned to control and treatment groups, but eligibility for treatment occurs at different observed time points—requiring models that account for staggered rollout while maintaining causal identification. I implement Bayesian regression discontinuity designs that properly model the discontinuous jump at treatment thresholds while allowing flexible functional forms on either side, with hierarchical structures that share information across multiple discontinuities when testing interventions across different contexts or time periods.

*Survival and Selection Models.* Player evaluation suffers from selection bias—we only observe players who remain in professional sports, creating distorted views of development trajectories. My football work implements multiple survival frameworks jointly: discrete Weibull models for career termination with Accelerated Failure Time specifications where longevity varies by player ability and position, competing risks models where match segments can end through multiple mechanisms (home goal, away goal, or censoring), and Lee inverse Mills ratio corrections that adjust age curves for the systematic filtering of lower-ability players from professional squads. This joint approach propagates survival information through shared ability parameters, allowing older players to contribute evidence about quality through their mere presence while simultaneously using match performance to calibrate survival models. In baseball, I developed Hidden Markov Models that explicitly account for MLB's Injured List eligibility rules—modeling latent health states (*e.g.*, active, 10-day IL, 60-day IL) with hierarchical structures that properly handle censored recovery periods. The model processes hundreds of thousands of game observations across thousands of players, implementing rule-based constraints where players in IL windows remain in fixed states while estimating transition probabilities for other periods. This work draws on techniques from biostatistics adapted for the specific selection mechanisms and administrative rules in professional sports.

*Temporal and Dynamic Models.* Sports performance evolves over time at multiple scales. I implement autoregressive models for tracking within-season form, differential equation models for physical processes like sprint acceleration, and survival models for career-length phenomena. My sprint speed work integrates Statcast tracking data with scouting reports through a joint-likelihood model. Rather than using published summary statistics, I model individual runs at 1/30 second resolution—applying spline smoothing to velocity and acceleration derivatives that reveal maximum speed with reduced measurement error. This physics-informed approach using force-velocity relationships reveals systematic bias in published leaderboards. I implement autoregressive age curves showing asymmetric decline patterns and hierarchical structures for scout grade evaluation that provide full uncertainty quantification. For cycling training load analysis, I implement exponential weighted moving averages with tuned decay parameters (42-day chronic load, 7-day acute load) to forecast athlete form and optimize training stress balance. The computational challenge is maintaining uncertainty propagation across these timescales while remaining tractable.

*Computational Scale & AI-leveraged workflows.* These models can require substantial computation. Current work involves parallelization across hundreds of threads, processing millions of observations with full Bayesian inference. I have used techniques like HSGP approximations for Gaussian processes, QR reparameterization for correlated predictors, and careful coding for memory management locality to make ambitious models feasible. We're all experiencing rapid changes in AI tools; I'm adept at leveraging locally-hosted LLMs and agentic tools (ensuring privacy in data security) where apprpriate in my workflow.

------------------------------------------------------------------------

## Teaching and Curriculum Development {#teaching-and-curriculum-development}

I teach in the [applied analytics graduate program at Columbia University](https://sps.columbia.edu/faculty/scott-spencer), where I've developed and led courses in storytelling with data, research design, and statistical communication. My communication courses integrate visual communication, narrative structure, and interactive design—teaching students to build data stories at the intersection of analyses, texts, and visuals. The curriculum spans from grammar of graphics and empirical visual perception research through modern web technologies to multimodal presentations for executive audiences. Students complete a semester-long case study analyzing real-world data (*e.g.*, NYC Citi Bike system) culminating in three deliverables: analytical proposals for Chief Analytics Officers, interactive visualizations for marketing executives, and value demonstrations for CEOs. Each semester I manage and mentor multiple student teams through complex analytical projects—experience that directly translates to directing analytics teams in organizational settings, where I guide team members with varying technical backgrounds through project scoping, methodology selection, and stakeholder communication. I authored *Data in Wonderland* as a [textbook](https://ssp3nc3r.github.io/diw/) for Columbia's graduate program in data storytelling.

I also designed and teach a two-course Bayesian curriculum through Posit BBC's educational partner Athlyticz, an online learning platform[^1]. [*Becoming a Bayesian I*](https://athlyticz.com/stan-i) builds foundations in probability, simulation, and regression through hierarchical models. [*Becoming a Bayesian II*](https://athlyticz.com/stan-ii) extends into mixture models and zero-inflation, Bradley-Terry and Plackett-Luce ranking models, autoregressive processes, survival analysis, differential equations for performance modeling, B-splines and tensor products, Gaussian processes with Hilbert-space approximations, copulas for correlation structures, and computational optimization including GPU acceleration and memory management. Together, these courses comprise over 200 instructional videos that I produce, film, and edit at professional production quality—three-point lighting, multiple compositions for code and equations, color grading, and sound design. Taylor Hoover, Posit's Director of Data Science Center of Excellence, took the second course and commented: "I loved the quality and depth of the Bayesian II course."

[^1]: Athlyticz recently partnered with Posit PBC to become the first platform to integrate Posit Workbench and Positron directly into a learning management system.

Beyond online courses, I co-teach multi-day Stan workshops covering Bayesian workflow, hierarchical modeling, MCMC diagnostics, and reparameterization strategies for improved sampling performance. These intensive workshops combine lectures with hands-on coding exercises, helping participants develop practical skills in probabilistic programming.

------------------------------------------------------------------------

## Communication and Visualization {#communication-and-visualization}

My ability to translate complex statistical concepts comes from dual backgrounds: a decade at major law firms as an innovation and regulatory advocate, where I developed and reviewed scientific and engineering arguments and communicated them to audiences ranging from technical experts to judges and business executives; and over seven years teaching graduate-level analytics, where I refined how to make Bayesian reasoning accessible.

This isn't incidental to my modeling work—it's central. I design interactive visualization tools that let executives explore probabilistic player valuations, spatial heatmaps that translate joint probabilities into pitch selection guidance, and decision support interfaces that bridge the gap between posterior distributions and actionable recommendations. The models are only valuable if decision-makers can use them.

------------------------------------------------------------------------

## Education & Recognition {#education--recognition}

**Columbia University** — Master of Science, Sports Management & Analytics (4.0 GPA)\
Winner, 2017 SABR Analytics Competition (graduate division)\
Primary analyst and editor, *The Real Madrid Way* (BenBella Books 2016)

**University of Illinois Urbana-Champaign** — Doctor of Jurisprudence\
Honors in research and writing. Specialized in applying formal logic and persuasive communications to complex legal and statistical questions

**Texas Tech University** — Bachelor of Science, Chemical Engineering\
Focused on numerical methods and stochastic process control. Built foundation in mathematical principles underlying physics-informed modeling

My work has been recognized in the Kantar Information is Beautiful Awards.

------------------------------------------------------------------------

## Stan Community {#stan-community}

I contribute software and documentation to the Stan probabilistic programming language as a scientific contributor and educator. I developed pedagogical implementations of McElreath's *Statistical Rethinking* that are widely used in academic settings, and I mentor new users in Bayesian workflow through the Stan discourse forums. My work combines open-source contribution with educational materials that have helped make Bayesian modeling more accessible worldwide.

------------------------------------------------------------------------

## Let's Connect {#lets-connect}

My consulting and teaching schedule allows me to take on select projects where the analytical challenges align with these methodological approaches. While much of my portfolio examples focuses on player evaluation, personnel decisions, and strategies in professional sports, I'm also interested in challenging problems across other domains—customer behavior, clinical outcomes, environmental modeling, operational optimization—particularly where selection bias, sparse hierarchical data, or joint process dependencies make standard methods struggle.

Beyond consulting engagements, I also provide technical mentoring and training for organizations building internal Bayesian modeling capabilities. This includes custom workshops, code review and methodology guidance for analytics teams, and strategic advising on model development workflows.

If you're working on something that might benefit from rigorous Bayesian modeling—or if your team needs mentoring in these approaches—I'd be interested to hear about it. You can reach me on [LinkedIn](https://www.linkedin.com/in/scottaspencer/) or through [direct message on the Stan forums](https://discourse.mc-stan.org/u/ssp3nc3r/) where I'm active in the discussions.