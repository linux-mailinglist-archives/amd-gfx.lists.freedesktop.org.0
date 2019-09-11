Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 585A9AF493
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 05:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E126E931;
	Wed, 11 Sep 2019 03:04:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800071.outbound.protection.outlook.com [40.107.80.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE4F6E931
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 03:04:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIBJETJj8za3Zl4xD5clYpVNnUmOllppFIe2kbQL0LnDpO7oKy/Iky2WEN12da83qVHns9QT4PHfOmbwG9UkGMAsImwbZGZD5eYJvz54MgLwI4+1xuriluxUdsxjvPHCmdqs318Q7HX1XO8T0VBTEkRH6i//r5yorAzMv8SOzs+RmruLYJskydlR2saZ2x8ivVrIryHQhddDgxxblOjFtyTWVWbPzi7wdq1GYtT+3zWjh4hTukKGAqseQNwt/ZPVrr5CXMzNBiJMSnJJv7CCXV07vpKkuHOGtVT2TcfHwzMf487MNiXyB9SyeJkm25/R4AiPOjeCNGCrL/v/cjz9Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7na5p/SrORStBPvNEhyEs5maojDp1L4YNX1Vclggm4=;
 b=LFZmfU3JdVpVNo29uAb/NP4u8F83QNPmGiJQZq+ni0vK1LSLb/hK1VKooIxFXLfbsyCfmzthh28zNQ86AVBol94ZAqLzzsLT89pYtXO4vydEeuKYP+3D7FmRnLqZlxnl8YmR56ESsp9mXBPHO1oJ1WAUoHQOKBWdH4K8KvaIjXy8hzuiSP9ovck8cxOrfe7xu2Rv3CPl7qPRBGmQ7bkbsrQoE9seQ71ta/wFxjC15nE5VLuFajtyFei4D4FJPXlpdJLILbzXDR8xzTkPp/wwrP5x9irhVhxD19BVl2JATp1QQ3m3s3fCtjKJitXpA+qLmSh7wCBH8nBa8lLTVtXqUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB4039.namprd12.prod.outlook.com (20.180.6.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Wed, 11 Sep 2019 03:04:25 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::dc49:bed0:febe:4f5]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::dc49:bed0:febe:4f5%7]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 03:04:25 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/sriov: add ring_stop before ring_create in psp
 v11 code
Thread-Topic: [PATCH] drm/amdgpu/sriov: add ring_stop before ring_create in
 psp v11 code
Thread-Index: AQHVZ68XD0UTt8ihFkSooVLHOf1xJaclyaUAgAACMPA=
Date: Wed, 11 Sep 2019 03:04:25 +0000
Message-ID: <CH2PR12MB3767DADF71BF733276CFE4EBFEB10@CH2PR12MB3767.namprd12.prod.outlook.com>
References: <20190910080922.4933-1-Jack.Zhang1@amd.com>
 <DM6PR12MB367543F375AE028DE9B4F810BBB10@DM6PR12MB3675.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB367543F375AE028DE9B4F810BBB10@DM6PR12MB3675.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c8a0980-2d5d-4d9a-4d4c-08d73664c0c7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB4039; 
