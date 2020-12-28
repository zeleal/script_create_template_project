SET nomeProjeto=ConnectTravel

dotnet new sln -o %nomeProjeto%

cd %nomeProjeto%

echo 'Criando Pasta Generics'
mkdir generics

echo 'entrando na pasta Generics'
cd generics

dotnet new classlib -f netcoreapp3.1 -o %nomeProjeto%.Generics.Api
dotnet sln ..\%nomeProjeto%.sln add .\%nomeProjeto%.Generics.Api\%nomeProjeto%.Generics.Api.csproj
dotnet add .\%nomeProjeto%.Generics.Api\%nomeProjeto%.Generics.Api.csproj package Microsoft.AspNetCore.Authentication -v 2.2.0
dotnet add .\%nomeProjeto%.Generics.Api\%nomeProjeto%.Generics.Api.csproj package Microsoft.AspNetCore.Authentication.JwtBearer -v 3.1.10
dotnet add .\%nomeProjeto%.Generics.Api\%nomeProjeto%.Generics.Api.csproj package Microsoft.AspNetCore.Mvc.Core -v 2.2.5
dotnet add .\%nomeProjeto%.Generics.Api\%nomeProjeto%.Generics.Api.csproj package System.IdentityModel.Tokens.Jwt -v 6.8.0

dotnet new classlib -f netcoreapp3.1 -o %nomeProjeto%.Generics.Application
dotnet sln ..\%nomeProjeto%.sln add .\%nomeProjeto%.Generics.Application\%nomeProjeto%.Generics.Application.csproj
dotnet add .\%nomeProjeto%.Generics.Application\%nomeProjeto%.Generics.Application.csproj package AutoMapper -v 10.1.1
dotnet add .\%nomeProjeto%.Generics.Application\%nomeProjeto%.Generics.Application.csproj package AutoMapper.Extensions.Microsoft.DependencyInjection -v 8.1.0
dotnet add .\%nomeProjeto%.Generics.Application\%nomeProjeto%.Generics.Application.csproj package Microsoft.AspNetCore.Mvc.Core -v 2.2.5
dotnet add .\%nomeProjeto%.Generics.Application\%nomeProjeto%.Generics.Application.csproj package Microsoft.Extensions.Configuration -v 5.0.0
dotnet add .\%nomeProjeto%.Generics.Application\%nomeProjeto%.Generics.Application.csproj package Microsoft.Extensions.Options -v 5.0.0

dotnet new classlib -f netcoreapp3.1 -o %nomeProjeto%.Generics.Data
dotnet sln ..\%nomeProjeto%.sln add .\%nomeProjeto%.Generics.Data\%nomeProjeto%.Generics.Data.csproj
dotnet add .\%nomeProjeto%.Generics.Data\%nomeProjeto%.Generics.Data.csproj package AutoMapper -v 10.1.1
dotnet add .\%nomeProjeto%.Generics.Data\%nomeProjeto%.Generics.Data.csproj package Microsoft.Data.SqlClient -v 2.0.1
dotnet add .\%nomeProjeto%.Generics.Data\%nomeProjeto%.Generics.Data.csproj package Microsoft.EntityFrameworkCore -v 5.0.0
dotnet add .\%nomeProjeto%.Generics.Data\%nomeProjeto%.Generics.Data.csproj package Microsoft.EntityFrameworkCore.SqlServer -v 5.0.0
dotnet add .\%nomeProjeto%.Generics.Data\%nomeProjeto%.Generics.Data.csproj package Microsoft.Extensions.Configuration -v 5.0.0

dotnet new classlib -f netcoreapp3.1 -o %nomeProjeto%.Generics.Domain
dotnet sln ..\%nomeProjeto%.sln add .\%nomeProjeto%.Generics.Domain\%nomeProjeto%.Generics.Domain.csproj
dotnet add .\%nomeProjeto%.Generics.Domain\%nomeProjeto%.Generics.Domain.csproj package FluentValidation -v 9.3.0
dotnet add .\%nomeProjeto%.Generics.Domain\%nomeProjeto%.Generics.Domain.csproj package Microsoft.AspNetCore.Cryptography.KeyDerivation -v 5.0.0
dotnet add .\%nomeProjeto%.Generics.Domain\%nomeProjeto%.Generics.Domain.csproj package Microsoft.EntityFrameworkCore -v 5.0.0

