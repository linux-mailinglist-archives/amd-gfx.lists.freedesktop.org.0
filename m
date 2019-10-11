Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EE1D42D1
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 16:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE81D6E21A;
	Fri, 11 Oct 2019 14:28:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740072.outbound.protection.outlook.com [40.107.74.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7563E6E21A
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 14:27:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BoUuLRA6JCEIYdQWBq0y4W8zUVq1imrW0AVfecoS+3m2EYul65L78Spfvjjx5SdwS7jtJ/C+ZpLq+td75WDzAiNjIXhwqP1MDge85DHmI+UtRlBLytRjWy+BvF8nW9z9exU/jH84oJzVZwD67phx8vAlLGJfCAZdO8Y8Kv/MPRBbJfcsb6NgTLBPduW9E1ondn3/X1FRX/z4+RVBA2Zft2vbeev2nE47PSa986Z7goii3PMeqrRfLpwdswmoZja9fhaWnHtauJKnGWCY645apMohmlEKjL7Stle1xvkQYVNo03tlVz3BTDxaE09NL4M7xJXF4Xs9I0mOAVbbyAl63g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFoZqn1UZGELwkVi4g3QKQ28h9iBndPzGnZg4U1UnXo=;
 b=H+VvBPqqshoWYlaMQ4o6QWvtePqATN2dn0pcfuMFKzApHzQt+g0V/T0HgPFfZe5kkT5dAFLqsDiMj39e4C0V8RKBNqRgSefJQnA9etE/yFdOu5PlpvWRhdIPjxpjqmvK7v/YoOmZGBMIVkp1v+Sr5cBqGjtFeruqL/rjsbBG6/1Uf5D47Z3fnR1iWM+X5DtmfvKeQZD+hi6aPryr2B72KiYyUWu/zCrlCUzIAzZgOLYtKonBech104HqNp84WHritFlT5PK3ADkEYmW1YbiPaeE8qo5K+VEbjn32onAIdIz+PgwYs0TuyzOP9xHv8y150lWqYtcP9TdlawFBzRCyhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1657.namprd12.prod.outlook.com (10.172.38.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 14:27:55 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::b016:c350:87e7:dede]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::b016:c350:87e7:dede%9]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 14:27:55 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/4] drm/amdgpu/soc15: disable doorbell interrupt as part
 of BACO entry sequence
Thread-Topic: [PATCH 1/4] drm/amdgpu/soc15: disable doorbell interrupt as part
 of BACO entry sequence
Thread-Index: AQHVgCSGh6AaQxEQPEmyRqqtS4jJY6dVf7iw
Date: Fri, 11 Oct 2019 14:27:55 +0000
Message-ID: <DM5PR12MB1418DD01A6E511355B2B316EFC970@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1570792228-11189-1-git-send-email-le.ma@amd.com>
In-Reply-To: <1570792228-11189-1-git-send-email-le.ma@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6a430b3-c88e-4b4d-40cd-08d74e573546
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1657:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB165716D70C3885C5D0AFE6CCFC970@DM5PR12MB1657.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(13464003)(199004)(189003)(71190400001)(71200400001)(7696005)(53546011)(76176011)(305945005)(7736002)(102836004)(256004)(14444005)(99286004)(486006)(26005)(74316002)(186003)(66066001)(476003)(4326008)(6246003)(11346002)(446003)(14454004)(6506007)(8936002)(478600001)(66556008)(66476007)(76116006)(66446008)(2906002)(66946007)(86362001)(33656002)(9686003)(64756008)(966005)(229853002)(2501003)(3846002)(6116002)(25786009)(110136005)(5660300002)(81166006)(55016002)(81156014)(6436002)(8676002)(6306002)(52536014)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1657;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NcDp9EAy8l19wnOmCscY9ItsCLQkIGkHdmAAefPsEdpzQ8uy683fruiLooSErAK2hBombWQDLWCVK5tSzclHaNSBU1B7rZpcE5xmoAc6AV/Unk8T9UH/Qjgr07PD21yAa1YIEE87EhgxsIo6qp0L8f3qCga79s8iRHyy9/mpFsUsNN6rLx84aF+U8tSnHNgxDnnj2m4hHxER2sj1pbSSnLQ+tGu/uXsogW33eAyaDUM4NETWSQpsXnyHKANglUPFomJapT6cCFsBHfFj5AEG4ZhR+/DFB4githf0gm1q65Iie8VFBFY0a5nz9/HIZLI9KtmwPdU7Y1L3+TGatwiRBHrKi0X1NAczJsS5bCG2xLWsgPEW5se24rWLuXu8ewqZ19LwOjJSVVlwqDXq7OgQAkf8xdwxZZgdMw9YBvxe5aC9r+dG8gfrQa0psLhTHgIOufAXBJkzbHQd5Y4ymiGung==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a430b3-c88e-4b4d-40cd-08d74e573546
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 14:27:55.8052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /rmy0+s55XlXKBsWBX0oznRLbgH0ZbNYf4WHFmR92ydswljGxdBRtJMi3hIb3E5e3KgiEE1k1R9Rfjunb4mHdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1657
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFoZqn1UZGELwkVi4g3QKQ28h9iBndPzGnZg4U1UnXo=;
 b=wHC5w4skUanN/f68PQY5B65ASBNFGExartSSI8LY7uKLzF70TFSEFdo/5fVS0sRkRB1iIK86NN4LSaZhjRFvxr8rki06o6pekOu0bGaKk8KKcjFR6mE8+fgDsxVgM+nniwZ9ugw/9b1PF1FYa349MKyxAbp/x1vNJsehwAopC64=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Ma, Le" <Le.Ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzDQpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQu
