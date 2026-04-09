clear;clc;close all;

g = 9.80665; % normální tíhové zrychlení 
v_0 = 10; % počáteční rychlost
x_0 = 0; % počáteční souřadnice x
y_0 = 0; % počáteční souřadnice y

figure; % vytvoření nového okna pro vykreslení
hold on; % zapnutí režimu kreslení do jednoho okna
for alpha = 15:15:90 % cyklus přes vybrané hodnoty úhlů
    alpha_rad = deg2rad(alpha); % převod úhlu: stupně -> radiány
    T = 2*v_0*sin(alpha_rad)/abs(g); % doba letu
    t = 0:(T/100):T; % čas (101 časových bodů)
    x = x_0 + v_0.*t.*cos(alpha_rad); % vzdálenost v čase
    y = y_0 + v_0.*t.*sin(alpha_rad) - (1/2).*g.*t.^2; % výška v čase
    R = ((v_0^2)/g)*sin(2*alpha_rad); % dostřel
    H = (v_0^2*sin(alpha_rad)^2)/(2*g); % maximální dosažená výška
    % příprava popisku do legendy
    txt = [   '$\alpha=', num2str(alpha),'$' ...
            ', $R=', num2str(R,'%05.2f'),'$' ...
            ', $H=',num2str(H,'%05.2f'),'$' ...
            ', $T=',num2str(T,'%05.2f'),'$'];
    plot(x, y, 'LineWidth', 2, 'DisplayName', txt); % samotné vykreslení
end
xlabel('vzdálenost [m]')
ylabel('výška [m]')
ylim([0,inf]) % nastavení limitu osy y: 0 až maximum z dat
xlim([0,inf]) % nastavení limitu osy x: 0 až maximum z dat
legend('Interpreter','latex');  % zobrazení legendy
saveas(gcf, 'sikmy_vrh.eps', 'epsc'); % uložení obrázku

