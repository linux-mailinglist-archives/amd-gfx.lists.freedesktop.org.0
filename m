Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB63CD1E12
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 03:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DAC6E31E;
	Thu, 10 Oct 2019 01:43:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770078.outbound.protection.outlook.com [40.107.77.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964EF6E31E
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 01:43:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWKbUGnL5sMSvx71T3qrEcDcmaYHAh/iBm26rE/vCqjEswa7p0sEqZs6PmakP8UTHV+4cYt7z7VrrYkKnnESF53CwRr3M1wVbTK8MgMtiahoVOuWVdwi0nQKN3NqvMzsIV76Q/7jrk1cyLu0hrJQXJwywSna+X+D4+RzvnSgC0jA0fpMun+g25VtGFUd3I7CiTX4AdkBjwF/Pb43/ARwuj6gqKXs+bYT66fUBg1/KuVYSisg/t6vAAHewzgGuAzzaD2XcuzGoI6l9KLj4e0LpLFUkoQNVQnfZfTh9+D1NcCA5y1+gb66rGqt2LEDTK9LVWvMRqMiW1tcWplaQSuJZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjBZpKZjTbDDE7r2V2QgzUjO1oUxOXmMLbTy2PwGInU=;
 b=G24uHCSHTLW0NWdfWT+nZUIanHbK2ytKHabtPhDch4OTZO2kLT7ttZz2RXUeKSbKSvmPrDKj19l7eiY2spNhKni2B2aynUWllgW7ZX/CKF6492tB+lu5gNdttxd4/84AmSj/N+FKyiv2BX8UdglktiVofvvFp6yZ6cM/G+HTJS2iRZ7fAHkmoUD4W8Eby88+Qvhcp1+YH0j5wYzUiDQRVVbmcnvISpZncHDif/0tDEzReT+Bzs5GYG7cWQ5XYunMyb/3Ym+wjbD4+XIDEjnOquUae7KIjjK7e/Mp1gLj0f0UKFJ+eq9CaWxZf7rLSzDYT8nun46krpJg2BDLAr6odA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4045.namprd12.prod.outlook.com (52.135.49.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 10 Oct 2019 01:43:38 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9d04:5f9f:eab5:dcd9]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9d04:5f9f:eab5:dcd9%6]) with mapi id 15.20.2347.016; Thu, 10 Oct 2019
 01:43:38 +0000
From: Kevin Wang <kevwa@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/swSMU/navi: add feature toggles for more things
Thread-Topic: [PATCH] drm/amdgpu/swSMU/navi: add feature toggles for more
 things
Thread-Index: AQHVfqPm0IrBS8xEpE6A25yeGaVXr6dTGvWA
Date: Thu, 10 Oct 2019 01:43:38 +0000
Message-ID: <7f3d7579-3d71-cf78-7b24-f84b09a98cbe@amd.com>
References: <20191009131714.24259-1-alexander.deucher@amd.com>
In-Reply-To: <20191009131714.24259-1-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0215.apcprd02.prod.outlook.com
 (2603:1096:201:20::27) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e765f0be-c491-4f8e-19d1-08d74d234577
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB4045:
x-microsoft-antispam-prvs: <MN2PR12MB40454995BF95D5A9C3F69A4EA2940@MN2PR12MB4045.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(199004)(189003)(2616005)(229853002)(6246003)(6116002)(6916009)(25786009)(305945005)(7736002)(11346002)(446003)(36756003)(2351001)(476003)(3846002)(14454004)(486006)(6436002)(5640700003)(31686004)(52116002)(81166006)(8676002)(2906002)(99286004)(71190400001)(76176011)(66446008)(316002)(81156014)(66066001)(71200400001)(66556008)(66476007)(2501003)(6512007)(186003)(31696002)(6506007)(6486002)(256004)(386003)(8936002)(26005)(478600001)(53546011)(5660300002)(66946007)(64756008)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4045;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V5d/yUIYfvKOe+sn+GeI6Mm3AV+Ts5GOkOeXiHTrCRmX1W3QbtJbvNv2+fjoVdSepC7tMtvYYAMc1CxVYkPMuRs8uqvuiXrxWkKEoVhwWErpAeACVG1Z0tFpd3YCcGJ7wyjQC/CJ1+y75PDdtQuomMdnF1f/poXFLSzb38jNGmmc2kQPsFbnqimADX4s7FcJI4dqLZ4RIm+DeSZQoFbz1LZgN9NenTk45GYB4FAxgZ40Bzu9lUS6gBuhbZ6u8tMm08GlcYBLY+tAEgsVk2YB5PG2/qFgNXOXf3TSBK5qihKXnm243CGJDv25tf4+ir1EmuZnf2fbbzOgCa/zPCMmzS/SUFuOkFx1m2RiJBcIX/3Xj5glQxGn3oMpPKv7lItcEDUTnyGymSDuvS8hy6hNkJ2GRR6Lx0E05YnyIqjd5mE=
x-ms-exchange-transport-forked: True
Content-ID: <66F815567EA2D247977147C96287233D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e765f0be-c491-4f8e-19d1-08d74d234577
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 01:43:38.4309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HOOYaoK0vemhx9k8xoXjkneO7Dot9Kgfau31l5+0GlDFQuZcaVNE7V3G1QoJt7Wd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4045
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjBZpKZjTbDDE7r2V2QgzUjO1oUxOXmMLbTy2PwGInU=;
 b=oGnE7VbBWakic+b5vxJ8F3MjT+mSCi2EGP87zDQdlHxy9hqHmaBOB4rgiPekmH1DfMq1KVhCYNvQQyx2WNf9wDoNcqr1/XnhYkFlQHqQpnYmyzVILALx6OX4w25e9xD9F5hljObI+qHajydHctYPNqvX6VoK7RJkE1hurQhw/ew=
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

