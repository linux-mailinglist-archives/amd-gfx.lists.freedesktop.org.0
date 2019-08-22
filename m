Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B63AF9897A
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 04:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41AEB6EA4F;
	Thu, 22 Aug 2019 02:33:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810040.outbound.protection.outlook.com [40.107.81.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2196EA4F
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 02:33:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aef8GI8PMEam5sj2YeKK/3AlAXS9fj6zgRz22d5S4/8n8JcJdX1MZsTgJHtWsKyRVXabxDJmftuwZaoWgpaF2tBo4Z2TiFx9Bs9wrYF3FNLVQ6uBgdIWKFsaeaymG+d4K+k1unXOM/bPYJYAbs8Q13noJP2u3/iSFR47/+r18whBHVat6+YV3mpjUxR/pSnd8tq23rKHt19HoSeyZP18P/9pTXnvmI5Bfu1Y24ibh9zVC3zDn9EQ7D69fXBJSW0+eooBD9GNwUoxts8EGFy0JYfP8QcZDl1yFgaY/F+hC3jr5bfrGFo8hwO8/LkVpDPkmhbRI10t21t/ScnE+dx3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/MvLnqWvyBQZ1JFnMIEMeo/bsF8DAJ7eCRNBilBER0=;
 b=JT2fdl4KY9okzsr4nSB2AYSESpNZejtcsHVapuAnaDQ6Bv/kXaCydLJp3b5bHBtxseyM7F+O1cd1Z4pUztVcMk+T1CHAkynS4Cun+GgrR2am0hfG3ozoHE6kfobtgvj5Boj4udFcJnO/jlt0rMvBCl0iOr7jlH3RAyQW2a2n+JvJQjt8Y9lIzPbJRLe+rxEJmR+GW8994a8XL6LnI+b7Ixnahm3+/4xRHv3mqv2/eWNKQQQauruUFYg7FecxL9sF3+a+XiTrTIdooc46BCmR4xeo36wDG67d6wMEh1zi01rOIh+oJh7Be6/KBh6ppuMT+c7SHRB1nuL179ivUBDUnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB4095.namprd12.prod.outlook.com (52.135.48.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 02:33:20 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::98dd:62d2:c020:3c02]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::98dd:62d2:c020:3c02%3]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 02:33:20 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 37/37] drm/amdgpu: enable VCN DPG for Renoir
Thread-Topic: [PATCH 37/37] drm/amdgpu: enable VCN DPG for Renoir
Thread-Index: AQHVWG9DTk3jVgvKM0qREhtthuE8KacGctNw
Date: Thu, 22 Aug 2019 02:33:20 +0000
Message-ID: <MN2PR12MB35368BDC2A7CC5EEB8B593C2FBA50@MN2PR12MB3536.namprd12.prod.outlook.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
 <20190821222359.13578-38-alexander.deucher@amd.com>
