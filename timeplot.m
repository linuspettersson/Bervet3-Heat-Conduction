clear all
close all
clc

n312 = [290 279.487 280.519 282.279 283.699 284.867 285.764 286.460 286.993 287.395 287.702 287.931 288.113 288.238 288.344 288.419 288.477 288.513 288.546 288.577 288.592];
n52 = [290 297.499 301.357 303.371 305.674 306.999 308.018 308.790 309.380 309.824 310.163 310.418 310.612 310.757 310.868 310.951 311.014 311.062 311.098 311.125 311.149];
time = [0:0.1:2];
plot(time, n312, 'g');
xlabel('time [sek]');
ylabel('Temp [K]');
hold on
plot(time, n52, 'r');
legend('node 312', 'node 52');