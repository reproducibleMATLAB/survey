function plotAwareness(awarenessTable, awarenessColumn)

    notAware = awarenessTable(contains(awarenessTable{:,awarenessColumn}, "Not aware of"), :);
    awareNoUse = awarenessTable(contains(awarenessTable{:,awarenessColumn}, "Aware of but don't use"), :);
    useWithMatlab = awarenessTable(contains(awarenessTable{:,awarenessColumn}, "Aware of and use with MATLAB"), :);
    useOutsideMatlab = awarenessTable(contains(awarenessTable{:,awarenessColumn}, "Aware of and use outside MATLAB"), :);
    useOutsideMatlabButNotWith = awarenessTable(contains(awarenessTable{:,awarenessColumn}, "Aware of and use outside MATLAB") & ~contains(awarenessTable{:,awarenessColumn},"Aware of and use with MATLAB"), :);

    figure;
    
    barVals = [countByExperience(notAware, "Novice") countByExperience(notAware, "Competent Practitioner") countByExperience(notAware, "Expert");...
        countByExperience(awareNoUse , "Novice") countByExperience(awareNoUse , "Competent Practitioner") countByExperience(awareNoUse , "Expert");...
        countByExperience(useWithMatlab, "Novice") countByExperience(useWithMatlab, "Competent Practitioner") countByExperience(useWithMatlab, "Expert");...
        countByExperience(useOutsideMatlab, "Novice") countByExperience(useOutsideMatlab, "Competent Practitioner") countByExperience(useOutsideMatlab, "Expert");...
        countByExperience(useOutsideMatlabButNotWith, "Novice") countByExperience(useOutsideMatlabButNotWith, "Competent Practitioner") countByExperience(useOutsideMatlabButNotWith, "Expert");...
        ];
    
    y = 100*barVals/height(awarenessTable);

    labels = {'Not aware of', 'Aware of but don''t use', 'Use with MATLAB', 'Use outside MATLAB', 'Use outside but not with MATLAB'};
    x = categorical(labels);
    x = reordercats(x,labels);

    handle = bar(x, y, 'stacked');
    ylabel(strcat("% of ", num2str(height(awarenessTable)), " respondents"))

    stackedBarLabels = {'Novice', 'Competent Practitioner', 'Expert'};
    legend(flip(handle), flip(stackedBarLabels), "Location","northeastoutside")

    set(gcf,'Units','normalized','Position',[0 0 1 1.5]);
    colormap parula

    function count = countByExperience(dataTable, value)
        count = height(dataTable(contains(dataTable.matlabExperience, value), :));
    end

end

