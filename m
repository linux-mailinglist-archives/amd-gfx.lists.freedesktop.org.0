Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6135B6370
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 14:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DEF6EF28;
	Wed, 18 Sep 2019 12:42:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam03on0618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4a::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D226EF28
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 12:42:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AK0+jvbdyZCuksNAy4pEKsNmmzdB0KTKNF4pq8gaRafVfXz3h3DXVZ092jRU0Q4JRLsA63TalxMdmJiReQRmul6ZuYTg28+ZlYpYnTQdPup/WZ5GRWfF/Lgzo+3TdxBIh/J0hO6IezxMuuThRFeCuYhoc1RZnfqHjdrZktWAtkDfh2QnpEwEBKginlxqNpBfiEeNojf6I5U6uGUysCPliGCsht5znbP2DxHQTDIua97QW5W7uKvPyE8PmVtGHwQh3csNgnfvzDH6HScolapyvsskv0Ul+LT7OxU/U9rHhLrKkooqemYsgxkVb6sZrk1BsdtcWcqrUuLKXoAaE5kSNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/kgDiWKkE75P/um9oSMc0SZHAb843AhAJEZVRd00lI=;
 b=gbSCYa5o3thk9KBHN+D4bEUwXiI9FKzNtUNOaN5imulmYDq2PdeoaaKI86ygKOYtU9+zrlc1ha38h4174ZMMAQAOVzsQtlLYIf5f6hmSKLld4LoNxPiKMoKxBouQKy3xV8fJfBXDDNqrGx6vPLZ152z+NLFpf1Yd89BVQ0E0bR9rET7i98Mwx/2WT7SYI3oOUplwvqzUE7zOeh7W4i15zxlf3a5FZXi4eQjLvGUyz2PP13bnqs0wAyQamxOVQpXYlfVxN1My9/93XBhnDVJuMo+g79j+njt2IxnuyARJ8p3xql6L96a3yCbHTVxOQJHttJW+IprFHzBBYVLgO6Cx/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3445.namprd12.prod.outlook.com (20.178.196.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.16; Wed, 18 Sep 2019 12:42:35 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::3930:ebfd:da9:5636]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::3930:ebfd:da9:5636%3]) with mapi id 15.20.2284.009; Wed, 18 Sep 2019
 12:42:35 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Create plane rotation property
Thread-Topic: [PATCH] drm/amd/display: Create plane rotation property
Thread-Index: AQHVaYqPDBtE9XCqm0aKgH3pvgq91KcoAWWAgABI2YCAAALggIAINWKAgADnfgA=
Date: Wed, 18 Sep 2019 12:42:35 +0000
Message-ID: <42abccf0-2212-6554-41db-e389720ecfb0@amd.com>
References: <20190912164404.12725-1-pgriffais@valvesoftware.com>
 <b781b06d-a52f-0291-b0df-d90b81a66c84@amd.com>
 <907ff2ce-e273-1ea0-a17b-522745756164@amd.com>
 <9cc53c0f-db53-96a1-32de-a2303c3b62d9@valvesoftware.com>
 <d3d4c53c-0ff3-2833-54a1-bcb7a9ac58b3@valvesoftware.com>
