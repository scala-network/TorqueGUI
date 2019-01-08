#pragma once

#include <QObject>
#include <wallet/api/wallet2_api.h>

class NetworkType : public QObject
{
    Q_OBJECT

public:
    enum Type : uint8_t {
        MAINNET = Stellite::MAINNET,
        TESTNET = Stellite::TESTNET,
        STAGENET = Stellite::STAGENET
    };
    Q_ENUM(Type)
};
