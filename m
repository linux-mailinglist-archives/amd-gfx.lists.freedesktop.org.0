Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E547330A
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 17:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A3C6E5D8;
	Wed, 24 Jul 2019 15:48:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710084.outbound.protection.outlook.com [40.107.71.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562456E5DB
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 15:48:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isQnM1aaz58YEsDZxLWJZnm5Mt2n7JN7fN8kf1bnlinvxPRlkv6G3zbSI3S/7moJw7uWlGeF9tbpn7dK/6DvEKEpX5qkJR/nPChD4Dffx3zXO5MnQmyHL4Qi5gQMxsr5GGlWFvVtYIr14P/sg8JJWyx3IE9ntiRRU5TKKUytru1wxzn5ahZNxQ1aDW4Bqn9sXE72PcTEAx36Hv+BFFkcnRSJLoftDET4f6ew2uszbfKEvccAJU/ZY9WUBFoUflVuCM7gQXKIhcCeevHNFLSx/wUPEo2HS0KADsf+2sJO1O8MtuBTU4mkBOs1VDQFkfS50p2joQBlutlTZ7kV8UuElw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2ZqDu6QnFhpVo8IHPCQ2/VZQqLbUFZM9MfOWEdHOV0=;
 b=d2NkM4B0lVU4QNdmJRTYp0NGzDTBJJWTNYbpPPQOF9VnbSGFzz/ps1wVzJmYNfNpdXAi3Rl2H5SWab/iA/+w/0+jX5yY3PmyiURdabqVJ/hZCX7F5LbXhoDyMVnyO8skQN8Qbdw3/E5tO55VYqK/6KUYSkoEd42vKpvORUbS81ncSP4Civ00bqiBCLBCBlNXQ8mp9aRBiVcA6q2zhJ7ve6cB9KurWQlFsxUYf/sadoHXDEyovQeQQe7wC/1+cgUt2T1ulTP+hUR+Af+tAPLP2A6KyQbXBpd/jhluDRQ9Q2nTvAPgaPZl4McMjgufB7qpSTD9zQE5SziVnpgVH5rZIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1904.namprd12.prod.outlook.com (10.175.56.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Wed, 24 Jul 2019 15:48:40 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::59df:2c5b:b1e2:8845]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::59df:2c5b:b1e2:8845%3]) with mapi id 15.20.2094.017; Wed, 24 Jul 2019
 15:48:40 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>
Subject: Re: [PATCH v4 2/4] drm/amdgpu: Create helper to clear
 AMDGPU_GEM_CREATE_CPU_GTT_USWC
Thread-Topic: [PATCH v4 2/4] drm/amdgpu: Create helper to clear
 AMDGPU_GEM_CREATE_CPU_GTT_USWC
Thread-Index: AQHVQjRyMLsQUJZwhkSHUqTvtbxFuqbZ5+qAgAACMIA=
Date: Wed, 24 Jul 2019 15:48:39 +0000
Message-ID: <fc62b097-c85c-4d87-92db-96167403d26c@amd.com>
References: <1563982066-21793-1-git-send-email-andrey.grodzovsky@amd.com>
 <1563982066-21793-3-git-send-email-andrey.grodzovsky@amd.com>
 <8de768fe-5089-f7a9-da25-31c96926953a@daenzer.net>
