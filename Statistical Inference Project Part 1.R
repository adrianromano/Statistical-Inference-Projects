## Simulations
set.seed(2018)
lambda <- 0.2
n <- 40
simulations <- 1000

expSimulation <- replicate(simulations, rexp(n,lambda))
simulationMeans <- apply(expSimulation, 2, mean)
simulationVar <- apply(expSimulation, 2, var)

## 1. Show the sample mean and compare it to the theoretical mean of the distribution.
sampleMean <- mean(simulationMeans)
sampleMean
theoreticalMean <- 1/lambda
theoreticalMean

hist(simulationMeans, main = "Theoretical vs sample mean", col = "azure", breaks = 20)
abline(v = sampleMean, lwd = 2, col = "red")
abline(v= theoreticalMean, lwd = 2, col = "purple")
text(6.5,110, paste("Sample mean = ", round(sampleMean, 2)), col = "red")
text(6.5, 95, paste("Theoretical mean = ", theoreticalMean), col = "purple")

## 2. Show how variable the sample is (via variance) and compare it to the theoretical variance of the distribution.
sampleVar <-var(simulationMeans)
sampleVar
theoreticalVar <- (1/lambda)^2/n
theoreticalVar

## 3. Show that the distribution is approximately normal.
qqnorm(simulationMeans)
qqline(simulationMeans, col = "red")
