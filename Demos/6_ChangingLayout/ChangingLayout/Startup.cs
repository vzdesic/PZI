using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ChangingLayout.Startup))]
namespace ChangingLayout
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