Y29tPg0KDQpSZWdhcmRzLA0KSGF3a2luZw0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJl
aGFsZiBPZiBMZSBNYQ0KU2VudDogMjAxOeW5tDEw5pyIMTHml6UgMTk6MTANClRvOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IE1hLCBMZSA8TGUuTWFAYW1kLmNvbT4NClN1Ympl
Y3Q6IFtQQVRDSCAxLzRdIGRybS9hbWRncHUvc29jMTU6IGRpc2FibGUgZG9vcmJlbGwgaW50ZXJy
dXB0IGFzIHBhcnQgb2YgQkFDTyBlbnRyeSBzZXF1ZW5jZQ0KDQpXb3JrYXJvdW5kIHRvIG1ha2Ug
UkFTIHJlY292ZXJ5IHdvcmsgaW4gQkFDTyByZXNldC4NCg0KQ2hhbmdlLUlkOiBJNGU0YTgxZjcx
OWRjYzg4ZGZkNDlmNTgzYzRiZTNhMzczYjVlYWIyYw0KU2lnbmVkLW9mZi1ieTogTGUgTWEgPGxl
Lm1hQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbmJp
by5oIHwgMiArKw0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdfNC5jICAgfCA4
ICsrKysrKysrDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyAgICAgICB8IDkg
KysrKysrKysrDQogMyBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbmJpby5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X25iaW8uaA0KaW5kZXggMWYyNmExNy4uOTE5YmQ1NiAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9uYmlvLmgNCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9uYmlvLmgNCkBAIC02Nyw2ICs2
Nyw4IEBAIHN0cnVjdCBhbWRncHVfbmJpb19mdW5jcyB7DQogCQkJCQkJICBib29sIGVuYWJsZSk7
DQogCXZvaWQgKCppaF9kb29yYmVsbF9yYW5nZSkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
DQogCQkJCSAgYm9vbCB1c2VfZG9vcmJlbGwsIGludCBkb29yYmVsbF9pbmRleCk7DQorCXZvaWQg
KCplbmFibGVfZG9vcmJlbGxfaW50ZXJydXB0KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwN
CisJCQkJCSAgYm9vbCBlbmFibGUpOw0KIAl2b2lkICgqdXBkYXRlX21lZGl1bV9ncmFpbl9jbG9j
a19nYXRpbmcpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KIAkJCQkJCSBib29sIGVuYWJs
ZSk7DQogCXZvaWQgKCp1cGRhdGVfbWVkaXVtX2dyYWluX2xpZ2h0X3NsZWVwKShzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L25iaW9fdjdfNC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192N180LmMNCmlu
ZGV4IDIzOGMyNDguLjBkYjQ1OGYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9uYmlvX3Y3XzQuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192
N180LmMNCkBAIC01MDIsNiArNTAyLDEzIEBAIHN0YXRpYyB2b2lkIG5iaW9fdjdfNF9xdWVyeV9y
YXNfZXJyb3JfY291bnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQogCX0NCiB9DQogDQor
c3RhdGljIHZvaWQgbmJpb192N180X2VuYWJsZV9kb29yYmVsbF9pbnRlcnJ1cHQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsDQorCQkJCQkJYm9vbCBlbmFibGUpDQorew0KKwlXUkVHMzJfRklF
TEQxNShOQklPLCAwLCBCSUZfRE9PUkJFTExfSU5UX0NOVEwsDQorCQkgICAgICAgRE9PUkJFTExf
SU5URVJSVVBUX0RJU0FCTEUsIGVuYWJsZSA/IDAgOiAxKTsgfQ0KKw0KIGNvbnN0IHN0cnVjdCBh
bWRncHVfbmJpb19mdW5jcyBuYmlvX3Y3XzRfZnVuY3MgPSB7DQogCS5nZXRfaGRwX2ZsdXNoX3Jl
cV9vZmZzZXQgPSBuYmlvX3Y3XzRfZ2V0X2hkcF9mbHVzaF9yZXFfb2Zmc2V0LA0KIAkuZ2V0X2hk
cF9mbHVzaF9kb25lX29mZnNldCA9IG5iaW9fdjdfNF9nZXRfaGRwX2ZsdXNoX2RvbmVfb2Zmc2V0
LA0KQEAgLTUxNiw2ICs1MjMsNyBAQCBjb25zdCBzdHJ1Y3QgYW1kZ3B1X25iaW9fZnVuY3MgbmJp
b192N180X2Z1bmNzID0gew0KIAkuZW5hYmxlX2Rvb3JiZWxsX2FwZXJ0dXJlID0gbmJpb192N180
X2VuYWJsZV9kb29yYmVsbF9hcGVydHVyZSwNCiAJLmVuYWJsZV9kb29yYmVsbF9zZWxmcmluZ19h
cGVydHVyZSA9IG5iaW9fdjdfNF9lbmFibGVfZG9vcmJlbGxfc2VsZnJpbmdfYXBlcnR1cmUsDQog
CS5paF9kb29yYmVsbF9yYW5nZSA9IG5iaW9fdjdfNF9paF9kb29yYmVsbF9yYW5nZSwNCisJLmVu
YWJsZV9kb29yYmVsbF9pbnRlcnJ1cHQgPSBuYmlvX3Y3XzRfZW5hYmxlX2Rvb3JiZWxsX2ludGVy
cnVwdCwNCiAJLnVwZGF0ZV9tZWRpdW1fZ3JhaW5fY2xvY2tfZ2F0aW5nID0gbmJpb192N180X3Vw
ZGF0ZV9tZWRpdW1fZ3JhaW5fY2xvY2tfZ2F0aW5nLA0KIAkudXBkYXRlX21lZGl1bV9ncmFpbl9s
aWdodF9zbGVlcCA9IG5iaW9fdjdfNF91cGRhdGVfbWVkaXVtX2dyYWluX2xpZ2h0X3NsZWVwLA0K
IAkuZ2V0X2Nsb2NrZ2F0aW5nX3N0YXRlID0gbmJpb192N180X2dldF9jbG9ja2dhdGluZ19zdGF0
ZSwgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQppbmRleCBmYzZjZmJjLi41Y2Y1ZjExIDEw
MDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0KKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0KQEAgLTQ5MywxMCArNDkzLDE1IEBAIHN0
YXRpYyBpbnQgc29jMTVfYXNpY19iYWNvX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KSAgew0KIAl2b2lkICpwcF9oYW5kbGUgPSBhZGV2LT5wb3dlcnBsYXkucHBfaGFuZGxlOw0KIAlj
b25zdCBzdHJ1Y3QgYW1kX3BtX2Z1bmNzICpwcF9mdW5jcyA9IGFkZXYtPnBvd2VycGxheS5wcF9m
dW5jczsNCisJc3RydWN0IGFtZGdwdV9yYXMgKnJhcyA9IGFtZGdwdV9yYXNfZ2V0X2NvbnRleHQo
YWRldik7DQogDQogCWlmICghcHBfZnVuY3MgfHwhcHBfZnVuY3MtPmdldF9hc2ljX2JhY29fc3Rh
dGUgfHwhcHBfZnVuY3MtPnNldF9hc2ljX2JhY29fc3RhdGUpDQogCQlyZXR1cm4gLUVOT0VOVDsN
CiANCisJLyogYXZvaWQgTkJJRiBnb3Qgc3R1Y2sgd2hlbiBkbyBSQVMgcmVjb3ZlcnkgaW4gQkFD
TyByZXNldCAqLw0KKwlpZiAocmFzICYmIHJhcy0+c3VwcG9ydGVkKQ0KKwkJYWRldi0+bmJpby5m
dW5jcy0+ZW5hYmxlX2Rvb3JiZWxsX2ludGVycnVwdChhZGV2LCBmYWxzZSk7DQorDQogCS8qIGVu
dGVyIEJBQ08gc3RhdGUgKi8NCiAJaWYgKHBwX2Z1bmNzLT5zZXRfYXNpY19iYWNvX3N0YXRlKHBw
X2hhbmRsZSwgMSkpDQogCQlyZXR1cm4gLUVJTzsNCkBAIC01MDUsNiArNTEwLDEwIEBAIHN0YXRp
YyBpbnQgc29jMTVfYXNpY19iYWNvX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0K
IAlpZiAocHBfZnVuY3MtPnNldF9hc2ljX2JhY29fc3RhdGUocHBfaGFuZGxlLCAwKSkNCiAJCXJl
dHVybiAtRUlPOw0KIA0KKwkvKiByZS1lbmFibGUgZG9vcmJlbGwgaW50ZXJydXB0IGFmdGVyIEJB
Q08gZXhpdCAqLw0KKwlpZiAocmFzICYmIHJhcy0+c3VwcG9ydGVkKQ0KKwkJYWRldi0+bmJpby5m
dW5jcy0+ZW5hYmxlX2Rvb3JiZWxsX2ludGVycnVwdChhZGV2LCB0cnVlKTsNCisNCiAJZGV2X2lu
Zm8oYWRldi0+ZGV2LCAiR1BVIEJBQ08gcmVzZXRcbiIpOw0KIA0KIAlhZGV2LT5pbl9iYWNvX3Jl
c2V0ID0gMTsNCi0tDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
