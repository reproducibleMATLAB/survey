function h = plotTrainingDemand(dataTable, column, xlabelon)

    arguments
        dataTable
        column
        xlabelon = false
    end

    notInterested = dataTable(contains(dataTable{:,column}, "Not interested"), :);
    learnAlone = dataTable(contains(dataTable{:,column}, "Would like to learn (on my own)"), :);
    learnStructured = dataTable(contains(dataTable{:,column}, "Would like to learn (in structured training)"), :);
    familiar = dataTable(contains(dataTable{:,column}, "Already familiar with"), :);
    noResponse = dataTable(strcmp(dataTable{:,column}, ""), :);
    
    % figure;
    barVals = [countByExperience(notInterested, "Novice") countByExperience(notInterested, "Competent Practitioner") countByExperience(notInterested, "Expert");...
        countByExperience(learnAlone , "Novice") countByExperience(learnAlone , "Competent Practitioner") countByExperience(learnAlone , "Expert");...
        countByExperience(learnStructured, "Novice") countByExperience(learnStructured, "Competent Practitioner") countByExperience(learnStructured, "Expert");...
        countByExperience(familiar, "Novice") countByExperience(familiar, "Competent Practitioner") countByExperience(familiar, "Expert");...
        countByExperience(noResponse, "Novice") countByExperience(noResponse, "Competent Practitioner") countByExperience(noResponse, "Expert");...
        ];
        
    y = 100*barVals/height(dataTable);

    labels = {'Not interested', 'Would like to learn (on my own)', 'Would like to learn (in structured training)', 'Already familiar with', 'No response'};
    x = categorical(labels);
    x = reordercats(x,labels);

    h = bar(x, y, 'stacked');

    if ~xlabelon
        set(gca,'Xticklabel',[]) 
    end
    
    % stackedBarLabels = {'Novice', 'Competent Practitioner', 'Expert'};
    % legend(flip(handle), flip(stackedBarLabels), "Location","northeastoutside")

    set(gcf,'Units','normalized','Position',[0 0 1 1.5]);
    colormap parula

    function count = countByExperience(dataTable, value)
        count = height(dataTable(contains(dataTable.matlabExperience, value), :));
    end

end