x-ms-traffictypediagnostic: CH2PR12MB4039:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB40396AF0DC03FB905D3C02CDFEB10@CH2PR12MB4039.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:862;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(13464003)(199004)(189003)(2501003)(316002)(6246003)(66946007)(66476007)(2906002)(76116006)(66446008)(9686003)(186003)(8936002)(486006)(55016002)(81166006)(81156014)(25786009)(476003)(99286004)(53546011)(6506007)(102836004)(8676002)(86362001)(6436002)(26005)(76176011)(74316002)(7736002)(305945005)(478600001)(110136005)(52536014)(53936002)(6306002)(7696005)(229853002)(66556008)(256004)(71200400001)(71190400001)(446003)(11346002)(6116002)(33656002)(5660300002)(66066001)(3846002)(14454004)(966005)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4039;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: t0Pg3UK28cQ/ug/oKOeN7ogqKDKD99W8qB++hIQB316axwEuESMoJnhb1/lSB3ZxcJ7wJQ9azi6Rxkg4NsXLJiUM7HejDkWt/tGbFnhL77GlSYIOmeYLZ4r5J90gBvl4+EQeLGKrbGnagt8ZBQrQ3zXDaR3y27+/gN5e6nUB+U4yhIQ49n82c/Ms3L3CF9PARIbCZwNG/rZkdgJcfpdgXOfw5+Wkcy1xb8YmuiTr7+863Ad1OSKq0k/LLBMbCdaJgKwRCMiw50chfUbEBurJ7VN9dYJ4k3uXh58KXHVNPO9995Gp/AcfFwtbkKThvXl4iP/dQNgbovWFoowF4A96JFcR2Uo/RXi8Xtfx21ODDv72M7g+AYBTgH31NJy4v136CqSxKFu2jqmO1SXpCH38gMFhFFPGKhkslIDEe6PjR0A=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8a0980-2d5d-4d9a-4d4c-08d73664c0c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 03:04:25.3252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IGNVD4rJx2n9mfxQ8KqZArNL0s/BxnX+4p8uJ2wGltJoF+SvRv80Rh7c63fkRBbO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4039
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7na5p/SrORStBPvNEhyEs5maojDp1L4YNX1Vclggm4=;
 b=l+y6Yvr1pCydS9QQ0tchwCZaWx5cnlwhm6ur5U1JEIkTl/WffiXWq9G9eM4SFEDIp9MAu5k60b6kwq5CFlyYDHcJMVb+gkcvvPsSQ/jWbiaB9Gvg8WNRgOWzZIQHBZTyQzKjwKwrSTkSp4x5X0KIJiZPAvgLNLOfRiJeXjQplYU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Feifei.Xu@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpSZXZpZXdlZC1ieTogRmVpZmVpIFh1IDxGZWlmZWkuWHVAYW1kLmNvbT4NCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFpoYW5nLCBKYWNrIChKaWFuKSA8SmFjay5aaGFuZzFA