UmV2aWV3ZWQtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+DQoNCkJlc3QgUmVn
YXJkcywNCktldmluDQoNCk9uIDEwLzkvMTkgOToxNyBQTSwgQWxleCBEZXVjaGVyIHdyb3RlOg0K
PiBBZGQgdG9nZ2xlcyBmb3IgbW9yZSBwb3dlciBmZWF0dXJlcy4gIEhlbHBmdWwgaW4gZGVidWdn
aW5nLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkx
MF9wcHQuYyB8IDI0ICsrKysrKysrKysrKysrKystLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwg
MTggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYw0KPiBpbmRleCBhNTgzY2Y4N2I1MTQuLjhlMWYzYmU4
YmE2ZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEw
X3BwdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQu
Yw0KPiBAQCAtMzI4LDExICszMjgsNyBAQCBuYXZpMTBfZ2V0X2FsbG93ZWRfZmVhdHVyZV9tYXNr
KHN0cnVjdCBzbXVfY29udGV4dCAqc211LA0KPiAgIAltZW1zZXQoZmVhdHVyZV9tYXNrLCAwLCBz
aXplb2YodWludDMyX3QpICogbnVtKTsNCj4gICANCj4gICAJKih1aW50NjRfdCAqKWZlYXR1cmVf
bWFzayB8PSBGRUFUVVJFX01BU0soRkVBVFVSRV9EUE1fUFJFRkVUQ0hFUl9CSVQpDQo+IC0JCQkJ
fCBGRUFUVVJFX01BU0soRkVBVFVSRV9EUE1fR0ZYQ0xLX0JJVCkNCj4gLQkJCQl8IEZFQVRVUkVf
TUFTSyhGRUFUVVJFX0RQTV9TT0NDTEtfQklUKQ0KPiAgIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFU
VVJFX0RQTV9NUDBDTEtfQklUKQ0KPiAtCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX0xJ
TktfQklUKQ0KPiAtCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfR0ZYX1VMVl9CSVQpDQo+ICAg
CQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfUlNNVV9TTU5fQ0dfQklUKQ0KPiAgIAkJCQl8IEZF
QVRVUkVfTUFTSyhGRUFUVVJFX0RTX1NPQ0NMS19CSVQpDQo+ICAgCQkJCXwgRkVBVFVSRV9NQVNL
KEZFQVRVUkVfUFBUX0JJVCkNCj4gQEAgLTM0Miw4ICszMzgsNiBAQCBuYXZpMTBfZ2V0X2FsbG93
ZWRfZmVhdHVyZV9tYXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211LA0KPiAgIAkJCQl8IEZFQVRV
UkVfTUFTSyhGRUFUVVJFX0ZBTl9DT05UUk9MX0JJVCkNCj4gICAJCQkJfCBGRUFUVVJFX01BU0so
RkVBVFVSRV9USEVSTUFMX0JJVCkNCj4gICAJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9MRURf
RElTUExBWV9CSVQpDQo+IC0JCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9EUE1fRENFRkNMS19C
SVQpDQo+IC0JCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9EU19HRlhDTEtfQklUKQ0KPiAgIAkJ
CQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0RTX0RDRUZDTEtfQklUKQ0KPiAgIAkJCQl8IEZFQVRV
UkVfTUFTSyhGRUFUVVJFX0ZXX0RTVEFURV9CSVQpDQo+ICAgCQkJCXwgRkVBVFVSRV9NQVNLKEZF
QVRVUkVfQkFDT19CSVQpDQo+IEBAIC0zNTIsMTEgKzM0NiwyOSBAQCBuYXZpMTBfZ2V0X2FsbG93
ZWRfZmVhdHVyZV9tYXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211LA0KPiAgIAkJCQl8IEZFQVRV
UkVfTUFTSyhGRUFUVVJFX0FQQ0NfREZMTF9CSVQpDQo+ICAgCQkJCXwgRkVBVFVSRV9NQVNLKEZF
QVRVUkVfRldfQ1RGX0JJVCk7DQo+ICAgDQo+ICsJaWYgKGFkZXYtPnBtLnBwX2ZlYXR1cmUgJiBQ
UF9TT0NDTEtfRFBNX01BU0spDQo+ICsJCSoodWludDY0X3QgKilmZWF0dXJlX21hc2sgfD0gRkVB
VFVSRV9NQVNLKEZFQVRVUkVfRFBNX1NPQ0NMS19CSVQpOw0KPiArDQo+ICsJaWYgKGFkZXYtPnBt
LnBwX2ZlYXR1cmUgJiBQUF9TQ0xLX0RQTV9NQVNLKQ0KPiArCQkqKHVpbnQ2NF90ICopZmVhdHVy
ZV9tYXNrIHw9IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0RQTV9HRlhDTEtfQklUKTsNCj4gKw0KPiAr
CWlmIChhZGV2LT5wbS5wcF9mZWF0dXJlICYgUFBfUENJRV9EUE1fTUFTSykNCj4gKwkJKih1aW50
NjRfdCAqKWZlYXR1cmVfbWFzayB8PSBGRUFUVVJFX01BU0soRkVBVFVSRV9EUE1fTElOS19CSVQp
Ow0KPiArDQo+ICsJaWYgKGFkZXYtPnBtLnBwX2ZlYXR1cmUgJiBQUF9EQ0VGQ0xLX0RQTV9NQVNL
KQ0KPiArCQkqKHVpbnQ2NF90ICopZmVhdHVyZV9tYXNrIHw9IEZFQVRVUkVfTUFTSyhGRUFUVVJF
X0RQTV9EQ0VGQ0xLX0JJVCk7DQo+ICsNCj4gICAJaWYgKGFkZXYtPnBtLnBwX2ZlYXR1cmUgJiBQ
UF9NQ0xLX0RQTV9NQVNLKQ0KPiAgIAkJKih1aW50NjRfdCAqKWZlYXR1cmVfbWFzayB8PSBGRUFU
VVJFX01BU0soRkVBVFVSRV9EUE1fVUNMS19CSVQpDQo+ICAgCQkJCXwgRkVBVFVSRV9NQVNLKEZF
QVRVUkVfTUVNX1ZERENJX1NDQUxJTkdfQklUKQ0KPiAgIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFU
VVJFX01FTV9NVkREX1NDQUxJTkdfQklUKTsNCj4gICANCj4gKwlpZiAoYWRldi0+cG0ucHBfZmVh
dHVyZSAmIFBQX1VMVl9NQVNLKQ0KPiArCQkqKHVpbnQ2NF90ICopZmVhdHVyZV9tYXNrIHw9IEZF
QVRVUkVfTUFTSyhGRUFUVVJFX0dGWF9VTFZfQklUKTsNCj4gKw0KPiArCWlmIChhZGV2LT5wbS5w
cF9mZWF0dXJlICYgUFBfU0NMS19ERUVQX1NMRUVQX01BU0spDQo+ICsJCSoodWludDY0X3QgKilm
ZWF0dXJlX21hc2sgfD0gRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFNfR0ZYQ0xLX0JJVCk7DQo+ICsN
Cj4gICAJaWYgKGFkZXYtPnBtLnBwX2ZlYXR1cmUgJiBQUF9HRlhPRkZfTUFTSykgew0KPiAgIAkJ
Kih1aW50NjRfdCAqKWZlYXR1cmVfbWFzayB8PSBGRUFUVVJFX01BU0soRkVBVFVSRV9HRlhPRkZf
QklUKTsNCj4gICAJCS8qIFRPRE86IHJlbW92ZSBpdCBvbmNlIGZ3IGZpeCB0aGUgYnVnICovDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
