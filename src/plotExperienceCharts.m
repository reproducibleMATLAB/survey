function plotExperienceCharts(cleanedData)

    roleExperienceTable = cleanedData(:, {'role', 'matlabExperience', 'programmingExperience'});
    
    % Filter out the rows by role
    undergrads = roleExperienceTable(contains(roleExperienceTable.role, "Undergraduate"), 2:3);
    gradStudents = roleExperienceTable(contains(roleExperienceTable.role, "Doctoral Student"), 2:3);
    postdocs = roleExperienceTable(contains(roleExperienceTable.role, "Postdoctoral Researcher / Research Fellow"), 2:3);
    rses = roleExperienceTable(contains(roleExperienceTable.role, "Research Software Engineer"), 2:3);
    academics = roleExperienceTable(contains(roleExperienceTable.role, "Academic"), 2:3);
    
    figure;
    subfigpos=1;

    for experienceColumn = ["matlabExperience", "programmingExperience"]

        undergradGroupCount = groupcounts(undergrads, experienceColumn,"IncludeEmptyGroups",true).GroupCount;
        gradStudentGroupCount = groupcounts(gradStudents, experienceColumn,"IncludeEmptyGroups",true).GroupCount;
        postdocGroupCount = groupcounts(postdocs, experienceColumn,"IncludeEmptyGroups",true).GroupCount;
        rseGroupCount =  groupcounts(rses, experienceColumn,"IncludeEmptyGroups",true).GroupCount;
        academicGroupCount = groupcounts(academics, experienceColumn,"IncludeEmptyGroups",true).GroupCount;
        
        % reorder from alphabetical to 'Novice', 'Competent Practitioner', 'Expert'
        y = [undergradGroupCount(3) undergradGroupCount(1) undergradGroupCount(2);...
            gradStudentGroupCount(3) gradStudentGroupCount(1) gradStudentGroupCount(2);...
            postdocGroupCount(3) postdocGroupCount(1) postdocGroupCount(2);...
            rseGroupCount(3) rseGroupCount(1) rseGroupCount(2);...
            academicGroupCount(3) academicGroupCount(1) academicGroupCount(2)];
        
        labels = {'Undergraduate Students', 'Doctoral Students', 'Postdoctoral Researchers/Research Fellows', 'RSEs/Developers','Academics'};
        x = categorical(labels);
        x = reordercats(x,labels);
        
        subplot(1, 2, subfigpos);
        handle = bar(x, y, 'stacked');
        ylabel('# Respondents')
        if experienceColumn == "matlabExperience"
            title('MATLAB expertise according to self-identified role')
        elseif experienceColumn == "programmingExperience"
            title('Programmming expertise according to self-identified role')
        end

        legend(flip(handle), 'Expert', 'Competent Practitioner', 'Novice')
        % flip the legend so that labels for stacked bars appear in sameset(gcf,'Units','normalized','Position',[0 0 1 1.5]);
        % order as bars

        hold on
        subfigpos = subfigpos+1;
    end

end