echo 'Adicionando Referências'
dotnet add .\%nomeProjeto%.Generics.Api\%nomeProjeto%.Generics.Api.csproj reference .\%nomeProjeto%.Generics.Application\%nomeProjeto%.Generics.Application.csproj
dotnet add .\%nomeProjeto%.Generics.Application\%nomeProjeto%.Generics.Application.csproj reference .\%nomeProjeto%.Generics.Data\%nomeProjeto%.Generics.Data.csproj
dotnet add .\%nomeProjeto%.Generics.Application\%nomeProjeto%.Generics.Application.csproj reference .\%nomeProjeto%.Generics.Domain\%nomeProjeto%.Generics.Domain.csproj

dotnet add .\%nomeProjeto%.Generics.Data\%nomeProjeto%.Generics.Data.csproj reference .\%nomeProjeto%.Generics.Domain\%nomeProjeto%.Generics.Domain.csproj

cd ..

echo 'Criando Pasta src'
mkdir src

echo 'entrando na pasta src'
cd src

dotnet new webapi -f netcoreapp3.1 -o %nomeProjeto%.Api
dotnet sln ..\%nomeProjeto%.sln add .\%nomeProjeto%.Api\%nomeProjeto%.Api.csproj
dotnet add .\%nomeProjeto%.Api\%nomeProjeto%.Api.csproj package Microsoft.Azure.DocumentDB.Core -v 1.0.0
dotnet add .\%nomeProjeto%.Api\%nomeProjeto%.Api.csproj package AutoMapper.Extensions.Microsoft.DependencyInjection -v 8.1.0
dotnet add .\%nomeProjeto%.Api\%nomeProjeto%.Api.csproj package Microsoft.EntityFrameworkCore.Design -v 5.0.0
dotnet add .\%nomeProjeto%.Api\%nomeProjeto%.Api.csproj package Microsoft.VisualStudio.Web.CodeGeneration.Design -v 3.1.4
dotnet add .\%nomeProjeto%.Api\%nomeProjeto%.Api.csproj package Swashbuckle.AspNetCore -v 5.6.3
dotnet add .\%nomeProjeto%.Api\%nomeProjeto%.Api.csproj package Swashbuckle.AspNetCore.Swagger -v 5.6.3

dotnet new classlib -f netcoreapp3.1 -o %nomeProjeto%.Domain
dotnet sln ..\%nomeProjeto%.sln add .\%nomeProjeto%.Domain\%nomeProjeto%.Domain.csproj
dotnet add .\%nomeProjeto%.Domain\%nomeProjeto%.Domain.csproj package FluentValidation -v 9.3.0

dotnet new classlib -f netcoreapp3.1 -o %nomeProjeto%.Infra.Data
dotnet sln ..\%nomeProjeto%.sln add .\%nomeProjeto%.Infra.Data\%nomeProjeto%.Infra.Data.csproj
dotnet add .\%nomeProjeto%.Infra.Data\%nomeProjeto%.Infra.Data.csproj package Microsoft.EntityFrameworkCore -v 5.0.0
dotnet add .\%nomeProjeto%.Infra.Data\%nomeProjeto%.Infra.Data.csproj package Microsoft.EntityFrameworkCore.Design -v 5.0.0
dotnet add .\%nomeProjeto%.Infra.Data\%nomeProjeto%.Infra.Data.csproj package Microsoft.EntityFrameworkCore.Relational -v 5.0.0
dotnet add .\%nomeProjeto%.Infra.Data\%nomeProjeto%.Infra.Data.csproj package Microsoft.EntityFrameworkCore.SqlServer -v 5.0.0
dotnet add .\%nomeProjeto%.Infra.Data\%nomeProjeto%.Infra.Data.csproj package Microsoft.EntityFrameworkCore.Tools -v 5.0.0
dotnet add .\%nomeProjeto%.Infra.Data\%nomeProjeto%.Infra.Data.csproj package Pomelo.EntityFrameworkCore.MySql -v 2.2.0

