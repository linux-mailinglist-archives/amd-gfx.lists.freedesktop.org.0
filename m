Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE30119CE
	for <lists+amd-gfx@lfdr.de>; Thu,  2 May 2019 15:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B7B894B7;
	Thu,  2 May 2019 13:11:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680043.outbound.protection.outlook.com [40.107.68.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0588894B7
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 May 2019 13:11:23 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3557.namprd12.prod.outlook.com (20.178.196.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Thu, 2 May 2019 13:11:19 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::f0ea:976a:f48c:35a1]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::f0ea:976a:f48c:35a1%2]) with mapi id 15.20.1856.008; Thu, 2 May 2019
 13:11:19 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Use int for signed error code checks in
 commit planes
Thread-Topic: [PATCH] drm/amd/display: Use int for signed error code checks in
 commit planes
Thread-Index: AQHVAOdyJYwHrIb1oEaW2MWiPrU6JqZXzo6AgAAANICAAAB8gA==
Date: Thu, 2 May 2019 13:11:19 +0000
Message-ID: <d9f12048-cc92-25b8-dd8e-7c9bbec08e21@amd.com>
References: <20190502130317.5506-1-nicholas.kazlauskas@amd.com>
 <b70af187-37f7-4f19-16c2-61839968d8e8@gmail.com>
 <abe0ec29-ca85-2170-4d06-c7b7f767d4e9@gmail.com>
