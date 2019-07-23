Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B14571DBD
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 19:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966E46E323;
	Tue, 23 Jul 2019 17:31:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700076.outbound.protection.outlook.com [40.107.70.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655F66E323
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 17:31:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCOQNBuusy5j8m25isYbu+vC1qctKf2l8gvZeEQ+CgxeYgx7W2CUvmBiVttdDhL+xg7O1eQJEhLVnVtkcz+b25C1zUqwC3W8lIovPl9ocDkJg6e8/aJViQFyrqWfd5qra2RvSGwDSFLTHwGwwwngqe8NAQTy+ZOFd/qu0BO45mh66YaXvMzMNWsXCrzMh/HLNBz5i39j7XOUkmjRbs0KU75LHL9DSi9EaAzgnv3cT8LTa2vy2HD/odhJvEuJj+JnOSJwSk7Y1sTvJqDTcZVJbp2r0TTUKsUzGsYMHryteqiAvE3D8Yv1Da55gNCfk7IbfD/FypIzObikAm7rORLqmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwsqlv1kli0R2mTR9VyiFqHCJ3zH+OR7nT5PGnX/m4o=;
 b=LMFbKXnFEaBTfusnnu25EImPQJ0D10XnStbYWkIUUy1dtfwzuSfjWBcodZiYhaV5P2gQfbv3YRtcu4XMW+kwqjPWT2ff3y+kkoGqRMJToeha++tNiuw9DnHki3DUw6C8EeflRqX+peKt7G5eV6uAscY+fMCISZBDcFZa+l9Nm6i5FgHeqgMs3cXPHR7O/PsGuRKCS3n4ybLsGnd19+F+9Faxaf2fBuBqa1m5lHuxWY5WPZRGVvQkcEn4MgQDV1kC1W7eXwgMz2gLM3zWnGc8AQFoFBy1/nsz+yAsPPrWyzr3g3g3oMVF6xRpwxJQHuwJaLAELjfFoRklbv+dhBScyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1838.namprd12.prod.outlook.com (10.175.49.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Tue, 23 Jul 2019 17:31:54 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::59df:2c5b:b1e2:8845]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::59df:2c5b:b1e2:8845%3]) with mapi id 15.20.2094.017; Tue, 23 Jul 2019
 17:31:54 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>
Subject: Re: [PATCH 1/3] drm/amdgpu: Fix hard hang for S/G display BOs.
Thread-Topic: [PATCH 1/3] drm/amdgpu: Fix hard hang for S/G display BOs.
Thread-Index: AQHVQXBVBhKxn09G006MKi9tbuJTFqbYYcMAgAAUYoA=
Date: Tue, 23 Jul 2019 17:31:54 +0000
Message-ID: <ced516f5-546d-cd49-6e0e-87d2528bde41@amd.com>
References: <1563897851-11501-1-git-send-email-andrey.grodzovsky@amd.com>
 <1563897851-11501-2-git-send-email-andrey.grodzovsky@amd.com>
 <d4c126b7-4fa5-19ff-6687-9a260927dc67@daenzer.net>
