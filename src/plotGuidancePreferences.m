function plotGuidancePreferences(dataTable)

    officialDocs = dataTable(contains(dataTable{:,"preferredGuidance"}, "Official documentation"), :);
    thirdPartyOnline = dataTable(contains(dataTable{:,"preferredGuidance"}, "Third-party online guidance"), :);
    colleagues = dataTable(contains(dataTable{:,"preferredGuidance"}, "Colleagues"), :);
    onlineQA = dataTable(contains(dataTable{:,"preferredGuidance"}, "Online Q&A"), :);
    institutional = dataTable(contains(dataTable{:,"preferredGuidance"}, "Institutional support"), :);
        
    figure;
    barVals = [];
    for response = {officialDocs thirdPartyOnline colleagues onlineQA institutional}
        responseVals = [];
        for role = ["Undergraduate student", "Doctoral Student", "Postdoctoral Researcher / Research Fellow", "Research Software Engineer","Academic"]
            responseVals = [responseVals countByRole(response{1,1}, role)];
        end
        barVals = [barVals; responseVals];
    end
        
    y = 100*barVals/height(dataTable);

    labels = {'Official documentation', 'Third-party online guidance', 'Colleagues', 'Online Q&A/Forums/Stack Overflow/MATLAB Central', 'Institutional Support'};
    x = categorical(labels);
    x = reordercats(x,labels);

    handle = bar(x, y, 'stacked');
    ylabel(strcat("% of ", num2str(height(dataTable)), " respondents"))

    stackedBarLabels = {'Undergraduate Students', 'Doctoral Students', 'Postdoctoral Researchers/Research Fellows', 'RSEs/Developers','Academics'};
    legend(flip(handle), flip(stackedBarLabels), "Location","northeastoutside")

    set(gcf,'Units','normalized','Position',[0 0 1 1.5]);
    colormap parula

    function count = countByRole(dataTable, role)
        count = height(dataTable(contains(dataTable.role, role), :));
    end

end

