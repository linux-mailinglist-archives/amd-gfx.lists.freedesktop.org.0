Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2479910ADD4
	for <lists+amd-gfx@lfdr.de>; Wed, 27 Nov 2019 11:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C07A6E505;
	Wed, 27 Nov 2019 10:39:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730062.outbound.protection.outlook.com [40.107.73.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDEA6E505
 for <amd-gfx@lists.freedesktop.org>; Wed, 27 Nov 2019 10:39:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iogKMpAnTIdJQz58M/RulN9B6XdWISemtTKTJdY+7KuTvRIgRODdWuTsXW3xaQYlOFAPdtCPXgtWS83y/+i3kd/BobSkY+epysh+1R0NmInqMYDinpzWIrON38GIQ7kxwxrGlv7BufPc5s1QjivTmNww8OWx3g3TYqFwB2lAgC/Yr/FXeGuYulGHXC+OlE8o36Go8RHsE0pNGltWxNszX8L3i/Ske9OeaUemLVZrzmY0R0NqYuQ202rKpwhovRPNCU9yc8G3Ydx04BLG38Izg0W+vvol9hITp+EqXPGiqqEU6nbGjCXg5gfU+hZ+Z6Vv0PgwviB+BSY9NuWO0GAPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/ccHywYARcln3yVP3YcOhWS2senfa0NSxN9LcOZyek=;
 b=P27q7Sx8tUPXKSU4IvBzWBeKgcGYCGNKVmB5oKMzE20f61snf8mMBLfvUB9sMyf1gE+lywOzp+y3CEEO80rlwCdIQ6uKbZo7hSy4eOeUxb0kpwAjMJ+zDYc/bix2H/cbdjgUqVpt1x68uFFHA7UVQ6AyIU1xIemMNrQI0yp4H5sX5JhEDYinEHVNOKOPfGpGTYG90kLArNlnydkjyYUyQcYXhmf+6TX0sblVpNnz3urfRhEr1MKki1qMeYY/1U5jzq4uMIeEfdy9iUES/lPqu0lNTUPw2HZB1CLdF4TGl28+ijuDz/SAXWHrZYqwsBM3fG9Jnzq5PnrN6t+2WHJquw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB4285.namprd12.prod.outlook.com (52.135.49.140) by
 MN2PR12MB3885.namprd12.prod.outlook.com (10.255.238.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Wed, 27 Nov 2019 10:39:12 +0000
Received: from MN2PR12MB4285.namprd12.prod.outlook.com
 ([fe80::b4d9:8cb3:3876:ed5]) by MN2PR12MB4285.namprd12.prod.outlook.com
 ([fe80::b4d9:8cb3:3876:ed5%6]) with mapi id 15.20.2495.014; Wed, 27 Nov 2019
 10:39:12 +0000
From: "Ma, Le" <Le.Ma@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 10/10 v2] drm/amdgpu: reduce redundant uvd context lost
 warning message
Thread-Topic: [PATCH 10/10 v2] drm/amdgpu: reduce redundant uvd context lost
 warning message
Thread-Index: AQHVpQnZ+fv9jDGsMUaLfm+qrjGcRKeeyxSAgAAAL0A=
Date: Wed, 27 Nov 2019 10:39:12 +0000
Message-ID: <MN2PR12MB428503A53B9B147662FCF622F6440@MN2PR12MB4285.namprd12.prod.outlook.com>
References: <1574848953-11109-1-git-send-email-le.ma@amd.com>
 <87e3c897-b226-1bf8-e169-197a149cbc32@gmail.com>
In-Reply-To: <87e3c897-b226-1bf8-e169-197a149cbc32@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7779ca43-178a-4be1-c24f-08d773260ace
x-ms-traffictypediagnostic: MN2PR12MB3885:|MN2PR12MB3885:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3885A679C315984C0C1571DAF6440@MN2PR12MB3885.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(13464003)(189003)(199004)(2906002)(186003)(7110500001)(6306002)(54906003)(53546011)(6506007)(99286004)(446003)(316002)(2420400007)(3846002)(14454004)(66476007)(66946007)(76116006)(4326008)(66556008)(64756008)(66446008)(6246003)(11346002)(110136005)(66066001)(26005)(478600001)(102836004)(229853002)(81156014)(81166006)(14444005)(6436002)(52536014)(71200400001)(71190400001)(2501003)(33656002)(7696005)(86362001)(76176011)(55016002)(256004)(790700001)(6116002)(74316002)(236005)(8676002)(7736002)(54896002)(9686003)(25786009)(66574012)(5660300002)(8936002)(15650500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3885;
 H:MN2PR12MB4285.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XXXYyFlcbP+bitAtvdcvIDElQyWOtYiSMagmpaKSHql+a0Mj6mS6JbCi48IyehYEyKOCwUNcX9gT0iHEplIeip/GVuTG+ynPU80DM7KjHLBO6SZKVrBDi+pWCiOWEeBjvQPyArkJ/AuibVBLOx2odwulqpdcG1XTiUTnP0UjnNv6genDK73244wTMZI4nz21I4Jr/YZ3uE70zyhZ5ahHD4e/KEuSobC4s7ZgCQhCua1avlOLwM+xdStds/JlLT22NAhgKGLaKKKtrM7pm0B6sXUehaw/jJN9gQUhUDKNhSUq2amvqcyJB+y8LdDGU+GW08yDMoTN6xoBcy7H3d0qD73oPWrZBo0Y+yg/KT/bL0Fg+zFkUTiQgVOuRI2IdyoNBACEqnPWCHplUzvq+rQFGN5eBZ0llFQfEktfuIb8bvA2kzBoHXqsZGDdK5RpoFrr
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7779ca43-178a-4be1-c24f-08d773260ace
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 10:39:12.1765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N+aQnZS1pPowcoquKZs8fQvzI/Q4w9gM5C6cKF9fhWIjAyfErQ7BsacgOIX6nLZN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3885
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/ccHywYARcln3yVP3YcOhWS2senfa0NSxN9LcOZyek=;
 b=sbR2LOIIxNaJN1cLJf4WurxT8ZmZqzm02b0PdVfAv4hV3Bixke+f2NRtbmRvcPeebkKO1h4vizTPSJYBI4M3xcBFRzOa+IUwO5K+o/k0jTA4SktM9IhczxTnyuCizQDgtakfTsUp0n51neZvxUWEuZeDbk31wH5m9HSgJ5c5Ky8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Le.Ma@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============1444562881=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1444562881==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB428503A53B9B147662FCF622F6440MN2PR12MB4285namp_"

--_000_MN2PR12MB428503A53B9B147662FCF622F6440MN2PR12MB4285namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+DQpTZW50OiBXZWRuZXNkYXksIE5v
dmVtYmVyIDI3LCAyMDE5IDY6MDggUE0NClRvOiBNYSwgTGUgPExlLk1hQGFtZC5jb20+OyBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IENoZW4sIEd1Y2h1biA8R3VjaHVuLkNoZW5A
YW1kLmNvbT47IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFu
ZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgTGksIERlbm5pcyA8RGVubmlzLkxpQGFt
ZC5jb20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KU3ViamVjdDog
UmU6IFtQQVRDSCAxMC8xMCB2Ml0gZHJtL2FtZGdwdTogcmVkdWNlIHJlZHVuZGFudCB1dmQgY29u
dGV4dCBsb3N0IHdhcm5pbmcgbWVzc2FnZQ0KDQoNCg0KQW0gMjcuMTEuMTkgdW0gMTE6MDIgc2No
cmllYiBMZSBNYToNCg0KPiBNb3ZlIHRoZSBwcmludCBvdXQgb2YgdXZkIGluc3RhbmNlIGxvb3Ag
aW4gYW1kZ3B1X3V2ZF9zdXNwZW5kDQoNCj4NCg0KPiB2MjogZHJvcCB1bm5lY2Vzc2FyeSBicmFj
a2V0cw0KDQo+DQoNCj4gQ2hhbmdlLUlkOiBJZmFkOTk3ZGViZDg0NzYzZTFiNTVkNjY4ZTE0NGI3
Mjk1OThmMTE1ZQ0KDQo+IFNpZ25lZC1vZmYtYnk6IExlIE1hIDxsZS5tYUBhbWQuY29tPG1haWx0
bzpsZS5tYUBhbWQuY29tPj4NCg0KPiAtLS0NCg0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV91dmQuYyB8IDEwICsrKysrKy0tLS0NCg0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoNCj4NCg0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jDQoNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdXZkLmMNCg0KPiBpbmRleCBlMzI0YmZlLi42OTI0OGVjYiAx
MDA2NDQNCg0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXZkLmMN
Cg0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXZkLmMNCg0KPiBA
QCAtMzc2LDEzICszNzYsMTUgQEAgaW50IGFtZGdwdV91dmRfc3VzcGVuZChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikNCg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gLUVOT01FTTsNCg0KPg0KDQo+ICAgICAgICAgICAgICAgICAgICAgIC8qIHJlLXdyaXRlIDAg
c2luY2UgZXJyX2V2ZW50X2F0aHViIHdpbGwgY29ycnVwdCBWQ1BVIGJ1ZmZlciAqLw0KDQo+IC0g
ICAgICAgICAgICAgICAgICAgaWYgKGFtZGdwdV9yYXNfaW50cl90cmlnZ2VyZWQoKSkgew0KDQo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX1dBUk4oIlVWRCBWQ1BVIHN0YXRl
IG1heSBsb3N0IGR1ZSB0byBSQVMgRVJSRVZFTlRfQVRIVUJfSU5URVJSVVBUXG4iKTsNCg0KPiAr
ICAgICAgICAgICAgICAgICAgaWYgKGFtZGdwdV9yYXNfaW50cl90cmlnZ2VyZWQoKSkNCg0KDQoN
CkNhbiB0aGUgc3RhdGUgY2hhbmdlIHdoaWxlIGRvaW5nIHRoZSBsb29wPyBJZiB5ZXMgdGhhbiBJ
IHdvdWxkIHJhdGhlciBncmFiIHRoYXQgb25jZSBhbmQgdXNlIGl0IG11bHRpcGxlIHRpbWVzLg0K
DQoNCg0KQ2hyaXN0aWFuLg0KDQoNCg0KW0xlXTogR290IHlvdXIgbWVhbmluZywgYW5kIHRoZSBz
dGF0ZSB3aWxsIG5vdCBjaGFuZ2UgaGVyZS4gV2lsbCB1cGRhdGUgdGhpcyBpbiB2My4NCg0KDQoN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWVtc2V0KGFkZXYtPnV2ZC5pbnN0
W2pdLnNhdmVkX2JvLCAwLCBzaXplKTsNCg0KPiAtICAgICAgICAgICAgICAgICAgIH0gZWxzZSB7
DQoNCj4gKyAgICAgICAgICAgICAgICAgIGVsc2UNCg0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBtZW1jcHlfZnJvbWlvKGFkZXYtPnV2ZC5pbnN0W2pdLnNhdmVkX2JvLCBwdHIs
IHNpemUpOw0KDQo+IC0gICAgICAgICAgICAgICAgICAgfQ0KDQo+ICAgICAgICAgIH0NCg0KPiAr
DQoNCj4gKyAgICAgIGlmIChhbWRncHVfcmFzX2ludHJfdHJpZ2dlcmVkKCkpDQoNCj4gKyAgICAg
ICAgICAgICAgICAgIERSTV9XQVJOKCJVVkQgVkNQVSBzdGF0ZSBtYXkgbG9zdCBkdWUgdG8gUkFT
DQoNCj4gK0VSUkVWRU5UX0FUSFVCX0lOVEVSUlVQVFxuIik7DQoNCj4gKw0KDQo+ICAgICAgICAg
IHJldHVybiAwOw0KDQo+ICAgfQ0KDQo+DQoNCg0K

--_000_MN2PR12MB428503A53B9B147662FCF622F6440MN2PR12MB4285namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjExLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQph
OmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xv
cjojMDU2M0MxOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFu
Lk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjoj
OTU0RjcyOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KcC5Nc29QbGFpblRleHQsIGxp
Lk1zb1BsYWluVGV4dCwgZGl2Lk1zb1BsYWluVGV4dA0KCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7
DQoJbXNvLXN0eWxlLWxpbms6IlBsYWluIFRleHQgQ2hhciI7DQoJbWFyZ2luOjBpbjsNCgltYXJn
aW4tYm90dG9tOi4wMDAxcHQ7DQoJZm9udC1zaXplOjE0LjBwdDsNCglmb250LWZhbWlseToiQ2Fs
aWJyaSIsc2Fucy1zZXJpZjt9DQpzcGFuLlBsYWluVGV4dENoYXINCgl7bXNvLXN0eWxlLW5hbWU6
IlBsYWluIFRleHQgQ2hhciI7DQoJbXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCW1zby1zdHlsZS1s
aW5rOiJQbGFpbiBUZXh0IjsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQou
TXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LWZhbWls
eToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVp
biAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3JkU2Vj
dGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48IS0tW2lmIGd0ZSBtc28g
OV0+PHhtbD4NCjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9IjEwMjYiIC8+
DQo8L3htbD48IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlbGF5
b3V0IHY6ZXh0PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIxIiAvPg0KPC9v
OnNoYXBlbGF5b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4t
VVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0
aW9uMSI+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxw
IGNsYXNzPSJNc29QbGFpblRleHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b1BsYWluVGV4dCI+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS08YnI+DQpGcm9tOiBDaHJpc3Rp
YW4gS8O2bmlnICZsdDtja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbSZndDsgPGJyPg0K
U2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAyNywgMjAxOSA2OjA4IFBNPGJyPg0KVG86IE1hLCBM
ZSAmbHQ7TGUuTWFAYW1kLmNvbSZndDs7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPGJy
Pg0KQ2M6IENoZW4sIEd1Y2h1biAmbHQ7R3VjaHVuLkNoZW5AYW1kLmNvbSZndDs7IFpob3UxLCBU
YW8gJmx0O1Rhby5aaG91MUBhbWQuY29tJmd0OzsgRGV1Y2hlciwgQWxleGFuZGVyICZsdDtBbGV4
YW5kZXIuRGV1Y2hlckBhbWQuY29tJmd0OzsgTGksIERlbm5pcyAmbHQ7RGVubmlzLkxpQGFtZC5j
b20mZ3Q7OyBaaGFuZywgSGF3a2luZyAmbHQ7SGF3a2luZy5aaGFuZ0BhbWQuY29tJmd0Ozxicj4N
ClN1YmplY3Q6IFJlOiBbUEFUQ0ggMTAvMTAgdjJdIGRybS9hbWRncHU6IHJlZHVjZSByZWR1bmRh
bnQgdXZkIGNvbnRleHQgbG9zdCB3YXJuaW5nIG1lc3NhZ2U8L3A+DQo8cCBjbGFzcz0iTXNvUGxh
aW5UZXh0Ij48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQiPkFt
IDI3LjExLjE5IHVtIDExOjAyIHNjaHJpZWIgTGUgTWE6PG86cD48L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7IE1vdmUgdGhlIHByaW50IG91dCBvZiB1dmQgaW5zdGFuY2Ug
bG9vcCBpbiBhbWRncHVfdXZkX3N1c3BlbmQ8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Q
bGFpblRleHQiPiZndDs8bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRl
eHQiPiZndDsgdjI6IGRyb3AgdW5uZWNlc3NhcnkgYnJhY2tldHM8bzpwPjwvbzpwPjwvcD4NCjxw
IGNsYXNzPSJNc29QbGFpblRleHQiPiZndDs8bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNz
PSJNc29QbGFpblRleHQiPiZndDsgQ2hhbmdlLUlkOiBJZmFkOTk3ZGViZDg0NzYzZTFiNTVkNjY4
ZTE0NGI3Mjk1OThmMTE1ZTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+
Jmd0OyBTaWduZWQtb2ZmLWJ5OiBMZSBNYSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmxlLm1hQGFtZC5j
b20iPjxzcGFuIHN0eWxlPSJjb2xvcjp3aW5kb3d0ZXh0O3RleHQtZGVjb3JhdGlvbjpub25lIj5s
ZS5tYUBhbWQuY29tPC9zcGFuPjwvYT4mZ3Q7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
UGxhaW5UZXh0Ij4mZ3Q7IC0tLTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4
dCI+Jmd0OyZuYnNwOyZuYnNwOyBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXZk
LmMgfCAxMCAmIzQzOyYjNDM7JiM0MzsmIzQzOyYjNDM7JiM0MzstLS0tPG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7Jm5ic3A7Jm5ic3A7IDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoJiM0MzspLCA0IGRlbGV0aW9ucygtKTxvOnA+PC9vOnA+PC9wPg0KPHAg
Y2xhc3M9Ik1zb1BsYWluVGV4dCI+Jmd0OzxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9
Ik1zb1BsYWluVGV4dCI+Jmd0OyBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3V2ZC5jIDxvOnA+DQo8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0
Ij4mZ3Q7IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jPG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7IGluZGV4IGUzMjRiZmUuLjY5MjQ4
ZWNiIDEwMDY0NDxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+Jmd0OyAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXZkLmM8bzpwPjwvbzpwPjwv
cD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQiPiZndDsgJiM0MzsmIzQzOyYjNDM7IGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jPG86cD48L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7IEBAIC0zNzYsMTMgJiM0MzszNzYsMTUgQEAgaW50IGFtZGdw
dV91dmRfc3VzcGVuZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik8bzpwPjwvbzpwPjwvcD4N
CjxwIGNsYXNzPSJNc29QbGFpblRleHQiPiZndDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyByZXR1cm4gLUVO
T01FTTs8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQiPiZndDsmbmJzcDsm
bmJzcDsgPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7Jm5ic3A7
Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyAvKiByZS13cml0ZSAwIHNpbmNlIGVycl9ldmVudF9hdGh1YiB3aWxsIGNvcnJ1cHQgVkNQVSBi
dWZmZXIgKi88bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQiPiZndDsgLSZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBpZiAoYW1k
Z3B1X3Jhc19pbnRyX3RyaWdnZXJlZCgpKSB7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
UGxhaW5UZXh0Ij4mZ3Q7IC0mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgRFJNX1dBUk4oJnF1b3Q7VVZEIFZDUFUgc3RhdGUg
bWF5IGxvc3QgZHVlIHRvIFJBUyBFUlJFVkVOVF9BVEhVQl9JTlRFUlJVUFRcbiZxdW90Oyk7PG86
cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7ICYjNDM7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIChhbWRncHVfcmFzX2ludHJf
dHJpZ2dlcmVkKCkpPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij48bzpw
PiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQiPkNhbiB0aGUgc3RhdGUg
Y2hhbmdlIHdoaWxlIGRvaW5nIHRoZSBsb29wPyBJZiB5ZXMgdGhhbiBJIHdvdWxkIHJhdGhlciBn
cmFiIHRoYXQgb25jZSBhbmQgdXNlIGl0IG11bHRpcGxlIHRpbWVzLjxvOnA+PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0i
TXNvUGxhaW5UZXh0Ij5DaHJpc3RpYW4uPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvUGxh
aW5UZXh0Ij48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQiPjxz
cGFuIHN0eWxlPSJjb2xvcjpibGFjayI+W0xlXTogR290IHlvdXIgbWVhbmluZywgYW5kIHRoZSBz
dGF0ZSB3aWxsIG5vdCBjaGFuZ2UgaGVyZS4gV2lsbCB1cGRhdGUgdGhpcyBpbiB2My48bzpwPjwv
bzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij48c3BhbiBzdHlsZT0iY29s
b3I6YmxhY2siPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29QbGFp
blRleHQiPiZndDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IG1lbXNldChhZGV2LSZndDt1dmQuaW5z
dFtqXS5zYXZlZF9ibywgMCwgc2l6ZSk7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvUGxh
aW5UZXh0Ij4mZ3Q7IC0mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgfSBlbHNlIHs8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQi
PiZndDsgJiM0MzsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsg
ZWxzZTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+Jmd0OyZuYnNwOyZu
YnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsg
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IG1lbWNweV9mcm9taW8oYWRldi0mZ3Q7dXZkLmluc3Rbal0uc2F2ZWRfYm8sIHB0
ciwgc2l6ZSk7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7IC0m
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgfTxvOnA+
PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+Jmd0OyZuYnNwOyZuYnNwOyAmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgfTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xh
c3M9Ik1zb1BsYWluVGV4dCI+Jmd0OyAmIzQzOzxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b1BsYWluVGV4dCI+Jmd0OyAmIzQzOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBpZiAo
YW1kZ3B1X3Jhc19pbnRyX3RyaWdnZXJlZCgpKTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b1BsYWluVGV4dCI+Jmd0OyAmIzQzOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyBEUk1fV0FSTigmcXVvdDtVVkQgVkNQVSBzdGF0ZSBtYXkgbG9zdCBkdWUgdG8g
UkFTDQo8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQiPiZndDsgJiM0MztF
UlJFVkVOVF9BVEhVQl9JTlRFUlJVUFRcbiZxdW90Oyk7PG86cD48L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7ICYjNDM7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
UGxhaW5UZXh0Ij4mZ3Q7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyByZXR1cm4gMDs8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQi
PiZndDsmbmJzcDsmbmJzcDsgfTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4
dCI+Jmd0OyZuYnNwOyZuYnNwOyA8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRl
eHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_MN2PR12MB428503A53B9B147662FCF622F6440MN2PR12MB4285namp_--

--===============1444562881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1444562881==--
