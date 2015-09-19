using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DataAnnotationDemo.Startup))]
namespace DataAnnotationDemo
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
