FROM mcr.microsoft.com/dotnet/core/aspnet:2.1-stretch-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:2.1-stretch AS build
WORKDIR /src
COPY ["AzureDevopsSampleApp/AzureDevopsSampleApp.csproj", "AzureDevopsSampleApp/"]
RUN dotnet restore "AzureDevopsSampleApp/AzureDevopsSampleApp.csproj"
COPY . .
WORKDIR "/src/AzureDevopsSampleApp"
RUN dotnet build "AzureDevopsSampleApp.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "AzureDevopsSampleApp.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "AzureDevopsSampleApp.dll"]