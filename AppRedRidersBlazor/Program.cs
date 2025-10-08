using AppRedRidersBlazor.Components;
using AppRedRidersBlazor.Models;
using AppRedRidersBlazor.Configs;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents();

// Registra IConfiguration automaticamente (j� vem por padr�o)
builder.Services.AddSingleton<IConfiguration>(builder.Configuration);

// Registra sua classe de conex�o e DAOs
builder.Services.AddScoped<Conexao>();
builder.Services.AddScoped<LoginDAO>();
builder.Services.AddScoped<CardapioDAO>();
builder.Services.AddScoped<ClienteDAO>();
builder.Services.AddScoped<EntregadorDAO>();
builder.Services.AddScoped<PratosDAO>();
builder.Services.AddScoped<RestauranteDAO>();
builder.Services.AddScoped<VeiculoDAO>();
builder.Services.AddScoped<PedidoDAO>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true);
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseStaticFiles();
app.UseAntiforgery();

app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode();
app.Run();