In-Reply-To: <8de768fe-5089-f7a9-da25-31c96926953a@daenzer.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::37) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23a22f52-619e-45af-3c80-08d7104e65ca
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1904; 
x-ms-traffictypediagnostic: MWHPR12MB1904:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MWHPR12MB1904BBB0FF9E3929332FC891EAC60@MWHPR12MB1904.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(189003)(199004)(86362001)(14444005)(229853002)(71190400001)(66556008)(6116002)(14454004)(71200400001)(66946007)(81156014)(99286004)(256004)(66476007)(446003)(64756008)(54906003)(5660300002)(31696002)(6306002)(66446008)(486006)(66574012)(6916009)(66066001)(966005)(316002)(7736002)(68736007)(2616005)(25786009)(102836004)(6246003)(478600001)(52116002)(476003)(6436002)(76176011)(4326008)(305945005)(3846002)(53546011)(386003)(2906002)(6486002)(6512007)(53936002)(36756003)(8676002)(81166006)(31686004)(186003)(6506007)(26005)(11346002)(8936002)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1904;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cFHIvaSPS8qU07kfOgib9RL4yVrfTuvZy762l2DPZprI+VgmrIbPiiQzasdneBEgDBM+Rom/4IUQEzEyxP86ikSiiyuQseIBjNEO+ASfKqDeJIA+Z8gFDLEH/GK0lOQUUCPcjA1JcAHqgJCIqKrQad13JVNsQHykZRZc7xv6QvAVaS4ZaXodahGKUcgZQPKGlGVTKVHt+dy6x/kKLHPXqGmknE4tsJ5+zZr1t4srxSTKSMbU+dgBv69SVHQ29ag8n2/burqo4YPeJpC7LEXUHq68hSaaAKMSwu9taTSOIV+cpKewaOI5GH0jEjb2ANeCutayqypJZvIDExja3oP9MQYBBLNpMC19Tp7qKwRdFPjkwfx0VzKc9SLFKS51ZUwD/ib0LDHUB4HTd8BkB3PQgsxciWk12fMxHK5rMxDt7Z0=
Content-ID: <001DB0B90139D54C8FE310C9E87A1AC9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a22f52-619e-45af-3c80-08d7104e65ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 15:48:39.9302 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agrodzov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1904
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2ZqDu6QnFhpVo8IHPCQ2/VZQqLbUFZM9MfOWEdHOV0=;
 b=T2s4Je6MDPiwKcGZa6blP3um+B5MdSR+zI3ln4BGfXIDRwU2GFFUVaL/UtpEGaeSaiiClmnNQav3wV54mQU6ZMsXV02JW0aoy5esPvnGehxH0BLtpNo9Khjbt9KY8XPGTJv6iQxLBMD1IZKgyQrYm/xrwTCw65UIC90TrR6lWzw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Wu, Hersen" <hersenxs.wu@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "S,
 Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiA3LzI0LzE5IDExOjQwIEFNLCBNaWNoZWwgRMOkbnplciB3cm90ZToNCj4gT24gMjAxOS0w
