Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1099E0AF5
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 19:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1F06E8B5;
	Tue, 22 Oct 2019 17:46:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810072.outbound.protection.outlook.com [40.107.81.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772C86E8B5
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 17:46:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRcSLE2Xfyz2Ji2AgwJ8VuKEoy+kt6hkKygniy6VXDd0wEAmQIaEcC1YDl2ke3Y9Cg+7qrJWyz1ciMZO3/yPnDr6boyP0AnXido9SOEwldcbbnzmyPrlDSN5GlLYaFwgvFKSgadFAY5HRYjXh4fwDsCYW5z86FgldUjtsu4sAjdj6UpdgYD8uSM3/PXe1Z27G4prZdKnlDVgmiCUaS8zsqv2+ZVWJC+K4sB7XaCP7fEkLx2e4JgioWWeH0Px7OfEY851bMyGEZrnNzV0iku+9ZKBlbdfjrUNveyeaPmzj2rqADyO3YkGAYg3Za1ZN2Vgp5jeijYiXQrhmruf7FlGBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eisa7+M40D3s92x4dSJT+6sT5nUxpkbJUyx3a/N494c=;
 b=h03KU6LBN0NOlIwQ5UlcbK5Y1LNP83w1qm20EKG/LN2I5aPd3gVjzIazFtbpu2mxzXEc2PNCms55txFQ4it5YUru5sds9rtdejAPZZL+Lpcre3dZW72KpViWKppq4nMQ1JRRrxiauUXlHsm9fNT7aj0L30ueqx28YIYyAR9i1eShpZNjJHT1jbTZkTzaeBLB7pdJUyPBmVW6CYaTzKNL6wfL6RNflAVP5/3m/LtQNBIw1u3GbVZmpzgWsDcvZt0q8ERGaMre7ZEhFSofktw7dX9T1DWZuaBcC2qgwLGoYwoP4GfjSglXth3BhIdcV1G8cuZe34kD/kn/2XEdKpG8WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2404.namprd12.prod.outlook.com (52.132.10.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 17:46:51 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::145c:4149:8b99:c3b4]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::145c:4149:8b99:c3b4%6]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 17:46:51 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>
Subject: RE: Stack out of bounds in KFD on Arcturus
Thread-Topic: Stack out of bounds in KFD on Arcturus
Thread-Index: AQHVhSbPJxXevXoNDku355BSbMnne6dfWaOAgAATSQCAAXWEAIAACVlggAX7FgCAAAf/8IAAAwsAgAAEX0A=
Date: Tue, 22 Oct 2019 17:46:51 +0000
Message-ID: <BL0PR12MB258071C07B015BBE3C4CA54A80680@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <a81a3f82-1f21-663f-150c-cdbbbf231ab3@amd.com>
 <31aa5ae0-5eb4-38ca-aed7-d807ab19e2ca@amd.com>
 <96393d3a-ebf7-3c2b-5b51-6a968ee9b4f8@amd.com>
 <134de413-61fe-a6ee-96ac-73b694fcb94c@amd.com>
 <BL0PR12MB25806E425A051EA059C805EF806C0@BL0PR12MB2580.namprd12.prod.outlook.com>
 <f865ffcd-2be0-0135-ba78-f78b370aa1fd@amd.com>
 <BL0PR12MB2580ED7FB1607624E3D884B280680@BL0PR12MB2580.namprd12.prod.outlook.com>
 <bbba4ea5-f253-5974-397a-c38f8d4c857f@amd.com>
