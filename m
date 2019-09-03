Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E10DBA689F
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 14:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC93892BD;
	Tue,  3 Sep 2019 12:29:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780074.outbound.protection.outlook.com [40.107.78.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BC7892BD
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 12:29:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l09L/N2VAWnz0FkQj7sGVmX9trjhiaGX0DLRKgIr+oUagSqfbYXIoEld/wD0A51Ys6lBBfFYPktfo8rXbNuS2zbtlVHBRn5RVqc1fDNUJJ+2hEn3n1ZL2QXoAMWCVw6BJH7LR6hGrY001KGlcWBHo8x6IWXy/PQk0amSoLJrDNJ3YZkeqiBePAIPoZOKswRaKyq/pW/cq5y7d2tBrjUbrdy6FyC4wDecUL5l6WSLiTpV79zi3Vc3vU+Zur6Vgh00LKll4FNxV3HHyERU6B+FBgqGM45RV1AxFGcbZUZ/VvgZVNEuHp9P3L5mKHP+gKrm8+6ISKGHXfnJwn6zVSkKsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHiwVCht9RX8emmjekYnSpJDWV/eGgOfnzPxoA53oWU=;
 b=PN/QL1g7rco/ZPkLm4bDT5j9wgL1LSQ6BpKzUozE3nBoN0/O5GGo/XGZNZ4N0+lkckP3pB3mIm90HeoXUs3UUELmfY/FqvKyU+2eKS4tYwUrHizFHsyKtvkFTMXCU9vU4GlaX0BFiHkX+y7wl9L0PnRUq/Z6RMQVoqOsNOn6w321U+hRspMYtyBtUJj4vcDltJC0aTdBORWdcXSQyorcchvk8bdbcwJ2hkti4xP253uju23SS0/IZtPbtzi75b1+TWvC0AgfyX8gJfHurx0dm1C+8JvDMMRUTNI4mEw6r0eC+yvcKaaP62Ky3fyC+bvO5M2ZKfeVjzOrOCsfiNV/Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3294.namprd12.prod.outlook.com (20.179.81.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Tue, 3 Sep 2019 12:29:20 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::79c0:d856:da12:c4b2]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::79c0:d856:da12:c4b2%2]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 12:29:20 +0000
From: Chunming Zhou <zhoucm1@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/amdgpu: remove amdgpu_cs_try_evict
Thread-Topic: [PATCH 3/3] drm/amdgpu: remove amdgpu_cs_try_evict
Thread-Index: AQHVYjdATqN2J+AnckOx5Q0OIlkLAacZ4fAA
Date: Tue, 3 Sep 2019 12:29:19 +0000
Message-ID: <77c7463d-1ff7-1985-48c6-b48138676164@amd.com>
References: <20190903090904.30747-1-christian.koenig@amd.com>
 <20190903090904.30747-3-christian.koenig@amd.com>
