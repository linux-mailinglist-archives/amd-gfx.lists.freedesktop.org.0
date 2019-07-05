Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2E460B9D
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jul 2019 20:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12F889DC5;
	Fri,  5 Jul 2019 18:59:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760057.outbound.protection.outlook.com [40.107.76.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A0489DC5
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jul 2019 18:59:33 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3596.namprd12.prod.outlook.com (20.178.199.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 5 Jul 2019 18:59:31 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.010; Fri, 5 Jul 2019
 18:59:31 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/ttm: make some functions static
Thread-Topic: [PATCH] drm/amdgpu/ttm: make some functions static
Thread-Index: AQHVM1TZ+bhjJgwx40qiXKklQxbloaa8YOGA
Date: Fri, 5 Jul 2019 18:59:31 +0000
Message-ID: <f4c1f72f-9dfa-da35-eb1f-5f58dbabdc3f@amd.com>
References: <20190705171227.21009-1-alexander.deucher@amd.com>
In-Reply-To: <20190705171227.21009-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YTXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::38) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90bbe0c9-d081-4822-dc49-08d7017ae96f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3596; 
x-ms-traffictypediagnostic: DM6PR12MB3596:
x-microsoft-antispam-prvs: <DM6PR12MB3596567992A49D92BD8C272B92F50@DM6PR12MB3596.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(189003)(199004)(6506007)(386003)(52116002)(53546011)(76176011)(99286004)(31696002)(229853002)(86362001)(102836004)(26005)(65806001)(305945005)(186003)(36756003)(14454004)(2501003)(7736002)(4326008)(8936002)(25786009)(476003)(81166006)(81156014)(2616005)(6246003)(486006)(6512007)(316002)(6436002)(6486002)(256004)(53936002)(64126003)(66476007)(66446008)(5660300002)(71200400001)(71190400001)(3846002)(6116002)(31686004)(110136005)(58126008)(68736007)(2906002)(11346002)(8676002)(65826007)(446003)(72206003)(66556008)(65956001)(73956011)(64756008)(66946007)(66066001)(478600001)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3596;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yQcTUgH9Sa9W9M8kHSQ0eBk1o+DZCchIZ0PejQJC0ccBxMCi6NOUkfSF0vR0NWgnPG/Ns8R4QMiULcpCAErVK81kSrcbLN+uiZL/VgjB78mC4REB4ZWFRVrJs+IwVDSWgiKmEUe23B489lzqJ8ccIpk68uocasqToOVKIhSftpUmzMM6eLOUdDLbofxxQAy57riJX3p5ct33RdZDafuPihBvSlViNRRhEGZF9Jy/qu6A+CMyIz8Fvv7YQ26vMMuWMQ6zXW8FCB1Z6GkujJuGrj82+IrODHkoHk9haRlJqVIxuK+vNCD5ZDEEnljm2LH5cUR3mTvs9w/aCJHsKC1f+EOhR3G94u6DMfftm8WDXDXmz8rQcGSo6+9XWAamSxEzQ8UrumRls9oHmSs9gh7sZ5RXzIcFjqfRhd0BkIyOokI=
Content-ID: <19488D4D8DDE1246B3390A92F187081B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90bbe0c9-d081-4822-dc49-08d7017ae96f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 18:59:31.1763 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3596
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/X4VQeyosvZYZ2YeSHeCJOowkm+JxvOOAlWyqldiO4=;
 b=I53JiDpu0qu8gQDcFmYh6zbb1Z/JATe67Lrd/gaWdCIA3WKnmuneUujwqbTibKxHTfg2MaR+gXvKZF42fbV8ypb321A+qc1RWdB7b+YPB5/BPH9jov7rhdQnt/ItGgJJ9Su27xCASriKG5aBoQiairkXwFugOUpC5p+1MyR3m3Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0wNSAxOjEyIHAubS4sIEFsZXggRGV1Y2hlciB3cm90ZToNCj4gTm90aWNlZCB3
aGlsZSByZXZpZXdpbmcgdGhlIGNvZGUuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGlu
ZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCg0KV2UnbGwgbmVlZCB0byBiZSBjYXJlZnVsIG5v
dCB0byBtZXJnZSB0aGlzIGNoYW5nZSBvbiBhbWQta2ZkLXN0YWdpbmcgYW5kIA0KYW1kLXN0YWdp
bmctZGttcy4gT24gdGhvc2UgYnJhbmNoZXMsIHRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkIGZyb20g
DQphbWRncHVfYW1ka2ZkX2dwdXZtLmMuDQoNClJlZ2FyZHMsDQogwqAgRmVsaXgNCg0KDQo+IC0t
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyB8IDE0ICsrKysr
KystLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5oIHwg
IDYgLS0tLS0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEzIGRlbGV0
aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+IGlu
ZGV4IGM5ZmFhNjljZDY3Ny4uZDA5MDEwNmVmMjNiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+IEBAIC0yOTksMTIgKzI5OSwxMiBAQCBzdGF0aWMgc3Ry
dWN0IGRybV9tbV9ub2RlICphbWRncHVfZmluZF9tbV9ub2RlKHN0cnVjdCB0dG1fbWVtX3JlZyAq
bWVtLA0KPiAgICAqDQo+ICAgICogQGY6IFJldHVybnMgdGhlIGxhc3QgZmVuY2UgaWYgbXVsdGlw
bGUgam9icyBhcmUgc3VibWl0dGVkLg0KPiAgICAqLw0KPiAtaW50IGFtZGdwdV90dG1fY29weV9t
ZW1fdG9fbWVtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAtCQkJICAgICAgIHN0cnVj
dCBhbWRncHVfY29weV9tZW0gKnNyYywNCj4gLQkJCSAgICAgICBzdHJ1Y3QgYW1kZ3B1X2NvcHlf
bWVtICpkc3QsDQo+IC0JCQkgICAgICAgdWludDY0X3Qgc2l6ZSwNCj4gLQkJCSAgICAgICBzdHJ1
Y3QgcmVzZXJ2YXRpb25fb2JqZWN0ICpyZXN2LA0KPiAtCQkJICAgICAgIHN0cnVjdCBkbWFfZmVu
Y2UgKipmKQ0KPiArc3RhdGljIGludCBhbWRncHVfdHRtX2NvcHlfbWVtX3RvX21lbShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwNCj4gKwkJCQkgICAgICBzdHJ1Y3QgYW1kZ3B1X2NvcHlfbWVt
ICpzcmMsDQo+ICsJCQkJICAgICAgc3RydWN0IGFtZGdwdV9jb3B5X21lbSAqZHN0LA0KPiArCQkJ
CSAgICAgIHVpbnQ2NF90IHNpemUsDQo+ICsJCQkJICAgICAgc3RydWN0IHJlc2VydmF0aW9uX29i
amVjdCAqcmVzdiwNCj4gKwkJCQkgICAgICBzdHJ1Y3QgZG1hX2ZlbmNlICoqZikNCj4gICB7DQo+
ICAgCXN0cnVjdCBhbWRncHVfcmluZyAqcmluZyA9IGFkZXYtPm1tYW4uYnVmZmVyX2Z1bmNzX3Jp
bmc7DQo+ICAgCXN0cnVjdCBkcm1fbW1fbm9kZSAqc3JjX21tLCAqZHN0X21tOw0KPiBAQCAtOTQ5
LDcgKzk0OSw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV90dG1fdHRfdW5waW5fdXNlcnB0cihzdHJ1
Y3QgdHRtX3R0ICp0dG0pDQo+ICAgI2VuZGlmDQo+ICAgfQ0KPiAgIA0KPiAtaW50IGFtZGdwdV90
dG1fZ2FydF9iaW5kKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiArc3RhdGljIGludCBh
bWRncHVfdHRtX2dhcnRfYmluZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gICAJCQkJ
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICp0Ym8sDQo+ICAgCQkJCXVpbnQ2NF90IGZsYWdzKQ0K
PiAgIHsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90
dG0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaA0KPiBpbmRleCBj
MmI3NjY5MDA0YmEuLmRlODljMjE4ZGIyNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uaA0KPiBAQCAtODYsMTIgKzg2LDYgQEAgaW50IGFtZGdwdV9jb3B5X2J1
ZmZlcihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQ2NF90IHNyY19vZmZzZXQsDQo+ICAg
CQkgICAgICAgc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqcmVzdiwNCj4gICAJCSAgICAgICBz
dHJ1Y3QgZG1hX2ZlbmNlICoqZmVuY2UsIGJvb2wgZGlyZWN0X3N1Ym1pdCwNCj4gICAJCSAgICAg
ICBib29sIHZtX25lZWRzX2ZsdXNoKTsNCj4gLWludCBhbWRncHVfdHRtX2NvcHlfbWVtX3RvX21l
bShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gLQkJCSAgICAgICBzdHJ1Y3QgYW1kZ3B1
X2NvcHlfbWVtICpzcmMsDQo+IC0JCQkgICAgICAgc3RydWN0IGFtZGdwdV9jb3B5X21lbSAqZHN0
LA0KPiAtCQkJICAgICAgIHVpbnQ2NF90IHNpemUsDQo+IC0JCQkgICAgICAgc3RydWN0IHJlc2Vy
dmF0aW9uX29iamVjdCAqcmVzdiwNCj4gLQkJCSAgICAgICBzdHJ1Y3QgZG1hX2ZlbmNlICoqZik7
DQo+ICAgaW50IGFtZGdwdV9maWxsX2J1ZmZlcihzdHJ1Y3QgYW1kZ3B1X2JvICpibywNCj4gICAJ
CQl1aW50MzJfdCBzcmNfZGF0YSwNCj4gICAJCQlzdHJ1Y3QgcmVzZXJ2YXRpb25fb2JqZWN0ICpy
ZXN2LA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
