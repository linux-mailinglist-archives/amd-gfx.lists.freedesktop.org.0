Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE492D418
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 05:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8765A6E065;
	Wed, 29 May 2019 03:07:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810049.outbound.protection.outlook.com [40.107.81.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CD96E065
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 May 2019 03:07:46 +0000 (UTC)
Received: from MWHPR12MB1326.namprd12.prod.outlook.com (10.169.205.19) by
 MWHPR12MB1710.namprd12.prod.outlook.com (10.175.54.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.16; Wed, 29 May 2019 03:07:43 +0000
Received: from MWHPR12MB1326.namprd12.prod.outlook.com
 ([fe80::2c1a:62f0:b1bd:74d7]) by MWHPR12MB1326.namprd12.prod.outlook.com
 ([fe80::2c1a:62f0:b1bd:74d7%2]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 03:07:43 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>
Subject: RE: [PATCH] drm/amdgpu:Fix the unpin warning about csb buffer
Thread-Topic: [PATCH] drm/amdgpu:Fix the unpin warning about csb buffer
Thread-Index: AQHVFSxBYHqsgoR6uEW/oFZToTLUWqaAUbTQgAEWydCAAAO2cA==
Date: Wed, 29 May 2019 03:07:43 +0000
Message-ID: <MWHPR12MB132656C894105F239387AE948F1F0@MWHPR12MB1326.namprd12.prod.outlook.com>
References: <1559030775-19612-1-git-send-email-Emily.Deng@amd.com>
 <MWHPR12MB1326361E2C7ADE7523E3E7D48F1E0@MWHPR12MB1326.namprd12.prod.outlook.com>
 <MWHPR12MB1326C5856A40BB52D1BC34508F1F0@MWHPR12MB1326.namprd12.prod.outlook.com>
In-Reply-To: <MWHPR12MB1326C5856A40BB52D1BC34508F1F0@MWHPR12MB1326.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86c1fe41-87b9-4c51-1d83-08d6e3e2d171
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(49563074)(7193020);
 SRVR:MWHPR12MB1710; 
x-ms-traffictypediagnostic: MWHPR12MB1710:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR12MB17105CE4A7D9D756D87F1F0D8F1F0@MWHPR12MB1710.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(396003)(39860400002)(136003)(366004)(13464003)(199004)(189003)(66446008)(64756008)(66556008)(11346002)(5660300002)(8676002)(14444005)(476003)(9686003)(66946007)(73956011)(66066001)(66616009)(66476007)(76116006)(52536014)(86362001)(6306002)(6116002)(446003)(7736002)(486006)(74316002)(33656002)(305945005)(2940100002)(8936002)(3846002)(72206003)(478600001)(7696005)(14454004)(76176011)(6246003)(26005)(316002)(71200400001)(71190400001)(6506007)(102836004)(68736007)(25786009)(81166006)(81156014)(110136005)(229853002)(99286004)(2906002)(2501003)(99936001)(6636002)(55016002)(186003)(256004)(53936002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1710;
 H:MWHPR12MB1326.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UDoeEydVG4vB3PQuZSRRVbGfoCl46L9+Sn05dMSR4fiEXohenE4aTa3dkRA3IqbRU5fFTXYKiMLL8t2QfCXLP/cjCyGSAEG6tPkmW5Y8l+z0oJu33Vj7qF2hmb/qKkXLcfiwTykv2UsqHLCuPtn21Ip4SqN9rQ4cCfDBcz4R8+RC/sxzGs0D563LDzrVyIxgGVVcDH90/EMB/xHem0FCNkLzB6W9vXrR7lTojHgPA+Jn0uZrD97ifU4QZJ7XRITTuy2vzUN0opaBUtZRB1dbMagc6coo84FLRmBTpR56r6h370I0IAsqmknVOT54Iza7GpPbg4QvPjo+r7xr4ek/3N0bQwTlLLHjb+7rcfNmiejz+JkyHUZjas4LUiT6oLdQRlYvzWBHet1u8lntzosQaABLTaIKOOkBjDXS6nQ/TDM=
Content-Type: multipart/mixed;
 boundary="_002_MWHPR12MB132656C894105F239387AE948F1F0MWHPR12MB1326namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c1fe41-87b9-4c51-1d83-08d6e3e2d171
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 03:07:43.3457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqdeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1710
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCV3Qa6CtfNzbZEp3vaZLbDHlT+n20iWDsLbZc08BWA=;
 b=dUdOBFWbGlrCgtMfcixEUhwAuVoCEbYgwRTGdMcwKgiE7t3jrmYqCjpnxHjdvBE7Q7qigQAsDe+Md7HtiZTLQb9sqGmbBw2OQFks9ln/vr+z327ffqPc3SbMXOALuRqsXFqF8xFEuKyA3WL3W47PXdKjuED/gSTKhOjf0USDRJY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_002_MWHPR12MB132656C894105F239387AE948F1F0MWHPR12MB1326namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ2hyaXN0aWFuLA0KICAgICBJIGhhdmUgcmV2ZXJ0ZWQgdGhlIGJlZm9yZSBjaGFuZ2UgYXMg
eW91ciBzdWdnZXN0aW9uLCBhbmQgc2VudCB0aGlzIG5ldyBwYXRjaCwgY291bGQgeW91IGhlbHAg
dG8gcmV2aWV3IHRoaXM/DQoNCkJlc3Qgd2lzaGVzDQpFbWlseSBEZW5nDQoNCg0KDQo+LS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgRGVuZywNCj5FbWlseQ0KPlNlbnQ6IFdl
ZG5lc2RheSwgTWF5IDI5LCAyMDE5IDEwOjUyIEFNDQo+VG86IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+U3ViamVjdDogUkU6IFtQQVRDSF0gZHJtL2FtZGdwdTpGaXggdGhlIHVucGlu
IHdhcm5pbmcgYWJvdXQgY3NiIGJ1ZmZlcg0KPg0KPlBpbmcuLi4uLi4NCj4NCj5CZXN0IHdpc2hl
cw0KPkVtaWx5IERlbmcNCj4NCj4NCj4NCj4+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+
RnJvbTogRGVuZywgRW1pbHkgPEVtaWx5LkRlbmdAYW1kLmNvbT4NCj4+U2VudDogVHVlc2RheSwg
TWF5IDI4LCAyMDE5IDY6MTQgUE0NCj4+VG86IERlbmcsIEVtaWx5IDxFbWlseS5EZW5nQGFtZC5j
b20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj5TdWJqZWN0OiBSRTogW1BBVENI
XSBkcm0vYW1kZ3B1OkZpeCB0aGUgdW5waW4gd2FybmluZyBhYm91dCBjc2IgYnVmZmVyDQo+Pg0K
Pj5QaW5nIC4uLi4uLg0KPj4NCj4+QmVzdCB3aXNoZXMNCj4+RW1pbHkgRGVuZw0KPj4NCj4+DQo+
Pg0KPj4+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+PkZyb206IGFtZC1nZnggPGFtZC1n
ZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPj4+RW1pbHkg
RGVuZw0KPj4+U2VudDogVHVlc2RheSwgTWF5IDI4LCAyMDE5IDQ6MDYgUE0NCj4+PlRvOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4+Q2M6IERlbmcsIEVtaWx5IDxFbWlseS5EZW5n
QGFtZC5jb20+DQo+Pj5TdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6Rml4IHRoZSB1bnBpbiB3
YXJuaW5nIGFib3V0IGNzYiBidWZmZXINCj4+Pg0KPj4+QXMgaXQgd2lsbCBkZXN0cm95IGNsZWFy
X3N0YXRlX29iaiwgYW5kIGFsc28gd2lsbCB1bnBpbiBpdCBpbiB0aGUNCj4+PmdmeF92OV8wX3N3
X2ZpbmksIHNvIGRvbid0IG5lZWQgdG8gY2FsbCBhbWRncHVfYm9fZnJlZV9rZXJuZWwgaW4NCj4+
PmdmeF92OV8wX3N3X2ZpbmksIG9yIGl0IHdpbGwgaGF2ZSB1bnBpbiB3YXJuaW5nLg0KPj4+DQo+
Pj5TaWduZWQtb2ZmLWJ5OiBFbWlseSBEZW5nIDxFbWlseS5EZW5nQGFtZC5jb20+DQo+Pj4tLS0N
Cj4+PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIHwgNCArLS0tDQo+Pj4g
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj5k
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPj4+Yi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+Pj5pbmRleCBjNzYzNzMzLi5j
YzVhMzgyIDEwMDY0NA0KPj4+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5
XzAuYw0KPj4+KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPj4+
QEAgLTE3OTQsOSArMTc5NCw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfc3dfZmluaSh2b2lkICpo
YW5kbGUpDQo+Pj4NCj4+PiAJZ2Z4X3Y5XzBfbWVjX2ZpbmkoYWRldik7DQo+Pj4gCWdmeF92OV8w
X25nZ19maW5pKGFkZXYpOw0KPj4+LQlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmFkZXYtPmdmeC5y
bGMuY2xlYXJfc3RhdGVfb2JqLA0KPj4+LQkJCQkmYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9n
cHVfYWRkciwNCj4+Pi0JCQkJKHZvaWQgKiopJmFkZXYtPmdmeC5ybGMuY3NfcHRyKTsNCj4+PisJ
YW1kZ3B1X2JvX3VucmVmKCZhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaik7DQo+Pj4gCWlm
IChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9SQVZFTikgew0KPj4+IAkJYW1kZ3B1X2JvX2ZyZWVf
a2VybmVsKCZhZGV2LT5nZngucmxjLmNwX3RhYmxlX29iaiwNCj4+PiAJCQkJJmFkZXYtPmdmeC5y
bGMuY3BfdGFibGVfZ3B1X2FkZHIsDQo+Pj4tLQ0KPj4+Mi43LjQNCj4+Pg0KPj4+X19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+PmFtZC1nZnggbWFpbGlu
ZyBsaXN0DQo+Pj5hbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4+aHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQo+X19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj5hbWQtZ2Z4IG1haWxpbmcgbGlz
dA0KPmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+aHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQo=

--_002_MWHPR12MB132656C894105F239387AE948F1F0MWHPR12MB1326namp_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Wed, 29 May 2019 03:07:40 GMT";
	modification-date="Wed, 29 May 2019 03:07:40 GMT"

Received: from DM6PR12MB3339.namprd12.prod.outlook.com (2603:10b6:301:16::27)
 by MWHPR12MB1326.namprd12.prod.outlook.com with HTTPS via
 MWHPR2201CA0053.NAMPRD22.PROD.OUTLOOK.COM; Tue, 28 May 2019 07:48:43 +0000
Received: from SN1PR12CA0043.namprd12.prod.outlook.com (2603:10b6:802:20::14)
 by DM6PR12MB3339.namprd12.prod.outlook.com (2603:10b6:5:11f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.18; Tue, 28 May
 2019 07:48:41 +0000
Received: from CO1NAM03FT022.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by SN1PR12CA0043.outlook.office365.com
 (2603:10b6:802:20::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.16 via Frontend
 Transport; Tue, 28 May 2019 07:48:41 +0000
Received: from gabe.freedesktop.org (131.252.210.177) by
 CO1NAM03FT022.mail.protection.outlook.com (10.152.80.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Tue, 28 May 2019 07:48:39 +0000
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A22389BFF;
	Tue, 28 May 2019 07:48:39 +0000 (UTC)
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740054.outbound.protection.outlook.com [40.107.74.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8F589BFF
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 07:48:37 +0000 (UTC)
Received: from MWHPR12MB1326.namprd12.prod.outlook.com (10.169.205.19) by
 MWHPR12MB1421.namprd12.prod.outlook.com (10.169.206.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Tue, 28 May 2019 07:48:35 +0000
Received: from MWHPR12MB1326.namprd12.prod.outlook.com
 ([fe80::2c1a:62f0:b1bd:74d7]) by MWHPR12MB1326.namprd12.prod.outlook.com
 ([fe80::2c1a:62f0:b1bd:74d7%2]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 07:48:35 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Quan, Evan"
	<Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
	<amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
Thread-Topic: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
Thread-Index:  AQHVFGf/fWnzFgt6lEuyAmxs5+HV9KZ+zoCAgAD13wCAAFnBAIAACV4AgAABxICAAABnkA==
Sender: amd-gfx <amd-gfx-bounces@lists.freedesktop.org>
Date: Tue, 28 May 2019 07:48:35 +0000
Message-ID:  <MWHPR12MB1326DF5AE0D6F1C02F643D328F1E0@MWHPR12MB1326.namprd12.prod.outlook.com>
References: <1558946487-18034-1-git-send-email-Emily.Deng@amd.com>
 <e15ac75c-fb1a-2a05-b857-d3761f5c905e@gmail.com>
 <MN2PR12MB3344714A52B709FCE058F48DE41E0@MN2PR12MB3344.namprd12.prod.outlook.com>
 <82dfcb34-109c-b7d6-c511-404008589869@amd.com>
 <MWHPR12MB132646027A5B99282AB6557A8F1E0@MWHPR12MB1326.namprd12.prod.outlook.com>
 <daf490f4-49fd-3688-84ff-5dc47eaa535c@amd.com>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
In-Reply-To: <daf490f4-49fd-3688-84ff-5dc47eaa535c@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Exchange-Organization-AuthAs: Anonymous
X-MS-Exchange-Organization-AuthSource:  CO1NAM03FT022.eop-NAM03.prod.protection.outlook.com
X-MS-Has-Attach: 
X-Auto-Response-Suppress: All
X-MS-Exchange-Organization-Network-Message-Id:  8c657d6d-e250-432e-94f8-08d6e340e6e0
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
x-ms-exchange-organization-originalclientipaddress: 131.252.210.177
x-ms-exchange-organization-originalserveripaddress: 10.152.80.182
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-publictraffictype: Email
X-Microsoft-Antispam-Mailbox-Delivery:  ucf:1;jmr:0;ex:0;auth:0;dest:C;OFR:CustomRules;ENG:(750119)(520011016)(944504077)(944701077);
X-Microsoft-Antispam-Message-Info:  EplJdRmrNh8XTA7ab8GfjZZIPn7yv0xFmb5zL7E3SCL71Hq1Zxq9ndvZJBuJd6OBRS3xkfGDSuGoDiDQXcM0MYYdgygaF6ShP3LSSqY/c90r33HlfV3gfa3W70wFckib4QikmOGx/iLm1onGL61TiIehaPsyI4/6lWA28EEuMLAwFXTFwOWlY4cUS7g4MsNoBCcFb8zYo2gzgmL9CxpKa6bQzYBdbVTTSgS0dTOJ9w70xlFp2lhfaalX2x69GXTJYtP4xL5dm2IdkXSO8FMcqzYXvDzNapd0Ak3DsWZ9WtWpuajkmgzzvq7WQ10+HjtegU8cMEFsap35i/gU0C98UW5BSh35RLoTIAdzJDGV+/TgvYa2RjZkNqQOc7jQd8tUk9uQODRUgMAI1GWsB+eIDL7rqfIQwuAOHi8YwjDQa7/1FmtbfesLKK224dRyVPEycLctntO41Sk0IdGwhrApJJWQqThmj7W4F8ciE3J/x3yFnYh8vFPx2Zws9QdxhtCEkL/mnJN4mFZwxAzcqbVbDuarPpW2DyjtxlqsVf+YqUx/90wAkvz2E5FZEhsSlt4pQyOA+z3BggMUvOuhmxaG1hje6t3x5nvhPH7RW7WXnATY4P7yKNoT3zsbfSe4TWY7ujY8CaAcsJSKMd6k1r4oatqxsuONmv1MhM4/PjFcCjJWIeGMiU8GtKzFuwd9hbYsnhZVkEWjpIgeAXWhusHAKAS/vWWzquVhBm9qwnDZLUVAIE/teUVIUB1DRx/3Zy9Od7UvQvhTckMun0BVvXm99mWsphbwhz6qQkb2oOcrSpXEsVxBKEM0jN4S6Eoih8CYkQ91Dj5e4HGcZW3peTZJKaS21SmeG2TGd37fxFL3ljCqgqLWMD6o/itpNKu0y4Ps
Content-Type: text/plain; charset="utf-8"
Content-ID: <6286641F5C2E0242B28229FBBCBEFBAA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogS29lbmlnLCBDaHJpc3RpYW4gPENo
cmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCj5TZW50OiBUdWVzZGF5LCBNYXkgMjgsIDIwMTkgMzo0
MyBQTQ0KPlRvOiBEZW5nLCBFbWlseSA8RW1pbHkuRGVuZ0BhbWQuY29tPjsgUXVhbiwgRXZhbg0K
PjxFdmFuLlF1YW5AYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+U3Vi
amVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogRG9uJ3QgbmVlZCB0byBjYWxsIGNzYl92cmFt
X3VucGluDQo+DQo+QW0gMjguMDUuMTkgdW0gMDk6Mzggc2NocmllYiBEZW5nLCBFbWlseToNCj4+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+IEZyb206IEtvZW5pZywgQ2hyaXN0aWFu
IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+DQo+Pj4gU2VudDogVHVlc2RheSwgTWF5IDI4LCAy
MDE5IDM6MDQgUE0NCj4+PiBUbzogUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+OyBEZW5n
LCBFbWlseQ0KPjxFbWlseS5EZW5nQGFtZC5jb20+Ow0KPj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+Pj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogRG9uJ3QgbmVl
ZCB0byBjYWxsIGNzYl92cmFtX3VucGluDQo+Pj4NCj4+PiBPayBpbiB0aGlzIGNhc2UgdGhlIHBh
dGNoIGlzIGEgTkFLLg0KPj4+DQo+Pj4gVGhlIGNvcnJlY3Qgc29sdXRpb24gaXMgdG8gc3RvcCB1
c2luZyBhbWRncHVfYm9fZnJlZV9rZXJuZWwgaW4NCj4+PiBnZnhfdjlfMF9zd19maW5pLg0KPj4g
U28gd2UganVzdCBsZWFkIHRoZSBtZW1vcnkgbGVhayBoZXJlIGFuZCBub3QgZGVzdHJveSB0aGUg
Ym8/IEkgZG9uJ3QgdGhpbmsNCj5pdCBpcyBjb3JyZWN0Lg0KPg0KPk9oLCBuby4gVGhhdCdzIG5v
dCB3aGF0IEkgbWVhbnQuDQo+DQo+V2Ugc2hvdWxkIHN0b3AgdXNpbmcgYW1kZ3B1X2JvX2ZyZWVf
a2VybmVsIGFuZCBpbnN0ZWFkIHVzZQ0KPmFtZGdwdV9ib19mcmVlIQ0KDQo+U29ycnkgZm9yIG5v
dCBiZWluZyBjbGVhciBoZXJlLA0KPkNocmlzdGlhbi4NClRoYW5rcyBmb3IgeW91ciBnb29kIHN1
Z2dlc3Rpb24uICBXaWxsIHJldmVydCB0aGlzIHBhdGNoLCBhbmQgc3VibWl0IGFub3RoZXIgcGF0
Y2guDQoNCkJlc3Qgd2lzaGVzDQpFbWlseSBEZW5nDQo+DQo+Pj4gQlRXOiBBcmUgd2UgdXNpbmcg
dGhlIGtlcm5lbCBwb2ludGVyIHNvbWV3aGVyZT8gQ2F1c2UgdGhhdCBvbmUNCj5iZWNhbWUNCj4+
PiBjb21wbGV0ZWx5IGludmFsaWQgYmVjYXVzZSBvZiBwYXRjaCAiZHJtL2FtZGdwdTogcGluIHRo
ZSBjc2IgYnVmZmVyDQo+Pj4gb24gaHcgaW5pdCIuDQo+Pj4NCj4+PiBDaHJpc3RpYW4uDQo+Pj4N
Cj4+PiBBbSAyOC4wNS4xOSB1bSAwMzo0MiBzY2hyaWViIFF1YW4sIEV2YW46DQo+Pj4+IFRoZSBv
cmlnaW5hbCB1bnBpbiBpbiBod19maW5pIHdhcyBpbnRyb2R1Y2VkIGJ5DQo+Pj4+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2FtZC1nZngvMjAxOC1KdWx5LzAyMzY4MS5o
dG1sDQo+Pj4+DQo+Pj4+IEV2YW4NCj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
Pj4+PiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
PiBPbiBCZWhhbGYgT2YNCj4+Pj4+IENocmlzdGlhbiBLP25pZw0KPj4+Pj4gU2VudDogTW9uZGF5
LCBNYXkgMjcsIDIwMTkgNzowMiBQTQ0KPj4+Pj4gVG86IERlbmcsIEVtaWx5IDxFbWlseS5EZW5n
QGFtZC5jb20+OyBhbWQtDQo+Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4+Pj4gU3ViamVj
dDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogRG9uJ3QgbmVlZCB0byBjYWxsIGNzYl92cmFtX3Vu
cGluDQo+Pj4+Pg0KPj4+Pj4gQW0gMjcuMDUuMTkgdW0gMTA6NDEgc2NocmllYiBFbWlseSBEZW5n
Og0KPj4+Pj4+IEFzIGl0IHdpbGwgZGVzdHJveSBjbGVhcl9zdGF0ZV9vYmosIGFuZCBhbHNvIHdp
bGwgdW5waW4gaXQgaW4gdGhlDQo+Pj4+Pj4gZ2Z4X3Y5XzBfc3dfZmluaSwgc28gZG9uJ3QgbmVl
ZCB0byBjYWxsIGNzYl92cmFtIHVucGluIGluDQo+Pj4+Pj4gZ2Z4X3Y5XzBfaHdfZmluaSwgb3Ig
aXQgd2lsbCBoYXZlIHVucGluIHdhcm5pbmcuDQo+Pj4+Pj4NCj4+Pj4+PiB2MjogRm9yIHN1c3Bl
bmQsIHN0aWxsIG5lZWQgdG8gZG8gdW5waW4NCj4+Pj4+Pg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiAgICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDMgKystDQo+Pj4+Pj4gICAg
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+Pj4+Pg0K
Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5j
DQo+Pj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+Pj4+Pj4g
aW5kZXggNWViNzBlOC4uNWIxZmY0OCAxMDA2NDQNCj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPj4+Pj4+IEBAIC0zMzk1LDcgKzMzOTUsOCBAQCBzdGF0aWMg
aW50IGdmeF92OV8wX2h3X2Zpbmkodm9pZCAqaGFuZGxlKQ0KPj4+Pj4+ICAgICAJZ2Z4X3Y5XzBf
Y3BfZW5hYmxlKGFkZXYsIGZhbHNlKTsNCj4+Pj4+PiAgICAgCWFkZXYtPmdmeC5ybGMuZnVuY3Mt
PnN0b3AoYWRldik7DQo+Pj4+Pj4NCj4+Pj4+PiAtCWdmeF92OV8wX2NzYl92cmFtX3VucGluKGFk
ZXYpOw0KPj4+Pj4+ICsJaWYgKGFkZXYtPmluX3N1c3BlbmQpDQo+Pj4+Pj4gKwkJZ2Z4X3Y5XzBf
Y3NiX3ZyYW1fdW5waW4oYWRldik7DQo+Pj4+PiBUaGF0IGRvZXNuJ3QgbG9va3MgbGlrZSBhIGdv
b2QgaWRlYSB0byBtZS4NCj4+Pj4+DQo+Pj4+PiBXaHkgZG8gd2UgaGF2ZSB1bnBpbiBib3RoIGlu
IHRoZSBzd19maW5pIGFzIHdlbGwgYXMgdGhlIGh3X2ZpbmkNCj4+Pj4+IGNvZGUNCj4+PiBwYXRo
cz8NCj4+Pj4+IFJlZ2FyZHMsDQo+Pj4+PiBDaHJpc3RpYW4uDQo+Pj4+Pg0KPj4+Pj4+ICAgICAJ
cmV0dXJuIDA7DQo+Pj4+Pj4gICAgIH0NCj4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQo+Pj4+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPj4+Pj4g
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+Pj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=

--_002_MWHPR12MB132656C894105F239387AE948F1F0MWHPR12MB1326namp_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--_002_MWHPR12MB132656C894105F239387AE948F1F0MWHPR12MB1326namp_--