In-Reply-To: <abe0ec29-ca85-2170-4d06-c7b7f767d4e9@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::20)
 To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8db7e04c-3e29-47c0-334f-08d6ceffaa90
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3557; 
x-ms-traffictypediagnostic: BYAPR12MB3557:
x-microsoft-antispam-prvs: <BYAPR12MB355736E30FD91058D45E1EC7EC340@BYAPR12MB3557.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(346002)(396003)(39860400002)(376002)(189003)(199004)(6436002)(256004)(53936002)(81166006)(486006)(81156014)(36756003)(476003)(25786009)(6486002)(6512007)(73956011)(5660300002)(66476007)(66556008)(66946007)(305945005)(6246003)(229853002)(2616005)(26005)(316002)(31696002)(86362001)(110136005)(8936002)(66446008)(64756008)(7736002)(76176011)(2906002)(68736007)(99286004)(446003)(102836004)(14454004)(31686004)(478600001)(52116002)(2501003)(386003)(186003)(6506007)(53546011)(8676002)(11346002)(72206003)(3846002)(6116002)(71200400001)(66066001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3557;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kiZ3AW4rOcn6KKqGWPCR0XUD37xtc3RmNjBKcVhFZk+6ciNLAnnPwP4GeJBMnL5wARCmbqrJJoyDsE/ZnIk6LJ0dgM7unmkiu0t9BrlXOCBlG9/RlCA93sX/xsK3TjKF2vuNCPIGSJJUSgg3uuJj8v1uPhRBxXqCnH6j5WE+PJ+AWUW7K/DQFncuK5XFe5PUCiw9uQgWbk9DfslFf/0QBF+OjWUOzUk+3O5Pza3zf7ELwrMavRtEqGy6JFPv32H+v1OQLfa78Tb1eXH2VspUIKprbFj7a36tzUUlb18/yuTCDCf0z5dHHQ1k7iMSumGlyohV+TSWx/Xnr39w7vS7P8PMKNSrC5i9yDYyNPmuylL2FPW4ONDCUNp596ZrUxnBjfYvrzVcdqynesY8uFBgvNELgY9zWuP5w81LfX1Lzj8=
Content-ID: <EF0CAAFFFB4FDF498DFFB0EC2EC31E50@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db7e04c-3e29-47c0-334f-08d6ceffaa90
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 13:11:19.5695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3557
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5PyXjQDXD5AyVYSMRaC6tr4uIuZVuT1ywjzDBS+wWA=;
 b=Kk2jEy9gRoOTNeJNYkfHno9pfG5VTazl2H8rIyOYTihxraBdv4oqarsSQLBW9fViizYiM5KZYHHtLckyVWLZT/mCkM2t2BGazu8yc+26eROpfZ/QOz/yU/le1nFKT+oG/GzbA2mceYFbkcnp/nYpV3cSr3Gk7foL9Q97i1JKoak=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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

T24gNS8yLzE5IDk6MDkgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+IA0KPiBBbSAwMi4w
NS4xOSB1bSAxNTowOCBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6DQo+PiBBbSAwMi4wNS4xOSB1
bSAxNTowMyBzY2hyaWViIE5pY2hvbGFzIEthemxhdXNrYXM6DQo+Pj4gW1doeV0NCj4+Pg0KPj4+
IFRoZSB0eXBlIG9mICdyJyBpcyB1aW50MzJfdCBhbmQgdGhlIHJldHVybiBjb2RlcyBmb3IgYm90
aDoNCj4+Pg0KPj4+IC0gcmVzZXJ2YXRpb25fb2JqZWN0X3dhaXRfdGltZW91dF9yY3UNCj4+PiAt
IGFtZGdwdV9ib19yZXNlcnZlDQo+Pj4NCj4+PiAuLi5hcmUgc2lnbmVkLiBXaGlsZSBpdCB3b3Jr
cyBmb3IgdGhlIGxhdHRlciBzaW5jZSB0aGUgY2hlY2sgaXMNCj4+PiBkb25lIG9uICE9IDAgaXQg
ZG9lc24ndCB3b3JrIGZvciB0aGUgZm9ybWVyIHNpbmNlIHdlIGNoZWNrIDw9IDAuDQo+Pj4NCj4+
PiBbSG93XQ0KPj4+DQo+Pj4gTWFrZSAncicgYW4gaW50IGluIGNvbW1pdCBwbGFuZXMgc28gd2Un
cmUgbm90IGRvaW5nIGFueSB1bnNpZ25lZC9zaWduZWQNCj4+PiBjb252ZXJzaW9uIGhlcmUgaW4g
dGhlIGZpcnN0IHBsYWNlLg0KPj4+DQo+Pj4gUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRh
bi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXps
YXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+DQo+Pg0KPj4gUmV2aWV3ZWQtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gDQo+IE9oLCB3
YWl0IGEgc2Vjb25kLiBTaG91bGRuJ3QgdGhpcyBldmVuIGJlIGEgbG9uZyBpbnN0ZWFkIG9mIGFu
IGludD8NCj4gDQo+IENocmlzdGlhbi4NCg0KVG8gYmUgZnVsbHkgY29ycmVjdCBvbiBhbGwgYXJj
aGl0ZWN0dXJlcyBJIHN1cHBvc2UgdGhhdCdzIHRydWUuIEknbGwgDQpyZXBvc3QgaXQgd2l0aCB0
aGF0IGZpeGVkLiBUaGFua3MuDQoNCk5pY2hvbGFzIEthemxhdXNrYXMNCg0KPiANCj4+DQo+Pj4g
LS0tDQo+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYyB8IDQgKystLQ0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPj4+IGluZGV4IGJlY2Q4Y2IzYWFiNi4uNzIy
Zjg2M2NlNGE0IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+Pj4gQEAgLTUzMzIsNyArNTMzMiw3IEBAIHN0YXRp
YyB2b2lkIGFtZGdwdV9kbV9jb21taXRfcGxhbmVzKHN0cnVjdA0KPj4+IGRybV9hdG9taWNfc3Rh
dGUgKnN0YXRlLA0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgZHJtX2NydGMgKnBjcnRjLA0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBib29sIHdhaXRfZm9yX3ZibGFuaykNCj4+PiDCoCB7DQo+Pj4gLcKg
wqDCoCB1aW50MzJfdCBpLCByOw0KPj4+ICvCoMKgwqAgdWludDMyX3QgaTsNCj4+PiDCoMKgwqDC
oMKgIHVpbnQ2NF90IHRpbWVzdGFtcF9uczsNCj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lOw0KPj4+IMKgwqDCoMKgwqAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3Bs
YW5lX3N0YXRlLCAqbmV3X3BsYW5lX3N0YXRlOw0KPj4+IEBAIC01MzQyLDcgKzUzNDIsNyBAQCBz
dGF0aWMgdm9pZCBhbWRncHVfZG1fY29tbWl0X3BsYW5lcyhzdHJ1Y3QNCj4+PiBkcm1fYXRvbWlj
X3N0YXRlICpzdGF0ZSwNCj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBkbV9jcnRjX3N0YXRlICphY3J0
Y19zdGF0ZSA9DQo+Pj4gdG9fZG1fY3J0Y19zdGF0ZShuZXdfcGNydGNfc3RhdGUpOw0KPj4+IMKg
wqDCoMKgwqAgc3RydWN0IGRtX2NydGNfc3RhdGUgKmRtX29sZF9jcnRjX3N0YXRlID0NCj4+PiB0
b19kbV9jcnRjX3N0YXRlKGRybV9hdG9taWNfZ2V0X29sZF9jcnRjX3N0YXRlKHN0YXRlLCBwY3J0
YykpOw0KPj4+IC3CoMKgwqAgaW50IHBsYW5lc19jb3VudCA9IDAsIHZwb3MsIGhwb3M7DQo+Pj4g
K8KgwqDCoCBpbnQgciwgcGxhbmVzX2NvdW50ID0gMCwgdnBvcywgaHBvczsNCj4+PiDCoMKgwqDC
oMKgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X2Jv
ICphYm87DQo+Pj4gwqDCoMKgwqDCoCB1aW50NjRfdCB0aWxpbmdfZmxhZ3M7DQo+Pg0KPiANCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
