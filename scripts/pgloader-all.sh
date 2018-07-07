#!/bin/bash

set -e

pgloader database/pgloader/00_etl_currency.load
pgloader database/pgloader/01_etl_bats_instrument.load
pgloader database/pgloader/02_etl_csi_cash.load
pgloader database/pgloader/03_etl_csi_commodityoption.load
pgloader database/pgloader/04_etl_csi_stockoption.load
pgloader database/pgloader/05_etl_csi_stock.load
pgloader database/pgloader/06_etl_csi_commodity.load