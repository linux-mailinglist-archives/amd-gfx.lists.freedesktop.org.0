Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 824A2B0DF2
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 13:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141CD6ECE3;
	Thu, 12 Sep 2019 11:35:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780077.outbound.protection.outlook.com [40.107.78.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B538F6ECE2
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 11:35:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdJ4W/vYq0wtw4ROCqzwnCvoVyYwaACIQqFCRRLEq8nuHJkdZaNCTnKdcmgdCa9tgLW+us9e3djO+FXCABffR6/bJhtwtV8+woBz4ATiE/d9bt4SL8D3Z1hudksnYe9ZDNNuGJHcZpZ4a+Gl7Irqjhxy2mpk0XZX1gIZyHkRtR7dOnS1kNlc+PegMUJ4FLo6CvA0y8ynP8JpbxYozfB1Fvo8DOnFqiKLk+WqdkUJUlFQnGCRwkzkLp5ulF2BVdz8kL4jGE1XgLsfy4idqDuYpdbRaGgeJCro15u6N4qUE4QU0cQVjzb35OqE2pKSt3r5Br4nHywO0KY7kyHb95zOzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciINjJwzPm1ZdhPIjLhTpN2QU/f9jrUc5rl/vfM3xss=;
 b=XXVIKsi5La7EQkxbKlqfyT9ST2gE8a0K1C8yDZVH3gilKGt9JO7Y6Wglne6SkrDXfRWWUmz+FIxuJ6pxrhxxE82A/Sq/IMC+z8NeS3CBfG+/NU7ltRj2PusI/ekMB+Fge2GE051ckKIF3Z2kynqAMYis3BLxJ6CPkouGfC/PilZbVdhcvVXozkV9TW2SiQtWbeBBDG8xhLWkC0EdeKmTDCqU1frIzdmp7uRr9UA+BUr2v80sKxVUcKjkEJeKK3YjkCPbVxfo+XuMNBG6UjKAObA/KBfIInlIALxMg5fNmnXHRIvRJTdcYmczpQAdOPUGJx9m/XesuXAzYdnYmlC/jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3517.namprd12.prod.outlook.com (20.179.80.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.20; Thu, 12 Sep 2019 11:35:09 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2241.018; Thu, 12 Sep 2019
 11:35:09 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Chen, Guchun"
 <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Fix mutex lock from atomic context.
Thread-Topic: [PATCH] drm/amdgpu: Fix mutex lock from atomic context.
Thread-Index: AQHVaA/AIusXbm4yfUGXHWnUs1JB1aclyi0wgAC9awCAAAYyAIAAu7aAgAAK/oCAAJbbcA==
Date: Thu, 12 Sep 2019 11:35:09 +0000
Message-ID: <MN2PR12MB3054CE8F6F6097847B188457B0B00@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1568144487-27802-1-git-send-email-andrey.grodzovsky@amd.com>
 <MN2PR12MB3054A0B4D399377417213B76B0B10@MN2PR12MB3054.namprd12.prod.outlook.com>
 <d35cc3f6-ff46-175e-3a92-5f7948f97bef@amd.com>
 <603add77-1476-ebc8-69f9-2cf88a788a6b@amd.com>,
 <SN6PR12MB2813F0DFFE8EC027AAF6D6DAF1B00@SN6PR12MB2813.namprd12.prod.outlook.com>
 <MWHPR12MB14533B06E13B86E54520E991EAB00@MWHPR12MB1453.namprd12.prod.outlook.com>
In-Reply-To: <MWHPR12MB14533B06E13B86E54520E991EAB00@MWHPR12MB1453.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 688309e9-6736-4128-fc53-08d73775449a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3517; 
x-ms-traffictypediagnostic: MN2PR12MB3517:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB351758968362D56AE9316121B0B00@MN2PR12MB3517.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39850400004)(376002)(396003)(366004)(136003)(199004)(189003)(13464003)(52314003)(186003)(229853002)(86362001)(76116006)(7696005)(76176011)(446003)(2501003)(11346002)(2906002)(26005)(478600001)(8936002)(81166006)(74316002)(71190400001)(71200400001)(8676002)(6116002)(4326008)(3846002)(6246003)(6506007)(81156014)(53546011)(102836004)(53936002)(66446008)(64756008)(6436002)(52536014)(14454004)(66556008)(99286004)(9686003)(55016002)(33656002)(14444005)(316002)(7736002)(5660300002)(305945005)(25786009)(66066001)(110136005)(66946007)(66476007)(476003)(256004)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3517;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yctpbE2srepLDy5PpSC/Tq4BRhN53QW1nlEzpiR2tM/mG1WSWOHGqBVqPgGz38wLVnj6u724ntQd6HSon96Q/3NHW06e5AsTMAntklVKPRsk6DJ0XaD08PpPKDXeae070xI1Vp1vyu8QK9WHWMshux997Ogq7v8HhRtO5JGT6+85vpRfsK7rRyi6dpe6dGO3BE+Hz2GyUX7W+u8DYhF2y8pxuCQc6ljSuPYBuONEdRomzoVpvvI3cyxhVi1hmub3XBfH4KwaLmtXUN8RcO95RviKt6fqnSewh4UNvy2x647UoZDWceWyZ8BrhHXnP+OQgQ1BAWC4XpJVa541kCyDQcmlAmXldpQQHEN+qjMe19ifdzYKHZN0MP2RzbjI/VOtYuMgSdueYi/2suRDfa1ejY9idi2DK3FPUv0IiZzL1Nk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 688309e9-6736-4128-fc53-08d73775449a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 11:35:09.6304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qx91SKsqwbQdPuW/frVwL3IVSMbPOnxRyjRzXTL0ZwRg7DoQVSkOftH2AqGcvMbV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3517
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciINjJwzPm1ZdhPIjLhTpN2QU/f9jrUc5rl/vfM3xss=;
 b=ELgOe06HKRTWLxoGCriomrug7afFiE7JJYlY1sMfxK0TSdYh2CcbQsddclrKtrj7IkP+9l7VkGxWRj/NdB4gDnIx/ljbU917XH6BtxzMf3Hdr9ZJSNWLqXUkCa19zbnWEG2B3IX/bFqzujwE2U9tROVy9E2jMOfT6TeNi5GXo1c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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

SGkgQW5kcmV5Og0KDQpBcmUgeW91IHN1cmUgb2YgdGhlIFZSQU0gY29udGVudCBsb3NzIGFmdGVy
IGdwdSByZXNldD8gSSdtIG5vdCB2ZXJ5IGZhbWlsaWFyIHdpdGggdGhlIGRldGFpbCBvZiBncHUg
cmVzZXQgYW5kIEknbGwgZG8gZXhwZXJpbWVudCB0byBjb25maXJtIHRoZSBjYXNlIHlvdSBtZW50
aW9uZWQuDQoNClJlZ2FyZHMsDQpUYW8NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBHcm9kem92c2t5LCBBbmRyZXkgPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+DQo+
IFNlbnQ6IDIwMTnlubQ55pyIMTLml6UgMTA6MzINCj4gVG86IENoZW4sIEd1Y2h1biA8R3VjaHVu
LkNoZW5AYW1kLmNvbT47IFpob3UxLCBUYW8NCj4gPFRhby5aaG91MUBhbWQuY29tPjsgYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFu
ZGVyLkRldWNoZXJAYW1kLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTog
Rml4IG11dGV4IGxvY2sgZnJvbSBhdG9taWMgY29udGV4dC4NCj4gDQo+IFRoYXQgbm90IHdoYXQg
SSBtZWFudC4gTGV0J3Mgc2F5IHlvdSBoYW5kbGVkIG9uZSBiYWQgcGFnZSBpbnRlcnJ1cHQgYW5k
IGFzDQo+IGEgcmVzdWx0IGhhdmUgb25lIGJhZCBwYWdlIHJlc2VydmVkLiBOb3cgdW5yZWxhdGVk
IGdmeCByaW5nIHRpbWVvdXQNCj4gaGFwcGVucyB3aGljaCB0cmlnZ2VycyBHUFUgcmVzZXQgYW5k
IFZSQU0gbG9zcy4gV2hlbiB5b3UgY29tZSBiYWNrIGZyb20NCj4gcmVzZXQgYW1kZ3B1X3Jhc19y
ZXNlcnZlX2JhZF9wYWdlcyB3aWxsIGJlIGNhbGxlZCBidXQgc2luY2UgbGFzdF9yZXNlcnZlZA0K
PiA9PSBkYXRhX2NvdW50IHRoZSBiYWQgcGFnZSB3aWxsIG5vdCBiZSByZXNlcnZlZCBhZ2Fpbiwg
bWF5YmUgd2Ugc2hvdWxkIGp1c3QNCj4gc2V0IGRhdGEtPmxhc3RfcmVzZXJ2ZWQgdG8gMCBhZ2Fp
biBpZiBWUkFNIHdhcyBsb3N0IGR1cmluZyBBU0lDIHJlc2V0Li4uDQo+IA0KPiBBbmRyZXkNCj4g
DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gRnJvbTogQ2hl
biwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPg0KPiBTZW50OiAxMSBTZXB0ZW1iZXIgMjAx
OSAyMTo1MzowMw0KPiBUbzogR3JvZHpvdnNreSwgQW5kcmV5OyBaaG91MSwgVGFvOyBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyDQo+IFN1Ympl
Y3Q6IFJFOiBbUEFUQ0hdIGRybS9hbWRncHU6IEZpeCBtdXRleCBsb2NrIGZyb20gYXRvbWljIGNv
bnRleHQuDQo+IA0KPiBDb21tZW50IGlubGluZS4NCj4gDQo+IFJlZ2FyZHMsDQo+IEd1Y2h1bg0K
PiANCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3JvZHpvdnNreSwgQW5k
cmV5IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIFNlcHRl
bWJlciAxMSwgMjAxOSAxMDo0MSBQTQ0KPiBUbzogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5j
b20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogQ2hlbiwgR3VjaHVuIDxH
dWNodW4uQ2hlbkBhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyDQo+IDxBbGV4YW5kZXIuRGV1
Y2hlckBhbWQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1OiBGaXggbXV0
ZXggbG9jayBmcm9tIGF0b21pYyBjb250ZXh0Lg0KPiANCj4gT24gc2Vjb25kIHRob3VnaCB0aGlz
IHdpbGwgYnJlYWsgIHdoYXQgYWJvdXQgcmVzZXJ2aW5nIGJhZCBwYWdlcyB3aGVuDQo+IHJlc2V0
dGluZyBHUFUgZm9yIG5vbiBSQVMgZXJyb3IgcmVhc29uIHN1Y2ggYXMgbWFudWFsIHJlc2V0ICxT
MyBvciByaW5nDQo+IHRpbWVvdXQsIChhbWRncHVfcmFzX3Jlc3VtZS0+YW1kZ3B1X3Jhc19yZXNl
dF9ncHUpIHNvIGkgd2lsbCBrZWVwIHRoZQ0KPiBjb2RlIGFzIGlzLg0KPiANCj4gQW5vdGhlciBw
b3NzaWJsZSBpc3N1ZSBpbiBleGlzdGluZyBjb2RlIC0gbG9va3MgbGlrZSBubyByZXNlcnZhdGlv
biB3aWxsIHRha2UNCj4gcGxhY2UgaW4gdGhvc2UgY2FzZSBldmVuIG5vdyBhcyBhbWRncHVfcmFz
X3Jlc2VydmVfYmFkX3BhZ2VzDQo+IGRhdGEtPmxhc3RfcmVzZXJ2ZWQgd2lsbCBiZSBlcXVhbCB0
byBkYXRhLT5jb3VudCAsIG5vID8gTG9va3MgbGlrZSBmb3INCj4gdGhpcyBjYXNlIHlvdSBuZWVk
IHRvIGFkZCBmbGFnIHRvIEZPUkNFIHJlc2VydmF0aW9uIGZvciBhbGwgcGFnZXMgZnJvbQ0KPiAw
IHRvIGRhdGEtPmNvdW5udC4NCj4gW0d1Y2h1bl1ZZXMsIGxhc3RfcmVzZXJ2ZWQgaXMgbm90IHVw
ZGF0ZWQgYW55IG1vcmUsIHVubGVzcyB3ZSB1bmxvYWQgb3VyDQo+IGRyaXZlci4gU28gaXQgbWF5
YmUgYWx3YXlzIGVxdWFsIHRvIGRhdGEtPmNvdW50LCB0aGVuIG5vIG5ldyBiYWQgcGFnZSB3aWxs
DQo+IGJlIHJlc2VydmVkLg0KPiBJIHNlZSB3ZSBoYXZlIG9uZSBlZXByb20gcmVzZXQgYnkgdXNl
ciwgY2FuIHdlIHB1dCB0aGlzIGxhc3RfcmVzZXJ2ZWQgY2xlYW4NCj4gb3BlcmF0aW9uIHRvIHVz
ZXIgaW4gdGhlIHNhbWUgc3RhY2sgYXMgd2VsbD8NCj4gDQo+IEFuZHJleQ0KPiANCj4gT24gOS8x
MS8xOSAxMDoxOSBBTSwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6DQo+ID4gSSBsaWtlIHRoaXMg
bXVjaCBtb3JlLCBJIHdpbGwgcmVsb2NhdGUgdG8NCj4gPiBhbWRncHVfdW1jX3Byb2Nlc3NfcmFz
X2RhdGFfY2IgYW4gcHVzaC4NCj4gPg0KPiA+IEFuZHJleQ0KPiA+DQo+ID4gT24gOS8xMC8xOSAx
MTowOCBQTSwgWmhvdTEsIFRhbyB3cm90ZToNCj4gPj4gYW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9w
YWdlcyBpcyBvbmx5IHVzZWQgYnkgdW1jIGJsb2NrLCBzbyBhbm90aGVyDQo+ID4+IGFwcHJvYWNo
IGlzIHRvIG1vdmUgaXQgaW50byBhbWRncHVfdW1jX3Byb2Nlc3NfcmFzX2RhdGFfY2IuDQo+ID4+
IEFueXdheSwgZWl0aGVyIHdheSBpcyBPSyBhbmQgdGhlIHBhdGNoIGlzOg0KPiA+Pg0KPiA+PiBS
ZXZpZXdlZC1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPg0KPiA+Pg0KPiA+Pj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+IEZyb206IEFuZHJleSBHcm9kem92c2t5IDxh
bmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0KPiA+Pj4gU2VudDogMjAxOeW5tDnmnIgxMeaXpSAz
OjQxDQo+ID4+PiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPj4+IENjOiBD
aGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+OyBaaG91MSwgVGFvDQo+ID4+PiA8VGFv
Llpob3UxQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5kZXINCj4gPEFsZXhhbmRlci5EZXVjaGVy
QGFtZC5jb20+Ow0KPiA+Pj4gR3JvZHpvdnNreSwgQW5kcmV5IDxBbmRyZXkuR3JvZHpvdnNreUBh
bWQuY29tPg0KPiA+Pj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBGaXggbXV0ZXggbG9j
ayBmcm9tIGF0b21pYyBjb250ZXh0Lg0KPiA+Pj4NCj4gPj4+IFByb2JsZW06DQo+ID4+PiBhbWRn
cHVfcmFzX3Jlc2VydmVfYmFkX3BhZ2VzIHdhcyBtb3ZlZCB0byBhbWRncHVfcmFzX3Jlc2V0X2dw
dQ0KPiA+Pj4gYmVjYXVzZSB3cml0aW5nIHRvIEVFUFJPTSBkdXJpbmcgQVNJQyByZXNldCB3YXMg
dW5zdGFibGUuDQo+ID4+PiBCdXQgZm9yIEVSUkVWRU5UX0FUSFVCX0lOVEVSUlVQVCBhbWRncHVf
cmFzX3Jlc2V0X2dwdSBpcyBjYWxsZWQNCj4gPj4+IGRpcmVjdGx5IGZyb20gSVNSIGNvbnRleHQg
YW5kIHNvIGxvY2tpbmcgaXMgbm90IGFsbG93ZWQuIEFsc28gaXQncw0KPiA+Pj4gaXJyZWxldmFu
dCBmb3IgdGhpcyBwYXJ0aWxjdWxhciBpbnRlcnJ1cHQgYXMgdGhpcyBpcyBnZW5lcmljIFJBUw0K
PiA+Pj4gaW50ZXJydXB0IGFuZCBub3QgbWVtb3J5IGVycm9ycyBzcGVjaWZpYy4NCj4gPj4+DQo+
ID4+PiBGaXg6DQo+ID4+PiBBdm9pZCBjYWxsaW5nIGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFn
ZXMgaWYgbm90IGluIHRhc2sgY29udGV4dC4NCj4gPj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4NCj4gPj4+IC0tLQ0K
PiA+Pj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmggfCA0ICsrKy0N
Cj4gPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
PiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmgNCj4gPj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5o
DQo+ID4+PiBpbmRleCAwMTIwMzRkLi5kZDVkYTNjIDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQo+ID4+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgNCj4gPj4+IEBAIC01MDQsNyArNTA0LDkgQEAg
c3RhdGljIGlubGluZSBpbnQgYW1kZ3B1X3Jhc19yZXNldF9ncHUoc3RydWN0DQo+ID4+PiBhbWRn
cHVfZGV2aWNlICphZGV2LA0KPiA+Pj4gICAgICAgLyogc2F2ZSBiYWQgcGFnZSB0byBlZXByb20g
YmVmb3JlIGdwdSByZXNldCwNCj4gPj4+ICAgICAgICAqIGkyYyBtYXkgYmUgdW5zdGFibGUgaW4g
Z3B1IHJlc2V0DQo+ID4+PiAgICAgICAgKi8NCj4gPj4+IC0gICAgYW1kZ3B1X3Jhc19yZXNlcnZl
X2JhZF9wYWdlcyhhZGV2KTsNCj4gPj4+ICsgICAgaWYgKGluX3Rhc2soKSkNCj4gPj4+ICsgICAg
ICAgIGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMoYWRldik7DQo+ID4+PiArDQo+ID4+PiAg
ICAgICBpZiAoYXRvbWljX2NtcHhjaGcoJnJhcy0+aW5fcmVjb3ZlcnksIDAsIDEpID09IDApDQo+
ID4+PiAgICAgICAgICAgc2NoZWR1bGVfd29yaygmcmFzLT5yZWNvdmVyeV93b3JrKTsNCj4gPj4+
ICAgICAgIHJldHVybiAwOw0KPiA+Pj4gLS0NCj4gPj4+IDIuNy40DQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
