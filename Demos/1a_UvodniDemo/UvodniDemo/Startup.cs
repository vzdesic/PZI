using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(UvodniDemo.Startup))]
namespace UvodniDemo
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
