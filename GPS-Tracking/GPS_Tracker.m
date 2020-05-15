for i = 1:1:200

%incase you want to sent zipped file from app unzip it first
%here, "outputdir" is the directory you want to save unzipped file
%unzip('filename.zip','outputdir')

%here saved 'filename' is 'location.kml'
winopen('location.kml')

buffer = fileread('location.kml');
%searching
results = regexp(buffer, '<gx:coord>(.*?)<', 'tokens') ;
for k = 1 : length(results),  fprintf('%s\n', results{k}{1}) ;  
end

a = results{1};
b = char(a);


lon = str2num(b(1:9));
lat = str2num(b(11:18));

url = sprintf('http://maps.googleapis.com/maps/api/geocode/xml?latlng=%.4f,%.4f&sensor=true', lat, lon) ;

butt = urlread(url);


%searching
results = regexp(butt, '<formatted_address>(.*?)<', 'tokens') ;
for k = 1 : length(results),  fprintf('%s\n', results{k}{1}) ;  end

pause(60)


end