In-Reply-To: <d3d4c53c-0ff3-2833-54a1-bcb7a9ac58b3@valvesoftware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::46) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fef5c923-e26b-471b-103b-08d73c35ae72
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3445; 
x-ms-traffictypediagnostic: BYAPR12MB3445:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BYAPR12MB34458151B16AEB2ADFCF196DEC8E0@BYAPR12MB3445.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(199004)(189003)(110136005)(6486002)(8936002)(81166006)(81156014)(8676002)(26005)(5660300002)(316002)(6436002)(2616005)(446003)(11346002)(3846002)(2501003)(229853002)(36756003)(186003)(6116002)(256004)(31696002)(476003)(478600001)(66066001)(6306002)(2906002)(53546011)(6506007)(386003)(486006)(305945005)(14454004)(6246003)(7736002)(6512007)(966005)(102836004)(99286004)(66556008)(66446008)(66476007)(86362001)(66946007)(71190400001)(76176011)(64756008)(52116002)(31686004)(25786009)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3445;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZR4QP14MOTBLqYA/lR05XJKF+9sHmjAMLcDZ1NL6YgmH4JTjBWyIzpl7qhxzRIrz7S/vK7zzDBZ5PtKdt92LJtPKP1c/D/avVEsh5w2OPx468l3+Y84xD5LYw88byADamwWGu4Srz0Ztl0WZy7TKjxV491FiRDHPMJg+y5riH3WCZQ+hHF+CvANLxhbZ3dlRWpZbSuk6xH0RWaYQaETQulZ6loOsnETZ+NjzvNXP1oxzlxguM7KlzW0ldpxrReeGrrvXnh4Ng7c1SW9OV16PnNfBmb37gQRZUchZ0Nglh8ZbZU4YQcPdWIm1akbp4wdDIGYiEMZWksx4mHpt3WLXR2f3iXcUT1JbHrtekUKNzqYj2ZUofYdj2y5hi3E3dl4g/r4npypPzKSYiddYJfLDrRQ5xdVsdy6N7SkE9avTcFo=
x-ms-exchange-transport-forked: True
Content-ID: <DAD45CE7AEE8F643868D002DCAADB73D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef5c923-e26b-471b-103b-08d73c35ae72
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 12:42:35.6177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hip/TCiC0S+GUExgLO8sqASNas5Ev0Lqjr0iVUWfTCny9OdRa7f/cdzt3e11pkvWXI9kjQvqmWRV03lFBtttzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3445
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/kgDiWKkE75P/um9oSMc0SZHAb843AhAJEZVRd00lI=;
 b=eSF1E/+TQCu2BDaOn1C9JwGX+cW/YvzztHkpALu5Sa3HJO6pK0knTnpoRhG79x3b+v9aeOpntL2p5x3pJ34EIw5sBBIg5E5NpgE9YTPyCvbuZpNmVS0eCrQOVPiOqeL5aA3ahZJMC+dHcEVcwREVgGbDZ7QkTyifzwyjAOa4Vg4=
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

