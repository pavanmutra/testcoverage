dotnet tool list -g 
dotnet test calculation.tests/calculation.tests.csproj /p:CollectCoverage=true /p:CoverletOutputFormat=opencover
dotnet build-server shutdown
dotnet tool install --global dotnet-sonarscanner --version 4.8.0
dotnet tool list -g 
dotnet sonarscanner begin /k:"calculation" /d:sonar.host.url=http://localhost:9000 /d:sonar.cs.opencover.reportsPaths="calculation.tests\coverage.opencover.xml" /d:sonar.coverage.exclusions="**Tests*.cs"
dotnet build
dotnet sonarscanner end
