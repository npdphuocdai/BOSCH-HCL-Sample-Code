#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include <QQuickItem>

class Controller : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool status READ status WRITE setStatus NOTIFY statusChanged)
public:
    explicit Controller(QObject *parent = nullptr);
    Q_INVOKABLE bool getStatus();
    bool status();
public slots:
    void setStatus(bool);

signals:
    void statusChanged();

private:
    bool m_status;

};

#endif // CONTROLLER_H
