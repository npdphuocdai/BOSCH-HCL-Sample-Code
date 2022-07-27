#include "controller.h"

Controller::Controller(QObject *parent)
    : QObject{parent}
{
    m_status = true;
}

bool Controller::getStatus()
{
    return m_status;
}

bool Controller::status()
{
    return m_status;
}

void Controller::setStatus(bool newStatus)
{
    if (m_status == newStatus)
        return;
    m_status = newStatus;
    emit statusChanged();
}
