Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5F92EAE3
	for <lists+amd-gfx@lfdr.de>; Thu, 30 May 2019 04:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234666E2BE;
	Thu, 30 May 2019 02:59:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760052.outbound.protection.outlook.com [40.107.76.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15816E2BE
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 May 2019 02:59:25 +0000 (UTC)
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB3597.namprd12.prod.outlook.com (20.178.243.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Thu, 30 May 2019 02:59:23 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::d58b:3f32:f2ff:9565]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::d58b:3f32:f2ff:9565%6]) with mapi id 15.20.1922.021; Thu, 30 May 2019
 02:59:23 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Kazlauskas, Nicholas"
 <Nicholas.Kazlauskas@amd.com>
Subject: RE: [PATCH v2] drm/amdgpu/display: Fix reload driver error
Thread-Topic: [PATCH v2] drm/amdgpu/display: Fix reload driver error
Thread-Index: AQHVFcxVNbT0M7h3A0Ka4GbQCW1zy6aC+4xg
Date: Thu, 30 May 2019 02:59:23 +0000
Message-ID: <MN2PR12MB29752B32EAE3748342D3D0268F180@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <1559099525-9742-1-git-send-email-Emily.Deng@amd.com>
In-Reply-To: <1559099525-9742-1-git-send-email-Emily.Deng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 384929c3-e457-4d48-1d66-08d6e4aad209
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3597; 
x-ms-traffictypediagnostic: MN2PR12MB3597:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3597B56301BC12CFCE58CD6C8F180@MN2PR12MB3597.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:758;
x-forefront-prvs: 00531FAC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(366004)(39860400002)(376002)(396003)(199004)(189003)(13464003)(25786009)(33656002)(476003)(305945005)(446003)(486006)(3846002)(8676002)(74316002)(6116002)(186003)(256004)(14444005)(2906002)(316002)(5660300002)(11346002)(6306002)(52536014)(9686003)(86362001)(53936002)(66066001)(6246003)(6436002)(55016002)(26005)(229853002)(6636002)(99286004)(102836004)(81166006)(76116006)(66946007)(73956011)(66556008)(66446008)(66476007)(64756008)(2501003)(81156014)(7696005)(71190400001)(110136005)(76176011)(6506007)(71200400001)(14454004)(8936002)(68736007)(7736002)(478600001)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3597;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hDYjyan2CTWIPK/4e8AvvHavp9ylZbcA2sKUEWEpg/MOouoRaq++3KMgICOoD9/zxTtjW2o+qLJFg0DUGfZ4Xptjp0vK/iBovm1hoh3BCPK5tgdvVUiFg2BOTDVKIfbX902IkkORs2HgzKLbJiliu/0F/HMf9ZYnsKfTjzFrBMxGnUtlojnpoSUU2qh5rB12KFw2TqcWlZzDPKhFTEf5C5Z2jjCS8zir7q01YUjmH2j2RcocR+Tgnr5EzYlefWdIQj8ajhjfvaip0EFjIH4c6OL3yY3gqC41m3dDLcLdiMuAjX0GkLqNchAJLlkSc4CJwLzKLxfiGMgG1PjXmuJlq5DrMX3u/i0C32YEJNWaVZARBdCHXWmY3eTdKoKy7TDMVacdh25cS/P/yqpiy2ry0l1zWlss9Ky8GJo0zkQ6GLg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 384929c3-e457-4d48-1d66-08d6e4aad209
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2019 02:59:23.7670 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqdeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3597
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XR+HiEIEoLPuV9jsExzApaod+uJ3R+sE0+yJbd7HbSw=;
 b=QTE/Xbu+izc3cyE45lnOhcMxlpQ57grPuTsn9KoiBLH9Fdqvs0EXYGXd0/coSJMiYgRivMqmV+y/8JV5mtkznjBg0EzA9dOQlyQAGJdVv/XtUGrF4PxhSkx3iI2Rmw7HFUZlHSc1UeTc/guaAq/NgMBvTqXiN9xpzYHrKngE+g4=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgS2F6bGF1c2thcywNCiAgICBJIGhhdmUgbW9kaWZpZWQgdGhlIHBhdGNoIGFzIHlvdXIgc3Vn
