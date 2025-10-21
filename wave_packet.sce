
clear;
clc;

// Define parameters
t = linspace(-50, 50, 2000);
k0 = 1.0;
omega0 = 1.0;

// Initialize packet
packet = zeros(t);

// Build wave packet by summing nearby frequencies
for dk = linspace(-0.2, 0.2, 100)
    k = k0 + dk;
    omega = omega0 * (k / k0);
    packet = packet + sin(k * t + omega * 0);
end

// Normalize
packet = packet / max(abs(packet));

// Envelope (Gaussian)
envelope = exp(-0.01 * (t.^2));

// Plot
clf();
plot(t, envelope, 'r--');       // upper envelope
plot(t, -envelope, 'r--');      // lower envelope
plot(t, packet .* envelope, 'b'); // wave packet
xlabel("Position (t)");
ylabel("Amplitude");
title("Wave Packet Representation");
legend(["Envelope", "Wave Packet"], "in_upper_right");
xgrid();

xlabel("x");
ylabel("Amplitude");
title("Wave Packet Representation");
xs2png(0, "wave_packet.png");

