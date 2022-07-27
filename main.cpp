#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "mymodel.h"
#include <QQuickView>
#include <QQmlContext>
#include <controller.h>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    qmlRegisterType<MyModel>("Model", 1, 0 , "MyModel");
    qmlRegisterType<Controller>("MyController", 1, 0 , "Controller");
    qmlRegisterSingletonType( QUrl("qrc:/StatusBarConf.qml"), "MyStatus", 1, 0, "StatusBarConf" );

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