In-Reply-To: <d4c126b7-4fa5-19ff-6687-9a260927dc67@daenzer.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::44) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 038b2cd1-6431-40fd-5ea7-08d70f93a762
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1838; 
x-ms-traffictypediagnostic: MWHPR12MB1838:
x-microsoft-antispam-prvs: <MWHPR12MB18386C7C9EF627B90FF4251AEAC70@MWHPR12MB1838.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(52314003)(199004)(43544003)(189003)(14454004)(54906003)(6436002)(4326008)(478600001)(316002)(31696002)(66066001)(86362001)(6916009)(66946007)(99286004)(7736002)(6512007)(66446008)(64756008)(66556008)(6246003)(66476007)(2906002)(386003)(36756003)(6116002)(25786009)(8936002)(53936002)(446003)(3846002)(102836004)(81156014)(186003)(256004)(68736007)(31686004)(26005)(81166006)(8676002)(11346002)(6486002)(486006)(53546011)(476003)(2616005)(76176011)(71200400001)(305945005)(6506007)(71190400001)(229853002)(52116002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1838;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +Pj8fybEbZZuFuUTkdOK++w6PQo3QbNcJuPYUnn8Q/zEV3isOQLk6+cjmj+iEbUozi+OW7M/tfvn/flxiutv+DEOpFOxd319mI91zzI6DWKhvYk4jR83+sHHA3Ypywvp2xPePl2HV3U7FHr/25v4JS6A8AnX/GzBBhZz8Tr8kLZ2YHudTTd5fjruZltr195hkiTCf5Yz82QHB4KOTU+PO4+5Fp8D+s4KBbQ0vnoATg7LTTubGkHNAScOVQItba48nGT0aXYX+1Vr4Qgh5jD3gXNVMKH3RHTOOZmJyfIh74mjg79TiLwVjBWG1lUQnFYYQbqjHFzF93giebgAaieu1ntoKOT+iMUniUEsWS8yQsePxRQQc2/cWnvbNlthavC/zTQStH99j/fh+qGp2svWwpziKeY5E8zogPI2W0e5Tz4=
Content-ID: <A716D21BC8A4DE4B8528C6DAA8BE840E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 038b2cd1-6431-40fd-5ea7-08d70f93a762
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 17:31:54.2047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agrodzov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1838
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwsqlv1kli0R2mTR9VyiFqHCJ3zH+OR7nT5PGnX/m4o=;
 b=JozT2W5BljxqOo/IW8M1iZLh/iTS/P9PNyEDPDfA3kEVWytJkdnMcoSzQFFzMu29uQrEiShX28PbiRZWdmQL1mRDZdNuNdZdFAfrzPiJ+wpB6t0SGCROSuPA8ay6o744nIZoOP2M1Z3whk7eB/By40/c66ULqD0RtM4qiLVYhjg=
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

DQpPbiA3LzIzLzE5IDEyOjE4IFBNLCBNaWNoZWwgRMOkbnplciB3cm90ZToNCj4gT24gMjAxOS0w
Ny0yMyA2OjA0IHAubS4sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOg0KPj4gSFcgcmVxdWlyZXMg
Zm9yIGNhY2hpbmcgdG8gYmUgdW5zZXQgZm9yIHNjYW5vdXQgQk8NCj4+IG1hcHBpbmdzIHdoZW4g
dGhlIEJPIHBsYWNlbWVudCBpcyBpbiBHVFQgbWVtb3J5Lg0KPj4gVXN1YWxseSB0aGUgZmxhZyB0
byB1bnNldCBpcyBwYXNzZWQgZnJvbSB1c2VyIG1vZGUNCj4+IGJ1dCBmb3IgRkIgbW9kZSB0aGlz
IHdhcyBtaXNzaW5nLg0KPj4NCj4+IFN1Z2dlc3RlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kg
PGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+DQo+PiBSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPj4gVGVzdGVkLWJ5OiBTaGlyaXNoIFMgPHNo
aXJpc2guc0BhbWQuY29tPg0KPj4gLS0tDQo+PiAgIFsuLi5dDQo+Pg0KPj4gQEAgLTE2Niw2ICsx
NjYsMTQgQEAgc3RhdGljIGludCBhbWRncHVmYl9jcmVhdGVfcGlubmVkX29iamVjdChzdHJ1Y3Qg
YW1kZ3B1X2ZiZGV2ICpyZmJkZXYsDQo+PiAgIAkJCWRldl9lcnIoYWRldi0+ZGV2LCAiRkIgZmFp
bGVkIHRvIHNldCB0aWxpbmcgZmxhZ3NcbiIpOw0KPj4gICAJfQ0KPj4gICANCj4+ICsJLyoNCj4+
ICsJICogSWYgdGhlIEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQyBmbGFnIHdhcyByZW1v
dmVkIGR1cmluZyBCTw0KPj4gKwkgKiBjcmVhdGlvbiBpdCBtZWFucyB0aGF0IFVTV0MgaXMgbm90
IHN1cHBvcnRlZCBmb3IgdGhpcyBib2FyZCBhbmQNCj4+ICsJICogc28gdG8gYXZvaWQgaGFuZyBj
YXVzZWQgYnkgcGxhY2VtZW50IG9mIHNjYW5vdXQgQk8gaW4gR1RUIG9uIGNlcnRhaW4NCj4+ICsJ
ICogQVBVcyBhbmQgc3RpbGwgbGlnaHQgdXAsIGZvcmNlIHRoZSBCTyBwbGFjZW1lbnQgdG8gVlJB
TS4NCj4+ICsJICovDQo+PiArCWlmIChhYm8tPmZsYWdzICYgfkFNREdQVV9HRU1fQ1JFQVRFX0NQ
VV9HVFRfVVNXQykNCj4+ICsJCWRvbWFpbiAgPSBBTURHUFVfR0VNX0RPTUFJTl9WUkFNOw0KPiBU
aGUgY29tbWVudCBzb3VuZHMgbGlrZSB5b3UgbWVhbnQNCj4NCj4gCWlmICghKGFiby0+ZmxhZ3Mg
JiBBTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0MpKQ0KPiAJCWRvbWFpbiAgPSBBTURHUFVf
R0VNX0RPTUFJTl9WUkFNOw0KPg0KPiA/DQoNCg0KWWVzLCBub3Qgc3VyZSBob3cgdGhpcyBoYXBw
ZW5lZCB0byBtZS4uLg0KDQoNCj4NCj4gQW55d2F5LCB0aGlzIHNob3VsZCBiZSBoYW5kbGVkIGlu
IGFtZGdwdV9kaXNwbGF5X3N1cHBvcnRlZF9kb21haW5zDQo+IGluc3RlYWQgKGUuZy4gYnkgbm90
IGFsbG93aW5nIEdUVCBpZiBDT05GSUdfWDg2XzMyIGlzIGRlZmluZWQpLA0KDQoNCldlIGhhdmUg
ZHJtX2FyY2hfY2FuX3djX21lbW9yeSBmdW5jdGlvbiB0byBjb3ZlciBhbGwgdGhlIGNhc2VzIHdo
ZW4gVVNXQyANCm1hcHBpbmcgaXMgbm90IGFsbG93ZWQsIHdoeSB0aGUgQ09ORklHX1g4Nl8zMiBo
ZXJlID8NCg0KDQo+IG90aGVyd2lzZSB0aGUgQk8gY291bGQgc3RpbGwgYmUgcGlubmVkIHRvIEdU
VCBsYXRlci4NCg0KVGhlIG9ubHkgb3RoZXIgbGF0ZXIgcGxhY2UgSSBrbm93IGlzIGRtX3BsYW5l
X2hlbHBlcl9wcmVwYXJlX2ZiIG9mIHdoaWNoIA0KSSB0YWtlIGNhcmUgaW4gcGF0Y2ggMy4gV2hh
dCBvdGhlciBwbGFjZXMgeW91IGhhdmUgaW4gbWluZCA/DQoNCg0KQW5kcmV5DQoNCg0KPg0KPg0K
Pj4gQEAgLTc2MSw2ICs3NjIsNyBAQCBpbnQgYW1kZ3B1X21vZGVfZHVtYl9jcmVhdGUoc3RydWN0
IGRybV9maWxlICpmaWxlX3ByaXYsDQo+PiAgIAlhcmdzLT5zaXplID0gQUxJR04oYXJncy0+c2l6
ZSwgUEFHRV9TSVpFKTsNCj4+ICAgCWRvbWFpbiA9IGFtZGdwdV9ib19nZXRfcHJlZmVycmVkX3Bp
bl9kb21haW4oYWRldiwNCj4+ICAgCQkJCWFtZGdwdV9kaXNwbGF5X3N1cHBvcnRlZF9kb21haW5z
KGFkZXYpKTsNCj4+ICsNCj4+ICAgCXIgPSBhbWRncHVfZ2VtX29iamVjdF9jcmVhdGUoYWRldiwg
YXJncy0+c2l6ZSwgMCwgZG9tYWluLCBmbGFncywNCj4+ICAgCQkJCSAgICAgdHRtX2JvX3R5cGVf
ZGV2aWNlLCBOVUxMLCAmZ29iaik7DQo+PiAgIAlpZiAocikNCj4+DQo+IERyb3AgdGhpcyBodW5r
IHdpdGggb25seSB3aGl0ZXNwYWNlIGNoYW5nZXMuDQo+DQo+DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
