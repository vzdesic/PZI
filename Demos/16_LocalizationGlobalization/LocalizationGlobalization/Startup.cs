using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LocalizationGlobalization.Startup))]
namespace LocalizationGlobalization
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
