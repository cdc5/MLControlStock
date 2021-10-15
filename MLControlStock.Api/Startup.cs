using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using MLControlStock.Core.Interfaces;
using MLControlStock.Infrastructure.Repositories;
using MLControlStock.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using FluentValidation.AspNetCore;
using MLControlStock.Core.Services;
using MLControlStock.Infrastructure.Api;
using MLControlStock.Infrastructure.Filters;
//using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.Data.SqlClient;
using Microsoft.OpenApi.Models;
using System.Reflection;
using System.IO;
using System.Net.Http;
using System.Net;
using System.Net.Http.Headers;


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
            //.ConfigurePrimaryHttpMessageHandler(() =>
            //{
            //    return new HttpClientHandler()
            //    {
            //        AllowAutoRedirect = true,
            //        AutomaticDecompression = DecompressionMethods.Deflate | DecompressionMethods.GZip |
            //                                 DecompressionMethods.Brotli
            //    };
            //});
            
            services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

            services.AddControllers(options => { options.Filters.Add<GlobalExceptionFilter>(); }).AddNewtonsoftJson(
                options =>
                {
                    options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore;
                });


            var sql_connection = new SqlConnectionStringBuilder(Configuration.GetConnectionString("FundaGes"));
            _dbconnection = sql_connection.ConnectionString;
            services.AddDbContext<MLControlStockContext>(options => options.UseSqlServer(_dbconnection));

            //CI
            services.AddScoped(typeof(IRepository<>), typeof(Repository<>));
            services.AddTransient<IUnitOfWork, UnitOfWork>();
            services.AddTransient<IApiClient, ApiClient>();
            services.AddTransient<IStockService, StockService>();

            services.AddSwaggerGen(doc =>
            {
                doc.SwaggerDoc("v1", new OpenApiInfo { Title = "ML Control Stock API - Christian Damian Cristofano", Version = "v1" });
                var xmlFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
                var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
                doc.IncludeXmlComments(xmlPath);
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
        }
    }
}
