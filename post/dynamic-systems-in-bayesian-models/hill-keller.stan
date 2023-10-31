// Hill-Keller model

functions {
  
  // analytical solution to ODE
  vector position(vector F, vector k, vector t, real t0) {
    return F ./ k^2 .* ( exp( -k .* (t - t0) ) - 1 + k .* (t - t0 ) );
  }
  
  vector time(vector F, vector k, vector x, real t0) {
    return (1 + (k ^ 2 .* x) ./ F + lambert_w0(-exp(-1 - (k ^ 2 .* x) ./ F) ) ) ./ k + t0;
  }
}

data {
  
  int<lower=0> N;            // total observations
  vector[N] t;               // elapsed time at each position (s)
  vector[N] x;               // position (m)
  array[N] int p_idx;        // index of runner for observation
}

transformed data {
  real t0 = 0;               // reaction time (s); can be parameter
  int p_max = max(p_idx);    // number of runners in data
}

parameters {
  vector<lower=0>[p_max] F; // propulsive force (N / kg)
  real F_mu;                // average force across players
  real<lower=0> F_sigma;    // variation in force across players
  vector[p_max] k;          // inefficiencies (1/s)
  real<lower=0> k_mu;       // average inefficiencies (1/s)
  real<lower=0> k_sigma;    // variation inefficiencies (1/s)
  real<lower=0> sigma;      // variation from measured position (m)
}

model {
  // priors
  F_mu ~ exponential(1);
  F_sigma ~ normal(0, 1);
  F ~ normal(F_mu, F_sigma);
  
  k_mu ~ exponential(1);
  k_sigma ~ normal(0, 1);
  k ~ normal(k_mu, k_sigma);
  
  sigma ~ normal(0, 1);
  
  // likelihood
  vector[N] x_star = position(F[p_idx], k[p_idx], t, t0);
  target += normal_lpdf(x | x_star, sigma);
}

generated quantities {
  // maximum velovity (m/s)
  vector[p_max] v_max = F ./ k;
  vector[p_max] t90 = time(F, k, rep_vector(90, p_max), t0);
}