Ny0yNCA1OjI3IHAubS4sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOg0KPj4gTW92ZSB0aGUgbG9n
aWMgdG8gY2xlYXIgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDIGluDQo+PiBhbWRncHVf
Ym9fZG9fY3JlYXRlIGludG8gc3RhbmRhbG9uZSBoZWxwZXIgc28gaXQgY2FuIGJlIHJldXNlZA0K
Pj4gaW4gb3RoZXIgZnVuY3Rpb25zLg0KPj4NCj4+IHY0Og0KPj4gU3dpdGNoIHRvIHJldHVybiBi
b29sLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3Jv
ZHpvdnNreUBhbWQuY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9vYmplY3QuYyB8IDYxICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQ0KPj4g
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmggfCAgMiArDQo+PiAg
IDIgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3Qu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYw0KPj4gaW5kZXgg
OTg5YjdiNS4uZGFmZGI2OCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9vYmplY3QuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X29iamVjdC5jDQo+PiBAQCAtNDEzLDYgKzQxMyw0MCBAQCBzdGF0aWMgYm9vbCBhbWRn
cHVfYm9fdmFsaWRhdGVfc2l6ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4+ICAgCXJl
dHVybiBmYWxzZTsNCj4+ICAgfQ0KPj4gICANCj4+ICtib29sIGFtZGdwdV9ib19zdXBwb3J0X3Vz
d2ModTY0IGJvX2ZsYWdzKQ0KPj4gK3sNCj4+ICsNCj4+ICsjaWZkZWYgQ09ORklHX1g4Nl8zMg0K
Pj4gKwkvKiBYWFg6IFdyaXRlLWNvbWJpbmVkIENQVSBtYXBwaW5ncyBvZiBHVFQgc2VlbSBicm9r
ZW4gb24gMzItYml0DQo+PiArCSAqIFNlZSBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3No
b3dfYnVnLmNnaT9pZD04NDYyNw0KPj4gKwkgKi8NCj4+ICsJcmV0dXJuIGZhbHNlDQo+IE1pc3Np
bmcgc2VtaWNvbG9uLg0KPg0KPg0KPj4gKyNlbGlmIGRlZmluZWQoQ09ORklHX1g4NikgJiYgIWRl
ZmluZWQoQ09ORklHX1g4Nl9QQVQpDQo+PiArCS8qIERvbid0IHRyeSB0byBlbmFibGUgd3JpdGUt
Y29tYmluaW5nIHdoZW4gaXQgY2FuJ3Qgd29yaywgb3IgdGhpbmdzDQo+PiArCSAqIG1heSBiZSBz
bG93DQo+PiArCSAqIFNlZSBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNn
aT9pZD04ODc1OA0KPj4gKwkgKi8NCj4+ICsNCj4+ICsjaWZuZGVmIENPTkZJR19DT01QSUxFX1RF
U1QNCj4+ICsjd2FybmluZyBQbGVhc2UgZW5hYmxlIENPTkZJR19NVFJSIGFuZCBDT05GSUdfWDg2
X1BBVCBmb3IgYmV0dGVyIHBlcmZvcm1hbmNlIFwNCj4+ICsJIHRoYW5rcyB0byB3cml0ZS1jb21i
aW5pbmcNCj4+ICsjZW5kaWYNCj4+ICsNCj4+ICsJaWYgKGJvX2ZsYWdzICYgQU1ER1BVX0dFTV9D
UkVBVEVfQ1BVX0dUVF9VU1dDKQ0KPj4gKwkJRFJNX0lORk9fT05DRSgiUGxlYXNlIGVuYWJsZSBD
T05GSUdfTVRSUiBhbmQgQ09ORklHX1g4Nl9QQVQgZm9yICINCj4+ICsJCQkgICAgICAiYmV0dGVy
IHBlcmZvcm1hbmNlIHRoYW5rcyB0byB3cml0ZS1jb21iaW5pbmdcbiIpOw0KPiBUaGUgQU1ER1BV
X0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDIGNoZWNrIHdpbGwgYWx3YXlzIHBhc3MgYXQgc29tZSBw
b2ludA0KPiBkdWUgdG8gcGF0Y2ggMSwgc28gcGFzc2luZyBpbiB0aGUgZmxhZ3MgaXMga2luZCBv
ZiBwb2ludGxlc3MuIEp1c3QgZG8NCj4gdGhlIERSTV9JTkZPX09OQ0UgdW5jb25kaXRpb25hbGx5
IGhlcmUuDQoNCkFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQyBpcyBzZXQgdW5jb25kaXRp
b25hbGx5IG9ubHkgZm9yIEZCIGNvbnNvbGUgQk9zIGluIHBhdGNoIDEsIGZvciB1c2VyIG1vZGUg
Qk9zIHRoaXMNCmZsYWcgbWlnaHQgbm90IGJlIHNldCBpbiB1c2VyIG1vZGUgYW5kIHNvIHRoaXMg
d2FybmluZyBzaG91bGRuJ3QgcG9wIGluIHRoaXMgY2FzZS4NCg0KQW5kcmV5DQoNCg0KPg0KPg0K
Pj4gQEAgLTQ2NiwzMyArNTAwLDggQEAgc3RhdGljIGludCBhbWRncHVfYm9fZG9fY3JlYXRlKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPj4gICANCj4+IFsuLi5dDQo+PiAgIA0KPj4gKwlp
ZiAoYW1kZ3B1X2JvX3N1cHBvcnRfdXN3Yyhiby0+ZmxhZ3MpKQ0KPj4gICAJCWJvLT5mbGFncyAm
PSB+QU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDOw0KPiBNaXNzaW5nICIhIi4NCj4NCj4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
