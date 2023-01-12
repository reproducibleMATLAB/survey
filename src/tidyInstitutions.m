function institutions = tidyInstitutions(institutions, verbose)

arguments
    institutions (:,1) string
    verbose logical = false
end

for i=1:size(institutions,1)
   
    if contains(institutions(i), "Sheffield", "IgnoreCase",true) || contains(institutions(i), "TUoS", "IgnoreCase",true) || contains(institutions(i), "sheffeild", "IgnoreCase",true)
        replacement = "The University of Sheffield";
    elseif contains(institutions(i), "Manchester", "IgnoreCase",true)
        replacement = "The University of Manchester";
    elseif contains(institutions(i), "EPFL", "IgnoreCase",true)
        replacement = "EPFL";
    elseif contains(institutions(i), "New York", "IgnoreCase",true) || contains(institutions(i), "NYU", "IgnoreCase",true)
        replacement = "New York University";
    elseif contains(institutions(i), "York", "IgnoreCase",true)
        replacement = "University of York";
    elseif contains(institutions(i), "Leeds", "IgnoreCase",true)
        replacement = "University of Leeds";
    elseif contains(institutions(i), "Oxford", "IgnoreCase",true)
        replacement = "University of Oxford";
    elseif contains(institutions(i), "Warwick", "IgnoreCase",true)
        replacement = "University of Warwick";
    elseif contains(institutions(i), "Potsdam", "IgnoreCase",true)
        replacement = "University of Potsdam";
    elseif contains(institutions(i), "UCL", "IgnoreCase",true)
        replacement = "University College London";
    elseif contains(institutions(i), "Delft", "IgnoreCase",true)
        replacement = "Delft University of Technology ";
    elseif contains(institutions(i), "Imperial", "IgnoreCase",true)
        replacement = "Imperial College London";
    elseif contains(institutions(i), "London School of Economics", "IgnoreCase",true)
        replacement = "London School of Economics";
    elseif contains(institutions(i), "Southampton", "IgnoreCase",true)
        replacement = "University of Southampton";
    elseif contains(institutions(i), "netherlands escience center", "IgnoreCase",true)
        replacement = "Netherlands eScience Center";
    elseif contains(institutions(i), "Washington", "IgnoreCase",true)
        replacement = "University of Washington";
    elseif contains(institutions(i), "Massachusetts Institute of Technology", "IgnoreCase",true)
        replacement = "Massachusetts Institute of Technology";
    elseif contains(institutions(i), "Princeton", "IgnoreCase",true)
        replacement = "Princeton University";
    elseif contains(institutions(i), "Carnegie", "IgnoreCase",true)
        replacement = "Carnegie Mellon University";
    elseif contains(institutions(i), "Loughborough", "IgnoreCase",true)
        replacement = "Loughborough University";
    elseif contains(institutions(i), "Swansea", "IgnoreCase",true)
        replacement = "Swansea University";
    elseif contains(institutions(i), "Durham", "IgnoreCase",true)
        replacement = "Durham University";
    elseif contains(institutions(i), "Neurobiology Research Unit, Copenhagen", "IgnoreCase",true)
        replacement = "Neurobiology Research Unit, Copenhagen University Hospital";
    elseif contains(institutions(i), "Queen Mary", "IgnoreCase",true) || contains(institutions(i), "QMUL", "IgnoreCase",true)
        replacement = "Queen Mary, University of London";
    elseif contains(institutions(i), "CNRS", "IgnoreCase",true)
        replacement = "CNRS";
    elseif contains(institutions(i), "UClouvain", "IgnoreCase",true) || contains(institutions(i), "Universtité catholique de Louvain", "IgnoreCase",true)
        replacement = "UCLouvain";
    elseif contains(institutions(i), "Strathclyde", "IgnoreCase",true)
        replacement = "University of Strathclyde";
    elseif contains(institutions(i), "Leicester", "IgnoreCase",true)
        replacement = "University of Leicester";
    elseif contains(institutions(i), "Chicago", "IgnoreCase",true)
        replacement = "University of Chicago";
    elseif contains(institutions(i), "University of California, San Diego", "IgnoreCase",true)
        replacement = "University of California, San Diego";
    elseif contains(institutions(i), "Energy 2050", "IgnoreCase",true)
        replacement = "Energy 2050";
    elseif contains(institutions(i), "IISLAFE", "IgnoreCase",true)
        replacement = "Instituto de Investigación Sanitaria La Fe de Valencia (IIS La Fe)";
    elseif contains(institutions(i), "Quilmes", "IgnoreCase",true)
        replacement = "University of Quilmes";
    elseif contains(institutions(i), "British Geological Survey", "IgnoreCase",true)
        replacement = "British Geological Survey";

        
    else
        replacement = "";
    end

    if verbose
        fprintf("Replacing ""%s"" with ""%s""\n", institutions(i), replacement);
    end

end

end