In-Reply-To: <20190903090904.30747-3-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0083.apcprd04.prod.outlook.com
 (2603:1096:202:15::27) To MN2PR12MB2910.namprd12.prod.outlook.com
 (2603:10b6:208:af::27)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [101.87.176.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29ca8f90-bc5d-4a1d-520a-08d7306a57f8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3294; 
x-ms-traffictypediagnostic: MN2PR12MB3294:
x-microsoft-antispam-prvs: <MN2PR12MB32942E2BF4F3BC5EE53ABBE8B4B90@MN2PR12MB3294.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(199004)(189003)(6512007)(478600001)(5660300002)(102836004)(66476007)(6436002)(7736002)(66946007)(66556008)(64756008)(66446008)(81156014)(6246003)(386003)(53936002)(66574012)(186003)(6506007)(81166006)(305945005)(26005)(8936002)(8676002)(256004)(14444005)(52116002)(31686004)(2501003)(36756003)(2616005)(316002)(11346002)(476003)(110136005)(71190400001)(71200400001)(3846002)(446003)(2906002)(25786009)(66066001)(229853002)(6116002)(6486002)(31696002)(99286004)(76176011)(14454004)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3294;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: v8krAXIjwaJZ62ktStnJIQK6aeMh+H0Stz5YbfAYoJwTeushI/0YkEkN5Ft791XM/geMMy4xgTrenPuAX4unKInY9yS60z/Q0N+RSTRGnJO71GS9MLG7QB7YAvMLL1t3paF1Z9Hm7BYfx7Rg2+liC5SFOMnC7BHVxvtuuQMy1snrzmXeCWC9NkIz+/ujYoqTJwk07pp87jlqRUFnLUyW9JCLEFENcm9YFf6T9B/wVIdtxJd+ZclECpT3cZlsCG9oAcvccMr7TqfTFL+pQ+CT44vysIKrpRer95Qtp/5tNwxfG5yib67rmQApxI33qpa/aoM6tkG3oo3hC1aKydwFl263vHtpXR5XYkUzW2Dyr4fv37OKL1c0y/nk5gr6sHjdovsMYmWHG8y3nuBx/ryjvx31k/Q/9TigYaxqzkndH5E=
x-ms-exchange-transport-forked: True
Content-ID: <7E2C38C3F74FA143B197F1E8ACDA6B22@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ca8f90-bc5d-4a1d-520a-08d7306a57f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 12:29:20.0110 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vucy3sl3+I8lgz44BvN6amrBRC+jRv0+IAnQRdLX78tEBVELTGPebW/S6NtWBIj2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3294
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHiwVCht9RX8emmjekYnSpJDWV/eGgOfnzPxoA53oWU=;
 b=d7OxnTvw2jobCNxYEwNdjmXgD9H7cOyi/KOupr3FKfyAZP7GuAOacWyIYpnSw5oDZlYGHANH4JhJALw6C2WbTaxyJVsCGRVL/A/d6B1Om6tk5AmxyexAAcxb2jQSS6whNsyaRORosM4noDZOMC3KxW+2MwlbneHHgiqA8i/yf9s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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

UmV2aWV3ZWQtYnk6IENodW5taW5nIFpob3UgPGRhdmlkMS56aG91QGFtZC5jb20+IGZvciBzZXJp
ZXMuDQoNCi1EYXZpZA0KDQrlnKggMjAxOS85LzMgMTc6MDksIENocmlzdGlhbiBLw7ZuaWcg5YaZ
6YGTOg0KPiBUcnlpbmcgdG8gZXZpY3QgdGhpbmdzIGZyb20gdGhlIGN1cnJlbnQgd29ya2luZyBz
ZXQgZG9lc24ndCB3b3JrIHRoYXQNCj4gd2VsbCBhbnltb3JlIGJlY2F1c2Ugb2YgcGVyIFZNIEJP
cy4NCj4NCj4gUmVseSBvbiByZXNlcnZpbmcgVlJBTSBmb3IgcGFnZSB0YWJsZXMgdG8gYXZvaWQg
Y29udGVudGlvbi4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHUuaCAgICB8ICAxIC0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfY3MuYyB8IDcxICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgMiBmaWxlcyBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgNzEgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdS5oDQo+IGluZGV4IGEyMzYyMTNmOGU4ZS4uZDE5OTUxNTY3MzNlIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPiBAQCAtNDc4LDcgKzQ3OCw2IEBA
IHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyIHsNCj4gICAJdWludDY0X3QJCQlieXRlc19tb3ZlZF92
aXNfdGhyZXNob2xkOw0KPiAgIAl1aW50NjRfdAkJCWJ5dGVzX21vdmVkOw0KPiAgIAl1aW50NjRf
dAkJCWJ5dGVzX21vdmVkX3ZpczsNCj4gLQlzdHJ1Y3QgYW1kZ3B1X2JvX2xpc3RfZW50cnkJKmV2
aWN0YWJsZTsNCj4gICANCj4gICAJLyogdXNlciBmZW5jZSAqLw0KPiAgIAlzdHJ1Y3QgYW1kZ3B1
X2JvX2xpc3RfZW50cnkJdWZfZW50cnk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfY3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9jcy5jDQo+IGluZGV4IGZkOTViNTg2YjU5MC4uMDMxODJkOTY4ZDNkIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYw0KPiBAQCAtNDQ3LDc1ICs0NDcsMTIgQEAg
c3RhdGljIGludCBhbWRncHVfY3NfYm9fdmFsaWRhdGUoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIg
KnAsDQo+ICAgCXJldHVybiByOw0KPiAgIH0NCj4gICANCj4gLS8qIExhc3QgcmVzb3J0LCB0cnkg
dG8gZXZpY3Qgc29tZXRoaW5nIGZyb20gdGhlIGN1cnJlbnQgd29ya2luZyBzZXQgKi8NCj4gLXN0
YXRpYyBib29sIGFtZGdwdV9jc190cnlfZXZpY3Qoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAs
DQo+IC0JCQkJc3RydWN0IGFtZGdwdV9ibyAqdmFsaWRhdGVkKQ0KPiAtew0KPiAtCXVpbnQzMl90
IGRvbWFpbiA9IHZhbGlkYXRlZC0+YWxsb3dlZF9kb21haW5zOw0KPiAtCXN0cnVjdCB0dG1fb3Bl
cmF0aW9uX2N0eCBjdHggPSB7IHRydWUsIGZhbHNlIH07DQo+IC0JaW50IHI7DQo+IC0NCj4gLQlp
ZiAoIXAtPmV2aWN0YWJsZSkNCj4gLQkJcmV0dXJuIGZhbHNlOw0KPiAtDQo+IC0JZm9yICg7JnAt
PmV2aWN0YWJsZS0+dHYuaGVhZCAhPSAmcC0+dmFsaWRhdGVkOw0KPiAtCSAgICAgcC0+ZXZpY3Rh
YmxlID0gbGlzdF9wcmV2X2VudHJ5KHAtPmV2aWN0YWJsZSwgdHYuaGVhZCkpIHsNCj4gLQ0KPiAt
CQlzdHJ1Y3QgYW1kZ3B1X2JvX2xpc3RfZW50cnkgKmNhbmRpZGF0ZSA9IHAtPmV2aWN0YWJsZTsN
Cj4gLQkJc3RydWN0IGFtZGdwdV9ibyAqYm8gPSB0dG1fdG9fYW1kZ3B1X2JvKGNhbmRpZGF0ZS0+
dHYuYm8pOw0KPiAtCQlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGFtZGdwdV90dG1fYWRl
dihiby0+dGJvLmJkZXYpOw0KPiAtCQlib29sIHVwZGF0ZV9ieXRlc19tb3ZlZF92aXM7DQo+IC0J
CXVpbnQzMl90IG90aGVyOw0KPiAtDQo+IC0JCS8qIElmIHdlIHJlYWNoZWQgb3VyIGN1cnJlbnQg
Qk8gd2UgY2FuIGZvcmdldCBpdCAqLw0KPiAtCQlpZiAoYm8gPT0gdmFsaWRhdGVkKQ0KPiAtCQkJ
YnJlYWs7DQo+IC0NCj4gLQkJLyogV2UgY2FuJ3QgbW92ZSBwaW5uZWQgQk9zIGhlcmUgKi8NCj4g
LQkJaWYgKGJvLT5waW5fY291bnQpDQo+IC0JCQljb250aW51ZTsNCj4gLQ0KPiAtCQlvdGhlciA9
IGFtZGdwdV9tZW1fdHlwZV90b19kb21haW4oYm8tPnRiby5tZW0ubWVtX3R5cGUpOw0KPiAtDQo+
IC0JCS8qIENoZWNrIGlmIHRoaXMgQk8gaXMgaW4gb25lIG9mIHRoZSBkb21haW5zIHdlIG5lZWQg
c3BhY2UgZm9yICovDQo+IC0JCWlmICghKG90aGVyICYgZG9tYWluKSkNCj4gLQkJCWNvbnRpbnVl
Ow0KPiAtDQo+IC0JCS8qIENoZWNrIGlmIHdlIGNhbiBtb3ZlIHRoaXMgQk8gc29tZXdoZXJlIGVs
c2UgKi8NCj4gLQkJb3RoZXIgPSBiby0+YWxsb3dlZF9kb21haW5zICYgfmRvbWFpbjsNCj4gLQkJ
aWYgKCFvdGhlcikNCj4gLQkJCWNvbnRpbnVlOw0KPiAtDQo+IC0JCS8qIEdvb2Qgd2UgY2FuIHRy
eSB0byBtb3ZlIHRoaXMgQk8gc29tZXdoZXJlIGVsc2UgKi8NCj4gLQkJdXBkYXRlX2J5dGVzX21v
dmVkX3ZpcyA9DQo+IC0JCQkJIWFtZGdwdV9nbWNfdnJhbV9mdWxsX3Zpc2libGUoJmFkZXYtPmdt
YykgJiYNCj4gLQkJCQlhbWRncHVfYm9faW5fY3B1X3Zpc2libGVfdnJhbShibyk7DQo+IC0JCWFt
ZGdwdV9ib19wbGFjZW1lbnRfZnJvbV9kb21haW4oYm8sIG90aGVyKTsNCj4gLQkJciA9IHR0bV9i
b192YWxpZGF0ZSgmYm8tPnRibywgJmJvLT5wbGFjZW1lbnQsICZjdHgpOw0KPiAtCQlwLT5ieXRl
c19tb3ZlZCArPSBjdHguYnl0ZXNfbW92ZWQ7DQo+IC0JCWlmICh1cGRhdGVfYnl0ZXNfbW92ZWRf
dmlzKQ0KPiAtCQkJcC0+Ynl0ZXNfbW92ZWRfdmlzICs9IGN0eC5ieXRlc19tb3ZlZDsNCj4gLQ0K
PiAtCQlpZiAodW5saWtlbHkocikpDQo+IC0JCQlicmVhazsNCj4gLQ0KPiAtCQlwLT5ldmljdGFi
bGUgPSBsaXN0X3ByZXZfZW50cnkocC0+ZXZpY3RhYmxlLCB0di5oZWFkKTsNCj4gLQkJbGlzdF9t
b3ZlKCZjYW5kaWRhdGUtPnR2LmhlYWQsICZwLT52YWxpZGF0ZWQpOw0KPiAtDQo+IC0JCXJldHVy
biB0cnVlOw0KPiAtCX0NCj4gLQ0KPiAtCXJldHVybiBmYWxzZTsNCj4gLX0NCj4gLQ0KPiAgIHN0
YXRpYyBpbnQgYW1kZ3B1X2NzX3ZhbGlkYXRlKHZvaWQgKnBhcmFtLCBzdHJ1Y3QgYW1kZ3B1X2Jv
ICpibykNCj4gICB7DQo+ICAgCXN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpwID0gcGFyYW07DQo+
ICAgCWludCByOw0KPiAgIA0KPiAtCWRvIHsNCj4gLQkJciA9IGFtZGdwdV9jc19ib192YWxpZGF0
ZShwLCBibyk7DQo+IC0JfSB3aGlsZSAociA9PSAtRU5PTUVNICYmIGFtZGdwdV9jc190cnlfZXZp
Y3QocCwgYm8pKTsNCj4gKwlyID0gYW1kZ3B1X2NzX2JvX3ZhbGlkYXRlKHAsIGJvKTsNCj4gICAJ
aWYgKHIpDQo+ICAgCQlyZXR1cm4gcjsNCj4gICANCj4gQEAgLTU1NCw5ICs0OTEsNiBAQCBzdGF0
aWMgaW50IGFtZGdwdV9jc19saXN0X3ZhbGlkYXRlKHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpw
LA0KPiAgIAkJCWJpbmRpbmdfdXNlcnB0ciA9IHRydWU7DQo+ICAgCQl9DQo+ICAgDQo+IC0JCWlm
IChwLT5ldmljdGFibGUgPT0gbG9iaikNCj4gLQkJCXAtPmV2aWN0YWJsZSA9IE5VTEw7DQo+IC0N
Cj4gICAJCXIgPSBhbWRncHVfY3NfdmFsaWRhdGUocCwgYm8pOw0KPiAgIAkJaWYgKHIpDQo+ICAg
CQkJcmV0dXJuIHI7DQo+IEBAIC02NTksOSArNTkzLDYgQEAgc3RhdGljIGludCBhbWRncHVfY3Nf
cGFyc2VyX2JvcyhzdHJ1Y3QgYW1kZ3B1X2NzX3BhcnNlciAqcCwNCj4gICAJCQkJCSAgJnAtPmJ5
dGVzX21vdmVkX3Zpc190aHJlc2hvbGQpOw0KPiAgIAlwLT5ieXRlc19tb3ZlZCA9IDA7DQo+ICAg
CXAtPmJ5dGVzX21vdmVkX3ZpcyA9IDA7DQo+IC0JcC0+ZXZpY3RhYmxlID0gbGlzdF9sYXN0X2Vu
dHJ5KCZwLT52YWxpZGF0ZWQsDQo+IC0JCQkJICAgICAgIHN0cnVjdCBhbWRncHVfYm9fbGlzdF9l
bnRyeSwNCj4gLQkJCQkgICAgICAgdHYuaGVhZCk7DQo+ICAgDQo+ICAgCXIgPSBhbWRncHVfdm1f
dmFsaWRhdGVfcHRfYm9zKHAtPmFkZXYsICZmcHJpdi0+dm0sDQo+ICAgCQkJCSAgICAgIGFtZGdw
dV9jc192YWxpZGF0ZSwgcCk7DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
