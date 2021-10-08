using Business.Banks;
using Business.Commons;
using Business.Companies;
using Business.Contracts;
using Business.Owners;
using Business.Properties;
using Business.Tenants;
using CodeMono.DataAccess.DBConnection;
using DataAccess;
using DataAccess.Banks;
using DataAccess.Commons;
using DataAccess.Companies;
using DataAccess.Contracts;
using DataAccess.Data;
using DataAccess.Owners;
using DataAccess.Properties;
using DataAccess.Tenants;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Swashbuckle.AspNetCore.Swagger;
using System.Collections.Generic;
using System.Text;

namespace CodeMono.API
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; } 

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //Servicios            
            services.AddScoped<ImagesService, ImagesService>();
            services.AddScoped<IvaService, IvaService>();
            services.AddScoped<PropertyCategoryService, PropertyCategoryService>();
            services.AddScoped<PropertyService, PropertyService>();
            services.AddScoped<PropertyStatusService, PropertyStatusService>();
            services.AddScoped<TypeOfferService, TypeOfferService>();
            services.AddScoped<AccountsStatusService, AccountsStatusService>();
            services.AddScoped<AccountsToPayContractService, AccountsToPayContractService>();
            services.AddScoped<AccountsToReceivableContractService, AccountsToReceivableContractService>();
            services.AddScoped<BankAccountService, BankAccountService>();
            services.AddScoped<HistoryBankAccountService, HistoryBankAccountService>();
            services.AddScoped<PaymentTypeService, PaymentTypeService>();
            services.AddScoped<CityService, CityService>();
            services.AddScoped<NeighborhoodService, NeighborhoodService>();
            services.AddScoped<StateService, StateService>();
            services.AddScoped<ZoneService, ZoneService>();
            services.AddScoped<CompanyService, CompanyService>();
            services.AddScoped<ContractService, ContractService>();
            services.AddScoped<ContractsStatusService, ContractsStatusService>();
            services.AddScoped<TenantsByContractService, TenantsByContractService>();
            services.AddScoped<OwnerService, OwnerService>();
            services.AddScoped<TenantService, TenantService>();

            //Modelos
            services.AddScoped<ImagesModel, ImagesModel>();
            services.AddScoped<IvaModel, IvaModel>();
            services.AddScoped<PropertyCategoryModel, PropertyCategoryModel>();
            services.AddScoped<PropertyModel, PropertyModel>();
            services.AddScoped<PropertyStatusModel, PropertyStatusModel>();
            services.AddScoped<TypeOfferModel, TypeOfferModel>();
            services.AddScoped<AccountsStatusModel, AccountsStatusModel>();
            services.AddScoped<AccountsToPayContractModel, AccountsToPayContractModel>();
            services.AddScoped<AccountsToReceivableContractModel, AccountsToReceivableContractModel>();
            services.AddScoped<BankAccountModel, BankAccountModel>();
            services.AddScoped<HistoryBankAccountModel, HistoryBankAccountModel>();
            services.AddScoped<PaymentTypeModel, PaymentTypeModel>();
            services.AddScoped<CityModel, CityModel>();
            services.AddScoped<NeighborhoodModel, NeighborhoodModel>();
            services.AddScoped<StateModel, StateModel>();
            services.AddScoped<ZoneModel, ZoneModel>();
            services.AddScoped<CompanyModel, CompanyModel>();
            services.AddScoped<ContractModel, ContractModel>();
            services.AddScoped<ContractsStatusModel, ContractsStatusModel>();
            services.AddScoped<TenantsByContractModel, TenantsByContractModel>();
            services.AddScoped<OwnerModel, OwnerModel>();
            services.AddScoped<TenantModel, TenantModel>();

            //Otros modelo
            services.AddScoped<DBConnectionMSSQL, DBConnectionMSSQL>();
            services.AddScoped<InmmoAppContext, InmmoAppContext>();
            services.AddScoped<BaseStoreProcedureModel, BaseStoreProcedureModel>();

            //Agregar cadena de conexion al contexto
            services.AddDbContext<InmmoAppContext>(options =>
                options.UseSqlServer(Configuration.GetConnectionString("Development")));

            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);

            // ======== CONFIGURACIÓN DE SWAGGER =========
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new Info { Title = "BaseProject", Version = "v1" });

                // Swagger 2.+ support
                var security = new Dictionary<string, IEnumerable<string>>
                {
                    {"Bearer", new string[] { } },
                };

                c.AddSecurityDefinition("Bearer", new ApiKeyScheme
                {
                    Description = "JWT Authorization header using the Bearer scheme. Example: \"Authorization: Bearer {token}\"",
                    Name = "Authorization",
                    In = "header",
                    Type = "apiKey"
                });

                c.AddSecurityRequirement(security);
            });
			
            // JWT Implementacion
            var key = Encoding.ASCII.GetBytes(Configuration.GetValue<string>("SecretKey"));

            services.AddAuthentication(x =>
            {
                x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(x =>
            {
                x.RequireHttpsMetadata = false;
                x.SaveToken = true;
                x.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(key),
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    ValidateLifetime = true
                };
            });
        }


        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            // ======== CONFIGURACIÓN DE SWAGGER =========
            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                string swaggerJsonBasePath = string.IsNullOrWhiteSpace(c.RoutePrefix) ? "." : "..";
                c.SwaggerEndpoint($"{swaggerJsonBasePath}/swagger/v1/swagger.json", "CodeMono v1");
            });

            app.UseCors(options => options
                .AllowAnyOrigin()
                .AllowAnyMethod()
                .AllowAnyHeader());

            app.UseAuthentication();
            app.UseMvc();
        }
    }
}