dotnet new classlib -f netcoreapp3.1 -o %nomeProjeto%.Infra.IoC
dotnet sln ..\%nomeProjeto%.sln add .\%nomeProjeto%.Infra.IoC\%nomeProjeto%.Infra.IoC.csproj
dotnet add .\%nomeProjeto%.Infra.IoC\%nomeProjeto%.Infra.IoC.csproj package AutoMapper -v 10.1.1
dotnet add .\%nomeProjeto%.Infra.IoC\%nomeProjeto%.Infra.IoC.csproj package Microsoft.AspNetCore.Http -v 2.2.2
dotnet add .\%nomeProjeto%.Infra.IoC\%nomeProjeto%.Infra.IoC.csproj package Microsoft.Extensions.Configuration -v 5.0.0
dotnet add .\%nomeProjeto%.Infra.IoC\%nomeProjeto%.Infra.IoC.csproj package Microsoft.Extensions.DependencyInjection -v 5.0.0

dotnet new classlib -f netcoreapp3.1 -o %nomeProjeto%.Resource
dotnet sln ..\%nomeProjeto%.sln add .\%nomeProjeto%.Resource\%nomeProjeto%.Resource.csproj

cd ..

echo 'Adicionando Referências ao projeto Generics'
dotnet add .\generics\%nomeProjeto%.Generics.Data\%nomeProjeto%.Generics.Data.csproj reference .\src\%nomeProjeto%.Domain\%nomeProjeto%.Domain.csproj

echo 'Adicionando Referências ao projeto Api'
dotnet add .\src\%nomeProjeto%.Api\%nomeProjeto%.Api.csproj reference .\src\%nomeProjeto%.Domain\%nomeProjeto%.Domain.csproj
dotnet add .\src\%nomeProjeto%.Api\%nomeProjeto%.Api.csproj reference .\generics\%nomeProjeto%.Generics.Api\%nomeProjeto%.Generics.Api.csproj
dotnet add .\src\%nomeProjeto%.Api\%nomeProjeto%.Api.csproj reference .\generics\%nomeProjeto%.Generics.Application\%nomeProjeto%.Generics.Application.csproj
dotnet add .\src\%nomeProjeto%.Api\%nomeProjeto%.Api.csproj reference .\src\%nomeProjeto%.Infra.Data\%nomeProjeto%.Infra.Data.csproj

echo 'Adicionando Referências ao projeto Domain'
dotnet add .\src\%nomeProjeto%.Domain\%nomeProjeto%.Domain.csproj reference .\src\%nomeProjeto%.Resource\%nomeProjeto%.Resource.csproj
dotnet add .\src\%nomeProjeto%.Domain\%nomeProjeto%.Domain.csproj reference .\generics\%nomeProjeto%.Generics.Domain\%nomeProjeto%.Generics.Domain.csproj

echo 'Adicionando Referências ao projeto InfraData'
dotnet add .\src\%nomeProjeto%.Infra.Data\%nomeProjeto%.Infra.Data.csproj reference .\src\%nomeProjeto%.Domain\%nomeProjeto%.Domain.csproj
dotnet add .\src\%nomeProjeto%.Infra.Data\%nomeProjeto%.Infra.Data.csproj reference .\generics\%nomeProjeto%.Generics.Data\%nomeProjeto%.Generics.Data.csproj
dotnet add .\src\%nomeProjeto%.Infra.Data\%nomeProjeto%.Infra.Data.csproj reference .\generics\%nomeProjeto%.Generics.Application\%nomeProjeto%.Generics.Application.csproj

