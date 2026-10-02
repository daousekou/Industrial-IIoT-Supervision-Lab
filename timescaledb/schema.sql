CREATE EXTENSION IF NOT EXISTS timescaledb;

CREATE TABLE IF NOT EXISTS mesures_opcua (
    time TIMESTAMPTZ NOT NULL,
    machine TEXT NOT NULL,
    variable TEXT NOT NULL,
    value DOUBLE PRECISION NOT NULL
);

SELECT create_hypertable(
    'mesures_opcua',
    'time',
    if_not_exists => TRUE
);

CREATE INDEX IF NOT EXISTS idx_mesures_opcua_variable_time
ON mesures_opcua (variable, time DESC);
