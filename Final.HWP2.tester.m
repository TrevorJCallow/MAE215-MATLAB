function result = TipSlide(P, y, m, l, mu)
    %fricition force
    Ffriction = mu * m * 9.81;
    %sliding
    Fhorizontal = P;
    if Fhorizontal > Ffriction
        result = -1; % value to mean sliding
        return;
    end

    halfwidth = l / 2;
    momentP = P * y; % applied
    momentweight = m * 9.81 * halfwidth; % Moment from wieght
    netmoment = momentP - momentweight;
    if netmoment <= 0
        result = 0; % tipping value
        return;
    end

    % not sliding or tipping
    result = 1;
end