echo 'Adicionando Referências ao projeto InfraIoC'
dotnet add .\src\%nomeProjeto%.Infra.IoC\%nomeProjeto%.Infra.IoC.csproj reference .\src\%nomeProjeto%.Domain\%nomeProjeto%.Domain.csproj
dotnet add .\src\%nomeProjeto%.Infra.IoC\%nomeProjeto%.Infra.IoC.csproj reference .\src\%nomeProjeto%.Infra.Data\%nomeProjeto%.Infra.Data.csproj
dotnet add .\src\%nomeProjeto%.Infra.IoC\%nomeProjeto%.Infra.IoC.csproj reference .\generics\%nomeProjeto%.Generics.Api\%nomeProjeto%.Generics.Api.csproj

echo 'Criando Pasta tests'
mkdir tests

echo 'entrando na pasta tests'
cd tests

dotnet new xUnit -f netcoreapp3.1 -o %nomeProjeto%.Api.Tests
dotnet sln ..\%nomeProjeto%.sln add .\%nomeProjeto%.Api.Tests\%nomeProjeto%.Api.Tests.csproj
dotnet add .\%nomeProjeto%.Api.Tests\%nomeProjeto%.Api.Tests.csproj package Moq -v 4.15.2

dotnet new xUnit -f netcoreapp3.1 -o %nomeProjeto%.Domain.Tests
dotnet sln ..\%nomeProjeto%.sln add .\%nomeProjeto%.Domain.Tests\%nomeProjeto%.Domain.Tests.csproj
dotnet add .\%nomeProjeto%.Domain.Tests\%nomeProjeto%.Domain.Tests.csproj package Moq -v 4.15.2
dotnet add .\%nomeProjeto%.Domain.Tests\%nomeProjeto%.Domain.Tests.csproj package Bogus -v 32.0.2

dotnet new xUnit -f netcoreapp3.1 -o %nomeProjeto%.Infra.IoC.Tests
dotnet sln ..\%nomeProjeto%.sln add .\%nomeProjeto%.Infra.IoC.Tests\%nomeProjeto%.Infra.IoC.Tests.csproj
dotnet add .\%nomeProjeto%.Infra.IoC.Tests\%nomeProjeto%.Infra.IoC.Tests.csproj package AutoMapper -v 10.1.1
dotnet add .\%nomeProjeto%.Infra.IoC.Tests\%nomeProjeto%.Infra.IoC.Tests.csproj package Moq -v 4.15.2
dotnet add .\%nomeProjeto%.Infra.IoC.Tests\%nomeProjeto%.Infra.IoC.Tests.csproj package Bogus -v 32.0.2

cd ..

echo 'Adicionando Referências ao projeto Api Tests'
dotnet add .\tests\%nomeProjeto%.Api.Tests\%nomeProjeto%.Api.Tests.csproj reference .\src\%nomeProjeto%.Api\%nomeProjeto%.Api.csproj
dotnet add .\tests\%nomeProjeto%.Api.Tests\%nomeProjeto%.Api.Tests.csproj reference .\src\%nomeProjeto%.Infra.IoC\%nomeProjeto%.Infra.IoC.csproj

echo 'Adicionando Referências ao projeto Domain Tests'
dotnet add .\tests\%nomeProjeto%.Domain.Tests\%nomeProjeto%.Domain.Tests.csproj reference .\src\%nomeProjeto%.Domain\%nomeProjeto%.Domain.csproj
dotnet add .\tests\%nomeProjeto%.Domain.Tests\%nomeProjeto%.Domain.Tests.csproj reference .\src\%nomeProjeto%.Resource\%nomeProjeto%.Resource.csproj

echo 'Adicionando Referências ao projeto Infra.IoC.Tests'
dotnet add .\tests\%nomeProjeto%.Infra.IoC.Tests\%nomeProjeto%.Infra.IoC.Tests.csproj reference .\src\%nomeProjeto%.Infra.IoC\%nomeProjeto%.Infra.IoC.csproj