In-Reply-To: <bbba4ea5-f253-5974-397a-c38f8d4c857f@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6d771b2d-d67e-4f73-2b65-08d75717d200
x-ms-traffictypediagnostic: BL0PR12MB2404:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB2404DFE600FC925E1464ABE380680@BL0PR12MB2404.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(189003)(199004)(13464003)(8936002)(52536014)(256004)(5024004)(476003)(14444005)(6636002)(14454004)(486006)(76176011)(6306002)(9686003)(478600001)(71200400001)(99286004)(6436002)(25786009)(11346002)(446003)(26005)(6116002)(5660300002)(3846002)(7696005)(229853002)(8676002)(2906002)(71190400001)(30864003)(186003)(4326008)(81166006)(81156014)(33656002)(4001150100001)(76116006)(66476007)(66556008)(305945005)(86362001)(74316002)(66446008)(64756008)(66946007)(6246003)(53546011)(6506007)(966005)(55016002)(110136005)(66066001)(316002)(7736002)(102836004)(505234006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2404;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dvF7SDSMSyUmWYKri6SlCTOtlIJYKJys2nLfWUPVnQe099bQlHz7sc6hsr+l/4JvlCGLbNgEvWFkFqIQbFEDpX08CiMEhfZO8oVM0r0WSG4Gt/RIsCNLcgRKUyCjFmXBsr6UvWYXxIrppoaQ6LP0aCH5G+J9M9uIOvemiTJDF1VxjJ+pEdztXtjh5i4oxACWTqL4immJCsy4X5/O342p/dyNgCKZcC5u08hyZ+KRlFAjnoZdyCpnTWx9SN1/c13BmV05qjoOEdyQ1KyEOsLtYC9CUoFzM6yj8EujeHvHj3CLaVp3a9yKjmSvb7j5rDu9AQxsB/9ABHW6sf1/28m7Zucs3CHtKlB8NBybICCZDUUK+Lyxi7s8T4ni4evMEXAzZVVZ2uMQzrMmvVAlNmbWkXnttFU6A/TWb1g8kaJg6h4oooRZCByk1bhJ5aayXIlLsvSRF+FfL78BvSPlRbZQZfbUA2Wf/re00uJW42jGFTs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d771b2d-d67e-4f73-2b65-08d75717d200
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 17:46:51.3946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WhhvsxT/APqa5OWs43PEIO5zpEF13OwJpF+S2VPPSLh014LYg6t2uXkcch8c14CK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2404
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eisa7+M40D3s92x4dSJT+6sT5nUxpkbJUyx3a/N494c=;
 b=EQwLO5H0t5+ZNhB3KRlJbL+hUDy8fGEzchusmO4q+Q+ohmEtds09y2idwrKGxG6KZ/udAeEAvByfjm1NFeG+vtmoKe+vPx2AC/AxZE0pwY3yWtpQVlneRZUrii0WcZe/FqN/wQ2h7VLIn7CoYmQLC4NV+4IN7gGE2pRbt5iQiaA=
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U29ycnkgSSBzZWFyY2hlZCBteSBrY29uZmlnIGFuZCBJIGRpZG4ndCBmaW5kIHRoZSBzdGFjayBz
aXplIGNvbmZpZ3VyZSBhbnltb3JlLi4uTWF5YmUgdG9kYXkga2VybmVsIHN0YWNrIHNpemUgaXMg
bm90IGNvbmZpZ3VyYWJsZSBhbnltb3JlLi4uDQoNCkNhbiB5b3UgdHJ5IHlvdXIga2VybmVsIG9u
IHZlZ2ExMCBvciAyMCBvciBuYXZpMTA/IFdlIHdhbnQgdG8ga25vdyB3aGV0aGVyIHRoaXMgaXMg
bWkxMDAgc3BlY2lmaWMgaXNzdWUuDQoNCk9haw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KRnJvbTogR3JvZHpvdnNreSwgQW5kcmV5IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPiAN
ClNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMjIsIDIwMTkgMToyOCBQTQ0KVG86IFplbmcsIE9hayA8
T2FrLlplbmdAYW1kLmNvbT47IEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNv
bT4NCkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6IFN0YWNr
IG91dCBvZiBib3VuZHMgaW4gS0ZEIG9uIEFyY3R1cnVzDQoNCkkgZG9uJ3Qga25vdyAtIHdoYXQg
S2NvbmZpZyBmbGFnIHNob3VsZCBJIGxvb2sgYXQgPw0KDQpBbmRyZXkNCg0KT24gMTAvMjIvMTkg
MToxNyBQTSwgWmVuZywgT2FrIHdyb3RlOg0KPiBTb3JyeSBJIG1lYW50IGlzIHRoZSBrZXJuZWwg
c3RhY2sgc2l6ZSAxNktCIGluIHlvdXIga2NvbmZpZz8NCj4NCj4gT2FrDQo+DQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEdyb2R6b3Zza3ksIEFuZHJleSA8QW5kcmV5Lkdy
b2R6b3Zza3lAYW1kLmNvbT4NCj4gU2VudDogVHVlc2RheSwgT2N0b2JlciAyMiwgMjAxOSAxMjo0
OSBQTQ0KPiBUbzogWmVuZywgT2FrIDxPYWsuWmVuZ0BhbWQuY29tPjsgS3VlaGxpbmcsIEZlbGl4
IA0KPiA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBTdGFjayBvdXQgb2YgYm91bmRzIGluIEtGRCBvbiBB
cmN0dXJ1cw0KPg0KPiBPbiAxMC8xOC8xOSA1OjMxIFBNLCBaZW5nLCBPYWsgd3JvdGU6DQo+DQo+
PiBIaSBBbmRyZXksDQo+Pg0KPj4gV2hhdCBpcyB5b3VyIHN5c3RlbSBjb25maWd1cmF0aW9uPyBJ
IGRpZG7igJl0IHNlZSB0aGlzIGlzc3VlIGJlZm9yZS4gQWxzbyBzZWUgYXR0YWNoZWQgUUEncyBj
b25maWd1cmF0aW9uIC0geW91IGNhbiBjb21wYXJlIHRvIHNlZSBhbnkgZGlmZmVyZW5jZS4NCj4N
Cj4gQXR0YWNoZWQgaXMgbXkgbHNodw0KPg0KPj4gQWxzbyBJIGJlbGlldmUgZm9yIHg4Ni02NCwg
dGhlIGRlZmF1bHQga2VybmVsIHN0YWNrIHNpemUgaXMgMTZrYj8gSXMgdGhpcyB5b3VyIEtjb25m
aWc/DQo+DQo+IFdoYXQgZG8geW91IG1lYW4gaWYgdGhpcyBpcyBteSBLY29uZmlnID8gSXMgdGhl
cmUgcGFydGljdWxhciBLY29uZmlnIGZsYWcgeW91IGtub3cgdGhhdCBpIGNhbiBsb29rIGZvciA/
DQo+DQo+IEFuZHJleQ0KPg0KPg0KPj4gUmVnYXJkcywNCj4+IE9haw0KPj4NCj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+PiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgDQo+PiBLdWVobGluZywgRmVsaXgNCj4+
IFNlbnQ6IEZyaWRheSwgT2N0b2JlciAxOCwgMjAxOSA0OjU1IFBNDQo+PiBUbzogR3JvZHpvdnNr
eSwgQW5kcmV5IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPg0KPj4gQ2M6IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBTdWJqZWN0OiBSZTogU3RhY2sgb3V0IG9mIGJvdW5kcyBp
biBLRkQgb24gQXJjdHVydXMNCj4+DQo+PiBPbiAyMDE5LTEwLTE3IDY6MzggcC5tLiwgR3JvZHpv
dnNreSwgQW5kcmV5IHdyb3RlOg0KPj4+IE5vdCB0aGF0IEkgYXdhcmUgb2YsIGlzIHRoZXJlIGEg
c3BlY2lhbCBLY29uZmlnIGZsYWcgdG8gZGV0ZXJtaW5lIA0KPj4+IHN0YWNrIHNpemUgPw0KPj4g
SSByZW1lbWJlciB0aGVyZSB1c2VkIHRvIGJlIGEgS2NvbmZpZyBvcHRpb24gdG8gZm9yY2UgYSA0
S0Iga2VybmVsIHN0YWNrLiBJIGRvbid0IHNlZSBpdCBpbiB0aGUgY3VycmVudCBrZXJuZWwgYW55
IG1vcmUuDQo+Pg0KPj4gSSBkb24ndCBoYXZlIHRpbWUgdG8gd29yayBvbiB0aGlzIG15c2VsZi4g
SSdsbCBjcmVhdGUgYSB0aWNrZXQgYW5kIHNlZSBpZiBJIGNhbiBmaW5kIHNvbWVvbmUgdG8gaW52
ZXN0aWdhdGUuDQo+Pg0KPj4gVGhhbmtzLA0KPj4gICAgwqAgRmVsaXgNCj4+DQo+Pg0KPj4+IEFu
ZHJleQ0KPj4+DQo+Pj4gT24gMTAvMTcvMTkgNToyOSBQTSwgS3VlaGxpbmcsIEZlbGl4IHdyb3Rl
Og0KPj4+PiBJIGRvbid0IHNlZSB3aHkgdGhpcyBwcm9ibGVtIHdvdWxkIGJlIHNwZWNpZmljIHRv
IEFyY3R1cnVzLiBJIGRvbid0IA0KPj4+PiBzZWUgYW55IGV4Y2Vzc2l2ZSBhbGxvY2F0aW9ucyBv
biB0aGUgc3RhY2sgZWl0aGVyLiBBbHNvIHRoZSBjb2RlIA0KPj4+PiBpbnZvbHZlZCBoZXJlIGhh
c24ndCBjaGFuZ2VkIHJlY2VudGx5Lg0KPj4+Pg0KPj4+PiBBcmUgeW91IHVzaW5nIHNvbWUgd2Vp
cmQga2VybmVsIGNvbmZpZyB3aXRoIGEgc21hbGxlciBzdGFjaz8gSXMgaXQgDQo+Pj4+IHNwZWNp
ZmljIHRvIGEgY29tcGlsZXIgdmVyc2lvbiBvciBzb21lIG9wdGltaXphdGlvbiBmbGFncz8gSSd2
ZSANCj4+Pj4gc29tZXRpbWVzIHNlZW4gZnVuY3Rpb24gaW5saW5pbmcgY2F1c2UgZXhjZXNzaXZl
IHN0YWNrIHVzYWdlLg0KPj4+Pg0KPj4+PiBSZWdhcmRzLA0KPj4+PiAgICAgIMKgIEZlbGl4DQo+
Pj4+DQo+Pj4+IE9uIDIwMTktMTAtMTcgNDowOSBwLm0uLCBHcm9kem92c2t5LCBBbmRyZXkgd3Jv
dGU6DQo+Pj4+PiBIZSBGZWxpeCAtIEkgc2VlIHRoaXMgb24gYm9vdCB3aGVuIHdvcmtpbmcgd2l0
aCBBcmN0dXJ1cy4NCj4+Pj4+DQo+Pj4+PiBBbmRyZXkNCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gW8Kg
IDEwMy42MDIwOTJdIGtmZCBrZmQ6IEFsbG9jYXRlZCAzOTY5MDU2IGJ5dGVzIG9uIGdhcnQgWyAN
Cj4+Pj4+IDEwMy42MTA3NjldIA0KPj4+Pj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+Pj4+PiBbwqAgMTAzLjYxMTQ2
OV0gQlVHOiBLQVNBTjogc3RhY2stb3V0LW9mLWJvdW5kcyBpbg0KPj4+Pj4ga2ZkX2NyZWF0ZV92
Y3JhdF9pbWFnZV9ncHUrMHg1ZGIvMHhiODAgW2FtZGdwdV0gW8KgIDEwMy42MTE2NDZdIA0KPj4+
Pj4gUmVhZCBvZiBzaXplIDQgYXQgYWRkciBmZmZmODg4M2NiMTllZTM4IGJ5IHRhc2sgbW9kcHJv
YmUvMTEyMg0KPj4+Pj4NCj4+Pj4+IFvCoCAxMDMuNjExODM2XSBDUFU6IDMgUElEOiAxMTIyIENv
bW06IG1vZHByb2JlIFRhaW50ZWQ6IEcgTyANCj4+Pj4+IDUuMy4wLXJjMysgIzQ1IFvCoCAxMDMu
NjExODQ3XSBIYXJkd2FyZSBuYW1lOiBTeXN0ZW0gbWFudWZhY3R1cmVyIA0KPj4+Pj4gU3lzdGVt
IFByb2R1Y3QgTmFtZS9aMTcwLVBSTywgQklPUyAxOTAyIDA2LzI3LzIwMTYgW8KgIDEwMy42MTE4
NTZdIA0KPj4+Pj4gQ2FsbCBUcmFjZToNCj4+Pj4+IFvCoCAxMDMuNjExODc5XcKgIGR1bXBfc3Rh
Y2srMHg3MS8weGFiIFvCoCAxMDMuNjExOTA3XQ0KPj4+Pj4gcHJpbnRfYWRkcmVzc19kZXNjcmlw
dGlvbisweDFkYS8weDNjMA0KPj4+Pj4gW8KgIDEwMy42MTI0NTNdwqAgPyBrZmRfY3JlYXRlX3Zj
cmF0X2ltYWdlX2dwdSsweDVkYi8weGI4MCBbYW1kZ3B1XSANCj4+Pj4+IFsgMTAzLjYxMjQ3OV3C
oCBfX2thc2FuX3JlcG9ydCsweDEzZi8weDFhMCBbwqAgMTAzLjYxMzAyMl3CoCA/DQo+Pj4+PiBr
ZmRfY3JlYXRlX3ZjcmF0X2ltYWdlX2dwdSsweDVkYi8weGI4MCBbYW1kZ3B1XSBbwqAgMTAzLjYx
MzU4MF3CoCA/DQo+Pj4+PiBrZmRfY3JlYXRlX3ZjcmF0X2ltYWdlX2dwdSsweDVkYi8weGI4MCBb
YW1kZ3B1XSBbwqAgMTAzLjYxMzYwNF0NCj4+Pj4+IGthc2FuX3JlcG9ydCsweGUvMHgyMCBbwqAg
MTAzLjYxNDE0OV0NCj4+Pj4+IGtmZF9jcmVhdGVfdmNyYXRfaW1hZ2VfZ3B1KzB4NWRiLzB4Yjgw
IFthbWRncHVdIFvCoCAxMDMuNjE0NzYyXcKgID8NCj4+Pj4+IGtmZF9maWxsX2dwdV9tZW1vcnlf
YWZmaW5pdHkrMHgxMTAvMHgxMTAgW2FtZGdwdV0gW8KgIDEwMy42MTQ3OTZdwqAgPw0KPj4+Pj4g
X19hbGxvY19wYWdlc19ub2RlbWFzaysweDJjOS8weDU2MA0KPj4+Pj4gW8KgIDEwMy42MTQ4MjRd
wqAgPyBfX2FsbG9jX3BhZ2VzX3Nsb3dwYXRoKzB4MTM5MC8weDEzOTANCj4+Pj4+IFvCoCAxMDMu
NjE0ODk4XcKgID8ga21hbGxvY19vcmRlcisweDYzLzB4NzAgW8KgIDEwMy42MTU0NjldDQo+Pj4+
PiBrZmRfY3JlYXRlX2NyYXRfaW1hZ2VfdmlydHVhbCsweDcwYy8weDc3MCBbYW1kZ3B1XSBbwqAg
MTAzLjYxNjA1NF3CoCA/DQo+Pj4+PiBrZmRfY3JlYXRlX2NyYXRfaW1hZ2VfYWNwaSsweDFjMC8w
eDFjMCBbYW1kZ3B1XSBbwqAgMTAzLjYxNjA5NV3CoCA/DQo+Pj4+PiB1cF93cml0ZSsweDRiLzB4
NzAgW8KgIDEwMy42MTY2NDldDQo+Pj4+PiBrZmRfdG9wb2xvZ3lfYWRkX2RldmljZSsweDk4ZC8w
eGIxMCBbYW1kZ3B1XSBbwqAgMTAzLjYxNzIwN13CoCA/DQo+Pj4+PiBrZmRfdG9wb2xvZ3lfc2h1
dGRvd24rMHg2MC8weDYwIFthbWRncHVdIFvCoCAxMDMuNjE3NzQzXcKgID8NCj4+Pj4+IHN0YXJ0
X2Nwc2NoKzB4MmZmLzB4M2EwIFthbWRncHVdIFvCoCAxMDMuNjE3Nzc3XcKgID8NCj4+Pj4+IG11
dGV4X2xvY2tfaW9fbmVzdGVkKzB4YWMwLzB4YWMwIFvCoCAxMDMuNjE3ODA3XcKgID8NCj4+Pj4+
IF9fbXV0ZXhfdW5sb2NrX3Nsb3dwYXRoKzB4ZGEvMHg0MjANCj4+Pj4+IFvCoCAxMDMuNjE3ODQ4
XcKgID8gX19tdXRleF91bmxvY2tfc2xvd3BhdGgrMHhkYS8weDQyMA0KPj4+Pj4gW8KgIDEwMy42
MTc4NzddwqAgPyB3YWl0X2Zvcl9jb21wbGV0aW9uKzB4MjAwLzB4MjAwIFvCoCAxMDMuNjE4NDYx
XcKgID8NCj4+Pj4+IHN0YXJ0X2Nwc2NoKzB4MzhiLzB4M2EwIFthbWRncHVdIFvCoCAxMDMuNjE5
MDExXcKgID8NCj4+Pj4+IGNyZWF0ZV9xdWV1ZV9jcHNjaCsweDY3MC8weDY3MCBbYW1kZ3B1XSBb
wqAgMTAzLjYxOTU3M13CoCA/DQo+Pj4+PiBrZmRfaW9tbXVfZGV2aWNlX2luaXQrMHg5Mi8weDFl
MCBbYW1kZ3B1XSBbwqAgMTAzLjYyMDExMl3CoCA/DQo+Pj4+PiBrZmRfaW9tbXVfcmVzdW1lKzB4
MmMvMHgyYzAgW2FtZGdwdV0gW8KgIDEwMy42MjA2NTVdwqAgPw0KPj4+Pj4ga2ZkX2lvbW11X2No
ZWNrX2RldmljZSsweGYwLzB4ZjAgW2FtZGdwdV0gW8KgIDEwMy42MjEyMjhdDQo+Pj4+PiBrZ2Qy
a2ZkX2RldmljZV9pbml0KzB4NDc0LzB4ODcwIFthbWRncHVdIFvCoCAxMDMuNjIxNzgxXQ0KPj4+
Pj4gYW1kZ3B1X2FtZGtmZF9kZXZpY2VfaW5pdCsweDI5MS8weDM5MCBbYW1kZ3B1XSBbwqAgMTAz
LjYyMjMyOV3CoCA/DQo+Pj4+PiBhbWRncHVfYW1ka2ZkX2RldmljZV9wcm9iZSsweDkwLzB4OTAg
W2FtZGdwdV0gW8KgIDEwMy42MjIzNDRdwqAgPw0KPj4+Pj4ga21zZ19kdW1wX3Jld2luZF9ub2xv
Y2srMHg1OS8weDU5IFvCoCAxMDMuNjIyODk1XcKgID8NCj4+Pj4+IGFtZGdwdV9yYXNfZWVwcm9t
X3Rlc3QrMHg3MS8weDkwIFthbWRncHVdIFvCoCAxMDMuNjIzNDI0XQ0KPj4+Pj4gYW1kZ3B1X2Rl
dmljZV9pbml0KzB4MWJiZS8weDJmMDAgW2FtZGdwdV0gW8KgIDEwMy42MjM4MTldwqAgPw0KPj4+
Pj4gYW1kZ3B1X2RldmljZV9oYXNfZGNfc3VwcG9ydCsweDMwLzB4MzAgW2FtZGdwdV0gW8KgIDEw
My42MjM4NDJdwqAgPw0KPj4+Pj4gX19pc29sYXRlX2ZyZWVfcGFnZSsweDI5MC8weDI5MCBbwqAg
MTAzLjYyMzg1Ml3CoCA/DQo+Pj4+PiBmc19yZWNsYWltX2FjcXVpcmUucGFydC45NysweDUvMHgz
MA0KPj4+Pj4gW8KgIDEwMy42MjM4OTFdwqAgPyBfX2FsbG9jX3BhZ2VzX25vZGVtYXNrKzB4MmM5
LzB4NTYwDQo+Pj4+PiBbwqAgMTAzLjYyMzkxMl3CoCA/IF9fYWxsb2NfcGFnZXNfc2xvd3BhdGgr
MHgxMzkwLzB4MTM5MA0KPj4+Pj4gW8KgIDEwMy42MjM5NDVdwqAgPyBrYXNhbl91bnBvaXNvbl9z
aGFkb3crMHgzMS8weDQwIFvCoCAxMDMuNjIzOTcwXcKgID8NCj4+Pj4+IGttYWxsb2Nfb3JkZXIr
MHg2My8weDcwIFvCoCAxMDMuNjI0MzM3XQ0KPj4+Pj4gYW1kZ3B1X2RyaXZlcl9sb2FkX2ttcysw
eGQ5LzB4NDMwIFthbWRncHVdIFvCoCAxMDMuNjI0NjkwXcKgID8NCj4+Pj4+IGFtZGdwdV9yZWdp
c3Rlcl9ncHVfaW5zdGFuY2UrMHhlMC8weGUwIFthbWRncHVdIFvCoCAxMDMuNjI0NzU2XcKgID8N
Cj4+Pj4+IGRybV9kZXZfcmVnaXN0ZXIrMHgxOWMvMHgzMTAgW2RybV0gW8KgIDEwMy42MjQ3Njhd
wqAgPw0KPj4+Pj4gX19rYXNhbl9zbGFiX2ZyZWUrMHgxMzMvMHgxNjAgW8KgIDEwMy42MjQ4NDld
DQo+Pj4+PiBkcm1fZGV2X3JlZ2lzdGVyKzB4MWY1LzB4MzEwIFtkcm1dIFvCoCAxMDMuNjI1MjEy
XQ0KPj4+Pj4gYW1kZ3B1X3BjaV9wcm9iZSsweDEwOS8weDFmMCBbYW1kZ3B1XSBbwqAgMTAzLjYy
NTU2NV3CoCA/DQo+Pj4+PiBhbWRncHVfcG1vcHNfcnVudGltZV9pZGxlKzB4ZTAvMHhlMCBbYW1k
Z3B1XSBbwqAgMTAzLjYyNTU4MF0NCj4+Pj4+IGxvY2FsX3BjaV9wcm9iZSsweDc0LzB4ZDAgW8Kg
IDEwMy42MjU2MDNdDQo+Pj4+PiBwY2lfZGV2aWNlX3Byb2JlKzB4MWZhLzB4MzEwIFvCoCAxMDMu
NjI1NjIwXcKgID8NCj4+Pj4+IHBjaV9kZXZpY2VfcmVtb3ZlKzB4MWMwLzB4MWMwIFvCoCAxMDMu
NjI1NjQwXcKgID8NCj4+Pj4+IHN5c2ZzX2RvX2NyZWF0ZV9saW5rX3NkLmlzcmEuMisweDc0LzB4
ZTANCj4+Pj4+IFvCoCAxMDMuNjI1NjczXcKgIHJlYWxseV9wcm9iZSsweDM2Ny8weDVkMCBbwqAg
MTAzLjYyNTcwMF0NCj4+Pj4+IGRyaXZlcl9wcm9iZV9kZXZpY2UrMHgxNzcvMHgxYjAgW8KgIDEw
My42MjU3MjFdDQo+Pj4+PiBkZXZpY2VfZHJpdmVyX2F0dGFjaCsweDhhLzB4OTAgW8KgIDEwMy42
MjU3MzddwqAgPw0KPj4+Pj4gZGV2aWNlX2RyaXZlcl9hdHRhY2grMHg5MC8weDkwIFvCoCAxMDMu
NjI1NzQ2XQ0KPj4+Pj4gX19kcml2ZXJfYXR0YWNoKzB4ZWIvMHgxOTAgW8KgIDEwMy42MjU3NjVd
wqAgPw0KPj4+Pj4gZGV2aWNlX2RyaXZlcl9hdHRhY2grMHg5MC8weDkwIFvCoCAxMDMuNjI1Nzcz
XQ0KPj4+Pj4gYnVzX2Zvcl9lYWNoX2RldisweGU0LzB4MTYwIFvCoCAxMDMuNjI1Nzg5XcKgID8N
Cj4+Pj4+IHN1YnN5c19kZXZfaXRlcl9leGl0KzB4MTAvMHgxMCBbwqAgMTAzLjYyNTgyOV0NCj4+
Pj4+IGJ1c19hZGRfZHJpdmVyKzB4Mjc3LzB4MzMwIFvCoCAxMDMuNjI1ODU1XQ0KPj4+Pj4gZHJp
dmVyX3JlZ2lzdGVyKzB4YzYvMHgxYTAgW8KgIDEwMy42MjU4NjZdwqAgPyAweGZmZmZmZmZmYTBk
ODgwMDAgWyANCj4+Pj4+IDEwMy42MjU4ODBdwqAgZG9fb25lX2luaXRjYWxsKzB4ZDMvMHgzMzQg
W8KgIDEwMy42MjU4OTVdwqAgPw0KPj4+Pj4gdHJhY2VfZXZlbnRfcmF3X2V2ZW50X2luaXRjYWxs
X2ZpbmlzaCsweDE1MC8weDE1MA0KPj4+Pj4gW8KgIDEwMy42MjU5MTFdwqAgPyBrYXNhbl91bnBv
aXNvbl9zaGFkb3crMHgzMS8weDQwIFvCoCAxMDMuNjI1OTI0XcKgID8NCj4+Pj4+IF9fa2FzYW5f
a21hbGxvYysweGQ1LzB4ZjAgW8KgIDEwMy42MjU5NDZdwqAgPw0KPj4+Pj4ga21lbV9jYWNoZV9h
bGxvY190cmFjZSsweDE1NC8weDMwMA0KPj4+Pj4gW8KgIDEwMy42MjU5NTVdwqAgPyBrYXNhbl91
bnBvaXNvbl9zaGFkb3crMHgzMS8weDQwIFvCoCAxMDMuNjI1OTg1XQ0KPj4+Pj4gZG9faW5pdF9t
b2R1bGUrMHhlYy8weDM1NCBbwqAgMTAzLjYyNjAxMV3CoCANCj4+Pj4+IGxvYWRfbW9kdWxlKzB4
M2M5MS8weDQ5ODAgW8KgIDEwMy42MjYxMThdwqAgPyANCj4+Pj4+IG1vZHVsZV9mcm9iX2FyY2hf
c2VjdGlvbnMrMHgyMC8weDIwDQo+Pj4+PiBbwqAgMTAzLjYyNjEzMl3CoCA/IGltYV9yZWFkX2Zp
bGUrMHgxMC8weDEwIFvCoCAxMDMuNjI2MTQyXcKgID8NCj4+Pj4+IHZmc19yZWFkKzB4MTI3LzB4
MTkwIFvCoCAxMDMuNjI2MTYzXcKgID8ga2VybmVsX3JlYWQrMHg5NS8weGIwIFsgDQo+Pj4+PiAx
MDMuNjI2MTg3XcKgID8ga2VybmVsX3JlYWRfZmlsZSsweDFhNS8weDM0MCBbwqAgMTAzLjYyNjI3
N13CoCA/DQo+Pj4+PiBfX2RvX3N5c19maW5pdF9tb2R1bGUrMHgxNzUvMHgxYjAgW8KgIDEwMy42
MjYyODddDQo+Pj4+PiBfX2RvX3N5c19maW5pdF9tb2R1bGUrMHgxNzUvMHgxYjAgW8KgIDEwMy42
MjYzMDFdwqAgPw0KPj4+Pj4gX19pYTMyX3N5c19pbml0X21vZHVsZSsweDQwLzB4NDAgW8KgIDEw
My42MjYzMzhdwqAgPw0KPj4+Pj4gbG9ja19kb3duZ3JhZGUrMHgzOTAvMHgzOTAgW8KgIDEwMy42
MjYzOTZdwqAgPw0KPj4+Pj4gdnRpbWVfdXNlcl9leGl0KzB4YzgvMHhlMCBbwqAgMTAzLjYyNjQy
M13CoCBkb19zeXNjYWxsXzY0KzB4N2QvMHgyNTAgDQo+Pj4+PiBbIDEwMy42MjY0NDBdwqAgZW50
cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDQvMHhhOQ0KPj4+Pj4gW8KgIDEwMy42MjY0
NTBdIFJJUDogMDAzMzoweDdmMDk5ODQ4NTRkOSBbwqAgMTAzLjYyNjQ2MV0gQ29kZTogMDAgZjMN
Cj4+Pj4+IGMzIDY2IDJlIDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIDBmIDFmIDQwIDAwDQo+Pj4+
PiA0OCA4OSBmOCA0OCA4OSBmNyA0OCA4OSBkNiA0OCA4OSBjYSA0ZCA4OSBjMiA0ZCA4OSBjOCA0
YyA4YiA0YyAyNA0KPj4+Pj4gMDggMGYNCj4+Pj4+IDA1IDw0OD4gM2QgMDEgZjAgZmYgZmYgNzMg
MDEgYzMgNDggOGIgMGQgOGYgMjkgMmMgMDAgZjcgZDggNjQgODkgDQo+Pj4+PiAwMQ0KPj4+Pj4g
NDggW8KgIDEwMy42MjY0NjhdIFJTUDogMDAyYjowMDAwN2ZmYzQyODk2MDA4IEVGTEFHUzogMDAw
MDAyNDYgT1JJR19SQVg6DQo+Pj4+PiAwMDAwMDAwMDAwMDAwMTM5DQo+Pj4+PiBbwqAgMTAzLjYy
NjQ3OV0gUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDU1OWE1MjQ5NTQwMCBSQ1g6DQo+
Pj4+PiAwMDAwN2YwOTk4NDg1NGQ5DQo+Pj4+PiBbwqAgMTAzLjYyNjQ4Nl0gUkRYOiAwMDAwMDAw
MDAwMDAwMDAwIFJTSTogMDAwMDU1OWE1MjQ5OTkwMCBSREk6DQo+Pj4+PiAwMDAwMDAwMDAwMDAw
MDA2DQo+Pj4+PiBbwqAgMTAzLjYyNjQ5M10gUkJQOiAwMDAwNTU5YTUyNDk5OTAwIFIwODogMDAw
MDAwMDAwMDAwMDAwMCBSMDk6DQo+Pj4+PiAwMDAwMDAwMDAwMDAwMDAwDQo+Pj4+PiBbwqAgMTAz
LjYyNjUwMF0gUjEwOiAwMDAwMDAwMDAwMDAwMDA2IFIxMTogMDAwMDAwMDAwMDAwMDI0NiBSMTI6
DQo+Pj4+PiAwMDAwMDAwMDAwMDAwMDAwDQo+Pj4+PiBbwqAgMTAzLjYyNjUwOF0gUjEzOiAwMDAw
NTU5YTUyNDk5YjMwIFIxNDogMDAwMDAwMDAwMDA0MDAwMCBSMTU6DQo+Pj4+PiAwMDAwMDAwMDAw
MDAwMDEzDQo+Pj4+Pg0KPj4+Pj4gW8KgIDEwMy42MjY1OTJdIFRoZSBidWdneSBhZGRyZXNzIGJl
bG9uZ3MgdG8gdGhlIHBhZ2U6DQo+Pj4+PiBbwqAgMTAzLjYyNjY2NV0gcGFnZTpmZmZmZWEwMDBm
MmM2NzgwIHJlZmNvdW50OjAgbWFwY291bnQ6MA0KPj4+Pj4gbWFwcGluZzowMDAwMDAwMDAwMDAw
MDAwIGluZGV4OjB4MCBbwqAgMTAzLjYyNjY3NV0gZmxhZ3M6IA0KPj4+Pj4gMHgyZmZmZjAwMDAw
MDAwMDAoKSBbwqAgMTAzLjYyNjY4Nl0gcmF3Og0KPj4+Pj4gMDJmZmZmMDAwMDAwMDAwMCAwMDAw
MDAwMDAwMDAwMDAwIGZmZmZlYTAwMGYyYzY3ODgNCj4+Pj4+IDAwMDAwMDAwMDAwMDAwMDANCj4+
Pj4+IFvCoCAxMDMuNjI2Njk2XSByYXc6IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAw
MCANCj4+Pj4+IDAwMDAwMDAwZmZmZmZmZmYNCj4+Pj4+IDAwMDAwMDAwMDAwMDAwMDANCj4+Pj4+
IFvCoCAxMDMuNjI2NzAyXSBwYWdlIGR1bXBlZCBiZWNhdXNlOiBrYXNhbjogYmFkIGFjY2VzcyBk
ZXRlY3RlZA0KPj4+Pj4NCj4+Pj4+IFvCoCAxMDMuNjI2NzQyXSBhZGRyIGZmZmY4ODgzY2IxOWVl
MzggaXMgbG9jYXRlZCBpbiBzdGFjayBvZiB0YXNrDQo+Pj4+PiBtb2Rwcm9iZS8xMTIyIGF0IG9m
ZnNldCAyNjQgaW4gZnJhbWU6DQo+Pj4+PiBbwqAgMTAzLjYyNzIzM13CoCBrZmRfY3JlYXRlX3Zj
cmF0X2ltYWdlX2dwdSsweDAvMHhiODAgW2FtZGdwdV0NCj4+Pj4+DQo+Pj4+PiBbwqAgMTAzLjYy
NzM0Nl0gdGhpcyBmcmFtZSBoYXMgMyBvYmplY3RzOg0KPj4+Pj4gW8KgIDEwMy42Mjc0MDVdwqAg
WzMyLCAzNikgJ2F2YWlsX3NpemUnDQo+Pj4+PiBbwqAgMTAzLjYyNzQxMF3CoCBbOTYsIDEyMCkg
J2xvY2FsX21lbV9pbmZvJw0KPj4+Pj4gW8KgIDEwMy42Mjc0NjZdwqAgWzE2MCwgMjY0KSAnY3Vf
aW5mbycNCj4+Pj4+DQo+Pj4+PiBbwqAgMTAzLjYyNzYwMl0gTWVtb3J5IHN0YXRlIGFyb3VuZCB0
aGUgYnVnZ3kgYWRkcmVzczoNCj4+Pj4+IFvCoCAxMDMuNjI3Njc1XcKgIGZmZmY4ODgzY2IxOWVk
MDA6IDAwIDAwIDAwIDAwIDAwIDAwIGYxIGYxIGYxIGYxIDA0DQo+Pj4+PiBmNCBmNA0KPj4+Pj4g
ZjQgZjIgZjINCj4+Pj4+IFvCoCAxMDMuNjI3NzgwXcKgIGZmZmY4ODgzY2IxOWVkODA6IGYyIGYy
IDAwIDAwIDAwIGY0IGYyIGYyIGYyIGYyIDAwDQo+Pj4+PiAwMCAwMA0KPj4+Pj4gMDAgMDAgMDAN
Cj4+Pj4+IFvCoCAxMDMuNjI3ODg1XSA+ZmZmZjg4ODNjYjE5ZWUwMDogMDAgMDAgMDAgMDAgMDAg
MDAgMDAgZjQgZjQgZjQgZjMNCj4+Pj4+IGYzIGYzDQo+Pj4+PiBmMyAwMCAwMA0KPj4+Pj4gW8Kg
IDEwMy42Mjc5ODldwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXiBbIA0KPj4+Pj4gMTAzLjYyODA2
NV3CoCBmZmZmODg4M2NiMTllZTgwOiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MA0KPj4+Pj4gMDANCj4+Pj4+IDAwIDAwIDAwDQo+Pj4+PiBbwqAgMTAzLjYyODE2OV3CoCBmZmZm
ODg4M2NiMTllZjAwOiBmMSBmMSBmMSBmMSAwMCBmNCBmNCBmNCBmMyBmMyBmMw0KPj4+Pj4gZjMg
MDANCj4+Pj4+IDAwIDAwIDAwDQo+Pj4+PiBbwqAgMTAzLjYyODI3M10NCj4+Pj4+ID09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQ0KPj4+Pj4NCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQo+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
