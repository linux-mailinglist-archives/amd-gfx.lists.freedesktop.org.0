Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DABA2D4BE6
	for <lists+amd-gfx@lfdr.de>; Sat, 12 Oct 2019 03:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80796E046;
	Sat, 12 Oct 2019 01:42:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820057.outbound.protection.outlook.com [40.107.82.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8E06E046
 for <amd-gfx@lists.freedesktop.org>; Sat, 12 Oct 2019 01:42:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTXZxS/O0TbcOR6P7sGyUvvK+a2n6QFH1mCB9NgiO0NP6WYSt0K8WJD5x/N7T0CYFeYFZE0Ut1Gw/+W+cYxolRGiZX/UBQnomCck9PqAWV7luZsgFVMzVv/CJr1Cx13pfl6dXmLf990NfanEHw2ERIFpCMYK/VNTKRF8A/F33o7eGJ8U2yg78mdmpGL41KwJM2CIkC5r37tmekokwc/oIAjd6rdUqW8yIw9PIUHzel2+mPn8Xg1JbIIF/9xh9Vr6byUsK6fi4bsgTrrJFMyc+U3jJNpgJN2yt0ZBhruO2Zy910qVWCFJqtpuZ78qANsGCYYG9K8YwD9XqPSMRXtvjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mfu0RklCA1/Jgq/r/DZd4K1EuTIMWykntXdiS2vjxv4=;
 b=Ud82+HqCvCnHdiZI3cGi/75oKiPzGljVMx2q0yz/EGGpUhDUnkMpPow+APR06zhvTL9sHJcffgzqdnp+Q6P19+PyZQ+5QhZcM3nCxWZ3JjnoMCA2W9AAggB7iFGTKIcwG4IZ3FAHhQgFIP1IyUwfgVs6yjQtAVEMb+StGzqNgvAz9BS1dAxvE1/7GiQg5s6Fe9KjnoAs5KkoEXYn0Z67gH6GinPmxoG5vOLABmprLpDXazddtg+4r8sle/8yn5qQWgU0eexxXh/MmVjKyBjWHYfkM23A6JewSMZvg14ZRj0yzKdYt3LFLZvcrZZKY0mM7/CIJo0el6jtwr4CvZtQSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3070.namprd12.prod.outlook.com (20.178.240.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Sat, 12 Oct 2019 01:42:36 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::435:bdca:bac1:a26d]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::435:bdca:bac1:a26d%5]) with mapi id 15.20.2347.021; Sat, 12 Oct 2019
 01:42:36 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: RE: [PATCH 2/5] drm/amdgpu: move gpu reset out of
 amdgpu_device_suspend
Thread-Topic: [PATCH 2/5] drm/amdgpu: move gpu reset out of
 amdgpu_device_suspend
Thread-Index: AQHVf38fpZTVkQVYz0m5HpaUx8AeoadU02TAgACcNQCAAM3DkA==
Date: Sat, 12 Oct 2019 01:42:36 +0000
Message-ID: <MN2PR12MB3344923284A5FF12F631B634E4960@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20191010152619.31011-1-alexander.deucher@amd.com>
 <20191010152619.31011-3-alexander.deucher@amd.com>
 <BN8PR12MB3329E4B5DE6B027D43B38F5AE4970@BN8PR12MB3329.namprd12.prod.outlook.com>
 <CADnq5_Pbi+K=62tY0sJdOARy74wpnh+Owfq3wQb0tcyXE2XtFw@mail.gmail.com>
