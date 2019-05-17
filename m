Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B64121E15
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 21:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6032891C1;
	Fri, 17 May 2019 19:15:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680073.outbound.protection.outlook.com [40.107.68.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32370891C1
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 19:15:49 +0000 (UTC)
Received: from BN6PR12MB1364.namprd12.prod.outlook.com (10.168.228.22) by
 BN6PR12MB1857.namprd12.prod.outlook.com (10.175.99.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Fri, 17 May 2019 19:15:47 +0000
Received: from BN6PR12MB1364.namprd12.prod.outlook.com
 ([fe80::304c:e454:c739:254a]) by BN6PR12MB1364.namprd12.prod.outlook.com
 ([fe80::304c:e454:c739:254a%11]) with mapi id 15.20.1900.010; Fri, 17 May
 2019 19:15:47 +0000
From: "Lin, Amber" <Amber.Lin@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu/soc15: skip reset on init
Thread-Topic: [PATCH] drm/amdgpu/soc15: skip reset on init
Thread-Index: AQHVDLyYTJsvNeMdgU+XI4QzC33zqaZvZXAAgAAlqACAACVJgA==
Date: Fri, 17 May 2019 19:15:47 +0000
Message-ID: <017cfa62-2ccf-6605-e4ba-99768208103d@amd.com>
References: <20190517142647.26034-1-alexander.deucher@amd.com>
 <a986c8b7-4255-e70b-4e39-102cc57cda92@amd.com>
 <CADnq5_PKFA62OMa4H9gKy4R9rk38mY0EKhZGxf51N36DkTEavQ@mail.gmail.com>
In-Reply-To: <CADnq5_PKFA62OMa4H9gKy4R9rk38mY0EKhZGxf51N36DkTEavQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::28) To BN6PR12MB1364.namprd12.prod.outlook.com
 (2603:10b6:404:1e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3ec75b4-63df-4feb-06bf-08d6dafc110d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1857; 
x-ms-traffictypediagnostic: BN6PR12MB1857:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB185782AB1B0551C222940E19E10B0@BN6PR12MB1857.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(396003)(136003)(366004)(376002)(199004)(189003)(1411001)(446003)(6512007)(2906002)(73956011)(66946007)(186003)(36756003)(6916009)(72206003)(486006)(64756008)(66446008)(66476007)(66556008)(4326008)(26005)(66066001)(11346002)(966005)(53936002)(6306002)(14454004)(25786009)(478600001)(256004)(2616005)(476003)(6246003)(7736002)(8676002)(102836004)(6116002)(3846002)(5660300002)(229853002)(31686004)(68736007)(6486002)(305945005)(86362001)(81156014)(6436002)(8936002)(81166006)(53546011)(6506007)(386003)(316002)(71200400001)(52116002)(31696002)(71190400001)(76176011)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1857;
 H:BN6PR12MB1364.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ome4/bT4Wu6Wi0QPNUOBmRztJU8gI5h/JuFVfrlmCT/jFO4QCCa3c00VPGdqdngVyJnmKjTUp2e56OR45z7mnrdDdkzSJPz0D5/Vg+H1B40FaQgJO8WY5YP2tFYTWmNpk/Io3oEINLcEfcQef3Y2thMA/FzYL/tOSD5kr0Ek9Eob1KUdGCtYCVUsn7YrLB8O+cTtc1gkonWq6bCQqPdckFepUxE0XOqTcn5oEeDNE8nMYZQ0fGVdpkyRoEDfVHNMeo6Wvz9VkXT24FU1by5uezLGYoWrXxKNBia6yKf5jm0mzHZxv+YB1sNw4RautiegSdnvbviu8EdwBVHWdv7y8rfhSNhpxL+D/utLN9WKVKRG5VDBu2e4KIFRFotiktE6qk9AwTTv0A9Xf2PP2McyTNm21FkJrwn1BFumSUKp3fo=
Content-ID: <89370A5653DF4F41B77C041A5BE45A65@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ec75b4-63df-4feb-06bf-08d6dafc110d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 19:15:47.5046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1857
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/hioN/oeRbF7jSWZmNJbcQLyOLOmu2ZNfgqpJOZlw4=;
 b=XnQ0Wd8wUizwV66zWKccSrzc5rtDQ9c8vw+h0phzNsgg9oSvP2c9p9+qYjiQUhLJO6UYaKoqOodHtsdFcT3pBYq6AL+7LMX2iyWbWHUD9y8TPWIcW4QWPMN0dondSeyaOrPe6oRKkQBwnLYXNIG3TU3DpV17VUgT/xXueaXT4WE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Amber.Lin@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IEFtYmVyIExpbiA8QW1iZXIuTGluQGFtZC5jb20+DQoNCk9uIDIwMTktMDUtMTcg
MTowMiBwLm0uLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFp
bF0NCj4NCj4gT24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMTA6NDcgQU0gTGluLCBBbWJlciA8QW1i
ZXIuTGluQGFtZC5jb20+IHdyb3RlOg0KPj4NCj4+DQo+PiBPbiAyMDE5LTA1LTE3IDEwOjI2IGEu
bS4sIEFsZXggRGV1Y2hlciB3cm90ZToNCj4+PiBbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdDQo+
Pj4NCj4+PiBOb3QgbmVjZXNzYXJ5IG9uIHNvYzE1IGFuZCBicmVha3MgZHJpdmVyIHJlbG9hZCBv
biBzZXJ2ZXIgY2FyZHMuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+Pj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcN
Cj4+PiAtLS0NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIHwgNSAr
KysrKw0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4+Pg0KPj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0KPj4+IGluZGV4IDMyZGM1YTEyODI0OS4uNzhiZDRm
YzA3YmFiIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1
LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQo+Pj4gQEAg
LTc2MSw2ICs3NjEsMTEgQEAgc3RhdGljIGJvb2wgc29jMTVfbmVlZF9yZXNldF9vbl9pbml0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPj4+ICAgIHsNCj4+PiAgICAgICAgICAgdTMyIHNv
bF9yZWc7DQo+Pj4NCj4+PiArICAgICAgIC8qIEp1c3QgcmV0dXJuIGZhbHNlIGZvciBzb2MxNSBH
UFVzLiAgUmVzZXQgZG9lcyBub3Qgc2VlbSB0bw0KPj4+ICsgICAgICAgICogYmUgbmVjZXNzYXJ5
Lg0KPj4+ICsgICAgICAgICovDQo+Pj4gKyAgICAgICByZXR1cm4gZmFsc2U7DQo+Pj4gKw0KPj4+
ICAgICAgICAgICBpZiAoYWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBVKQ0KPj4+ICAgICAgICAgICAg
ICAgICAgIHJldHVybiBmYWxzZTsNCj4+IFNob3VsZCByZW1vdmUgdGhlIHJlc3Qgb2YgY29kZSBp
biB0aGlzIGZ1bmN0aW9uIGFuZCBzb2xfcmVnIGFzIHdlbGw/DQo+PiBTaW1wbHkgcmV0dXJuIGZh
bHNlPw0KPiBJIHdhcyB0aGlua2luZyB3ZSdkIGxlYXZlIGl0IGluIHBsYWNlIGZvciBub3cgaW4g
Y2FzZSB3ZSBuZWVkIHRvDQo+IHJlLWVuYWJsZSBpdCBmb3Igc29tZXRoaW5nIGVsc2UgaW4gdGhl
IGZ1dHVyZSwgYnV0IEkgZ3Vlc3Mgd2UgY2FuIGp1c3QNCj4gcmV2ZXJ0IHRoZSBjaGFuZ2UgaWYg
bmVlZCBiZS4gIEkgZG9uJ3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9uIGVpdGhlcg0KPiB3YXkuDQo+
DQo+IEFsZXgNCj4NCj4+PiAtLQ0KPj4+IDIuMjAuMQ0KPj4+DQo+Pj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+PiBhbWQtZ2Z4IG1haWxpbmcgbGlz
dA0KPj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQo+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4gYW1kLWdmeCBtYWlsaW5nIGxp
c3QNCj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
