Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F2CD4A72
	for <lists+amd-gfx@lfdr.de>; Sat, 12 Oct 2019 00:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D3F6ECA3;
	Fri, 11 Oct 2019 22:44:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730066.outbound.protection.outlook.com [40.107.73.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70136ECA3
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 22:44:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMJymIjMU2W04U+TfbLAFrqrGRO3zDJ7bUIrV6Wjmvh/wFp63//pytSUfLTxaUcGdQcCbZlvHg8zm1G+0MwoSM8ynsZpzVKngpDjrx+PKf9m7WmG/+ujmY4Wow3IXca1bSJPuPHvHO1HBWFtyTJIY29wq2qE/2NDawC0yo8UlfFqKZiEYzue3MzVVwqDY7xF/WL8qTdGMU0enWjhEkhSvafXxWP5ncoaW/8pdu6nCKfl0NpW5L3vfkpQ/y9YQkALBg6CTWqg7D6ghCi3/ICOVn4Di/4WrWek0ATpTNDr6Oth2QqZ4No2SWFamlchRSs0yDKLR/hpiJUQoW251dnZCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+yPys1bE3fFlWdmRJy/pJjr5Sa/XW52K766Ri3MDrY=;
 b=H4trsNTMyhZWWwnvhSLqH0LpZJFjtj/ahheCVrxBOk8eq1f9xCgYzJzpyut+8fskp8N/wjIiBRRAATc0w4EB6Yhe8Nhz5PGhO06Zdm5JtZgO5IxiX1FfwBWV7X3h5qna6k+O1Q4qtkB/twlWekSVNuDrPN+muEvGojHGYnrxAZRl3o/YnqFnEuDh9oud7n7l9+3+tiLhp2fUT1KD9QuqtdZjoz7aY4pX7qGQcBypkygEE2N6xG/PQb6D1RLy59aoU5snrJx06RuIBrwogl6VNFvXf5HW3lGYty+A2IBBriDJFUWrgc6rYd/dlWYm3dz/AJsKvuzMZnBxAb2DwAsd7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BY5PR12MB4146.namprd12.prod.outlook.com (52.135.55.88) by
 BY5PR12MB4116.namprd12.prod.outlook.com (10.255.126.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Fri, 11 Oct 2019 22:44:28 +0000
Received: from BY5PR12MB4146.namprd12.prod.outlook.com
 ([fe80::915:89b2:7fad:ccfc]) by BY5PR12MB4146.namprd12.prod.outlook.com
 ([fe80::915:89b2:7fad:ccfc%7]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 22:44:28 +0000
From: "Tuikov, Luben" <Luben.Tuikov@amd.com>
To: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/8] drm/amdgpu: add a generic fb accessing helper function
Thread-Topic: [PATCH 2/8] drm/amdgpu: add a generic fb accessing helper
 function
Thread-Index: AQHVf+cWZc99rWfUmkKsMoH6Dcc4pKdWCw8A
Date: Fri, 11 Oct 2019 22:44:28 +0000
Message-ID: <d9b839fe-7545-adcf-4b57-1436eef173ec@amd.com>
References: <20191011035033.24935-1-tianci.yin@amd.com>
 <20191011035033.24935-2-tianci.yin@amd.com>
In-Reply-To: <20191011035033.24935-2-tianci.yin@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::40) To BY5PR12MB4146.namprd12.prod.outlook.com
 (2603:10b6:a03:20d::24)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89794235-dc2d-4a64-0dfc-08d74e9c92e7
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BY5PR12MB4116:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB411667565D859BFE3C57D0AC99970@BY5PR12MB4116.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(189003)(199004)(71190400001)(4326008)(6246003)(25786009)(6506007)(53546011)(478600001)(66066001)(14454004)(99286004)(76176011)(52116002)(298455003)(31686004)(386003)(66556008)(36756003)(81156014)(8676002)(81166006)(14444005)(256004)(71200400001)(66946007)(66476007)(66446008)(64756008)(8936002)(7736002)(2501003)(2906002)(186003)(26005)(486006)(5660300002)(11346002)(476003)(2616005)(446003)(86362001)(31696002)(6486002)(6436002)(4001150100001)(3846002)(6116002)(54906003)(316002)(110136005)(229853002)(102836004)(6512007)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4116;
 H:BY5PR12MB4146.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AApiU51webm0YNctnjrQcHFTTeJelWfUJgHsgtiGC4+xCjYFxU5at91qMODUBrWj6NYKS6lq+r8AnJGXoY3pc+vDoA7s92SLCN4McA0Ao8DApb2ADuEby60Q7KjrtX7KFO4eusndLoWqVqkAyjgVsU24oxF1z2mfLEDYHNiI7Y8JndkRM9JX9FDkWb8han04etl5ZnTXEE65g5mER3rSi9+0SNWEaXpoUVyRgmoFHQpnFe/ruZaofLXNpGizx2hHZHWYGMhDxpL49NVrWwA7wYzAmufFYE14XlyB52VdQYII5SsJgAokSlEdgWHVV70aS1uEif8O7FWcFgj031n9wXb/btZtrXt821jm/0ZJl4V1YTSiy5KIWcgKIVwsa2FqC89DizPxMbkZtlyC66imzWeLE/wpWxXyr1oduI4KTc0=
Content-ID: <A37BDEDBDC64644D9985501DCF1444C5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89794235-dc2d-4a64-0dfc-08d74e9c92e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 22:44:28.4487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d16wLJZqsSCXrEa9GP6nvdLukSx6I7WtDWDRZX1/P/QA5gl3ElOthjjck3NHsyQW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4116
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+yPys1bE3fFlWdmRJy/pJjr5Sa/XW52K766Ri3MDrY=;
 b=1Uz7g4hIuc6DjLDlpQGO8qtxdj2kzl4EKUV6AVNCV54fypWgJyxihledRDky7cORdw+6jZ9NG/nbruf0suz5iFUI09iZ58lmg5MwomNtCITDqnwnflcYkO6VjQXb65IXNDBJ9dKCI+RwwiYFE3sUrgY2fR5/Or1OroAEMLK+eMI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luben.Tuikov@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0xMCAxMTo1MCBwLm0uLCBUaWFuY2kgWWluIHdyb3RlOg0KPiBGcm9tOiAiVGlh
bmNpLllpbiIgPHRpYW5jaS55aW5AYW1kLmNvbT4NCj4gDQo+IGFkZCBhIGdlbmVyaWMgaGVscGVy
IGZ1bmN0aW9uIGZvciBhY2Nlc3NpbmcgZnJhbWVidWZmZXIgdmlhIE1NSU8NCj4gDQo+IENoYW5n
ZS1JZDogSTRiYWEwYWE1M2M5M2E5NGMyZWZmOThjNjIxMWE2MWYzNjkyMzk5ODINCj4gUmV2aWV3
ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gU2lnbmVk
LW9mZi1ieTogVGlhbmNpLllpbiA8dGlhbmNpLnlpbkBhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oICAgICAgICAgICB8ICAyICsrDQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgICAgfCAzNCArKysrKysrKysr
KysrKysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292ZXJ5
LmMgfCAxMyArLS0tLS0tDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDEy
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCj4gaW5k
ZXggNTFjY2YxNzVjZGEwLi4xMTAyZTZiYWU1ZDUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oDQo+IEBAIC05OTEsNiArOTkxLDggQEAgaW50IGFtZGdwdV9kZXZpY2VfaW5p
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gIHZvaWQgYW1kZ3B1X2RldmljZV9maW5p
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsNCj4gIGludCBhbWRncHVfZ3B1X3dhaXRfZm9y
X2lkbGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiAgDQo+ICtpbnQgYW1kZ3B1X2Rl
dmljZV92cmFtX2FjY2VzcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgbG9mZl90IHBvcywN
Cj4gKwkJCSAgICAgIHVpbnQzMl90ICpidWYsIHNpemVfdCBzaXplLCBib29sIHdyaXRlKTsNCj4g
IHVpbnQzMl90IGFtZGdwdV9tbV9ycmVnKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50
MzJfdCByZWcsDQo+ICAJCQl1aW50MzJfdCBhY2NfZmxhZ3MpOw0KPiAgdm9pZCBhbWRncHVfbW1f
d3JlZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgcmVnLCB1aW50MzJfdCB2
LA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rldmlj
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+IGluZGV4
IDU5ODE1OGU5NWVjMS4uZmIyMWVjMWY4YTYxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+IEBAIC0xNTQsNiArMTU0LDQwIEBAIGJvb2wgYW1k
Z3B1X2RldmljZV9pc19weChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPiAgCXJldHVybiBmYWxz
ZTsNCj4gIH0NCj4gIA0KPiArLyoqDQo+ICsgKiBWUkFNIGFjY2VzcyBoZWxwZXIgZnVuY3Rpb25z
Lg0KPiArICoNCj4gKyAqIGFtZGdwdV9kZXZpY2VfdnJhbV9hY2Nlc3MgLSByZWFkL3dyaXRlIGEg
YnVmZmVyIGluIHZyYW0NCj4gKyAqDQo+ICsgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVy
DQo+ICsgKiBAcG9zOiBvZmZzZXQgb2YgdGhlIGJ1ZmZlciBpbiB2cmFtDQo+ICsgKiBAYnVmOiB2
aXJ0dWFsIGFkZHJlc3Mgb2YgdGhlIGJ1ZmZlciBpbiBzeXN0ZW0gbWVtb3J5DQo+ICsgKiBAc2l6
ZTogcmVhZC93cml0ZSBzaXplLCBzaXplb2YoQGJ1ZikgbXVzdCA+IEBzaXplDQo+ICsgKiBAd3Jp
dGU6IHRydWUgLSB3cml0ZSB0byB2cmFtLCBvdGhlcndpc2UgLSByZWFkIGZyb20gdnJhbQ0KPiAr
ICoNCj4gKyAqIFJldHVybnMgMCBvbiBzdWNjZXNzIG9yIGFuIC1lcnJvciBvbiBmYWlsdXJlLg0K
DQpSZWFsbHk/IFdoZXJlPw0KVGhpcyBmdW5jdGlvbiBzZWVtcyB0byByZXR1cm4gMC4NClRyYWRp
dGlvbmFsbHkgcmVhZC93cml0ZSBmdW5jdGlvbnMNCnJldHVybiB0aGUgbnVtYmVyIG9mIGJ5dGVz
IHJlYWQvd3JpdHRlbiBvciBlcnJvci4NCllvdSBkbyBuZWl0aGVyLiBKdXN0IGRlZmluZSBpdCB2
b2lkLg0KDQo+ICsgKi8NCj4gK2ludCBhbWRncHVfZGV2aWNlX3ZyYW1fYWNjZXNzKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LCBsb2ZmX3QgcG9zLA0KPiArCQkJICAgICAgdWludDMyX3QgKmJ1
Ziwgc2l6ZV90IHNpemUsIGJvb2wgd3JpdGUpDQo+ICt7DQo+ICsJdWludDY0X3QgZW5kID0gcG9z
ICsgc2l6ZTsNCg0KTkFLISB0byBwcmVpbml0aWFsaXppbmcgYXV0b21hdGljIHZhcmlhYmxlcy4N
Cg0KPiArCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICsNCj4gKwl3aGlsZSAocG9zIDwgZW5kKSB7
DQo+ICsJCXNwaW5fbG9ja19pcnFzYXZlKCZhZGV2LT5tbWlvX2lkeF9sb2NrLCBmbGFncyk7DQo+
ICsJCVdSRUczMl9OT19LSVEobW1NTV9JTkRFWCwgKCh1aW50MzJfdClwb3MpIHwgMHg4MDAwMDAw
MCk7DQo+ICsJCVdSRUczMl9OT19LSVEobW1NTV9JTkRFWF9ISSwgcG9zID4+IDMxKTsNCj4gKwkJ
aWYgKHdyaXRlKQ0KPiArCQkJV1JFRzMyX05PX0tJUShtbU1NX0RBVEEsICpidWYrKyk7DQo+ICsJ
CWVsc2UNCj4gKwkJCSpidWYrKyA9IFJSRUczMl9OT19LSVEobW1NTV9EQVRBKTsNCj4gKwkJc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+bW1pb19pZHhfbG9jaywgZmxhZ3MpOw0KPiArCQlw
b3MgKz0gNDsNCj4gKwl9DQoNCk5BSyEgdG8gdGhpcyB0aGlzOg0KDQp3aGlsZSAocG9zIDwgZW5k
KSB7ICAgICA8LS0tKw0KCTxib2R5IG9mIGxvb3A+ICAgICAgfC0tPiBQYXJ0IG9mIHRoZSBsb29w
IGRlZmluaXRpb24NCglwb3MgKz0gNDsgICAgICAgPC0tLSsNCn0NCg0KSW5zdGVhZCBvZiBicmVh
a2luZyB1cCB0aGUgbG9vcCBkZWZpbml0aW9uIGxpa2UgdGhpcywNCnVzZSBhIGZvci1sb29wLCBh
bmQgRE8gTk9UIHByZWluaXRpYWxpemUgdGhlICJlbmQiIHZhcmlhYmxlLA0KYW5kIGFsc28gcHJv
dGVjdCBmcm9tIG92ZXJmbG93LCBhbGwgbGlrZSB0aGlzOg0KDQpsYXN0ID0gc2l6ZSAtIDE7DQpm
b3IgKGxhc3QgKz0gcG9zOyBwb3MgPD0gbGFzdDsgcG9zICs9IDQpIHsNCgk8Ym9keSBvZiBsb29w
Pg0KfQ0KDQpJIG1lbnRpb25lZCB0aGUgd2h5IG9mIHRoaXMgaW4gbXkgcHJldmlvdXMgcmV2aWV3
IG9mIHRoZSBzYW1lDQp0b3BpYyBwYXRjaHNldCBvdmVyIHRoZSBzYW1lIHdoaWxlIGxvb3AgZmlh
c2NvLg0KDQpSZWdhcmRzLA0KTHViZW4NCg0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsN
Cj4gIC8qDQo+ICAgKiBNTUlPIHJlZ2lzdGVyIGFjY2VzcyBoZWxwZXIgZnVuY3Rpb25zLg0KPiAg
ICovDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlz
Y292ZXJ5LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292ZXJ5LmMN
Cj4gaW5kZXggZGIyZGFiM2E2ZGZmLi4zMjRjMmQ2MDVmNTQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292ZXJ5LmMNCj4gQEAgLTEzNCwyMSArMTM0
LDEwIEBAIHN0YXRpYyBpbnQgaHdfaWRfbWFwW01BWF9IV0lQXSA9IHsNCj4gIA0KPiAgc3RhdGlj
IGludCBhbWRncHVfZGlzY292ZXJ5X3JlYWRfYmluYXJ5KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LCB1aW50OF90ICpiaW5hcnkpDQo+ICB7DQo+IC0JdWludDMyX3QgKnAgPSAodWludDMyX3Qg
KiliaW5hcnk7DQo+ICAJdWludDY0X3QgdnJhbV9zaXplID0gKHVpbnQ2NF90KVJSRUczMihtbVJD
Q19DT05GSUdfTUVNU0laRSkgPDwgMjA7DQo+ICAJdWludDY0X3QgcG9zID0gdnJhbV9zaXplIC0g
QklOQVJZX01BWF9TSVpFOw0KPiAtCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+IC0NCj4gLQl3aGls
ZSAocG9zIDwgdnJhbV9zaXplKSB7DQo+IC0JCXNwaW5fbG9ja19pcnFzYXZlKCZhZGV2LT5tbWlv
X2lkeF9sb2NrLCBmbGFncyk7DQo+IC0JCVdSRUczMl9OT19LSVEobW1NTV9JTkRFWCwgKCh1aW50
MzJfdClwb3MpIHwgMHg4MDAwMDAwMCk7DQo+IC0JCVdSRUczMl9OT19LSVEobW1NTV9JTkRFWF9I
SSwgcG9zID4+IDMxKTsNCj4gLQkJKnArKyA9IFJSRUczMl9OT19LSVEobW1NTV9EQVRBKTsNCj4g
LQkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+bW1pb19pZHhfbG9jaywgZmxhZ3MpOw0K
PiAtCQlwb3MgKz0gNDsNCj4gLQl9DQo+ICANCj4gLQlyZXR1cm4gMDsNCj4gKwlyZXR1cm4gYW1k
Z3B1X2RldmljZV92cmFtX2FjY2VzcyhhZGV2LCBwb3MsICh1aW50MzJfdCAqKWJpbmFyeSwgQklO
QVJZX01BWF9TSVpFLCBmYWxzZSk7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyB1aW50MTZfdCBhbWRn
cHVfZGlzY292ZXJ5X2NhbGN1bGF0ZV9jaGVja3N1bSh1aW50OF90ICpkYXRhLCB1aW50MzJfdCBz
aXplKQ0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
