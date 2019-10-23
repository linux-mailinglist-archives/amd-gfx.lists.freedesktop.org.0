Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D5DE0FCD
	for <lists+amd-gfx@lfdr.de>; Wed, 23 Oct 2019 03:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3E86E0D9;
	Wed, 23 Oct 2019 01:55:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750047.outbound.protection.outlook.com [40.107.75.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712936E0D9
 for <amd-gfx@lists.freedesktop.org>; Wed, 23 Oct 2019 01:55:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejrdiQvLG7sLFqs+weGeomUniOnLQHT4SEUlDQDMnpLQMz096x9uy5FJvn6Rls8LturZpPIKWZJsq5yy3MeKwPcMgbzDHRny6ADsupiKJQSvHgGxJivMBLkd6WIPs5YQ5D3X0hydE6MT6wSmRUQArEDBRyZxA8QSFEqI/cjTOo36NeknJGRcU1XSacYXMvZLaIVF0r/rLnnqmQzx3FfFe+C4V9FlzvSEKrrkkMar2TvtO1wYmZ4bqZUUhgCAOwe3br1x087rxxaC3x8PLczlk7n5sLvgdEbdFJyzi0iU9Rf6KHReLEqtYQv/WTOV/eb1NkNhINSn7D1e3LvK0Vduzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qQorj333I5V5YyBZ1l1SGkPdEPlTQgtqgN+PPdmTbk=;
 b=RRhw9Ed/0GLfnmBsjJpdZYHKfwcROdtvWnPAsWbIWhHbYxBN3du9oUR9/h5lP4c0VilpouZaHTYouVJUsHCZmaSysGzhZyIG0Wl5WcsuZZKBXJK2PQwENDCCWHuVk1wxC9odgaE9qY6L7CpVcvt2ZpgLx+NLRIMQPE1//Yfd3OxYacJgWT31Ct1WZd0ReS+q191M7xEN7IH2Q+FMzkOfqTX3ePgZfXIz1wc0pBSLusXN5YdU8FMQ5QfaqHhK6BZ2cS8iO3tQJOluBGMBA3pTPW+mypwTZEFdtinejJuKpIXZl05wRi6Q7W9mNMkpkys4CC1gy9b/wjP/64vXFzI3EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1860.namprd12.prod.outlook.com (10.175.98.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Wed, 23 Oct 2019 01:55:00 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554%12]) with mapi id 15.20.2347.029; Wed, 23 Oct
 2019 01:55:00 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Zhu, James" <James.Zhu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/vcn: Enable VCN2.5 encoding
Thread-Topic: [PATCH] drm/amdgpu/vcn: Enable VCN2.5 encoding
Thread-Index: AQHViOfa3EMIa6k/q0ePItLmq/KJz6dnd8ig
Date: Wed, 23 Oct 2019 01:55:00 +0000
Message-ID: <BN6PR12MB18094C7C5F54C7F2850D7FE2F76B0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1571755708-12173-1-git-send-email-James.Zhu@amd.com>
In-Reply-To: <1571755708-12173-1-git-send-email-James.Zhu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [198.54.100.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b4c4baab-e7eb-4a04-bef4-08d7575c037c
x-ms-traffictypediagnostic: BN6PR12MB1860:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1860ACE1537A5828D610C5C9F76B0@BN6PR12MB1860.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(199004)(189003)(13464003)(4326008)(66066001)(256004)(26005)(186003)(6246003)(5660300002)(71200400001)(64756008)(486006)(52536014)(8936002)(476003)(33656002)(81166006)(81156014)(8676002)(2501003)(446003)(66476007)(11346002)(76116006)(6436002)(6306002)(71190400001)(305945005)(53546011)(9686003)(110136005)(7696005)(66556008)(478600001)(99286004)(74316002)(102836004)(7736002)(2906002)(25786009)(6506007)(229853002)(3846002)(6116002)(66946007)(55016002)(966005)(316002)(14454004)(76176011)(66446008)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1860;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GpmzBgAIBnr7lawnp9/K2nScwW5mWKJ6czlJWXuLpgdcuffTKdwV5tPrlY9t5KW2oH8mf37GQFGzCxPvxoELy7V/PYf3tG8RhYzOTpyuG6NBxI/CMscjV6bKfxsqMV7jH1sADzttsZNSVdD3ddzhyKSaoTwzJCqdtPEKVYX7uf/Pn3QJ3g/JfU7CEHSmOR2zzBo5+nXizRV8ZdnqmO+/kMVrfAwpy/LgHadSF03QmxCIIMCeVwoh42NDP1bBtLLslzoUJCElYXMuhvFaGtFYlaL/WyCdnSQOhZMggRRWXbAuvYAyaqKxiHis1kqszvV0ZtCeBSVRjygmI0Z9t0rTdyb9QMcBoM0Kr+WA9aVLe/0vI9yd8GCyxWuSYW9y5WzLCaKu0JkHHZWxusGCbzRbX+xSUO9uBYv38D7FZzkaDQDpE6rkUzzevtX2HHjRULfvJH+dI/98FsJRS8XJsENONxvnXN/zGVoJdFMh6/uZFwU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c4baab-e7eb-4a04-bef4-08d7575c037c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 01:55:00.1370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AWKHppZz1x/U5RR3NmcG3cwv3CJNfdfz7GDpUaZzYlc4C0Rfa+AJNXQrtSK7JAe1LlkySrX5fnTEC0MW3XlINA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1860
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qQorj333I5V5YyBZ1l1SGkPdEPlTQgtqgN+PPdmTbk=;
 b=QpZA9xPIyawsE2kK09q5N9yXuRKnxytvjEjkJwxrYpNUKR3Yb7W2ulKnncFQYVL4r0BBMwiEFkBAzZuw2eiYkw9k2Fs8taqPM0aVdXfG1aR9qR5wRdmvqHYIbtwBX85AkULtlPCaWLRD446vyzKXSCfAIihbxVDAD2cUeGLOvBY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
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
Cc: "Zhu, James" <James.Zhu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgWmh1LA0KPiBKYW1lcw0K
PiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDIyLCAyMDE5IDEwOjQ5IEFNDQo+IFRvOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogWmh1LCBKYW1lcyA8SmFtZXMuWmh1QGFtZC5j
b20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdS92Y246IEVuYWJsZSBWQ04yLjUgZW5j
b2RpbmcNCj4gDQo+IEFmdGVyIFZDTjIuNSBmaXJtd2FyZSAoVmVyc2lvbiBFTkM6IDEuMSAgUmV2
aXNpb246IDExKSwNCj4gVkNOMi41IGVuY29kaW5nIGNhbiB3b3JrIHByb3Blcmx5Lg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4NCg0KDQpBY2tlZC1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KDQo+IC0tLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYyB8IDMgLS0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dmNuX3YyXzUuYw0KPiBpbmRleCBkMjcwZGY4Li5mZjZjYzc3IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMNCj4gQEAgLTI2NSw5ICsyNjUsNiBAQCBzdGF0aWMgaW50
IHZjbl92Ml81X2h3X2luaXQodm9pZCAqaGFuZGxlKQ0KPiANCj4gIAkJZm9yIChpID0gMDsgaSA8
IGFkZXYtPnZjbi5udW1fZW5jX3JpbmdzOyArK2kpIHsNCj4gIAkJCXJpbmcgPSAmYWRldi0+dmNu
Lmluc3Rbal0ucmluZ19lbmNbaV07DQo+IC0JCQkvKiBkaXNhYmxlIGVuY29kZSByaW5ncyB0aWxs
IHRoZSByb2J1c3RuZXNzIG9mIHRoZSBGVw0KPiAqLw0KPiAtCQkJcmluZy0+c2NoZWQucmVhZHkg
PSBmYWxzZTsNCj4gLQkJCWNvbnRpbnVlOw0KPiAgCQkJciA9IGFtZGdwdV9yaW5nX3Rlc3RfaGVs
cGVyKHJpbmcpOw0KPiAgCQkJaWYgKHIpDQo+ICAJCQkJZ290byBkb25lOw0KPiAtLQ0KPiAyLjcu
NA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
