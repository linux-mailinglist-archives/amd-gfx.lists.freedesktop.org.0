Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDA61CEF4
	for <lists+amd-gfx@lfdr.de>; Tue, 14 May 2019 20:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFA0892FA;
	Tue, 14 May 2019 18:20:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750040.outbound.protection.outlook.com [40.107.75.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00AF7892D4
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 May 2019 18:20:57 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3544.namprd12.prod.outlook.com (20.179.94.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Tue, 14 May 2019 18:20:55 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e07e:24e5:eb8f:199e]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e07e:24e5:eb8f:199e%6]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 18:20:55 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Wentland, Harry" <Harry.Wentland@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/amd/display: Add ASICREV_IS_PICASSO
Thread-Topic: [PATCH 1/3] drm/amd/display: Add ASICREV_IS_PICASSO
Thread-Index: AQHVCn19oAuc5ZNYWUyvbJnfVxrvGqZq7osA
Date: Tue, 14 May 2019 18:20:55 +0000
Message-ID: <387c6572-f872-44e1-3b41-de6ae957646d@amd.com>
References: <20190514174935.28605-1-harry.wentland@amd.com>
In-Reply-To: <20190514174935.28605-1-harry.wentland@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::25) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acea06b6-9984-4570-acaa-08d6d898e75e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3544; 
x-ms-traffictypediagnostic: BYAPR12MB3544:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB3544E87CB5C1FBD093B3EBF5EC080@BYAPR12MB3544.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(39860400002)(346002)(366004)(396003)(189003)(199004)(486006)(53936002)(186003)(31686004)(14454004)(66556008)(66476007)(476003)(6512007)(66066001)(6436002)(54906003)(8676002)(66446008)(66946007)(2616005)(64756008)(73956011)(11346002)(86362001)(6306002)(5660300002)(110136005)(446003)(2906002)(31696002)(966005)(71190400001)(71200400001)(102836004)(26005)(256004)(81166006)(8936002)(52116002)(76176011)(6246003)(99286004)(316002)(478600001)(305945005)(25786009)(68736007)(4326008)(229853002)(2501003)(53546011)(6506007)(7736002)(386003)(36756003)(6486002)(72206003)(6116002)(3846002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3544;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uMlOXhtsiCtZkfG1eV7W7zelAvAuZm88Vfp4IRpuznTzvuauDP/kkJSsgROR3PgA45KCGTAQjiVLWFTQ4UsFWmTjed/CIppWI1G9kM+Cih//KQ4vfDJScB1uf6PUsLz+ZkylNi8av7zj2QqyQbqneAnbvXqErorOsIbyENIXlUhGuoj5q5t76KjD8xm5To/VJpB6zpfvKJf7IYa+L9+CG0onL4OFRQ/w/W6uRKJ8iLPG0x86oNGEos1gQMPAYgnRZc/va9vHdTnMs7fL4wRmoXifFuWZ9KF4LWVqhTVJkdPvnDNfjnXnnwJ60aZxNCqMbtBqTx9HCdHSGZm5h9uDJlUDCMgftSn6uw0HeoTyGH28p5M5DP9QDUqa7Y+8JCW30utFsXO0Yl4xMucnjlJ34hbvHe9HztryBDzC8SQeLNg=
Content-ID: <E8705F7AAC245B498F962270154345F9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acea06b6-9984-4570-acaa-08d6d898e75e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 18:20:55.4350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3544
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGN76Iv0VhnW+uggr3A5bBu0JL5mBwbu96AH/YpIxfQ=;
 b=SRtKIYgEoDWgAkm+QAqTUVYslADz64w7TqXHT1SH8irgxoPOYjIsMM7TfUEqq7kOhex9OPtl1t40ALtcX71Wh1Ko3Dd8v233CMJuTZ4Ycl0iGaYurkBt/AmvlGBd4hJE9QhGlfP7y+G/HDl+MC1dvbNgnq1iK5ucUiduVzxdoGM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Cheng,
 Tony" <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gNS8xNC8xOSAxOjQ5IFBNLCBIYXJyeSBXZW50bGFuZCB3cm90ZToNCj4gDQo+IFtXSFldDQo+
IFdlIG9ubHkgd2FudCB0byBsb2FkIERNQ1UgRlcgb24gUGljYXNzbyBhbmQgUmF2ZW4gMiwgbm90
IG9uIFJhdmVuIDEuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnku
d2VudGxhbmRAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2luY2x1ZGUvZGFsX2FzaWNfaWQuaCB8IDcgKysrKy0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGFsX2FzaWNfaWQuaCBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2RhbF9hc2ljX2lkLmgNCj4gaW5kZXggMWE5Yjc1MDc3
ODRmLi4wNzJkOGQ3ZGViZjUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9pbmNsdWRlL2RhbF9hc2ljX2lkLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2luY2x1ZGUvZGFsX2FzaWNfaWQuaA0KPiBAQCAtMTM5LDEzICsxMzksMTQgQEANCj4g
ICAjZGVmaW5lIFJBVkVOMV9GMCAweEYwDQo+ICAgI2RlZmluZSBSQVZFTl9VTktOT1dOIDB4RkYN
Cj4gDQo+IC0jaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQ19EQ04xXzAxKQ0KPiAtI2RlZmlu
ZSBBU0lDUkVWX0lTX1JBVkVOMihlQ2hpcFJldikgKChlQ2hpcFJldiA+PSBSQVZFTjJfQTApICYm
IChlQ2hpcFJldiA8IDB4RjApKQ0KPiAtI2VuZGlmIC8qIERDTjFfMDEgKi8NCj4gICAjZGVmaW5l
IEFTSUNfUkVWX0lTX1JBVkVOKGVDaGlwUmV2KSAoKGVDaGlwUmV2ID49IFJBVkVOX0EwKSAmJiBl
Q2hpcFJldiA8IFJBVkVOX1VOS05PV04pDQo+ICAgI2RlZmluZSBSQVZFTjFfRjAgMHhGMA0KPiAg
ICNkZWZpbmUgQVNJQ1JFVl9JU19SVjFfRjAoZUNoaXBSZXYpICgoZUNoaXBSZXYgPj0gUkFWRU4x
X0YwKSAmJiAoZUNoaXBSZXYgPCBSQVZFTl9VTktOT1dOKSkNCj4gDQo+ICsjaWYgZGVmaW5lZChD
T05GSUdfRFJNX0FNRF9EQ19EQ04xXzAxKQ0KPiArI2RlZmluZSBBU0lDUkVWX0lTX1BJQ0FTU08o
ZUNoaXBSZXYpICgoZUNoaXBSZXYgPj0gUElDQVNTT19BMCkgJiYgKGVDaGlwUmV2IDwgUkFWRU4y
X0EwKSkNCj4gKyNkZWZpbmUgQVNJQ1JFVl9JU19SQVZFTjIoZUNoaXBSZXYpICgoZUNoaXBSZXYg
Pj0gUkFWRU4yX0EwKSAmJiAoZUNoaXBSZXYgPCAweEYwKSkNCj4gKyNlbmRpZiAvKiBEQ04xXzAx
ICovDQoNCkFjdHVhbGx5LCBJIGp1c3QgcmVhbGl6ZWQgYSBwcm9ibGVtIHdpdGggZG9pbmcgdGhp
cy4gWW91J2xsIGJyZWFrIGJ1aWxkcyANCnRoYXQgZG9uJ3QgaGF2ZSBEQ04gZW5hYmxlZCB3aXRo
IHRoZSBzZWNvbmQgcGF0Y2ggYmVjYXVzZSB5b3UncmUgDQpndWFyZGluZyB0aGVzZSBiZWhpbmQg
dGhlIGRlZmluZSBhbmQgdGhlIHNlY29uZCBwYXRjaCBjaGVja3MgDQpBU0lDUkVWX0lTX1BJQ0FT
U08gb3V0c2lkZSBvZiBhbnkgZ3VhcmQgYXQgYWxsLg0KDQpOaWNob2xhcyBLYXpsYXVza2FzDQoN
Cj4gDQo+ICAgI2RlZmluZSBGQU1JTFlfUlYgMTQyIC8qIERDTiAxKi8NCj4gDQo+IC0tDQo+IDIu
MjEuMA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4DQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
