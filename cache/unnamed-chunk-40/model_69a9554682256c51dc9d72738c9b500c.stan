data {
  int<lower=0> N;
  vector<lower=0>[N] rk;
  array[N] int<lower=0> k;
}

parameters {
  vector<lower=0, upper=1>[N] b_;
  real<lower=0> kappa;
  real<lower=0> lambda;
}

transformed parameters {
  vector[N] b = b_ .* rk;
}

model {
  b ~ lognormal(2.7, 2);
  kappa ~ exponential(1);
  lambda ~ exponential(1);
  
  rk - b ~ weibull(kappa, lambda);
}

generated quantities {
  vector[N] rk_hat = weibull_rng(kappa, lambda) + b;
}
