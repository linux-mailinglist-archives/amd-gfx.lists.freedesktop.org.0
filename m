Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 463486E1E6
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 09:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9B76E5BA;
	Fri, 19 Jul 2019 07:45:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780054.outbound.protection.outlook.com [40.107.78.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572376E5BA
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 07:45:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4ufe+PUZA1OtNCq8ZmoLJTC2ZI1m27NVV8ZhczVObuD0LfU+DCM5gud0WdBapmE/16LpCY1eqS8EgvJC02Ta4/13asabRI7no+dr3X7aGYzfIWq3FcGChTksNyOv8iH7pZdcVTDfsI0kpeg78WlDJKd0HzGZN7pKUsyqJwvpfb77Jt19MHkdWybFwbE7h6S+V2facHtjo+aslSQWCPe3yA7lhrA2MvQeW6ENgMrhnD5M0EJQwTvfWKdjVDg+rolQZNeRkGc4whbeHP+rL+nUhW1HbMwmLojsHoEBO0tYohg5ZCveNzU9dZ8KjqAsn0zDO8IvRPhgyJChaUxRldOVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qv4ehoeOXhTjf+7ofGVE40K1gw/LgJ9zTFX5y0FHN+4=;
 b=m3SS9ldN9MpysL6B7i7nGIQBDoSpx1E8m6F3eK0MZ2EsKy5WHRJrufAQujsROlMIIW+sQoK0xHCEO78XLpLjnIH9TLMqZFWEgrnA+XEVcVkCNsqq1Qa8O11ufc1pZvOSBMGQ1wYLqNwA1d5SjxmpWitosxDoODk2SYhI1yzD+0ATFA33e641K0/Vg/SKoUQSjfRYFW2G/UsrMOE7pJSl2hERIpO9179nonV8g6c4QN02iwLb9aOPL0A9a033x9iDy3jQ09hdZ6VGfi76G7Jr1q6kQcnbEMhdMnZMobqqUpUx730CvUdwsU/kL1k2qcvYMCRFfPOrBedyAPtk2wS1gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3887.namprd12.prod.outlook.com (10.255.237.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Fri, 19 Jul 2019 07:45:37 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 07:45:37 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
Subject: RE: [PATCH] drm/amdgpu: fix two documentation mismatch issues
Thread-Topic: [PATCH] drm/amdgpu: fix two documentation mismatch issues
Thread-Index: AQHVPdAL9Uv1aveFGkKpifW5vvBnTKbRkCYg
Date: Fri, 19 Jul 2019 07:45:37 +0000
Message-ID: <MN2PR12MB3309B0C13710653DF9840933ECCB0@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190719011943.10920-1-xywang.sjtu@sjtu.edu.cn>
In-Reply-To: <20190719011943.10920-1-xywang.sjtu@sjtu.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 777c845d-305b-43bb-9987-08d70c1d1731
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3887; 
x-ms-traffictypediagnostic: MN2PR12MB3887:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB38872C37DEAF3D9677316A9FECCB0@MN2PR12MB3887.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:208;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(13464003)(199004)(189003)(256004)(26005)(8936002)(7696005)(68736007)(8676002)(76116006)(102836004)(86362001)(186003)(76176011)(6506007)(25786009)(33656002)(478600001)(81156014)(74316002)(81166006)(476003)(14454004)(7736002)(446003)(486006)(966005)(53936002)(11346002)(2906002)(4326008)(6916009)(316002)(9686003)(55016002)(3846002)(6306002)(6246003)(6116002)(5660300002)(2171002)(66946007)(66556008)(64756008)(66446008)(66476007)(71190400001)(71200400001)(54906003)(229853002)(99286004)(305945005)(52536014)(66066001)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3887;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: n+gz3HKrCC5iWnJu1PLQ0lnPaLBDIwXbPX3CF00pnj4FABu410AVinAKpEHa/YnpruohDPVokvga/Bv9g7dNgoCAG1Ad8sEUBM9Wb9rFMYIvURD7w7uTYK5imEfC8kPESK42rmUmKXuq2DcXeTIRV7pe3J0A9u8wWx9pDQfhWC3RxvWPHTKtDebk/abhSRr/Zmx6kd1nnvM2bg0gP27JHbkV8rCL+oUvn15qPduvsr5Q59BYOlW2gyk11cSln2lrhaSRb8zyM3cm8tnNdFzchbCg7GCRi25S57lylzFkzG4FhIcFVZfiUG05BXurZNo9EuGZmNtHz3jNeh6VZ4jbi9C9WYfyj1FLYy61M8mObiGho3LX9ns0iWMFfG8Ag4bN/DR/1BBgq8Cl7ANe2otK+wBpRt2FvUv9LcOJ7WvutFc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 777c845d-305b-43bb-9987-08d70c1d1731
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 07:45:37.7676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruihuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3887
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qv4ehoeOXhTjf+7ofGVE40K1gw/LgJ9zTFX5y0FHN+4=;
 b=giHMAxnD2fh+S5/VhEKN/KrkyXwIi1VcwAERRL1fm4/HdRT0LaPCiy8KY0eJktA7GVunq5q021slK2Pp3xHSai7jFkcOnadgBScaboh/zcll66KZOqJKUFou/Wzc1nte13NKfaIh9wuEktMtirvRWk0MdyctbZCrRj2MiNf6JAg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Zhou,
 David\(ChunMing\)" <David1.Zhou@amd.com>,
 "trivial@kernel.org" <trivial@kernel.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gV2FuZyBYaWF5YW5n
DQo+IFNlbnQ6IEZyaWRheSwgSnVseSAxOSwgMjAxOSA5OjIwIEFNDQo+IENjOiBaaG91LCBEYXZp
ZChDaHVuTWluZykgPERhdmlkMS5aaG91QGFtZC5jb20+OyBXYW5nIFhpYXlhbmcNCj4gPHh5d2Fu
Zy5zanR1QHNqdHUuZWR1LmNuPjsgdHJpdmlhbEBrZXJuZWwub3JnOyBhbWQtDQo+IGdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IERldWNoZXIsIEFsZXhhbmRlcg0KPiA8QWxleGFuZGVyLkRldWNo
ZXJAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuDQo+IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5j
b20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogZml4IHR3byBkb2N1bWVudGF0aW9u
IG1pc21hdGNoIGlzc3Vlcw0KPiANCj4gVGhlIGZ1bmN0aW9uIG5hbWUgbWVudGlvbmVkIGluIHRo
ZSBkb2N1bWVudGF0aW9uYWwgY29tbWVudHMNCj4gbWlzbWF0Y2hlcyB0aGUgYWN0dWFsIG9uZS4g
VGhlIG1pc21hdGNoIG1heSBtYWtlIHRyb3VibGUgZm9yIGF1dG9tYXRpYw0KPiBkb2N1bWVudGF0
aW9uIGdlbmVyYXRpb24uIE9uZSBvZiB0aGUgZXJyb25vdXMgbmFtZSBoYXMgc2VlbiB0byBiZQ0K
PiBtaXN1c2VkIGFuZCBmaXhlZCBpbiBjb21taXQgYmM1YWIyZDI5YjhhICgiZHJtL2FtZGdwdTog
Zml4IHR5cG8gaW4NCj4gZnVuY3Rpb24gc2RtYV92NF8wX3BhZ2VfcmVzdW1lIikuDQo+IA0KPiBU
aGVyZSBpcyBhcHBhcmVudGx5IG5vIGZ1bmN0aW9uYWwgY2hhbmdlIGluIHRoZSBwYXRjaC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgWGlheWFuZyA8eHl3YW5nLnNqdHVAc2p0dS5lZHUuY24+
DQoNClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPg0KDQo+IC0tLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgfCA0ICsrLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMNCj4gYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYw0KPiBpbmRleCA0NDI4MDE4NjcyZDMu
LjM3NDgwNzQyMjBiYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
c2RtYV92NF8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8w
LmMNCj4gQEAgLTQ1NSw3ICs0NTUsNyBAQCBzdGF0aWMgdWludDY0X3QNCj4gc2RtYV92NF8wX3Bh
Z2VfcmluZ19nZXRfd3B0cihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpICB9DQo+IA0KPiAgLyoq
DQo+IC0gKiBzZG1hX3Y0XzBfcmluZ19zZXRfd3B0ciAtIGNvbW1pdCB0aGUgd3JpdGUgcG9pbnRl
cg0KPiArICogc2RtYV92NF8wX3BhZ2VfcmluZ19zZXRfd3B0ciAtIGNvbW1pdCB0aGUgd3JpdGUg
cG9pbnRlcg0KPiAgICoNCj4gICAqIEByaW5nOiBhbWRncHUgcmluZyBwb2ludGVyDQo+ICAgKg0K
PiBAQCAtNjg4LDcgKzY4OCw3IEBAIHN0YXRpYyB2b2lkIHNkbWFfdjRfMF9wYWdlX3N0b3Aoc3Ry
dWN0DQo+IGFtZGdwdV9kZXZpY2UgKmFkZXYpICB9DQo+IA0KPiAgLyoqDQo+IC0gKiBzZG1hX3Zf
MF9jdHhfc3dpdGNoX2VuYWJsZSAtIHN0b3AgdGhlIGFzeW5jIGRtYSBlbmdpbmVzIGNvbnRleHQN
Cj4gc3dpdGNoDQo+ICsgKiBzZG1hX3Y0XzBfY3R4X3N3aXRjaF9lbmFibGUgLSBzdG9wIHRoZSBh
c3luYyBkbWEgZW5naW5lcyBjb250ZXh0DQo+ICsgc3dpdGNoDQo+ICAgKg0KPiAgICogQGFkZXY6
IGFtZGdwdV9kZXZpY2UgcG9pbnRlcg0KPiAgICogQGVuYWJsZTogZW5hYmxlL2Rpc2FibGUgdGhl
IERNQSBNRXMgY29udGV4dCBzd2l0Y2guDQo+IC0tDQo+IDIuMTEuMA0KPiANCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5n
IGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
