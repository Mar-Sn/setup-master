using Qml.Net;
using Qml.Net.Runtimes;

namespace SetupMaster
{
    class Program
    {
        static int Main(string[] args)
        {

            RuntimeManager.DiscoverOrDownloadSuitableQtRuntime();

            QQuickStyle.SetStyle("Material");

            using (var application = new QGuiApplication(args))
            {
                using (var engine = new QQmlApplicationEngine())
                {
                    // Register our new type to be used in Qml
                    //Qml.Net.Qml.RegisterType<QmlType>("test", 1, 1);
                    engine.Load("QML/Main.qml");
                    return application.Exec();
                }
            }
        }
    }
}
