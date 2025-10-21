// wave_function.sci
// Visualize particle in a 1D infinite box (n=1..4)

clc; clear; clf;

L = 1;
x = linspace(0, L, 500);

//prepare for multiple plots
clf();
xgrid();
xlabel("x (with 0.5-unit gaps)");
ylabel("ψ(x)");
title("Wave Functions for n = 1 to 4 (Side by Side)");

//plot wave functions with gap
for n = 1:4
    x_shifted = x + (n-1)*(L + 0.5); // 0.5-unit gap between each wave
    psi = sqrt(2/L) * sin(n * %pi * x / L);
    plot(x_shifted, psi);

legend("n=1", "n=2", "n=3", "n=4");
end
// Titles and labels
xlabel("Position (x)");
ylabel("Wave Function ψ(x)");
title("Wave Function for Particle in a 1D Box");

// Save the plot as an image
xs2png(gcf(), "wave_function.png");

