Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8E9AF48E
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 04:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EB26E9E6;
	Wed, 11 Sep 2019 02:56:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720068.outbound.protection.outlook.com [40.107.72.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998AF6E9E8
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 02:56:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=El++8IsMM+ratA7+9EXlwzRyX11EWQT9fxNAkgnoZrMhrA2jwwiqi96PoJ+Dt9VYKxT+1i/xg0Te5snar3+aDfOotlLk4WpW5yf4VDQUXJiN3IGK3aBtvbQwx/olCTFAFT6HQzJgfY8FQ5XkLP8KlXTKXp18VkTpOZVwUnpw7CcyWUrCsDYRZ8C5yKTp0l8OKBMzUvE0TcctVlvHvf7KOqmYusyd2kJMzRbP2sqXH6/hqWI32+zgc8EwqCEpRuRsm7rJtYX7jGboBQ18FpT9Xbm1kjgvoorFEZEfelQ/21DCVOmCsyWGAwGDLQDHZS5CJ3FciRu/7m9bRsgJ6qQo7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AJmKiu0C+5L4swPumPLgn9PY7R44ls2qF832WMpfpQ=;
 b=jcGzvdq0tMUi8jiSEhDeOnOFWuOAewHgDJ0NajYb5Pa8Ajw/HfScfJz2O1ebs4Px2b9yJyQT1TR6lYUYnmxd7gkDWJenG0C2lVpfv4E0Gg0Q2R7iwjIvGeHPhVK360DAe0zjPGT9vLGvPdr742XEOiPCwXsT9eRaLY3zYhc8vH8OU8FqNlBz3kGENWoTb/L9K2Lvim/ydRAyGhU3xY9dU2BukvrjazG8xkgj23/0y4DHZx7D5H9hFEhU9HwI80oQNzisSkJqosQqClizRqcb2EVBl9kaoUa5P/HIhTJ7YeURWbRhaP219ywV6Co0voXbIcOKUn0H66waYXi5eaiXKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3675.namprd12.prod.outlook.com (10.255.76.80) by
 DM6PR12MB2985.namprd12.prod.outlook.com (20.178.29.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 02:56:28 +0000
Received: from DM6PR12MB3675.namprd12.prod.outlook.com
 ([fe80::79ff:58ff:d106:e77]) by DM6PR12MB3675.namprd12.prod.outlook.com
 ([fe80::79ff:58ff:d106:e77%3]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 02:56:28 +0000
From: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Xu,
 Feifei" <Feifei.Xu@amd.com>
Subject: RE: [PATCH] drm/amdgpu/sriov: add ring_stop before ring_create in psp
 v11 code
Thread-Topic: [PATCH] drm/amdgpu/sriov: add ring_stop before ring_create in
 psp v11 code
Thread-Index: AQHVZ68XPJE8vLh7uU6DbNQCo6lEB6clyYBA
Date: Wed, 11 Sep 2019 02:56:28 +0000
Message-ID: <DM6PR12MB367543F375AE028DE9B4F810BBB10@DM6PR12MB3675.namprd12.prod.outlook.com>
References: <20190910080922.4933-1-Jack.Zhang1@amd.com>
In-Reply-To: <20190910080922.4933-1-Jack.Zhang1@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ddbae09-461e-45ea-5700-08d73663a463
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2985; 
x-ms-traffictypediagnostic: DM6PR12MB2985:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB29851561618311C15EA9885DBBB10@DM6PR12MB2985.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(189003)(199004)(13464003)(66946007)(76116006)(6636002)(66476007)(6436002)(229853002)(66446008)(4326008)(8936002)(2906002)(14454004)(316002)(64756008)(110136005)(55016002)(2501003)(102836004)(6506007)(53546011)(86362001)(99286004)(11346002)(476003)(446003)(186003)(71190400001)(81156014)(81166006)(25786009)(305945005)(7736002)(71200400001)(74316002)(8676002)(33656002)(966005)(486006)(52536014)(3846002)(6116002)(256004)(53936002)(66066001)(5660300002)(478600001)(76176011)(7696005)(9686003)(6246003)(6306002)(26005)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2985;
 H:DM6PR12MB3675.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +tvD3BfSI/ezQ+pTCDmxMXJ9VGB2zrxhr5bw0pys2OA6jtcG2/bYSA7U51DIWsFNlAyILxWXJO7HQj/ucjEwNas7Mn44yJI7dBTwFOj5uPzMg3msN+tkShIGhbPP23DSK1TexscIufBHNPWs2NoCfkcPl2VJeevfvEmhJX0M10zOw8+8Ma/QBG/ziiYxUK+FUsdXImpKvf6JFDdeOzgfUX87GWmUmAsInokNiUxwTNDXot06idNZyyrWbsbywa6MbcX/jRPzxcnpjfHX40/XbwA9nc+Ikxu7RXb3+8b19VVFZxjDig/+lm1GAlULsuFWy7dpSXWWCMOdvIgA4e264NNYNyq7I8QmJx6aUB7lciWuY9mKMcu/psXNdqaLA97nPYLVf2IqM+xJlx8PuSpobuMTn3tleyLEodfa8d5wjtY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ddbae09-461e-45ea-5700-08d73663a463
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 02:56:28.2381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /LFxtSQBxTyY8e/E5ERSoliEVcW9ubQ6eMQ5vA53+ORT7PmBA72jkDc9Ugc5mRER
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2985
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AJmKiu0C+5L4swPumPLgn9PY7R44ls2qF832WMpfpQ=;
 b=jp46u7YIeUnZ+g2VGf4xQMP5xN2sgvV4v5bjGhcE94pMI4jfJ+fzRzXkzGhbTxrwZInvKf2E9veft3j1N6K76ghWJtVuHIhuTnwU2jeT4wldlH55Nfom57K3wNOhFdyK18szEmXrvViv3ihNLrf6Jq895WvwAK3fZMwDMebQhVM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Zhang1@amd.com; 
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
Cc: "Zhang, Jack \(Jian\)" <Jack.Zhang1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cGluZw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEphY2sgWmhhbmcN
ClNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAxMCwgMjAxOSA0OjA5IFBNDQpUbzogYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBaaGFuZywgSmFjayAoSmlhbikgPEphY2suWmhhbmcx
QGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHUvc3Jpb3Y6IGFkZCByaW5nX3N0
b3AgYmVmb3JlIHJpbmdfY3JlYXRlIGluIHBzcCB2MTEgY29kZQ0KDQpwc3AgIHYxMSBjb2RlIG1p
c3NlZCByaW5nIHN0b3AgaW4gcmluZyBjcmVhdGUgZnVuY3Rpb24oVk1SKSB3aGlsZSBwc3AgdjMu
MSBjb2RlIGhhZCB0aGUgY29kZS4gVGhpcyB3aWxsIGNhdXNlIFZNIGRlc3Ryb3kxIGZhaWwgYW5k
IHBzcCByaW5nIGNyZWF0ZSBmYWlsLg0KDQpGb3IgU0lPVi1WRiwgcmluZ19zdG9wIHNob3VsZCBu
b3QgYmUgZGVsZXRlZCBpbiByaW5nX2NyZWF0ZSBmdW5jdGlvbi4NCg0KU2lnbmVkLW9mZi1ieTog
SmFjayBaaGFuZyA8SmFjay5aaGFuZzFAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3BzcF92MTFfMC5jIHwgNjEgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMNCmluZGV4IGNkZGZhM2MuLjhl
OWIzNGEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAu
Yw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMNCkBAIC0zOTcs
NiArMzk3LDM0IEBAIHN0YXRpYyBib29sIHBzcF92MTFfMF9zdXBwb3J0X3Ztcl9yaW5nKHN0cnVj
dCBwc3BfY29udGV4dCAqcHNwKQ0KIAlyZXR1cm4gZmFsc2U7DQogfQ0KIA0KK3N0YXRpYyBpbnQg
cHNwX3YxMV8wX3Jpbmdfc3RvcChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwNCisJCQkgICAgICBl
bnVtIHBzcF9yaW5nX3R5cGUgcmluZ190eXBlKQ0KK3sNCisJaW50IHJldCA9IDA7DQorCXN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2ID0gcHNwLT5hZGV2Ow0KKw0KKwkvKiBXcml0ZSB0aGUgcmlu
ZyBkZXN0cm95IGNvbW1hbmQqLw0KKwlpZiAocHNwX3YxMV8wX3N1cHBvcnRfdm1yX3JpbmcocHNw
KSkNCisJCVdSRUczMl9TT0MxNShNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfMTAxLA0KKwkJCQkg
ICAgIEdGWF9DVFJMX0NNRF9JRF9ERVNUUk9ZX0dQQ09NX1JJTkcpOw0KKwllbHNlDQorCQlXUkVH
MzJfU09DMTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzY0LA0KKwkJCQkgICAgIEdGWF9DVFJM
X0NNRF9JRF9ERVNUUk9ZX1JJTkdTKTsNCisNCisJLyogdGhlcmUgbWlnaHQgYmUgaGFuZHNoYWtl
IGlzc3VlIHdpdGggaGFyZHdhcmUgd2hpY2ggbmVlZHMgZGVsYXkgKi8NCisJbWRlbGF5KDIwKTsN
CisNCisJLyogV2FpdCBmb3IgcmVzcG9uc2UgZmxhZyAoYml0IDMxKSAqLw0KKwlpZiAocHNwX3Yx
MV8wX3N1cHBvcnRfdm1yX3JpbmcocHNwKSkNCisJCXJldCA9IHBzcF93YWl0X2Zvcihwc3AsIFNP
QzE1X1JFR19PRkZTRVQoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzEwMSksDQorCQkJCSAgIDB4
ODAwMDAwMDAsIDB4ODAwMDAwMDAsIGZhbHNlKTsNCisJZWxzZQ0KKwkJcmV0ID0gcHNwX3dhaXRf
Zm9yKHBzcCwgU09DMTVfUkVHX09GRlNFVChNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfNjQpLA0K
KwkJCQkgICAweDgwMDAwMDAwLCAweDgwMDAwMDAwLCBmYWxzZSk7DQorDQorCXJldHVybiByZXQ7
DQorfQ0KKw0KIHN0YXRpYyBpbnQgcHNwX3YxMV8wX3JpbmdfY3JlYXRlKHN0cnVjdCBwc3BfY29u
dGV4dCAqcHNwLA0KIAkJCQllbnVtIHBzcF9yaW5nX3R5cGUgcmluZ190eXBlKQ0KIHsNCkBAIC00
MDYsNiArNDM0LDEyIEBAIHN0YXRpYyBpbnQgcHNwX3YxMV8wX3JpbmdfY3JlYXRlKHN0cnVjdCBw
c3BfY29udGV4dCAqcHNwLA0KIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHBzcC0+YWRl
djsNCiANCiAJaWYgKHBzcF92MTFfMF9zdXBwb3J0X3Ztcl9yaW5nKHBzcCkpIHsNCisJCXJldCA9
IHBzcF92MTFfMF9yaW5nX3N0b3AocHNwLCByaW5nX3R5cGUpOw0KKwkJaWYgKHJldCkgew0KKwkJ
CURSTV9FUlJPUigicHNwX3YxMV8wX3Jpbmdfc3RvcF9zcmlvdiBmYWlsZWQhXG4iKTsNCisJCQly
ZXR1cm4gcmV0Ow0KKwkJfQ0KKw0KIAkJLyogV3JpdGUgbG93IGFkZHJlc3Mgb2YgdGhlIHJpbmcg
dG8gQzJQTVNHXzEwMiAqLw0KIAkJcHNwX3JpbmdfcmVnID0gbG93ZXJfMzJfYml0cyhyaW5nLT5y
aW5nX21lbV9tY19hZGRyKTsNCiAJCVdSRUczMl9TT0MxNShNUDAsIDAsIG1tTVAwX1NNTl9DMlBN
U0dfMTAyLCBwc3BfcmluZ19yZWcpOyBAQCAtNDUwLDMzICs0ODQsNiBAQCBzdGF0aWMgaW50IHBz
cF92MTFfMF9yaW5nX2NyZWF0ZShzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwNCiAJcmV0dXJuIHJl
dDsNCiB9DQogDQotc3RhdGljIGludCBwc3BfdjExXzBfcmluZ19zdG9wKHN0cnVjdCBwc3BfY29u
dGV4dCAqcHNwLA0KLQkJCSAgICAgIGVudW0gcHNwX3JpbmdfdHlwZSByaW5nX3R5cGUpDQotew0K
LQlpbnQgcmV0ID0gMDsNCi0Jc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBwc3AtPmFkZXY7
DQotDQotCS8qIFdyaXRlIHRoZSByaW5nIGRlc3Ryb3kgY29tbWFuZCovDQotCWlmIChwc3BfdjEx
XzBfc3VwcG9ydF92bXJfcmluZyhwc3ApKQ0KLQkJV1JFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBf
U01OX0MyUE1TR18xMDEsDQotCQkJCSAgICAgR0ZYX0NUUkxfQ01EX0lEX0RFU1RST1lfR1BDT01f
UklORyk7DQotCWVsc2UNCi0JCVdSRUczMl9TT0MxNShNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0df
NjQsDQotCQkJCSAgICAgR0ZYX0NUUkxfQ01EX0lEX0RFU1RST1lfUklOR1MpOw0KLQ0KLQkvKiB0
aGVyZSBtaWdodCBiZSBoYW5kc2hha2UgaXNzdWUgd2l0aCBoYXJkd2FyZSB3aGljaCBuZWVkcyBk
ZWxheSAqLw0KLQltZGVsYXkoMjApOw0KLQ0KLQkvKiBXYWl0IGZvciByZXNwb25zZSBmbGFnIChi
aXQgMzEpICovDQotCWlmIChwc3BfdjExXzBfc3VwcG9ydF92bXJfcmluZyhwc3ApKQ0KLQkJcmV0
ID0gcHNwX3dhaXRfZm9yKHBzcCwgU09DMTVfUkVHX09GRlNFVChNUDAsIDAsIG1tTVAwX1NNTl9D
MlBNU0dfMTAxKSwNCi0JCQkJICAgMHg4MDAwMDAwMCwgMHg4MDAwMDAwMCwgZmFsc2UpOw0KLQll
bHNlDQotCQlyZXQgPSBwc3Bfd2FpdF9mb3IocHNwLCBTT0MxNV9SRUdfT0ZGU0VUKE1QMCwgMCwg
bW1NUDBfU01OX0MyUE1TR182NCksDQotCQkJCSAgIDB4ODAwMDAwMDAsIDB4ODAwMDAwMDAsIGZh
bHNlKTsNCi0NCi0JcmV0dXJuIHJldDsNCi19DQogDQogc3RhdGljIGludCBwc3BfdjExXzBfcmlu
Z19kZXN0cm95KHN0cnVjdCBwc3BfY29udGV4dCAqcHNwLA0KIAkJCQkgZW51bSBwc3BfcmluZ190
eXBlIHJpbmdfdHlwZSkNCi0tDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
