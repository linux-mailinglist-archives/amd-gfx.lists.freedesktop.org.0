Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB987B861
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 06:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851096E66A;
	Wed, 31 Jul 2019 04:03:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780071.outbound.protection.outlook.com [40.107.78.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1FE6E66A
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 04:03:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMmVIgp7JyiH4rk3WkHxdzeF/v3ZFuntxvdCFDDmirjVMH1TjaoY9zJ+q8nd9aEbNrTkaLZw9EnAwZvKGK/egBKNKcmoE5A/uwLGu6cFofu/og1S+XGMx8bZTjqVCSN8ad2rh0MX9q0vDjp4vah5sdTdaUarLufKPzUQKFE9WaN8wh3OtEyhxvC2vHCBTEA/cPS0f2ocGTVBmrSti1pY/4LkqbE7wF6u54sHJyg4BE/ZsOuupKYP1PelWwzm3ycJBRz1l9yxzWcQtnq5CMpvD+VIF9UASL8EZrhijSjuO7nEWAooldt7Yv0P5th9YY0W5aq3QresbCZ1JUhh0oEhyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tG+F4Oe62fYDjFse+N2x1fVh4E4OgzdwTLULVJf8Q/0=;
 b=XK/5PsiWxC93uj7NZAYNwCaS/eslVAwrXxyXAf74fY0GhEolIA//DL7km/PEwap2z9MHHF1e98lxgkE7t3rlZq+3hqoiWLHheKteY5/PIUD5XtSu0glUyNWPNejLqFyDyU/Pabnzx4+1Nl8BG42lgh4UApWOa3g+JpX5XdriEfr6DFqIlojKdw9ySdwt1z13aXtGmDNkWXnF3sb228VbV0iMULzn/TR2Ts7SVnX46Rd5mtcyBOGhezh1G9cY+1fPcPNXKigMmUiDGmx99x3vZwuggrTYggxOxRnhXsCBe5DEk4FFsPPspMUArnP8YrO3oEsw25EoPr7t9nrulAAp2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3343.namprd12.prod.outlook.com (20.178.240.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Wed, 31 Jul 2019 04:02:58 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 04:02:58 +0000
From: Kevin Wang <kevwa@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: enable SW SMU power profile switch
 support in KFD
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: enable SW SMU power profile
 switch support in KFD
Thread-Index: AQHVR1Gzt/sht3lU3kqlfyphZIGzfqbkGwAA
Date: Wed, 31 Jul 2019 04:02:58 +0000
Message-ID: <8665f67a-10cf-a8a1-d63e-575c3198cc0b@amd.com>
References: <20190731033959.10414-1-evan.quan@amd.com>
 <20190731033959.10414-2-evan.quan@amd.com>
In-Reply-To: <20190731033959.10414-2-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR03CA0048.apcprd03.prod.outlook.com
 (2603:1096:202:17::18) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0f92b02-28f1-4cbe-f01e-08d7156bf90f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3343; 
x-ms-traffictypediagnostic: MN2PR12MB3343:
x-microsoft-antispam-prvs: <MN2PR12MB3343089598DEC3881B8915B3A2DF0@MN2PR12MB3343.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:608;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(199004)(189003)(7736002)(66066001)(52116002)(476003)(6116002)(3846002)(478600001)(66946007)(25786009)(446003)(71200400001)(256004)(2616005)(99286004)(64756008)(66556008)(66446008)(8676002)(66476007)(81156014)(8936002)(6246003)(5660300002)(31696002)(305945005)(81166006)(71190400001)(186003)(11346002)(486006)(68736007)(110136005)(102836004)(26005)(6512007)(386003)(53936002)(316002)(14454004)(6506007)(53546011)(14444005)(36756003)(229853002)(6436002)(6486002)(76176011)(31686004)(2501003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3343;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vD9EX3EB/uEU4uQavtljkYN9blsUnxqwmGNyIPxHuQM3g5zj85sK0YGDylqfK4b2B2hI42pqEesS1bqXkAfa8uX6od29/ROm9DTtZ1l5gWqcHox7599ubt/9ieI0hnCq2bFrJ83ht7D/WohZlP5wdHC+F3NwRb12UK/+D7dtdSHIRDlXG3/5H3tnE4F/4ppJlHkDaZJg3wffpy1ckFtxpITf1CdMERsCCI24DXh4AO4AmdQhYb+DwLH8Q9Y/V4Gj8tkMLzVAK7D3WiCG3vq1oC8DFzc5m/b1F5y6RMskivyNT2zIbHzBxhrBT04mg3ujfu0RUaLc/cOCB616oZsklwiN2PsW09JFpPY9t4J2I6stL/dqaw+Yu8DXrWDaTUwIs7X/oHtWZO6Rb9eelMgg2IYDCJboAo/ArwkLG7GGY4E=
Content-ID: <D59821EEE1C57A419BC623A8721AEA7C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f92b02-28f1-4cbe-f01e-08d7156bf90f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 04:02:58.4347 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3343
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tG+F4Oe62fYDjFse+N2x1fVh4E4OgzdwTLULVJf8Q/0=;
 b=cV8gyyls/lp0leFNFFBPPhI2+Zg8Qi/FjYmqaW4cuF9/s+UiBOQ1z6w0D0mSNWxouVRycyegD7rnzHOcmpph5bhzVzlk6X3ycycocZ9yfiGVFOmu0BZcEqBQIG8WzMqctzTP9wa8DRkF7MW7638GJA6yPsA3nrVFZ2M3g+wroj8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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

UmV2aWV3ZWQtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+DQoNCkJSDQpLZXZp
bg0KDQpPbiA3LzMxLzE5IDExOjM5IEFNLCBFdmFuIFF1YW4gd3JvdGU6DQo+IEhvb2sgdXAgdGhl
IFNXIFNNVSBwb3dlciBwcm9maWxlIHN3aXRjaCBpbiBLRkQgcm91dGluZS4NCj4NCj4gQ2hhbmdl
LUlkOiBJNDFlNTM3NjJjZGM3NTA0Mjg1ZGU4OWYzMGUzZTZlMmJiMzk2Yjk1Mw0KPiBTaWduZWQt
b2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMgICAgfCAgOCArKystLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyAgICB8IDM2ICsrKysrKysr
KysrKysrKysrKysNCj4gICAuLi4vZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211
LmggICAgfCAgMyArKw0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9hbWRrZmQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRr
ZmQuYw0KPiBpbmRleCA0M2IxMTg3OTcxM2QuLjljNWRjYWE4ZmE0OCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYw0KPiBAQCAtNjcyLDggKzY3Miwx
MiBAQCB2b2lkIGFtZGdwdV9hbWRrZmRfc2V0X2NvbXB1dGVfaWRsZShzdHJ1Y3Qga2dkX2RldiAq
a2dkLCBib29sIGlkbGUpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9
IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWtnZDsNCj4gICANCj4gLQlpZiAoYWRldi0+cG93ZXJw
bGF5LnBwX2Z1bmNzICYmDQo+IC0JICAgIGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+c3dpdGNo
X3Bvd2VyX3Byb2ZpbGUpDQo+ICsJaWYgKGlzX3N1cHBvcnRfc3dfc211KGFkZXYpKQ0KPiArCQlz
bXVfc3dpdGNoX3Bvd2VyX3Byb2ZpbGUoJmFkZXYtPnNtdSwNCj4gKwkJCQkJIFBQX1NNQ19QT1dF
Ul9QUk9GSUxFX0NPTVBVVEUsDQo+ICsJCQkJCSAhaWRsZSk7DQo+ICsJZWxzZSBpZiAoYWRldi0+
cG93ZXJwbGF5LnBwX2Z1bmNzICYmDQo+ICsJCSBhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MtPnN3
aXRjaF9wb3dlcl9wcm9maWxlKQ0KPiAgIAkJYW1kZ3B1X2RwbV9zd2l0Y2hfcG93ZXJfcHJvZmls
ZShhZGV2LA0KPiAgIAkJCQkJCVBQX1NNQ19QT1dFUl9QUk9GSUxFX0NPTVBVVEUsDQo+ICAgCQkJ
CQkJIWlkbGUpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
YW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5j
DQo+IGluZGV4IGQ5OWE4YWEwZGVmYi4uNTVjY2I0ZTZhNmZiIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jDQo+IEBAIC0xNDQ3LDYgKzE0NDcsNDIg
QEAgaW50IHNtdV9oYW5kbGVfdGFzayhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwNCj4gICAJcmV0
dXJuIHJldDsNCj4gICB9DQo+ICAgDQo+ICtpbnQgc211X3N3aXRjaF9wb3dlcl9wcm9maWxlKHN0
cnVjdCBzbXVfY29udGV4dCAqc211LA0KPiArCQkJICAgICBlbnVtIFBQX1NNQ19QT1dFUl9QUk9G
SUxFIHR5cGUsDQo+ICsJCQkgICAgIGJvb2wgZW4pDQo+ICt7DQo+ICsJc3RydWN0IHNtdV9kcG1f
Y29udGV4dCAqc211X2RwbV9jdHggPSAmKHNtdS0+c211X2RwbSk7DQo+ICsJbG9uZyB3b3JrbG9h
ZDsNCj4gKwl1aW50MzJfdCBpbmRleDsNCj4gKw0KPiArCWlmICghc211LT5wbV9lbmFibGVkKQ0K
PiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiArCWlmICghKHR5cGUgPCBQUF9TTUNfUE9XRVJf
UFJPRklMRV9DVVNUT00pKQ0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiArCW11dGV4X2xv
Y2soJnNtdS0+bXV0ZXgpOw0KPiArDQo+ICsJaWYgKCFlbikgew0KPiArCQlzbXUtPndvcmtsb2Fk
X21hc2sgJj0gfigxIDw8IHNtdS0+d29ya2xvYWRfcHJvcml0eVt0eXBlXSk7DQo+ICsJCWluZGV4
ID0gZmxzKHNtdS0+d29ya2xvYWRfbWFzayk7DQo+ICsJCWluZGV4ID0gaW5kZXggPiAwICYmIGlu
ZGV4IDw9IFdPUktMT0FEX1BPTElDWV9NQVggPyBpbmRleCAtIDEgOiAwOw0KPiArCQl3b3JrbG9h
ZCA9IHNtdS0+d29ya2xvYWRfc2V0dGluZ1tpbmRleF07DQo+ICsJfSBlbHNlIHsNCj4gKwkJc211
LT53b3JrbG9hZF9tYXNrIHw9ICgxIDw8IHNtdS0+d29ya2xvYWRfcHJvcml0eVt0eXBlXSk7DQo+
ICsJCWluZGV4ID0gZmxzKHNtdS0+d29ya2xvYWRfbWFzayk7DQo+ICsJCWluZGV4ID0gaW5kZXgg
PD0gV09SS0xPQURfUE9MSUNZX01BWCA/IGluZGV4IC0gMSA6IDA7DQo+ICsJCXdvcmtsb2FkID0g
c211LT53b3JrbG9hZF9zZXR0aW5nW2luZGV4XTsNCj4gKwl9DQo+ICsNCj4gKwlpZiAoc211X2Rw
bV9jdHgtPmRwbV9sZXZlbCAhPSBBTURfRFBNX0ZPUkNFRF9MRVZFTF9NQU5VQUwpDQo+ICsJCXNt
dV9zZXRfcG93ZXJfcHJvZmlsZV9tb2RlKHNtdSwgJndvcmtsb2FkLCAwKTsNCj4gKw0KPiArCW11
dGV4X3VubG9jaygmc211LT5tdXRleCk7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0K
PiAgIGVudW0gYW1kX2RwbV9mb3JjZWRfbGV2ZWwgc211X2dldF9wZXJmb3JtYW5jZV9sZXZlbChz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkNCj4gICB7DQo+ICAgCXN0cnVjdCBzbXVfZHBtX2NvbnRl
eHQgKnNtdV9kcG1fY3R4ID0gJihzbXUtPnNtdV9kcG0pOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgNCj4gaW5kZXggOWMwYTUzZWY5M2M0Li4x
YjQ0NDE0Y2VjM2IgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2luYy9hbWRncHVfc211LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
aW5jL2FtZGdwdV9zbXUuaA0KPiBAQCAtOTczLDYgKzk3Myw5IEBAIGV4dGVybiBpbnQgc211X2Rw
bV9zZXRfcG93ZXJfZ2F0ZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSx1aW50MzJfdCBibG9ja190
eXBlLCBiDQo+ICAgZXh0ZXJuIGludCBzbXVfaGFuZGxlX3Rhc2soc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUsDQo+ICAgCQkJICAgZW51bSBhbWRfZHBtX2ZvcmNlZF9sZXZlbCBsZXZlbCwNCj4gICAJ
CQkgICBlbnVtIGFtZF9wcF90YXNrIHRhc2tfaWQpOw0KPiAraW50IHNtdV9zd2l0Y2hfcG93ZXJf
cHJvZmlsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwNCj4gKwkJCSAgICAgZW51bSBQUF9TTUNf
UE9XRVJfUFJPRklMRSB0eXBlLA0KPiArCQkJICAgICBib29sIGVuKTsNCj4gICBpbnQgc211X2dl
dF9zbWNfdmVyc2lvbihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDMyX3QgKmlmX3ZlcnNp
b24sIHVpbnQzMl90ICpzbXVfdmVyc2lvbik7DQo+ICAgaW50IHNtdV9nZXRfZHBtX2ZyZXFfYnlf
aW5kZXgoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gc211X2Nsa190eXBlIGNsa190eXBl
LA0KPiAgIAkJCSAgICAgIHVpbnQxNl90IGxldmVsLCB1aW50MzJfdCAqdmFsdWUpOw0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
