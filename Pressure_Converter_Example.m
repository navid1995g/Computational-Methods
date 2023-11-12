clear;clc;

%% Step_1

U = {'psi', 'atm', 'inHg', 'kg/cm^2', 'inH2O', 'Pa', 'bar', 'dyne/cm^2', 'ftH2O', 'mmHg', 'torr', 'ksi'};
C = [6894.76 101325 3376.85 98066.5 248.843 1 100000 0.1 2988.98 133.322 133.322 6894760];

Step_2 = 1;

while Step_2 == 1

    Ui = input('\nSelect the pressure unit by entering a value within the range 1-12 \n');
    exp_i = mod(Ui,1) == 0;

        if isempty(Ui)

            Ui = 0;

        end

    if Ui > 12 || Ui < 1

        fprintf('\nError --> Correct your response\n\n')

    elseif exp_i == 0

        fprintf('\nError --> Correct your response\n\n')

    else

        Ci = C(Ui);
        Ui = U{Ui};

        %%
        Step_3 = 1;

        while Step_3 == 1

            Pg = input('\nEnter the value for Pressure \n');

            if isempty(Pg)

                Pg = -1;

            end

            if Pg < 0

                fprintf('\nError --> Correct your response\n\n')

            else

                %%
                Step_4 = 1;

                while Step_4 == 1

                    Uj = input('\nSelect the desired pressure unit by entering a value within the range 1-12 \n');
                    exp_j = mod(Uj,1) == 0;

                    if isempty(Uj)

                        Uj = 0;

                    end

                    if Uj > 12 || Uj < 1
                        
                        fprintf('\nError --> Correct your response\n\n')

                    elseif exp_j == 0

                        fprintf('\nError --> Correct your response\n\n')

                    else

                        Cj = C(Uj);
                        Uj = U{Uj};

                        %% Step_5

                        Pd = Ci/Cj*Pg;

                        %% Step_6

                        fprintf('\nThe Original Quantity: Pg = %d %s \n',Pg,Ui)
                        fprintf('The Converted Quantity: Pd = %d %s \n',Pd,Uj)

                        %%
                        Step_7 = 1;

                        while Step_7 == 1

                            Ask1 = input('\nDo you want to convert the pressure to another unit? (YES/NO) \n','s');

                            check_YES = length('YES');
                            check_NO = length('NO');

                            if isempty(Ask1)

                                Ask1 = 0;

                            end

                            lengthAsk = length(Ask1);

                            if lengthAsk == check_YES

                                if logical(Ask1 == 'YES') == 1
                                
                                    Step_7 = 0;

                                else

                                    fprintf('\nError --> Correct your response\n')

                                end

                            elseif lengthAsk == check_NO

                                if logical(Ask1 == 'NO') == 1
                                
                                    %%
                                    Step_8 = 1;
                                
                                    while Step_8 == 1

                                        Ask2 = input('\nDo you want to do another conversion? (YES/NO) \n','s');
                                        check_YES = length('YES');
                                        check_NO = length('NO');

                                        if isempty(Ask2)
                                
                                            Ask2 = 0;
                                
                                        end
                                
                                        lengthAsk = length(Ask2);
                                
                                        if lengthAsk == check_YES
                                
                                            if logical(Ask2 == 'YES') == 1
                                
                                                Step_8 = 0;
                                                Step_7 = 0;
                                                Step_4 = 0;
                                                Step_3 = 0;
                                                Step_2 = 1;
                                
                                            else
                                
                                                fprintf('\nError --> Correct your response\n\n')
                                
                                            end

                                        elseif lengthAsk == check_NO

                                            if logical(Ask2 == 'NO') == 1

                                                Step_8 = 0;
                                                Step_7 = 0;
                                                Step_4 = 0;
                                                Step_3 = 0;
                                                Step_2 = 0;

                                                break

                                            end

                                        else

                                            fprintf('\nError --> Correct your response\n\n')

                                        end

                                    end

                                else

                                    fprintf('\nError --> Correct your response\n\n')

                                end

                            else

                                fprintf('\nError --> Correct your response\n\n')

                            end

                        end

                    end

                end

            end

        end

    end

end
