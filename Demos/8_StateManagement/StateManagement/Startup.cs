using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(StateManagement.Startup))]
namespace StateManagement
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
