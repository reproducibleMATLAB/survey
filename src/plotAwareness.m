function plotAwareness(awarenessTable, awarenessColumn)

    notAware = awarenessTable(contains(awarenessTable{:,awarenessColumn}, "Not aware of"), :);
    awareNoUse = awarenessTable(contains(awarenessTable{:,awarenessColumn}, "Aware of but don't use"), :);
    useWithMatlab = awarenessTable(contains(awarenessTable{:,awarenessColumn}, "Aware of and use with MATLAB"), :);
    useOutsideMatlab = awarenessTable(contains(awarenessTable{:,awarenessColumn}, "Aware of and use outside MATLAB"), :);
    useOutsideMatlabButNotWith = awarenessTable(contains(awarenessTable{:,awarenessColumn}, "Aware of and use outside MATLAB") & ~contains(awarenessTable{:,awarenessColumn},"Aware of and use with MATLAB"), :);

    figure;
%     barVals = [height(notAware) height(awareNoUse) height(useWithMatlab) height(useOutsideMatlab) height(useOutsideMatlabButNotWith)];
    
    barVals = [countByRole(notAware, "Undergraduate student") countByRole(notAware, "Doctoral student") countByRole(notAware, "Postdoctoral Researcher / Research Fellow") countByRole(notAware, "Research Software Engineer") countByRole(notAware, "Academic");...
        countByRole(awareNoUse, "Undergraduate student") countByRole(awareNoUse, "Doctoral student") countByRole(awareNoUse, "Postdoctoral Researcher / Research Fellow") countByRole(awareNoUse, "Research Software Engineer") countByRole(awareNoUse, "Academic");...
        countByRole(useWithMatlab, "Undergraduate student") countByRole(useWithMatlab, "Doctoral student") countByRole(useWithMatlab, "Postdoctoral Researcher / Research Fellow") countByRole(useWithMatlab, "Research Software Engineer") countByRole(useWithMatlab, "Academic");...
        countByRole(useOutsideMatlab, "Undergraduate student") countByRole(useOutsideMatlab, "Doctoral student") countByRole(useOutsideMatlab, "Postdoctoral Researcher / Research Fellow") countByRole(useOutsideMatlab, "Research Software Engineer") countByRole(useOutsideMatlab, "Academic");...
        countByRole(useOutsideMatlabButNotWith, "Undergraduate student") countByRole(useOutsideMatlabButNotWith, "Doctoral student") countByRole(useOutsideMatlabButNotWith, "Postdoctoral Researcher / Research Fellow") countByRole(useOutsideMatlabButNotWith, "Research Software Engineer") countByRole(useOutsideMatlabButNotWith, "Academic");...
        ];
    
    y = 100*barVals/height(awarenessTable);

    labels = {'Not aware of', 'Aware of but don''t use', 'Use with MATLAB', 'Use outside MATLAB', 'Use Outside but not with MATLAB'};
    x = categorical(labels);
    x = reordercats(x,labels);

    handle = bar(x, y, 'stacked');
    ylabel(strcat("% of ", num2str(height(awarenessTable)), " respondents"))

    stackedBarLabels = {'Undergraduate Students', 'Doctoral Students', 'Postdoctoral Researchers/Research Fellows', 'RSEs/Developers','Academics'};
    legend(flip(handle), flip(stackedBarLabels), "Location","northeastoutside")

    set(gcf,'Units','normalized','Position',[0 0 1 1.5]);
    colormap parula

%     xtips1 = b(1).XEndPoints;
%     ytips1 = b(1).YEndPoints;
%     labels1 = string(barVals);
%     text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
%         'VerticalAlignment','bottom')

    function count = countByRole(dataTable, role)
        count = height(dataTable(contains(dataTable.role, role), :));
    end

end