YW1kLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAxMSwgMjAxOSAxMDo1NiBBTQ0K
VG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBYdSwgRmVpZmVpIDxGZWlmZWkuWHVA
YW1kLmNvbT4NCkNjOiBaaGFuZywgSmFjayAoSmlhbikgPEphY2suWmhhbmcxQGFtZC5jb20+DQpT
dWJqZWN0OiBSRTogW1BBVENIXSBkcm0vYW1kZ3B1L3NyaW92OiBhZGQgcmluZ19zdG9wIGJlZm9y
ZSByaW5nX2NyZWF0ZSBpbiBwc3AgdjExIGNvZGUNCg0KcGluZw0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZz4gT24gQmVoYWxmIE9mIEphY2sgWmhhbmcNClNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJl
ciAxMCwgMjAxOSA0OjA5IFBNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNj
OiBaaGFuZywgSmFjayAoSmlhbikgPEphY2suWmhhbmcxQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFU
Q0hdIGRybS9hbWRncHUvc3Jpb3Y6IGFkZCByaW5nX3N0b3AgYmVmb3JlIHJpbmdfY3JlYXRlIGlu
IHBzcCB2MTEgY29kZQ0KDQpwc3AgIHYxMSBjb2RlIG1pc3NlZCByaW5nIHN0b3AgaW4gcmluZyBj
cmVhdGUgZnVuY3Rpb24oVk1SKSB3aGlsZSBwc3AgdjMuMSBjb2RlIGhhZCB0aGUgY29kZS4gVGhp
cyB3aWxsIGNhdXNlIFZNIGRlc3Ryb3kxIGZhaWwgYW5kIHBzcCByaW5nIGNyZWF0ZSBmYWlsLg0K
DQpGb3IgU0lPVi1WRiwgcmluZ19zdG9wIHNob3VsZCBub3QgYmUgZGVsZXRlZCBpbiByaW5nX2Ny
ZWF0ZSBmdW5jdGlvbi4NCg0KU2lnbmVkLW9mZi1ieTogSmFjayBaaGFuZyA8SmFjay5aaGFuZzFA
YW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jIHwg
NjEgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAz
NCBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvcHNwX3YxMV8wLmMNCmluZGV4IGNkZGZhM2MuLjhlOWIzNGEgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvcHNwX3YxMV8wLmMNCkBAIC0zOTcsNiArMzk3LDM0IEBAIHN0YXRpYyBib29s
IHBzcF92MTFfMF9zdXBwb3J0X3Ztcl9yaW5nKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQ0KIAly
ZXR1cm4gZmFsc2U7DQogfQ0KIA0KK3N0YXRpYyBpbnQgcHNwX3YxMV8wX3Jpbmdfc3RvcChzdHJ1
Y3QgcHNwX2NvbnRleHQgKnBzcCwNCisJCQkgICAgICBlbnVtIHBzcF9yaW5nX3R5cGUgcmluZ190
eXBlKQ0KK3sNCisJaW50IHJldCA9IDA7DQorCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0g
cHNwLT5hZGV2Ow0KKw0KKwkvKiBXcml0ZSB0aGUgcmluZyBkZXN0cm95IGNvbW1hbmQqLw0KKwlp
ZiAocHNwX3YxMV8wX3N1cHBvcnRfdm1yX3JpbmcocHNwKSkNCisJCVdSRUczMl9TT0MxNShNUDAs
IDAsIG1tTVAwX1NNTl9DMlBNU0dfMTAxLA0KKwkJCQkgICAgIEdGWF9DVFJMX0NNRF9JRF9ERVNU
Uk9ZX0dQQ09NX1JJTkcpOw0KKwllbHNlDQorCQlXUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9T
TU5fQzJQTVNHXzY0LA0KKwkJCQkgICAgIEdGWF9DVFJMX0NNRF9JRF9ERVNUUk9ZX1JJTkdTKTsN
CisNCisJLyogdGhlcmUgbWlnaHQgYmUgaGFuZHNoYWtlIGlzc3VlIHdpdGggaGFyZHdhcmUgd2hp
Y2ggbmVlZHMgZGVsYXkgKi8NCisJbWRlbGF5KDIwKTsNCisNCisJLyogV2FpdCBmb3IgcmVzcG9u
c2UgZmxhZyAoYml0IDMxKSAqLw0KKwlpZiAocHNwX3YxMV8wX3N1cHBvcnRfdm1yX3JpbmcocHNw
KSkNCisJCXJldCA9IHBzcF93YWl0X2Zvcihwc3AsIFNPQzE1X1JFR19PRkZTRVQoTVAwLCAwLCBt
bU1QMF9TTU5fQzJQTVNHXzEwMSksDQorCQkJCSAgIDB4ODAwMDAwMDAsIDB4ODAwMDAwMDAsIGZh
bHNlKTsNCisJZWxzZQ0KKwkJcmV0ID0gcHNwX3dhaXRfZm9yKHBzcCwgU09DMTVfUkVHX09GRlNF
VChNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfNjQpLA0KKwkJCQkgICAweDgwMDAwMDAwLCAweDgw
MDAwMDAwLCBmYWxzZSk7DQorDQorCXJldHVybiByZXQ7DQorfQ0KKw0KIHN0YXRpYyBpbnQgcHNw
X3YxMV8wX3JpbmdfY3JlYXRlKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwLA0KIAkJCQllbnVtIHBz
cF9yaW5nX3R5cGUgcmluZ190eXBlKQ0KIHsNCkBAIC00MDYsNiArNDM0LDEyIEBAIHN0YXRpYyBp
bnQgcHNwX3YxMV8wX3JpbmdfY3JlYXRlKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwLA0KIAlzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHBzcC0+YWRldjsNCiANCiAJaWYgKHBzcF92MTFfMF9z
dXBwb3J0X3Ztcl9yaW5nKHBzcCkpIHsNCisJCXJldCA9IHBzcF92MTFfMF9yaW5nX3N0b3AocHNw
LCByaW5nX3R5cGUpOw0KKwkJaWYgKHJldCkgew0KKwkJCURSTV9FUlJPUigicHNwX3YxMV8wX3Jp
bmdfc3RvcF9zcmlvdiBmYWlsZWQhXG4iKTsNCisJCQlyZXR1cm4gcmV0Ow0KKwkJfQ0KKw0KIAkJ
LyogV3JpdGUgbG93IGFkZHJlc3Mgb2YgdGhlIHJpbmcgdG8gQzJQTVNHXzEwMiAqLw0KIAkJcHNw
X3JpbmdfcmVnID0gbG93ZXJfMzJfYml0cyhyaW5nLT5yaW5nX21lbV9tY19hZGRyKTsNCiAJCVdS
RUczMl9TT0MxNShNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfMTAyLCBwc3BfcmluZ19yZWcpOyBA
QCAtNDUwLDMzICs0ODQsNiBAQCBzdGF0aWMgaW50IHBzcF92MTFfMF9yaW5nX2NyZWF0ZShzdHJ1
Y3QgcHNwX2NvbnRleHQgKnBzcCwNCiAJcmV0dXJuIHJldDsNCiB9DQogDQotc3RhdGljIGludCBw
c3BfdjExXzBfcmluZ19zdG9wKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwLA0KLQkJCSAgICAgIGVu
dW0gcHNwX3JpbmdfdHlwZSByaW5nX3R5cGUpDQotew0KLQlpbnQgcmV0ID0gMDsNCi0Jc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBwc3AtPmFkZXY7DQotDQotCS8qIFdyaXRlIHRoZSByaW5n
IGRlc3Ryb3kgY29tbWFuZCovDQotCWlmIChwc3BfdjExXzBfc3VwcG9ydF92bXJfcmluZyhwc3Ap
KQ0KLQkJV1JFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR18xMDEsDQotCQkJCSAg
ICAgR0ZYX0NUUkxfQ01EX0lEX0RFU1RST1lfR1BDT01fUklORyk7DQotCWVsc2UNCi0JCVdSRUcz
Ml9TT0MxNShNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfNjQsDQotCQkJCSAgICAgR0ZYX0NUUkxf
Q01EX0lEX0RFU1RST1lfUklOR1MpOw0KLQ0KLQkvKiB0aGVyZSBtaWdodCBiZSBoYW5kc2hha2Ug
aXNzdWUgd2l0aCBoYXJkd2FyZSB3aGljaCBuZWVkcyBkZWxheSAqLw0KLQltZGVsYXkoMjApOw0K
LQ0KLQkvKiBXYWl0IGZvciByZXNwb25zZSBmbGFnIChiaXQgMzEpICovDQotCWlmIChwc3BfdjEx
XzBfc3VwcG9ydF92bXJfcmluZyhwc3ApKQ0KLQkJcmV0ID0gcHNwX3dhaXRfZm9yKHBzcCwgU09D
MTVfUkVHX09GRlNFVChNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfMTAxKSwNCi0JCQkJICAgMHg4
MDAwMDAwMCwgMHg4MDAwMDAwMCwgZmFsc2UpOw0KLQllbHNlDQotCQlyZXQgPSBwc3Bfd2FpdF9m
b3IocHNwLCBTT0MxNV9SRUdfT0ZGU0VUKE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR182NCksDQot
CQkJCSAgIDB4ODAwMDAwMDAsIDB4ODAwMDAwMDAsIGZhbHNlKTsNCi0NCi0JcmV0dXJuIHJldDsN
Ci19DQogDQogc3RhdGljIGludCBwc3BfdjExXzBfcmluZ19kZXN0cm95KHN0cnVjdCBwc3BfY29u
dGV4dCAqcHNwLA0KIAkJCQkgZW51bSBwc3BfcmluZ190eXBlIHJpbmdfdHlwZSkNCi0tDQoyLjcu
NA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1k
LWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
