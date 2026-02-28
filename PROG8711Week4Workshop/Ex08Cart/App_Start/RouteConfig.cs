using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace ChigozieNweke_BookStore
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.EnableFriendlyUrls();
        }
    }
}
