function [status] = execute_type_stage(status, ipp, env)
    if ismember('type', ipp.Results.stages)
        try 
            filename = status.tikzStage.texFile;
            stream = 1; % stdout
            if errorHasOccurred(status) && exist(filename, 'file')
                fprintf(stream, '\n%%%%%%%% BEGIN FILE "%s" %%%%%%%%\n', filename);
                type(filename);
                fprintf(stream, '\n%%%%%%%% END   FILE "%s" %%%%%%%%\n', filename);
            end
        catch
            e = lasterror('reset');
            [status.typeStage] = errorHandler(e, env);
        end
    end
end