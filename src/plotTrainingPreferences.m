function plotTrainingPreferences(dataTable)

    inPersonLecture = dataTable(contains(dataTable{:,"generalTrainingPreferences"}, "In-person lecture"), :);
    inPersonPractical = dataTable(contains(dataTable{:,"generalTrainingPreferences"}, "In-person practical"), :);
    remoteLecture = dataTable(contains(dataTable{:,"generalTrainingPreferences"}, "Remote (online) lecture"), :);
    remotePractical = dataTable(contains(dataTable{:,"generalTrainingPreferences"}, "Remote (online) practical"), :);
    writtenTutorials = dataTable(contains(dataTable{:,"generalTrainingPreferences"}, "Written tutorials"), :);
    videoTutorials = dataTable(contains(dataTable{:,"generalTrainingPreferences"}, "Video tutorials"), :);
    blogs = dataTable(contains(dataTable{:,"generalTrainingPreferences"}, "Blogs"), :);
    
    figure;
%     barVals = [...
%         countByRole(inPersonLecture, "Undergraduate student") countByRole(inPersonLecture, "Doctoral student") countByRole(inPersonLecture, "Postdoctoral Researcher / Research Fellow") countByRole(inPersonLecture, "Research Software Engineer") countByRole(inPersonLecture, "Academic");...
%         countByRole(inPersonPractical, "Undergraduate student") countByRole(inPersonPractical, "Doctoral student") countByRole(inPersonPractical, "Postdoctoral Researcher / Research Fellow") countByRole(inPersonPractical, "Research Software Engineer") countByRole(inPersonPractical, "Academic");...
%         countByRole(remoteLecture, "Undergraduate student") countByRole(remoteLecture, "Doctoral student") countByRole(remoteLecture, "Postdoctoral Researcher / Research Fellow") countByRole(remoteLecture, "Research Software Engineer") countByRole(remoteLecture, "Academic");...
%         countByRole(remotePractical, "Undergraduate student") countByRole(remotePractical, "Doctoral student") countByRole(remotePractical, "Postdoctoral Researcher / Research Fellow") countByRole(remotePractical, "Research Software Engineer") countByRole(remotePractical, "Academic");...
%         countByRole(writtenTutorials, "Undergraduate student") countByRole(writtenTutorials, "Doctoral student") countByRole(writtenTutorials, "Postdoctoral Researcher / Research Fellow") countByRole(writtenTutorials, "Research Software Engineer") countByRole(writtenTutorials, "Academic");...
%         countByRole(videoTutorials, "Undergraduate student") countByRole(videoTutorials, "Doctoral student") countByRole(videoTutorials, "Postdoctoral Researcher / Research Fellow") countByRole(videoTutorials, "Research Software Engineer") countByRole(videoTutorials, "Academic");...
%         countByRole(blogs, "Undergraduate student") countByRole(blogs, "Doctoral student") countByRole(blogs, "Postdoctoral Researcher / Research Fellow") countByRole(blogs, "Research Software Engineer") countByRole(blogs, "Academic");...
%         ];

    barVals = [];
    for response = {inPersonLecture, inPersonPractical, remoteLecture, remotePractical, writtenTutorials, videoTutorials, blogs}
        responseVals = [];
        for role = ["Undergraduate student", "Doctoral Student", "Postdoctoral Researcher / Research Fellow", "Research Software Engineer","Academic"]
            responseVals = [responseVals countByRole(response{1,1}, role)];
        end
        barVals = [barVals; responseVals];
    end
        
    y = 100*barVals/height(dataTable);

    labels = {'In-person lecture', 'In-person practical', 'Remote lecture', 'Remote practical', 'Written tutorials', 'Video tutorials', 'Blogs'};
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