T24gMjAxOS0wOS0xNyA2OjUzIHAubS4sIFBpZXJyZS1Mb3VwIEEuIEdyaWZmYWlzIHdyb3RlOg0K
PiANCj4gDQo+IE9uIDkvMTIvMTkgMTA6MzIgQU0sIFBpZXJyZS1Mb3VwIEEuIEdyaWZmYWlzIHdy
b3RlOg0KPj4gT24gOS8xMi8xOSAxMDoyMiBBTSwgSGFycnkgV2VudGxhbmQgd3JvdGU6DQo+Pj4g
T24gMjAxOS0wOS0xMiAxOjAxIHAubS4sIEthemxhdXNrYXMsIE5pY2hvbGFzIHdyb3RlOg0KPj4+
PiBPbiAyMDE5LTA5LTEyIDEyOjQ0IHAubS4sIFBpZXJyZS1Mb3VwIEEuIEdyaWZmYWlzIHdyb3Rl
Og0KPj4+Pj4gSXQncyBvdGhlcndpc2UgcHJvcGVybHkgc3VwcG9ydGVkLCBqdXN0IG5lZWRzIGV4
cG9zaW5nIHRvIHVzZXJzcGFjZS4NCj4+Pj4+DQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmUt
TG91cCBBLiBHcmlmZmFpcyA8cGdyaWZmYWlzQHZhbHZlc29mdHdhcmUuY29tPg0KPj4+PiBJIGtu
b3cgSUdUIGhhcyBzb21lIHRlc3RzIGZvciBwbGFuZSByb3RhdGlvbiwgZG8geW91IGhhcHBlbiB0
byBrbm93IA0KPj4+PiB3aGF0DQo+Pj4+IHRlc3RzIHBhc3Mgb3IgZmFpbCB3aGVuIGV4cG9zaW5n
IHRoaXM/DQo+Pj4+DQo+Pj4+IEkgdGhpbmsgRENOMSAoUmF2ZW4pIHNob3VsZCB3b3JrIGFzIGV4
cGVjdGVkIGJ1dCBJJ2QgYmUgY29uY2VybmVkIGFib3V0DQo+Pj4+IERDRSBvciBEQ04yLiBJIHRo
aW5rIHdlIGhhdmUgaGFkIHNvbWUgY3Vyc29yIGJ1Z3MgaW4gdGhlIHBhc3Qgd2l0aA0KPj4+PiBj
dXJzb3Igcm90YXRpb24gYnV0IHRoZXkgbWlnaHQgb25seSBiZSBleHBvc2VkIHdoZW4gdXNlZCBp
biBjb25qdW5jdGlvbg0KPj4+PiB3aXRoIG92ZXJsYXkgcGxhbmVzLg0KPj4+Pg0KPj4+DQo+Pj4g
V2luZG93cyBndXlzIGhhZCBhIGZpeCAoaW4gREMpIGZvciBjdXJzb3Igd2l0aCBIVyByb3RhdGlv
biBvbiBEQ04gYSBmZXcNCj4+PiB3ZWVrcyBhZ28uIFRoYXQgbWlnaHQgaGF2ZSBmaXhlZCB0aGVz
ZSBpc3N1ZXMuDQo+Pj4NCj4+PiBXZSBzaG91bGQgc3RpbGwgbWFrZSBzdXJlIHdlIGNhbiBwYXNz
IElHVCB0ZXN0cyB0aGF0IGRvIHJvdGF0aW9uLg0KPj4+DQo+Pj4gSG93IGRpZCB5b3UgdGVzdD8g
V2VzdG9uPw0KPj4NCj4+IEkndmUgdGVzdGVkIGl0IHdpdGggYSBwYXRjaGVkIGttc2N1YmUgdG8g
YWRkIHRoZSByb3RhdGlvbiBwcm9wZXJ0eSBpbiANCj4+IHRoZSBhdG9taWMgcGF0aC4gOTAsIDE4
MCBhbmQgMjcwIGFsbCBzZWVtIGhhcHB5IG9uIFJhdmVuIHdpdGggdGhhdCANCj4+IHNldHVwLiBJ
J3ZlIG5vdCB0ZXN0ZWQgYW55IG90aGVyIGNoaXAgYXQgdGhpcyBwb2ludC4NCj4gDQo+IElmIHRo
ZXJlJ3MgbW9yZSB0ZXN0aW5nIHlvdSdkIGxpa2UgbWUgdG8gZG8sIHdvdWxkIGFueW9uZSBwb2lu
dCBtZSBpbiANCj4gdGhlIHJpZ2h0IGRpcmVjdGlvbj8gSSdtIG5ldyB0byBhbGwgdGhpcywgc29y
cnkuDQoNCkknZCBiZSBtb3N0bHkgaW50ZXJlc3RlZCBpbiBnZXR0aW5nIElHVCB0ZXN0cyBnb2lu
ZyBmb3Igb3VyIENJIHNvIHdlIA0KaGF2ZSByZWd1bGFyIGF1dG9tYXRlZCB0ZXN0aW5nIG9uIHRo
ZSBmZWF0dXJlLiBUaGUgImttc19yb3RhdGlvbl9jcmMiIHRlc3Q6DQoNCmh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy9ibG9iL21hc3Rlci90ZXN0cy9rbXNf
cm90YXRpb25fY3JjLmMNCg0KLi4ubG9va3MgbGlrZSB0aGUgY29ycmVjdCB0ZXN0IGZvciB0aGlz
IHByb3BlcnR5IGJ1dCBpdCBzZWVtcyBsaWtlIHRoZSANCnRlc3Qgd291bGQgbmVlZCB0byBiZSBt
b2RpZmllZCB0byB1c2UgRFJJVkVSX0FOWSBpbnN0ZWFkIG9mIERSSVZFUl9JTlRFTCANCmZvciBk
cm1fb3Blbl9kcml2ZXJfbWFzdGVyLg0KDQpJdCBwcm9iYWJseSBuZWVkcyBhIGZldyAiaXNfaTkx
NV9kZXZpY2UoLi4uKSIgY2hlY2tzIHBsYWNlZCBiZWZvcmUgDQoiaW50ZWxfZ2VuKC4uLiIpIGNo
ZWNrcyBhcyB3ZWxsIHNpbmNlIHdlIGRvbid0IHN1cHBvcnQgaTkxNSB0aWxpbmcgDQptb2RpZmll
cnMgbm9yIEludGVsIGdlbmVyYXRpb24gY2hlY2tzLiBXaXRoIHRob3NlIG1vZGlmaWNhdGlvbnMg
SSdkIA0KaW1hZ2luZSBpdCdkIHByb2JhYmx5IHJ1biBhcyBleHBlY3RlZCBidXQgSSBoYXZlbid0
IGhhZCB0aGUgY2hhbmNlIHRvIA0KdHJ5IGl0IG91dC4NCg0KTmljaG9sYXMgS2F6bGF1c2thcw0K
DQoNCj4gDQo+IFRoYW5rcywNCj4gIMKgLSBQaWVycmUtTG91cA0KPiANCj4+DQo+Pj4NCj4+PiBI
YXJyeQ0KPj4+DQo+Pj4+IEknZCBqdXN0IGxpa2UgdG8gbWFrZSBzdXJlIHRoZXJlJ3Mgc3VpdGFi
bGUgdGVzdGluZyBhdCBsZWFzdCBpZiB3ZSdyZQ0KPj4+PiBnb2luZyB0byBleHBvc2UgdGhpcyB0
byB1c2Vyc3BhY2UuDQo+Pj4+DQo+Pj4+IE5pY2hvbGFzIEthemxhdXNrYXMNCj4+Pj4NCj4+Pj4+
IC0tLQ0KPj4+Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jIHwgOCArKysrKysrKw0KPj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspDQo+Pj4+Pg0KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgDQo+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4+Pj4+IGluZGV4IDQ1YmU3YTIxMzJi
Yi4uMzc3Mjc2M2M2NDQ5IDEwMDY0NA0KPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPj4+Pj4gQEAgLTQ2ODAsNiArNDY4
MCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX3BsYW5lX2luaXQoc3RydWN0IA0KPj4+Pj4gYW1k
Z3B1X2Rpc3BsYXlfbWFuYWdlciAqZG0sDQo+Pj4+PiDCoMKgwqDCoMKgwqAgdWludDMyX3QgZm9y
bWF0c1szMl07DQo+Pj4+PiDCoMKgwqDCoMKgwqAgaW50IG51bV9mb3JtYXRzOw0KPj4+Pj4gwqDC
oMKgwqDCoMKgIGludCByZXMgPSAtRVBFUk07DQo+Pj4+PiArwqDCoMKgIHVuc2lnbmVkIGludCBz
dXBwb3J0ZWRfcm90YXRpb25zOw0KPj4+Pj4gwqDCoMKgwqDCoMKgIG51bV9mb3JtYXRzID0gZ2V0
X3BsYW5lX2Zvcm1hdHMocGxhbmUsIHBsYW5lX2NhcCwgZm9ybWF0cywNCj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFSUkFZX1NJWkUoZm9ybWF0cykp
Ow0KPj4+Pj4gQEAgLTQ3MTEsNiArNDcxMiwxMyBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9wbGFu
ZV9pbml0KHN0cnVjdCANCj4+Pj4+IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRtLA0KPj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBEUk1fQ09MT1JfWUNCQ1JfQlQ3MDksIERSTV9D
T0xPUl9ZQ0JDUl9MSU1JVEVEX1JBTkdFKTsNCj4+Pj4+IMKgwqDCoMKgwqDCoCB9DQo+Pj4+PiAr
wqDCoMKgIHN1cHBvcnRlZF9yb3RhdGlvbnMgPQ0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIERSTV9N
T0RFX1JPVEFURV8wIHwgRFJNX01PREVfUk9UQVRFXzkwIHwNCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCBEUk1fTU9ERV9ST1RBVEVfMTgwIHwgRFJNX01PREVfUk9UQVRFXzI3MDsNCj4+Pj4+ICsNCj4+
Pj4+ICvCoMKgwqAgZHJtX3BsYW5lX2NyZWF0ZV9yb3RhdGlvbl9wcm9wZXJ0eShwbGFuZSwgRFJN
X01PREVfUk9UQVRFXzAsDQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc3VwcG9ydGVkX3JvdGF0aW9ucyk7DQo+Pj4+PiArDQo+Pj4+PiDCoMKgwqDC
oMKgwqAgZHJtX3BsYW5lX2hlbHBlcl9hZGQocGxhbmUsICZkbV9wbGFuZV9oZWxwZXJfZnVuY3Mp
Ow0KPj4+Pj4gwqDCoMKgwqDCoMKgIC8qIENyZWF0ZSAocmVzZXQpIHRoZSBwbGFuZSBzdGF0ZSAq
Lw0KPj4+Pj4NCj4+Pj4NCj4+DQo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KPj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4+IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZngNCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
