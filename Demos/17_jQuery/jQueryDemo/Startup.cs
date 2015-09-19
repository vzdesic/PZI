using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(jQueryDemo.Startup))]
namespace jQueryDemo
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
