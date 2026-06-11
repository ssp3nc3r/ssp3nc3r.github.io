---
title: Four million World Cups before the first whistle
author: Scott Spencer
date: '2026-06-11'
slug: four-million-world-cups
categories:
  - Bayesian
  - Stan
  - Football
  - Simulation
tags:
  - Bayesian modeling
  - Stan
  - World Cup
  - hierarchical models
  - uncertainty
  - imputation
comments: no
images: ~
---

*The 2026 World Cup kicks off today. I simulated the whole tournament four
million times --- and unlike most forecasts you'll read this week, mine tells
you how sure it is.*

## The number everyone publishes, and the number almost nobody does

Every World Cup forecast gives you a number: *Spain 18%*. Useful, but it
hides a question that matters just as much: **how well do we actually know
that number?** A model that has watched a player's whole career should be
more confident than one squinting at six months of form. A squad full of
household names playing in well-measured leagues should carry tighter
uncertainty than one whose players we've barely observed.

So I don't publish a probability. I publish the **distribution of the
probability** --- a full Bayesian answer.

![Posterior densities of championship probability, top 12 teams](images/fig1_champion_densities.png)

Spain leads at **18% [15–22]**. That bracket isn't decoration; it's the
model saying *given everything I know about every Spanish player --- and
everything I don't --- the title chance is somewhere in here.* Even the
favourite is 4-to-1 against. Football's single-elimination format guarantees
that nobody, however good, is ever *likely* to win.

A few things only visible because the answers are distributions:

- **Germany vs Argentina is a coin flip about who's even the better pick.**
  Their means are nearly identical (11.1% vs 11.0%), and across the
  posterior, Germany is the stronger choice in just 52% of draws. Any
  forecast ranking one cleanly above the other is reporting noise.
- **Spain over France is real, but not certain.** Spain is ahead in 83% of
  posterior draws --- strong, not settled.
- **Concentration at the top:** Spain, France and England account for 48%
  of simulated titles; the top nine take 96%. The other 39 teams share what's
  left.

## Six gates, forty-eight teams

The tournament is six gates: reach the round of 32, the 16, the quarters,
the semis, the final, win it. Below, every team's chance at every gate ---
with its 50% and 95% credible intervals, because a number without its
uncertainty is an opinion.

![All 48 teams, all six rounds, with credible intervals](images/fig2_full_field.png)

Reading it as a fan:

- **England's strange shape.** England is *more* likely to reach the
  quarterfinal (76%) than any other team, because their draw is soft exactly
  where others' is brutal: their projected round-of-16 tie is an 87% pass ---
  nearly a bye --- while Argentina's is a 54% coin flip. Bracket geography is
  destiny.
- **Brazil peaks late.** Brazil's semifinal probability (45%) is the best
  in the field --- better than Spain's --- but their gate *into* the final is
  itself a 45% proposition. The model expects them to meet someone serious
  there, and the title probability (10%) reflects it.
- **Sixteen teams will fly home after three games.** The bottom of the
  table is not pessimism; it's arithmetic plus evidence. Iraq's 3.4% chance
  of escaping the group is what happens when most of a squad plays in
  leagues the data doesn't cover.

## Curaçao: missing data, properly imputed

Look at Curaçao's row. The smallest probability in the round-of-32 column
isn't theirs --- but their **interval** is the widest among the longshots:
**10% [2–25]**. Why? Not one Curaçao squad member plays in any of the 86
leagues and competitions the model is trained on. That's a missing-data
problem, and the Bayesian answer is imputation from the model itself: their
abilities are drawn, each posterior draw, from the population distribution
of player abilities the model has already learned. The lack of data doesn't
get papered over with a made-up rating --- it becomes a wider interval,
propagated through every match of the bracket.

This is the part I'd highlight for anyone evaluating modeling work: when
data is missing, the right answer isn't a guess dressed up as a number ---
it's principled imputation inside the same generative model as everything
else, so the final answer carries exactly as much uncertainty as the data
warrants.

## What's under the hood

This isn't an Elo system or a betting-odds aggregator. It's a single **joint
Bayesian hierarchical model** --- more than 220,000 parameters, [hand-tuned
C++ gradients](/post/hand-coded-cpp-gradients-for-stan/), fit with
Stan to ten seasons of data across 86 leagues and competitions: 1.6 million
match segments, 853,000 market valuations, and 27,000 national-team
selection events, covering 106,962 players. Jointly, the model learns:

- **per-player offensive and defensive ability**, correlated, with
  position-specific **age curves** (a 23-year-old midfielder and a
  31-year-old striker age differently);
- **league scoring environments** (the same player produces different goal
  rates in different competitions --- measured, not assumed);
- **manager behaviour** --- who gets selected, who gets substituted, and when,
  as a function of ability and game state;
- **market values, national-team call-ups, and career survival**, which
  sharpen player abilities through entirely different channels of evidence.

Because everything is estimated *jointly*, uncertainty flows end-to-end. The
tournament simulation isn't bolted on: for each of 4,000 posterior draws I
build every nation's best XI (a 4-2-3-1, selected by that draw's abilities),
score matches with the model's own goal process --- zero-inflated, with
match-level shared frailty --- and play all 103 matches that decide the title,
1,000 times over. Four million World Cups, each one consistent with a
different, fully-specified state of belief about every player the data has
measured.

The same machinery that simulates a tournament answers the questions clubs
actually pay for: what is this player worth, how will he age, what does he
add to *this* squad against *this* opposition. The World Cup is just the
fun part.

## After the whistle

Today at the Azteca, the first whistle collapses four million World Cups
into one. Every density on this page narrows, match by match, into the
single tournament we actually get to watch --- one draw from the
distribution, unrepeatable, and quite possibly won by nobody the model
favours. That isn't a failure of the forecast; it *is* the forecast. An 18%
favourite goes home empty four times in five. The point of simulating four
million World Cups was never to predict the one that happens. It was to
know exactly how surprised to be.

---

*Model: joint Bayesian hierarchical model in Stan with custom C++ gradient
kernels. Rosters: announced or provisional squads as of June 2026, matched
to the player database; teams without released squads use most-recent
national-team call-ups. Venue advantage not modeled (neutral-site
assumption). Penalty shootouts treated as coin flips --- even four million
simulations can't tell you who blinks from twelve yards.*
