*** Settings ***
Library    BuiltIn
Library    AppiumLibrary
Library    DateTime
Library    String
Variables   ../data/device.yaml
Variables   ../data/data_${env}.yaml
Resource    ../common/keywords.resource
Resource    ../feature/dang_nhap/dang_nhap_keywords.resource
Resource    ../feature/dang_ky_xem_can_ho/dang_ky_xem_can_ho_keywords.resource
