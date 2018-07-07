-- +goose Up

CREATE TABLE etl.etl_currency (
    name                                    VARCHAR(128),
    symbol                                  VARCHAR(12)
);

CREATE TABLE etl.etl_bats_instrument (
    company_name                                    VARCHAR(128),
    bats_name                                       VARCHAR(12),
    isin					                        VARCHAR(12),
    currency				                        VARCHAR(3),
    mic						                        VARCHAR(4),
    reuters_exchange_code	                        VARCHAR(4),
    lis_local				                        DECIMAL(21,9),
    live					                        VARCHAR(1),
    tick_type				                        VARCHAR(12),
    reference_price			                        DECIMAL(21,9),
    bats_prev_close			                        DECIMAL(21,9),
    live_date				                        DATE,
    bloomberg_primary		                        VARCHAR(32),
    bloomberg_bats			                        VARCHAR(32),
    mifid_share				                        VARCHAR(1),
    asset_class				                        VARCHAR(8),
    matching_unit			                        INTEGER,
    euroccp_enabled			                        BOOLEAN,
    xclr_enabled			                        BOOLEAN,
    lchl_enabled			                        BOOLEAN,
    reuters_ric_primary		                        VARCHAR(99),
    reuters_ric_bats		                        VARCHAR(99),
    reference_adt_eur		                        DECIMAL(21,9),
    csd						                        VARCHAR(16),
    corporate_action_status	                        VARCHAR(99),
    supported_services		                        VARCHAR(8),
    trading_segment			                        VARCHAR(4),
    printed_name						            VARCHAR(8),
    periodic_auction_max_duration			        INTEGER,
    periodic_auction_min_order_entry_size	        INTEGER,
    periodic_auction_min_order_entry_notional		INTEGER,
    max_otr_count						            INTEGER,
    max_otr_volume						            INTEGER,
    capped						                    INTEGER,
    venue_cap_percentage						    DECIMAL(21,9),
    venue_uncap_date                                DATE
);

CREATE TABLE etl.etl_csi_stock (
    CsiNumber			                            INTEGER,
    Symbol					                        VARCHAR(12),
    Name                                            VARCHAR(128),
    Exchange					                    VARCHAR(12),
    IsActive			                            BOOLEAN,
    StartDate                                       DATE,
    EndDate                                         DATE,
    ConversionFactor						        INTEGER,
    SwitchCfDate                                    DATE,
    PreSwitchCf						                INTEGER,
    SubExchange					                    VARCHAR(32),
    ExchangeSymbol					                VARCHAR(12)
);

CREATE TABLE etl.etl_csi_stockoption (
    CsiNumber			                            INTEGER,
    Symbol					                        VARCHAR(12),
    Name                                            VARCHAR(128),
    Exchange					                    VARCHAR(12),
    IsActive			                            BOOLEAN,
    StartDate                                       DATE,
    EndDate                                         DATE,
    DivideStrike					                VARCHAR(12),
    ConversionFactor						        INTEGER,
    SwitchCfDate                                    DATE,
    PreSwitchCf						                INTEGER,
    SubExchange					                    VARCHAR(32),
    ExchangeSymbol					                VARCHAR(12)
);

CREATE TABLE etl.etl_csi_commodity (
    CommercialCsiNumber			                    INTEGER,
    CommercialDeliveryMonth			                INTEGER,
    UACsiNumber			                            INTEGER,
    SymbolCommercial					            VARCHAR(12),
    SymbolUA					                    VARCHAR(12),
    Name					                        VARCHAR(128),
    IsActive			                            BOOLEAN,
    TerminalPointValue			                    INTEGER,
    FullPointValue			                        INTEGER,
    Currency					                    VARCHAR(3),
    ContractSize						            VARCHAR(12),
    Units					                        VARCHAR(12),
    MinimumTick			                            INTEGER,
    TickValue			                            INTEGER,
    StartDate                                       DATE,
    EndDate                                         DATE,
    ConversionFactorCode						    INTEGER
);

CREATE TABLE etl.etl_csi_commodityoption (
    CsiNumber			                            INTEGER,
    Symbol					                        VARCHAR(12),
    Name                                            VARCHAR(128),
    Exchange					                    VARCHAR(12),
    IsActive			                            BOOLEAN,
    StartDate                                       DATE,
    EndDate                                         DATE,
    DeliveryMonths					                VARCHAR(12),
    DivideStrike					                VARCHAR(12),
    ConversionFactor						        INTEGER,
    HasImplied5Prices			                    BOOLEAN,
    HasImplied5Strikes			                    BOOLEAN
);

CREATE TABLE etl.etl_csi_cash (
    CsiNumber			                            INTEGER,
    DeliveryMonthCode						        INTEGER,
    UACsinumber						                INTEGER,
    Symbol					                        VARCHAR(12),
    Name                                            VARCHAR(128),
    IsActive			                            BOOLEAN,
    Currency						                VARCHAR(3),
    Units					                        VARCHAR(32),
    Footnote                                        VARCHAR(512),
    StartDate                                       DATE,
    EndDate                                         DATE,
    DivideStrike					                VARCHAR(12),
    ConversionFactorCode						    INTEGER
);

-- +goose Down
DROP TABLE IF EXISTS etl.etl_bats_instrument;
DROP TABLE IF EXISTS etl.etl_csi_stock;
DROP TABLE IF EXISTS etl.etl_csi_stockoption;
DROP TABLE IF EXISTS etl.etl_csi_commodity;
DROP TABLE IF EXISTS etl.etl_csi_commodityoption;
DROP TABLE IF EXISTS etl.etl_csi_cash;
DROP TABLE IF EXISTS etl.etl_currency;