In-Reply-To: <CADnq5_Pbi+K=62tY0sJdOARy74wpnh+Owfq3wQb0tcyXE2XtFw@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cdf0ec7b-ae3e-441a-be4b-08d74eb575aa
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3070:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3070B6123F3E047CC005583FE4960@MN2PR12MB3070.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(51914003)(189003)(199004)(51444003)(13464003)(81166006)(6436002)(186003)(6506007)(53546011)(8676002)(25786009)(446003)(7696005)(99286004)(14444005)(6116002)(1411001)(76176011)(102836004)(26005)(8936002)(54906003)(3846002)(256004)(71190400001)(71200400001)(9686003)(11346002)(81156014)(316002)(6306002)(55016002)(2906002)(6246003)(478600001)(4326008)(74316002)(14454004)(7736002)(66476007)(66066001)(64756008)(5660300002)(229853002)(476003)(966005)(486006)(33656002)(66556008)(52536014)(66946007)(76116006)(86362001)(6916009)(305945005)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3070;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: izUcTJ8w4jMr4Pfrk8IRw3rgkD7UXzUQy5G3FxGw4KWefr+HKxKgOcqWdU0cGQJci2VWMHL4VXfE28w+ZCbj+H4CYtNOHzztCDfnBmnBH7FDQNk7+K5+mbhWVWYQBDQrmvQ+EzwkjeTjOtNr4UOIbz8uwPE/nI+WHJSbNYhgKeqyVGd+EHmQhJEfnBJ3g7HmbCuAscD3NMFe/AhE23bTJC5e06dYLmnTqcP9L6AF7R/NEiADexwzACVRsa51cwTiDPy3/qDaGC1RR0jQogwKMSzCy8hkbSskGNxzIHVvu3ZiR9zR6DggEQ+bRLX4WWqA4gojlYE/7+ffWXAdaT7MUd6xfrfnmjHIemy6Clcd+aT3HqtIKkr6vTzs87v93P+Map+YJHzno5uhsh4XPzihJ/fGTW+bQP9hfIIMK9F+1bUMwYz216fa5TxagDCbfflVPPkSTYg/mlYbj18vt+yzXA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf0ec7b-ae3e-441a-be4b-08d74eb575aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 01:42:36.4546 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P9cK9bKVRRnZRUQMxIZL+SjZIpNLjm3dy8oWP5S7K3Qddmjq42m9BK5TXBm6fWy3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3070
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mfu0RklCA1/Jgq/r/DZd4K1EuTIMWykntXdiS2vjxv4=;
 b=38fI6xHzt/mZToLHBhK+oaeEQvAUWtURNmq2fF66wwkISqPCM8oPuU65Lf86VVgENYyw8lwe9Vf/sG0xZCUjGcVDSOU9yRx+99pgdjPsFK/WMAPZGvns2+Pedp44Cqzsqx1mdaY+UcvshCQy2tDGHjCQEYy1nL36mUVcpzqlBKY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbi4gVGhhdCB3aWxsIGJlIGZpbmUgdGhlbi4NClJl