Z2VzdGlvbiwgY291bGQgeW91IHBsZWFzZSBoZWxwIHRvIHJldmlldyBpdCBhZ2Fpbj8NCg0KQmVz
dCB3aXNoZXMNCkVtaWx5IERlbmcNCg0KDQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9u
IEJlaGFsZiBPZiBFbWlseQ0KPkRlbmcNCj5TZW50OiBXZWRuZXNkYXksIE1heSAyOSwgMjAxOSAx
MToxMiBBTQ0KPlRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPkNjOiBEZW5nLCBF
bWlseSA8RW1pbHkuRGVuZ0BhbWQuY29tPg0KPlN1YmplY3Q6IFtQQVRDSCB2Ml0gZHJtL2FtZGdw
dS9kaXNwbGF5OiBGaXggcmVsb2FkIGRyaXZlciBlcnJvcg0KPg0KPklzc3VlOg0KPldpbGwgaGF2
ZSBmb2xsb3cgZXJyb3Igd2hlbiByZWxvYWQgZHJpdmVyOg0KPlsgMzk4Ni41Njc3MzldIHN5c2Zz
OiBjYW5ub3QgY3JlYXRlIGR1cGxpY2F0ZSBmaWxlbmFtZQ0KPicvZGV2aWNlcy9wY2kwMDAwOjAw
LzAwMDA6MDA6MDcuMC9kcm1fZHBfYXV4X2RldicNCj5bIDM5ODYuNTY3NzQzXSBDUFU6IDYgUElE
OiAxNzY3IENvbW06IG1vZHByb2JlIFRhaW50ZWQ6IEcgICAgICAgICAgIE9FICAgICA1LjAuMC0N
Cj5yYzEtY3VzdG9tICMxDQo+WyAzOTg2LjU2Nzc0NV0gSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFu
ZGFyZCBQQyAoaTQ0MEZYICsgUElJWCwgMTk5NiksIEJJT1MNCj5VYnVudHUtMS44LjItMXVidW50
dTEgMDQvMDEvMjAxNCBbIDM5ODYuNTY3NzQ2XSBDYWxsIFRyYWNlOg0KPi4uLi4uLg0KPlsgMzk4
Ni41Njc4MDhdICBkcm1fZHBfYXV4X3JlZ2lzdGVyX2Rldm5vZGUrMHhkYy8weDE0MA0KPltkcm1f
a21zX2hlbHBlcl0gLi4uLi4uDQo+WyAzOTg2LjU2OTA4MV0ga29iamVjdF9hZGRfaW50ZXJuYWwg
ZmFpbGVkIGZvciBkcm1fZHBfYXV4X2RldiB3aXRoIC1FRVhJU1QsDQo+ZG9uJ3QgdHJ5IHRvIHJl
Z2lzdGVyIHRoaW5ncyB3aXRoIHRoZSBzYW1lIG5hbWUgaW4gdGhlIHNhbWUgZGlyZWN0b3J5Lg0K
Pg0KPlJlcHJvZHVjZSBzZXF1ZW5jZXM6DQo+MS5tb2Rwcm9iZSBhbWRncHUNCj4yLm1vZHByb2Jl
IC1yIGFtZGdwdQ0KPjMubW9kcHJvYmUgYW1kZ3B1DQo+DQo+Um9vdCBjYXVzZToNCj5XaGVuIHVu
bG9hZCBkcml2ZXIsIGl0IGRvZXNuJ3QgdW5yZWdpc3RlciBhdXguDQo+DQo+djI6IERvbid0IHVz
ZSBoYXNfYXV4DQo+DQo+U2lnbmVkLW9mZi1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQu
Y29tPg0KPi0tLQ0KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jIHwgMTUNCj4rKysrKysrKysrKysrKy0NCj4gMSBmaWxlIGNoYW5nZWQsIDE0IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4NCj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPmIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPmluZGV4IDhmZTE2ODUuLjk0MTMxM2Ig
MTAwNjQ0DQo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYw0KPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMNCj5AQCAtMzc2MCw2ICszNzYwLDEzIEBAIGludA0KPmFtZGdwdV9kbV9jb25uZWN0
b3JfYXRvbWljX2dldF9wcm9wZXJ0eShzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcg0KPipjb25uZWN0b3Is
DQo+IAlyZXR1cm4gcmV0Ow0KPiB9DQo+DQo+K3N0YXRpYyB2b2lkIGFtZGdwdV9kbV9jb25uZWN0
b3JfdW5yZWdpc3RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcg0KPisqY29ubmVjdG9yKSB7DQo+Kwlz
dHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYW1kZ3B1X2RtX2Nvbm5lY3RvciA9DQo+K3RvX2Ft
ZGdwdV9kbV9jb25uZWN0b3IoY29ubmVjdG9yKTsNCj4rDQo+Kwlkcm1fZHBfYXV4X3VucmVnaXN0
ZXIoJmFtZGdwdV9kbV9jb25uZWN0b3ItDQo+PmRtX2RwX2F1eC5hdXgpOw0KPit9DQo+Kw0KPiBz
dGF0aWMgdm9pZCBhbWRncHVfZG1fY29ubmVjdG9yX2Rlc3Ryb3koc3RydWN0IGRybV9jb25uZWN0
b3INCj4qY29ubmVjdG9yKSAgew0KPiAJc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25u
ZWN0b3IgPQ0KPnRvX2FtZGdwdV9kbV9jb25uZWN0b3IoY29ubmVjdG9yKTsNCj5AQCAtMzc4OCw2
ICszNzk1LDExIEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9jb25uZWN0b3JfZGVzdHJveShzdHJ1
Y3QNCj5kcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQo+IAlkcm1fZHBfY2VjX3VucmVnaXN0ZXJf
Y29ubmVjdG9yKCZhY29ubmVjdG9yLT5kbV9kcF9hdXguYXV4KTsNCj4gCWRybV9jb25uZWN0b3Jf
dW5yZWdpc3Rlcihjb25uZWN0b3IpOw0KPiAJZHJtX2Nvbm5lY3Rvcl9jbGVhbnVwKGNvbm5lY3Rv
cik7DQo+KwlpZiAoYWNvbm5lY3Rvci0+aTJjKSB7DQo+KwkJaTJjX2RlbF9hZGFwdGVyKCZhY29u
bmVjdG9yLT5pMmMtPmJhc2UpOw0KPisJCWtmcmVlKGFjb25uZWN0b3ItPmkyYyk7DQo+Kwl9DQo+
Kw0KPiAJa2ZyZWUoY29ubmVjdG9yKTsNCj4gfQ0KPg0KPkBAIC0zODQ2LDcgKzM4NTgsOCBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3MNCj5hbWRncHVfZG1fY29ubmVj
dG9yX2Z1bmNzID0gew0KPiAJLmF0b21pY19kdXBsaWNhdGVfc3RhdGUgPQ0KPmFtZGdwdV9kbV9j
b25uZWN0b3JfYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSwNCj4gCS5hdG9taWNfZGVzdHJveV9zdGF0
ZSA9DQo+ZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX2Rlc3Ryb3lfc3RhdGUsDQo+IAkuYXRv
bWljX3NldF9wcm9wZXJ0eSA9DQo+YW1kZ3B1X2RtX2Nvbm5lY3Rvcl9hdG9taWNfc2V0X3Byb3Bl
cnR5LA0KPi0JLmF0b21pY19nZXRfcHJvcGVydHkgPQ0KPmFtZGdwdV9kbV9jb25uZWN0b3JfYXRv
bWljX2dldF9wcm9wZXJ0eQ0KPisJLmF0b21pY19nZXRfcHJvcGVydHkgPQ0KPmFtZGdwdV9kbV9j
b25uZWN0b3JfYXRvbWljX2dldF9wcm9wZXJ0eSwNCj4rCS5lYXJseV91bnJlZ2lzdGVyID0gYW1k
Z3B1X2RtX2Nvbm5lY3Rvcl91bnJlZ2lzdGVyDQo+IH07DQo+DQo+IHN0YXRpYyBpbnQgZ2V0X21v
ZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQo+LS0NCj4yLjcuNA0KPg0KPl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+YW1kLWdmeCBt
YWlsaW5nIGxpc3QNCj5hbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
