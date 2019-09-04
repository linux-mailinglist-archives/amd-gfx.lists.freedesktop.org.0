Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8910CA7B17
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 08:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B9189A32;
	Wed,  4 Sep 2019 06:01:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810085.outbound.protection.outlook.com [40.107.81.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C2089A32
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 06:01:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlKaJjAFp3Jgg6C3mf1hruuMkE7c8t5hWrhx1SeJBPmriq225cHIR5+N4jvmhtDNEH2uHY0Uqm26u0W7rBdJJrkIcPgqOdskeUGVaxa8qGS+caTYuky2IA9t50gfSeG/JU2odotFo+qd86E3lluEEBUK6ZYauplE6/nuCCanBAa6TufScH2o2rNxFsNi5QC0TlBeq/Pg/S4y3LfrZthHzLA2W6d01f3MbKpsBxc93BUQJ2tKo9Fp4anIn1q2CVBPaW/szczU/kRbBqAT5LD9NIJVJ9X/Vt4qAE6jjLE0q2/cjE+a79Qb0ypKLu82YJmTpS1gqOg04vMx4laqEiJFKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaV0la7B3sqh8JQIMCWLCjTvyc0XWjrxE7rWlyVcZ2c=;
 b=Qu8/N23e4pKCMXfvvnDVtMTpXObJ42irBOMCXHGwi3HMXwUDmSxTfI5Lzv+sPkZKJ881KnBtKKfUlGzhNQzhWBnCkfYNJYDZMIsDN6RC1tH83crZ6NvEzGg3j67rfMwrktK2O2UPmKtUCHWbjXYXQGkyn3X4s5JykAY8F7WrkbzoJOZcyroB0GppIDONrmvKCuvlH+qaek7VWpLCESqsY89TyEKrt1fZqdpajzDKyRDirUPHDll5I4nBudF7DPBSsTF9rKWISodoedTlqsLsq5GFrbAm3u6ZvfIa6PgSNmPajlph7Xx88OB2XSybdRM5O0hwX40sKfbM8KvFQPeWFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3390.namprd12.prod.outlook.com (20.178.242.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.22; Wed, 4 Sep 2019 06:01:38 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 06:01:38 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/powerplay: implement sysfs for getting dpm clock
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: implement sysfs for getting dpm
 clock
Thread-Index: AQHVYuY2FSBBNJmbLkqF75nKz8IVPA==
Date: Wed, 4 Sep 2019 06:01:37 +0000
Message-ID: <1567576882-13685-2-git-send-email-Prike.Liang@amd.com>
References: <1567576882-13685-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1567576882-13685-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:203:36::13) To MN2PR12MB3536.namprd12.prod.outlook.com
 (2603:10b6:208:104::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3ddd876-51c5-4bf8-7a8c-08d730fd5918
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3390; 
x-ms-traffictypediagnostic: MN2PR12MB3390:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB339003F72D0519C24B2AA15BFBB80@MN2PR12MB3390.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:227;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(199004)(189003)(86362001)(2501003)(11346002)(6512007)(8676002)(6116002)(3846002)(71190400001)(5640700003)(6436002)(99286004)(54906003)(316002)(71200400001)(5660300002)(76176011)(2351001)(36756003)(2906002)(14454004)(66946007)(66556008)(476003)(486006)(305945005)(66446008)(64756008)(66066001)(256004)(66476007)(186003)(386003)(14444005)(2616005)(26005)(53936002)(6916009)(6486002)(7736002)(478600001)(4326008)(25786009)(81166006)(446003)(50226002)(6506007)(102836004)(52116002)(81156014)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3390;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vZx0rrwZuyBRiZDPweV3tDBj2PZ+Vfg7Qo4ZEuXx1D0W7RL1789LLD1jw115yX157jI1ch7h+GMTg/1NLDvvdhIg/anIpFlEP58h36sa8woswgDDa0cCRCcBuQQBRLgl7nnRphSvI3kILSjmAeo8ZZuUu+bnvVmLjXa321PDG2kQflXSpasQck94UYHcoS45dtLifdYBVuspEWNTFx3+KynoJA5tBWyVv7RD8CjUw9SC03apIvxVwpOkO2coAyVkdQBTvggRJP4NFEF1KGY2Skn04R1k+6KzvYW5JJyjxGkIJSTCwnMpAJ8fCfJ+GmYi1Teo7lu8LctR/BAzfaFwOOAuzNCMRfBZ0q4iuWocuQgoKkIiHWE6/N/KH0NV2kwfAQaB2ZzIdoBImNAgm2BP+iu0+nTcWy95MKXLQ7NtETI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ddd876-51c5-4bf8-7a8c-08d730fd5918
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 06:01:38.1916 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FE4+0XZjoe34w8s5J6RAiY2WkekuRJICO4UFbzW8eSKvgi7HR3txQwnqB8pBiMKS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3390
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaV0la7B3sqh8JQIMCWLCjTvyc0XWjrxE7rWlyVcZ2c=;
 b=l7kIefHoOaQom+Nhv1HWRAlMbT/IWbjRvc6pJcVkt/PEZcTxfzshXqpey1VmQWlPykV9wBjrXIZyUABmXPR2TyrrV+Ey26i2hNNpoySBKoFDX3gvR9yxkb1kbiJ/Mrt0Az9i4crS6uBAu24pTrT3lfc/TjZO8Qm+YKlgNJHbi/g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Liang,
 Prike" <Prike.Liang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2l0aCB0aGUgY29tbW9uIGludGVyZmFjZSBwcmludF9jbGtfbGV2ZWxzIGNhbiBnZXQgdGhlIGZv
bGxvd2luZyBkcG0gY2xvY2s6CgotcHBfZHBtX2RjZWZjbGsKLXBwX2RwbV9mY2xrCi1wcF9kcG1f
bWNsawotcHBfZHBtX3NjbGsKLXBwX2RwbV9zb2NjbGsKClNpZ25lZC1vZmYtYnk6IFByaWtlIExp
YW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxldmFuLnF1
YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0
LmMgfCA3MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuaCB8IDIyICsrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdl
ZCwgOTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L3Jlbm9pcl9wcHQuYwppbmRleCA4NzI1OThjLi43NGU4NTg5IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jCkBAIC0xNzcsMTIgKzE3Nyw4MiBA
QCBzdGF0aWMgaW50IHJlbm9pcl9nZXRfZHBtX3VjbGtfbGltaXRlZChzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwgdWludDMyX3QgKmNsb2NrLAogCiB9CiAKK3N0YXRpYyBpbnQgcmVub2lyX3ByaW50
X2Nsa19sZXZlbHMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCisJCQllbnVtIHNtdV9jbGtfdHlw
ZSBjbGtfdHlwZSwgY2hhciAqYnVmKQoreworCWludCBpLCBzaXplID0gMCwgcmV0ID0gMDsKKwl1
aW50MzJfdCBjdXJfdmFsdWUgPSAwLCB2YWx1ZSA9IDAsIGNvdW50ID0gMCwgbWluID0gMCwgbWF4
ID0gMDsKKwlEcG1DbG9ja3NfdCAqY2xrX3RhYmxlID0gc211LT5zbXVfdGFibGUuY2xvY2tzX3Rh
YmxlOworCVNtdU1ldHJpY3NfdCBtZXRyaWNzID0gezB9OworCisJaWYgKCFjbGtfdGFibGUgfHwg
Y2xrX3R5cGUgPj0gU01VX0NMS19DT1VOVCkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlyZXQgPSBz
bXVfdXBkYXRlX3RhYmxlKHNtdSwgU01VX1RBQkxFX1NNVV9NRVRSSUNTLAorCQkJICAgICAgICh2
b2lkICopJm1ldHJpY3MsIGZhbHNlKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJc3dp
dGNoIChjbGtfdHlwZSkgeworCWNhc2UgU01VX0dGWENMSzoKKwljYXNlIFNNVV9TQ0xLOgorCQkv
KiByZXRpcnZlIHRhYmxlIHJldHVybmVkIHBhcmFtdGVycyB1bml0IGlzIE1IeiAqLworCQljdXJf
dmFsdWUgPSBtZXRyaWNzLkNsb2NrRnJlcXVlbmN5W0NMT0NLX0dGWENMS107CisJCXJldCA9IHNt
dV9nZXRfZHBtX2ZyZXFfcmFuZ2Uoc211LCBTTVVfR0ZYQ0xLLCAmbWluLCAmbWF4KTsKKwkJaWYg
KCFyZXQpIHsKKwkJCS8qIGRyaXZlciBvbmx5IGtub3cgbWluL21heCBnZnhfY2xrLCBBZGQgbGV2
ZWwgMSBmb3IgYWxsIG90aGVyIGdmeCBjbGtzICovCisJCQlpZiAoY3VyX3ZhbHVlICA9PSBtYXgp
CisJCQkJaSA9IDI7CisJCQllbHNlIGlmIChjdXJfdmFsdWUgPT0gbWluKQorCQkJCWkgPSAwOwor
CQkJZWxzZQorCQkJCWkgPSAxOworCisJCQlzaXplICs9IHNwcmludGYoYnVmICsgc2l6ZSwgIjA6
ICV1TWh6ICVzXG4iLCBtaW4sCisJCQkJCWkgPT0gMCA/ICIqIiA6ICIiKTsKKwkJCXNpemUgKz0g
c3ByaW50ZihidWYgKyBzaXplLCAiMTogJXVNaHogJXNcbiIsCisJCQkJCWkgPT0gMSA/IGN1cl92
YWx1ZSA6IFJFTk9JUl9VTURfUFNUQVRFX0dGWENMSywKKwkJCQkJaSA9PSAxID8gIioiIDogIiIp
OworCQkJc2l6ZSArPSBzcHJpbnRmKGJ1ZiArIHNpemUsICIyOiAldU1oeiAlc1xuIiwgbWF4LAor
CQkJCQlpID09IDIgPyAiKiIgOiAiIik7CisJCX0KKwkJcmV0dXJuIHNpemU7CisJY2FzZSBTTVVf
U09DQ0xLOgorCQljb3VudCA9IE5VTV9TT0NDTEtfRFBNX0xFVkVMUzsKKwkJY3VyX3ZhbHVlID0g
bWV0cmljcy5DbG9ja0ZyZXF1ZW5jeVtDTE9DS19TT0NDTEtdOworCQlicmVhazsKKwljYXNlIFNN
VV9NQ0xLOgorCQljb3VudCA9IE5VTV9NRU1DTEtfRFBNX0xFVkVMUzsKKwkJY3VyX3ZhbHVlID0g
bWV0cmljcy5DbG9ja0ZyZXF1ZW5jeVtDTE9DS19VTUNDTEtdOworCQlicmVhazsKKwljYXNlIFNN
VV9EQ0VGQ0xLOgorCQljb3VudCA9IE5VTV9EQ0ZDTEtfRFBNX0xFVkVMUzsKKwkJY3VyX3ZhbHVl
ID0gbWV0cmljcy5DbG9ja0ZyZXF1ZW5jeVtDTE9DS19EQ0ZDTEtdOworCQlicmVhazsKKwljYXNl
IFNNVV9GQ0xLOgorCQljb3VudCA9IE5VTV9GQ0xLX0RQTV9MRVZFTFM7CisJCWN1cl92YWx1ZSA9
IG1ldHJpY3MuQ2xvY2tGcmVxdWVuY3lbQ0xPQ0tfRkNMS107CisJCWJyZWFrOworCWRlZmF1bHQ6
CisJCXJldHVybiAtRUlOVkFMOworCX0KKworCWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7
CisJCUdFVF9EUE1fQ1VSX0ZSRVEoY2xrX3RhYmxlLCBjbGtfdHlwZSwgaSwgdmFsdWUpOworCQlz
aXplICs9IHNwcmludGYoYnVmICsgc2l6ZSwgIiVkOiAldU1oeiAlc1xuIiwgaSwgdmFsdWUsCisJ
CQkJY3VyX3ZhbHVlID09IHZhbHVlID8gIioiIDogIiIpOworCX0KKworCXJldHVybiBzaXplOwor
fQorCiBzdGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgcmVub2lyX3BwdF9mdW5jcyA9
IHsKIAkuZ2V0X3NtdV9tc2dfaW5kZXggPSByZW5vaXJfZ2V0X3NtdV9tc2dfaW5kZXgsCiAJLmdl
dF9zbXVfdGFibGVfaW5kZXggPSByZW5vaXJfZ2V0X3NtdV90YWJsZV9pbmRleCwKIAkudGFibGVz
X2luaXQgPSByZW5vaXJfdGFibGVzX2luaXQsCiAJLnNldF9wb3dlcl9zdGF0ZSA9IE5VTEwsCiAJ
LmdldF9kcG1fdWNsa19saW1pdGVkID0gcmVub2lyX2dldF9kcG1fdWNsa19saW1pdGVkLAorCS5w
cmludF9jbGtfbGV2ZWxzID0gcmVub2lyX3ByaW50X2Nsa19sZXZlbHMsCiB9OwogCiB2b2lkIHJl
bm9pcl9zZXRfcHB0X2Z1bmNzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5oCmluZGV4IGEwMTdhNDcuLjJhMzkwZGQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmgKQEAgLTI1LDkgKzI1
LDI5IEBACiAKIGV4dGVybiB2b2lkIHJlbm9pcl9zZXRfcHB0X2Z1bmNzKHN0cnVjdCBzbXVfY29u
dGV4dCAqc211KTsKIAotLy9VTUQgUFN0YXRlIFJlbm9pciBNc2cgUGFyYW1ldGVycyBpbiBNSHoK
Ky8qIFVNRCBQU3RhdGUgUmVub2lyIE1zZyBQYXJhbWV0ZXJzIGluIE1IeiAqLwogI2RlZmluZSBS
RU5PSVJfVU1EX1BTVEFURV9HRlhDTEsgICAgICAgNzAwCiAjZGVmaW5lIFJFTk9JUl9VTURfUFNU
QVRFX1NPQ0NMSyAgICAgICA2NzgKICNkZWZpbmUgUkVOT0lSX1VNRF9QU1RBVEVfRkNMSyAgICAg
ICAgIDgwMAogCisjZGVmaW5lIEdFVF9EUE1fQ1VSX0ZSRVEodGFibGUsIGNsa190eXBlLCBkcG1f
bGV2ZWwsIGZyZXEpCQlcCisJZG8gewkJCQkJCQkJXAorCQlzd2l0Y2ggKGNsa190eXBlKSB7CQkJ
CQlcCisJCWNhc2UgU01VX1NPQ0NMSzoJCQkJCVwKKwkJCWZyZXEgPSB0YWJsZS0+U29jQ2xvY2tz
W2RwbV9sZXZlbF0uRnJlcTsJXAorCQkJYnJlYWs7CQkJCQkJXAorCQljYXNlIFNNVV9NQ0xLOgkJ
CQkJCVwKKwkJCWZyZXEgPSB0YWJsZS0+TWVtQ2xvY2tzW2RwbV9sZXZlbF0uRnJlcTsJXAorCQkJ
YnJlYWs7CQkJCQkJXAorCQljYXNlIFNNVV9EQ0VGQ0xLOgkJCQkJXAorCQkJZnJlcSA9IHRhYmxl
LT5EY2ZDbG9ja3NbZHBtX2xldmVsXS5GcmVxOwlcCisJCQlicmVhazsJCQkJCQlcCisJCWNhc2Ug
U01VX0ZDTEs6CQkJCQkJXAorCQkJZnJlcSA9IHRhYmxlLT5GQ2xvY2tzW2RwbV9sZXZlbF0uRnJl
cTsJCVwKKwkJCWJyZWFrOwkJCQkJCVwKKwkJZGVmYXVsdDoJCQkJCQlcCisJCQlicmVhazsJCQkJ
CQlcCisJCX0JCQkJCQkJXAorCX0gd2hpbGUgKDApCisKICNlbmRpZgotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
