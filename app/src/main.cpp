#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtCore/qloggingcategory.h>
#include <headers/style.h>

static QLoggingCategory lc("awlobo.project_name");

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    qCInfo(lc, "------------------------------------");
    qCInfo(lc, "Starting Pix4Dscan %s", VERSION_NAME);

    QGuiApplication::setApplicationName(QStringLiteral("Scan"));
    QGuiApplication::setOrganizationName(QStringLiteral("Pix4D"));
    QGuiApplication::setOrganizationDomain(QStringLiteral("com.pix4d"));
    Q_ASSERT(QFile::exists(":/qtquickcontrols2.conf"));


    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));

//    qmlRegisterType<Style>("awlobo.project_name.style", 1, 0, "Style");
    Style style;
    engine.rootContext()->setContextProperty("Style", &style);

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