dmlld2VkLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPg0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+
IA0KU2VudDogRnJpZGF5LCBPY3RvYmVyIDExLCAyMDE5IDk6MjUgUE0NClRvOiBRdWFuLCBFdmFu
IDxFdmFuLlF1YW5AYW1kLmNvbT4NCkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
RGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KU3ViamVjdDog
UmU6IFtQQVRDSCAyLzVdIGRybS9hbWRncHU6IG1vdmUgZ3B1IHJlc2V0IG91dCBvZiBhbWRncHVf
ZGV2aWNlX3N1c3BlbmQNCg0KT24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMTI6MDcgQU0gUXVhbiwg
RXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+IHdyb3RlOg0KPg0KPiBJdCBzZWVtcyBhbWRncHVfcG1v
cHNfcnVudGltZV9zdXNwZW5kKCkgbmVlZHMgdG8gYmUgdXBkYXRlZCBhY2NvcmRpbmdseSBhbHNv
Lg0KDQpJIHB1cnBvc2VseSBsZWZ0IHRoYXQgb3V0LiAgSSB0aGluayB0aGF0IGlzIGEgYnVnLiAg
V2UgZG9uJ3QgbmVlZCB0byByZXNldCB0aGUgR1BVIGZvciBydW50aW1lIHN1c3BlbmQuICBXZSBv
bmx5IG5lZWQgaXQgZm9yIGhpYmVybmF0aW9uIGJlY2F1c2Ugb2YgdGhlIHdob2xlIGZyZWV6ZS90
aGF3IGRhbmNlLg0KDQpBbGV4DQoNCj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24g
QmVoYWxmIE9mIA0KPiBBbGV4IERldWNoZXINCj4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMTAs
IDIwMTkgMTE6MjYgUE0NCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+DQo+IFN1Ympl
Y3Q6IFtQQVRDSCAyLzVdIGRybS9hbWRncHU6IG1vdmUgZ3B1IHJlc2V0IG91dCBvZiANCj4gYW1k
Z3B1X2RldmljZV9zdXNwZW5kDQo+DQo+IE1vdmUgaXQgaW50byB0aGUgY2FsbGVyLiAgVGhlcmUg
YXJlIGNhc2VzIHdlcmUgd2UgZG9uJ3Qgd2FudCBpdC4gIFdlIA0KPiBuZWVkIGl0IGZvciBoaWJl
cm5hdGlvbiwgYnV0IHdlIGRvbid0IG5lZWQgaXQgZm9yIHJ1bnRpbWUgcG0uDQo+DQo+IFNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gLS0t
DQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCA0IC0tLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyAgICB8IDcgKysrKysr
LQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMgDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+IGlu
ZGV4IDliOWIxNTM2MDE5NC4uOTFiZGIyNDZlNDA1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+IEBAIC0zMTczLDEwICszMTczLDYgQEAgaW50
IGFtZGdwdV9kZXZpY2Vfc3VzcGVuZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBib29sIHN1c3Bl
bmQsIGJvb2wgZmJjb24pDQo+ICAgICAgICAgICAgICAgICAvKiBTaHV0IGRvd24gdGhlIGRldmlj
ZSAqLw0KPiAgICAgICAgICAgICAgICAgcGNpX2Rpc2FibGVfZGV2aWNlKGRldi0+cGRldik7DQo+
ICAgICAgICAgICAgICAgICBwY2lfc2V0X3Bvd2VyX3N0YXRlKGRldi0+cGRldiwgUENJX0QzaG90
KTsNCj4gLSAgICAgICB9IGVsc2Ugew0KPiAtICAgICAgICAgICAgICAgciA9IGFtZGdwdV9hc2lj
X3Jlc2V0KGFkZXYpOw0KPiAtICAgICAgICAgICAgICAgaWYgKHIpDQo+IC0gICAgICAgICAgICAg
ICAgICAgICAgIERSTV9FUlJPUigiYW1kZ3B1IGFzaWMgcmVzZXQgZmFpbGVkXG4iKTsNCj4gICAg
ICAgICB9DQo+DQo+ICAgICAgICAgcmV0dXJuIDA7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2Rydi5jDQo+IGluZGV4IGQ0M2M0NmRlNzgwNy4uNjQxNDEzODZlNjAzIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQo+IEBAIC0xMTE4
LDggKzExMTgsMTMgQEAgc3RhdGljIGludCBhbWRncHVfcG1vcHNfcmVzdW1lKHN0cnVjdCBkZXZp
Y2UgDQo+ICpkZXYpICBzdGF0aWMgaW50IGFtZGdwdV9wbW9wc19mcmVlemUoc3RydWN0IGRldmlj
ZSAqZGV2KSAgew0KPiAgICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gZGV2X2dl
dF9kcnZkYXRhKGRldik7DQo+ICsgICAgICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBk
cm1fZGV2LT5kZXZfcHJpdmF0ZTsNCj4gKyAgICAgICBpbnQgcjsNCj4NCj4gLSAgICAgICByZXR1
cm4gYW1kZ3B1X2RldmljZV9zdXNwZW5kKGRybV9kZXYsIGZhbHNlLCB0cnVlKTsNCj4gKyAgICAg
ICByID0gYW1kZ3B1X2RldmljZV9zdXNwZW5kKGRybV9kZXYsIGZhbHNlLCB0cnVlKTsNCj4gKyAg
ICAgICBpZiAocikNCj4gKyAgICAgICAgICAgICAgIHJldHVybiByOw0KPiArICAgICAgIHJldHVy
biBhbWRncHVfYXNpY19yZXNldChhZGV2KTsNCj4gIH0NCj4NCj4gIHN0YXRpYyBpbnQgYW1kZ3B1
X3Btb3BzX3RoYXcoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAtLQ0KPiAyLjIwLjENCj4NCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBt
YWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
