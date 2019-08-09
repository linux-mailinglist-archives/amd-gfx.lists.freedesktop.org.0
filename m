Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4846387C90
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 16:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF526EE15;
	Fri,  9 Aug 2019 14:24:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750083.outbound.protection.outlook.com [40.107.75.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F276C6EE17
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 14:24:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTndXnwdGjMFOzdtVj8F0AzFFk964tEjdtJrieAjZFNHh5TvLzpOGA8y1f6Rv166VLVHPfebiVlWsie1iYmadDwIqnQ67bexbrm5dJZ8f3wC1+PQEz/q2CH69neHLZ1gMJc8VYQTT3Prf1V+QERpgPeZWvP2rUgu0Epqj8yt2B24Q/zGdV0enOUabSHnsFGv5Jdexno8snj2chJW2ZsFUorICP6k2YnUrU26CaD3UBk/fgbxefXW5YNvEYhX8CIBKEB6gjkBXu0ITbyqd1SSeFlvInKnvluBwqk47l9KGM5RNdMrmXAT+x4JfYkobbWSer4zDlHwlI11BBvvXYvKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVnhJC6Tuj3thQ+Ulc4NcjgJAwaY9U4uFU8KXb3eXt8=;
 b=BY0LkJ5e7/ZQBPbb40UBWEL6wSfXRAhIpjDYgKKMSS6VNtxMbIUIwnLlWW2hzg/jtqr18blcDAUX9MRxK9f7SoLos+W5Nei50rFlfNS2XPvIJZ2clkbtT0dbKT7nYSlnbIVZ9B6pJYyTlHOKXie9wy6kTMSkvh5u9LkOajgAnT5M0NriwRJWtMlmGETOBTrW94ZLLgu4ALxPDTHi83GYNOTJTTkti6IuexGFDCiiZzoz9fdnCcI08u3sbqOo2S4aSf5iGhPsiWVoKAeiOoJARy6wuc22/ebUuEb9aed5MRhfLqaEBDLa2wJ5pCP8yu2torXcLJPpr56cB6J66D2CzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2546.namprd12.prod.outlook.com (52.132.28.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Fri, 9 Aug 2019 14:24:00 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543%7]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 14:24:00 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 4/5] drm/amdgpu: Support snooped PTE flag
Thread-Topic: [PATCH 4/5] drm/amdgpu: Support snooped PTE flag
Thread-Index: AQHVTlhXXcI9iAy5pkax2f/14M8R/abywAKAgAAeyPA=
Date: Fri, 9 Aug 2019 14:24:00 +0000
Message-ID: <BL0PR12MB25801EB371ADC1E82ED6AEA180D60@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <1565316926-19516-1-git-send-email-Oak.Zeng@amd.com>
 <1565316926-19516-4-git-send-email-Oak.Zeng@amd.com>
 <88fad585-ad1b-bca9-7079-d79896def19c@amd.com>
In-Reply-To: <88fad585-ad1b-bca9-7079-d79896def19c@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.228.209.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12538964-3477-4ef7-796f-08d71cd538ff
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2546; 
x-ms-traffictypediagnostic: BL0PR12MB2546:
x-microsoft-antispam-prvs: <BL0PR12MB2546D9A6EDC09A236BF236C880D60@BL0PR12MB2546.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(13464003)(199004)(189003)(14454004)(6246003)(14444005)(256004)(52536014)(476003)(86362001)(486006)(3846002)(8936002)(6116002)(2501003)(5660300002)(446003)(2906002)(71200400001)(71190400001)(8676002)(33656002)(81156014)(81166006)(11346002)(54906003)(9686003)(186003)(55016002)(7696005)(478600001)(76176011)(110136005)(229853002)(74316002)(305945005)(25786009)(4326008)(99286004)(6436002)(66066001)(7736002)(66446008)(26005)(66476007)(66556008)(64756008)(66946007)(316002)(53936002)(6506007)(102836004)(76116006)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2546;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GpUABkH/vPn9ww3NUZyYEYL9/5Wa8GWWk2AD1MwZZqNN3v09KdaYNdmyV7gK4drV1sj/YW7lUni7VDClK5QGf0wX3E1A9gIOhq4hCeuM4FiS1oA+wNSgEoIH7ouTTk+7sgpMZ+ABf4ocdxBffpIs9j/7r0gxNx2p1MTVVIyB7pCLvHX+I1xjWVNUUSxzvhciRDHWgs3bT7xnp4hjNNvrJ6MW83kgD/d2IgdlVs5ZjPkXmVvYS2nE82WDdtjtkBh8V2NcpmPUem8sEB8BYxrJgZqE57yHekyijtZWfByBwAS6otDdHInHK0L5+8ENDEYQA3wsVjNKCj/nJt9TZY4GCBeOn9pNarvznt1Avi3/vAjduAYFpkBPDE5a9gMSaEukOhF9Bh83Ojjhguu9Iaj6V6KMiGUsnMZ2NqVsxiXwDzI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12538964-3477-4ef7-796f-08d71cd538ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 14:24:00.4284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JCjKRM9TyczJ6HVUE6AH9hAVNXktVNCoGraYvYMMyXLBQOQHDMd5uWKxmUk2gJlz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2546
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVnhJC6Tuj3thQ+Ulc4NcjgJAwaY9U4uFU8KXb3eXt8=;
 b=htay2uDBSfJ3Wl6tBk9EXAZvhGIft03VwcRVhSh67edPc3W82XbRJE0RBt2A4r7pz53T0gvfsmLauod/F/SPqUo+mWNRfQP/vyir3hVWERjOhPVbdoh+J2QZxWLz+4DCZttKkvROgFlpN9rsYXIeXaHxjCxwxVO51yni9ddMu5U=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Keely,
 Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNClJlZ2FyZHMsDQpPYWsNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtv
ZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+IA0KU2VudDogRnJpZGF5
LCBBdWd1c3QgOSwgMjAxOSA4OjMxIEFNDQpUbzogWmVuZywgT2FrIDxPYWsuWmVuZ0BhbWQuY29t
PjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBLdWVobGluZywgRmVsaXggPEZl
bGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBLZWVseSwgU2VhbiA8U2Vhbi5LZWVseUBhbWQuY29tPg0K
U3ViamVjdDogUmU6IFtQQVRDSCA0LzVdIGRybS9hbWRncHU6IFN1cHBvcnQgc25vb3BlZCBQVEUg
ZmxhZw0KDQpBbSAwOS4wOC4xOSB1bSAwNDoxNSBzY2hyaWViIFplbmcsIE9hazoNCj4gU2V0IHNu
b29wZWQgUFRFIGZsYWcgYWNjb3JkaW5nIHRvIG1hcHBpbmcgZmxhZy4gV3JpdGUgcmVxdWVzdCB0
byBhIA0KPiBwYWdlIHdpdGggc25vb3BlZCBiaXQgc2V0LCB3aWxsIHNlbmQgb3V0IGludmFsaWRh
dGUgcHJvYmUgcmVxdWVzdCB0byANCj4gVENDIG9mIHRoZSByZW1vdGUgR1BVIHdoZXJlIHRoZSB2
cmFtIHBhZ2UgcmVzaWRlcy4NCj4NCj4gQ2hhbmdlLUlkOiBJNzk5ZjY4ZWM3YTVhMWFiZjMyMDc1
ZjVlZjMxMDUxNjQxYTBiMzczNg0KPiBTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdA
YW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAu
YyB8IDMgKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyANCj4gYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+IGluZGV4IGQ3MDk5MDIuLjhmYWVh
ZDMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPiBAQCAtNTk5
LDYgKzU5OSw5IEBAIHN0YXRpYyB1aW50NjRfdCBnbWNfdjlfMF9nZXRfdm1fcHRlX2ZsYWdzKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgIAlpZiAoZmxhZ3MgJiBBTURHUFVfVk1fUEFH
RV9QUlQpDQo+ICAgCQlwdGVfZmxhZyB8PSBBTURHUFVfUFRFX1BSVDsNCj4gICANCj4gKwlpZiAo
ZmxhZ3MgJiBBTURHUFVfVk1fUEFHRV9JTlZBTElEQVRFX1BST0JFKQ0KPiArCQlwdGVfZmxhZyB8
PSBBTURHUFVfUFRFX1NOT09QRUQ7DQo+ICsNCg0KU3RpbGwgYSBOQUssIHdlIGFic29sdXRlbHkg
bmVlZCBhIGNoZWNrIGhlcmUgdGhhdCB0aGlzIGlzIG9ubHkgc2V0IHdoZW4gdGhlIEJPIGlzIGlu
IFhHTUkuDQoNCltPYWtdOiBQZXIgZGlzY3Vzc2lvbiB3aXRoIHVwcGVyIGxheWVyIHN0YWNrLCBy
ZW1vdGUgdnJhbSBtYXBwaW5nIChlaXRoZXIgb3ZlciBQQ0llIG9yIFhHTUkpIHNob3VsZCBhbHdh
eXMgaW52YWxpZGF0ZSBwcm9iZSB0aGUgY2FjaGUgbGluZXMgb2YgR1BVIHdobyBvd25zIHRoZSBt
ZW1vcnkgb2JqZWN0Lg0KDQpDaHJpc3RpYW4uDQoNCj4gICAJcmV0dXJuIHB0ZV9mbGFnOw0KPiAg
IH0NCj4gICANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
