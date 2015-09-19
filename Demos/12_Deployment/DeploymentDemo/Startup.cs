using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DeploymentDemo.Startup))]
namespace DeploymentDemo
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
