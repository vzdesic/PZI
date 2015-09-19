using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(RenderingViews.Startup))]
namespace RenderingViews
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
