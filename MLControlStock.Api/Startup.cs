using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Localization;
//using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;
using Microsoft.OpenApi.Models;
using MlControlStock.Infrastructure.Repositories;
using MLControlStock.Core.Interfaces;
using MLControlStock.Core.Services;
using MLControlStock.Infrastructure.Api;
using MLControlStock.Infrastructure.Data;
using MLControlStock.Infrastructure.Filters;
using MLControlStock.Infrastructure.Repositories;
using System;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Reflection;


namespace MLControlStock.Api
{
    public class Startup
    {
        private string _dbconnection = null;
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddHttpClient("Api.ML", client =>
            {
                client.BaseAddress = new Uri("https://api.mercadolibre.com/");
                client.Timeout = TimeSpan.FromSeconds(300);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            });           
            
            services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

            services.AddControllers(options => { options.Filters.Add<GlobalExceptionFilter>(); }).AddNewtonsoftJson(
                options =>
                {
                    options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore;
                });


            var sql_connection = new SqlConnectionStringBuilder(Configuration.GetConnectionString("MLControlStock"));
            _dbconnection = sql_connection.ConnectionString;
            services.AddDbContext<MLControlStockContext>(options => options.UseSqlServer(_dbconnection));

            //CI
            services.AddScoped(typeof(IRepository<>), typeof(Repository<>));
            services.AddScoped(typeof(IStockRepository), typeof(StockRepository));
            services.AddTransient<IUnitOfWork, UnitOfWork>();
            services.AddTransient<IApiClient, ApiClient>();
            services.AddTransient<IStockService, StockService>();

            services.AddSwaggerGen(doc =>
            {
                doc.SwaggerDoc("v1", new OpenApiInfo { Title = "ML Challenge API Control de Stock - Christian Damian Cristofano", Version = "v1" });
                var xmlFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
                var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
                doc.IncludeXmlComments(xmlPath);
            });

            services.Configure<RequestLocalizationOptions>(options =>
            {
                var supportedCultures = new[]
                {
                    new CultureInfo("es-AR"),
                };
                options.DefaultRequestCulture = new RequestCulture(culture: "es-AR", uiCulture: "es-AR");
                options.SupportedCultures = supportedCultures;
                options.SupportedUICultures = supportedCultures;
            });


        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseSwagger();
            app.UseSwaggerUI(options =>
            {
                options.SwaggerEndpoint("/swagger/v1/swagger.json", "ML Control Stock API ");
                options.RoutePrefix = string.Empty;
            });

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });

            var options = app.ApplicationServices.GetService<IOptions<RequestLocalizationOptions>>();
            app.UseRequestLocalization(options.Value);
        }

    }
}