In-Reply-To: <20190821222359.13578-38-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18a47254-b1ce-4c5c-bb14-08d726a918e2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4095; 
x-ms-traffictypediagnostic: MN2PR12MB4095:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4095DD32A8641AB6BB927FEBFBA50@MN2PR12MB4095.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:758;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(189003)(199004)(13464003)(81166006)(2501003)(25786009)(2906002)(8676002)(81156014)(6116002)(6246003)(3846002)(53936002)(8936002)(446003)(476003)(64756008)(486006)(66446008)(66946007)(66476007)(76116006)(66556008)(4326008)(7736002)(5660300002)(99286004)(55016002)(6436002)(14454004)(478600001)(33656002)(66066001)(9686003)(6306002)(7696005)(52536014)(11346002)(229853002)(110136005)(76176011)(54906003)(316002)(86362001)(53546011)(26005)(6506007)(102836004)(186003)(305945005)(14444005)(74316002)(256004)(966005)(71200400001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4095;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: T8yCGV1kk4DstPRfs4fZPtHU5UcdSaN63C0zlcAa8wIPwaZ+LPUS97pvXw3wB2RKS6X9EEfH8KxfrkaN5SfF0j36vSn6+Hi8wIOqKUKJeRyG7JJhEhVYjv04V0s1ygw4TQpzXrqEiLcmzAArX9wJu3CPRqflmF5iaot99369fJK5KEBTxNH6d2xcMOPhcIYpVYr31ABHPE4IAEzxJpq9Ul6L5v7wm8Kz1ZaAQFKvAw71L3BReLHMihRX20l0mNNt3Q0zKng8MbfuY/r5qOLwTa0ROB0XqSxpREEIO5GGFmkXhnD0J61u6IKwlNgmvS9k2oWb+vVyLfbmeJc5MrOJBkQ+Wj+Wkbbz/HhbcrLoBU1SEGqYiBqHFZpSHOuiTuOe0vQbVEXfDbc7cLaClISZyq0GaYg/m2i374Wjs2fLjfA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a47254-b1ce-4c5c-bb14-08d726a918e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 02:33:20.2306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wdqJAP7JFt5QzV/hYLQDFhjClFhbKT5MjEf10ZnjAXMIi5+wGGUOfvI3Sl/ym/4M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4095
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/MvLnqWvyBQZ1JFnMIEMeo/bsF8DAJ7eCRNBilBER0=;
 b=hGdM4w1kZpMMgypR93P06x7fbqEbfclySXlvXcl5/iYc11/19+L4n4nmunHbgOuDBQkL53eCplyLRy4xKMBEKWS/+8vyvYEsPHgguOPn+SFhkPbpHqLN5xcpMULrXYTISJFGt8Vegye2NEKSaqv1uxbn7n+CbsxMUblHk3dky8M=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Thai, Thong" <Thong.Thai@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPg0KDQpUaGFua3Ms
DQpQcmlrZQ0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxh
bWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQWxleA0K
PiBEZXVjaGVyDQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMjIsIDIwMTkgNjoyNCBBTQ0KPiBU
bzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IERldWNoZXIsIEFsZXhhbmRl
ciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IExpdSwgTGVvDQo+IDxMZW8uTGl1QGFtZC5j
b20+OyBUaGFpLCBUaG9uZyA8VGhvbmcuVGhhaUBhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0gg
MzcvMzddIGRybS9hbWRncHU6IGVuYWJsZSBWQ04gRFBHIGZvciBSZW5vaXINCj4gDQo+IEZyb206
IFRob25nIFRoYWkgPHRob25nLnRoYWlAYW1kLmNvbT4NCj4gDQo+IFRoaXMgd2lsbCBlbmFibGUg
aW5kaXJlY3QgU1JBTSBsb2FkaW5nIGZvciBWQ04gRFBHIG1vZGUgaW5pdGlhbGl6YXRpb24uDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaG9uZyBUaGFpIDx0aG9uZy50aGFpQGFtZC5jb20+DQo+IFJl
dmlld2VkLWJ5OiBMZW8gTGl1IDxsZW8ubGl1QGFtZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIHwgNCArKystDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NvYzE1LmMNCj4gaW5kZXggNWMyMTFmYTAzMzI4Li5mZTIyMTJkZjEyYTMgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0KPiBAQCAtMTE3Myw3ICsxMTczLDkgQEAgc3Rh
dGljIGludCBzb2MxNV9jb21tb25fZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpDQo+ICAJCQkJIEFN
RF9DR19TVVBQT1JUX0FUSFVCX0xTIHwNCj4gIAkJCQkgQU1EX0NHX1NVUFBPUlRfQVRIVUJfTUdD
RyB8DQo+ICAJCQkJIEFNRF9DR19TVVBQT1JUX0RGX01HQ0c7DQo+IC0JCWFkZXYtPnBnX2ZsYWdz
ID0gQU1EX1BHX1NVUFBPUlRfU0RNQTsNCj4gKwkJYWRldi0+cGdfZmxhZ3MgPSBBTURfUEdfU1VQ
UE9SVF9TRE1BIHwNCj4gKwkJCQkgQU1EX1BHX1NVUFBPUlRfVkNOIHwNCj4gKwkJCQkgQU1EX1BH
X1NVUFBPUlRfVkNOX0RQRzsNCj4gIAkJYWRldi0+ZXh0ZXJuYWxfcmV2X2lkID0gYWRldi0+cmV2
X2lkICsgMHg5MTsNCj4gDQo+ICAJCWlmIChhZGV2LT5wbS5wcF9mZWF0dXJlICYgUFBfR0ZYT0ZG
X01BU0spDQo+IC0tDQo+IDIuMjAuMQ0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
