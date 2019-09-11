Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A69AFEF7
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 16:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087986E293;
	Wed, 11 Sep 2019 14:41:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740051.outbound.protection.outlook.com [40.107.74.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9A96E293
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 14:41:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHPEqcCjLzUYd3j353oqIMOkSc1Fa+euibSZL8CX2o79Jm7rryNLp5ZLVE64iIwXXKSo2u1UGqyTpeCaGgQcIbJPluwpC+52TOwUqRscYeXU8B0KJ5tv1w6ARbyRij3d71JG+3Er5SxvVx8Jbp6jMbVUgDo9nvY/mbMKGZRXbtvcKlH5RU6ORVp/B1JojEIVSi4hEoW7kKGxxKczvGOD6PGNOG7yLynxOMTqxg2sAlaozuunivCfEJNoB/DAVNSn3EhtOT7s9+PpH5oF97llNb1wG0rdNd/vFt5L3RwKxV+RMWFLBIY32suYcOtSygbg4ZUb39z121F1En95qLSc6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNoMcN8770KTim13Ay0KYGkylXtzBjDZE7quc/wHXVg=;
 b=lumAjhUN0KfYOPoH/IbPOH92CvvkIvnfPR3C2PgxYnkpydHLQTX7BhtrrCp7hrpuw0cTN5e70nNpusgJr9NQxNIh4CG/HURW8fRlgULOITySEoUebk5AVS/ab5ds0ifto3JpyHW53yi+xuSd30LuKb5g3ByjY/FnU7s7REA4V9wVpuwtLqWcwcrAEeMP3Q+mr0iiRCy+uMDKHp5jxDW2C3pfE4ymjWLZH9RYAoiaN0Y4xP0+/XHgoSyjk45Irr8IojavgPjz540yV6BOFbCrDLmEDJqA+JyhJAme3WVVSaBlBTIQlVzKSfIDNJsRkJvYOkC/x4QeQH0iT84a9G4vdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1470.namprd12.prod.outlook.com (10.172.55.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Wed, 11 Sep 2019 14:41:13 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0%11]) with mapi id 15.20.2263.015; Wed, 11 Sep
 2019 14:41:13 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Fix mutex lock from atomic context.
Thread-Topic: [PATCH] drm/amdgpu: Fix mutex lock from atomic context.
Thread-Index: AQHVaA/Asx1vpdHBGkKaZL/KBwFVFaclzGCAgAB4KACAAEk/AA==
Date: Wed, 11 Sep 2019 14:41:12 +0000
Message-ID: <603add77-1476-ebc8-69f9-2cf88a788a6b@amd.com>
References: <1568144487-27802-1-git-send-email-andrey.grodzovsky@amd.com>
 <MN2PR12MB3054A0B4D399377417213B76B0B10@MN2PR12MB3054.namprd12.prod.outlook.com>
 <d35cc3f6-ff46-175e-3a92-5f7948f97bef@amd.com>
In-Reply-To: <d35cc3f6-ff46-175e-3a92-5f7948f97bef@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::18) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef67e678-2fd3-47ce-68d5-08d736c617bf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1470; 
x-ms-traffictypediagnostic: MWHPR12MB1470:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB14702D6836D3846C80863C99EAB10@MWHPR12MB1470.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(13464003)(199004)(189003)(52314003)(3846002)(110136005)(5660300002)(26005)(54906003)(316002)(186003)(8936002)(66476007)(66556008)(52116002)(53546011)(71200400001)(99286004)(102836004)(76176011)(86362001)(31696002)(66446008)(66946007)(4326008)(386003)(6506007)(36756003)(71190400001)(81166006)(6246003)(25786009)(64756008)(2906002)(53936002)(6512007)(11346002)(31686004)(2616005)(476003)(486006)(229853002)(446003)(6486002)(6436002)(66066001)(14444005)(256004)(2501003)(14454004)(305945005)(478600001)(8676002)(7736002)(6116002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1470;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VVq25oWfLYXgJu3WOeWRAA5JIl6pcGTrhzmsIilVWtSuGbU6zFPpirifRU0yIvvWuN9hbxgOWAvkO/ydxzQ0TNrWKwsml3ezRjtcVLGvIK++z12Ii6jaP9VlDEb77/aTdrMNHz9eE4XzPqdqqqucONeFfVxMmWrEgcRJ+P3wscwUHyrTRvFIyVQ3hbWH05eD/GBBH8WQeM36u7fKQSBLrd9RbrbRyAomAvml1i2GibkRTHRHHqMQ7fQ/kHYgdc0zgMlArUYPDJdbDO3PPs+ZUvyrtQ/9HLa5rkJrx5Tv0JJ3Aqedy2VYJ8kXydCM7TAiFt4NJcXgzOIPllwlcRaMqrJQ343jSatVMWdxj6fE3aEPXQYFBxmdvjRsyKmjp4o5HN5VGl69SqkYILuh9kBaQvJTNpC7TkpAntM/KLCoQU0=
Content-ID: <9C387DD35544F64E895556EB49F66F81@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef67e678-2fd3-47ce-68d5-08d736c617bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 14:41:12.8648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7O6vCZQg561vUNiocx79uv/4aK6N2k5KQSY2anM01qQ1z4rLhrJ+80WVCQkt2o2UpVh401ha+vDb8T6Jq93+gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1470
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNoMcN8770KTim13Ay0KYGkylXtzBjDZE7quc/wHXVg=;
 b=mxU9e8cJaLTK5GXw629movX0cQXD7Pd90gM0GMJIZ14+1vTLOXU/OfaWMXvI4nHY7D9KF7MUUc+9VIJr3WaSzzWXbnkbMMrkxRAq9FRJ/XzSnSXJe6/ftHd0yhdAKs7U8vk4xR0EVs2bexG2Bw69mPfOq5gvzoB/MV3Gi3m0Mlw=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Chen,
 Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gc2Vjb25kIHRob3VnaCB0aGlzIHdpbGwgYnJlYWvCoCB3aGF0IGFib3V0IHJlc2VydmluZyBi
YWQgcGFnZXMgd2hlbiANCnJlc2V0dGluZyBHUFUgZm9yIG5vbiBSQVMgZXJyb3IgcmVhc29uIHN1
Y2ggYXMgbWFudWFsIHJlc2V0ICxTMyBvciByaW5nIA0KdGltZW91dCwgKGFtZGdwdV9yYXNfcmVz
dW1lLT5hbWRncHVfcmFzX3Jlc2V0X2dwdSkgc28gaSB3aWxsIGtlZXAgdGhlIA0KY29kZSBhcyBp
cy4NCg0KQW5vdGhlciBwb3NzaWJsZSBpc3N1ZSBpbiBleGlzdGluZyBjb2RlIC0gbG9va3MgbGlr
ZSBubyByZXNlcnZhdGlvbiB3aWxsIA0KdGFrZSBwbGFjZSBpbiB0aG9zZSBjYXNlIGV2ZW4gbm93
IGFzIGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMgDQpkYXRhLT5sYXN0X3Jlc2VydmVkIHdp
bGwgYmUgZXF1YWwgdG8gZGF0YS0+Y291bnQgLCBubyA/IExvb2tzIGxpa2UgZm9yIA0KdGhpcyBj
YXNlIHlvdSBuZWVkIHRvIGFkZCBmbGFnIHRvIEZPUkNFIHJlc2VydmF0aW9uIGZvciBhbGwgcGFn
ZXMgZnJvbcKgIA0KMCB0byBkYXRhLT5jb3VubnQuDQoNCkFuZHJleQ0KDQpPbiA5LzExLzE5IDEw
OjE5IEFNLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToNCj4gSSBsaWtlIHRoaXMgbXVjaCBtb3Jl
LCBJIHdpbGwgcmVsb2NhdGUgdG8gDQo+IGFtZGdwdV91bWNfcHJvY2Vzc19yYXNfZGF0YV9jYiBh
biBwdXNoLg0KPg0KPiBBbmRyZXkNCj4NCj4gT24gOS8xMC8xOSAxMTowOCBQTSwgWmhvdTEsIFRh
byB3cm90ZToNCj4+IGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMgaXMgb25seSB1c2VkIGJ5
IHVtYyBibG9jaywgc28gYW5vdGhlciANCj4+IGFwcHJvYWNoIGlzIHRvIG1vdmUgaXQgaW50byBh
bWRncHVfdW1jX3Byb2Nlc3NfcmFzX2RhdGFfY2IuDQo+PiBBbnl3YXksIGVpdGhlciB3YXkgaXMg
T0sgYW5kIHRoZSBwYXRjaCBpczoNCj4+DQo+PiBSZXZpZXdlZC1ieTogVGFvIFpob3UgPHRhby56
aG91MUBhbWQuY29tPg0KPj4NCj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+IEZy
b206IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0KPj4+IFNl
bnQ6IDIwMTnlubQ55pyIMTHml6UgMzo0MQ0KPj4+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPj4+IENjOiBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+OyBaaG91
MSwgVGFvDQo+Pj4gPFRhby5aaG91MUBhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyDQo+Pj4g
PEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBHcm9kem92c2t5LCBBbmRyZXkNCj4+PiA8QW5k
cmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT4NCj4+PiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6
IEZpeCBtdXRleCBsb2NrIGZyb20gYXRvbWljIGNvbnRleHQuDQo+Pj4NCj4+PiBQcm9ibGVtOg0K
Pj4+IGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMgd2FzIG1vdmVkIHRvIGFtZGdwdV9yYXNf
cmVzZXRfZ3B1DQo+Pj4gYmVjYXVzZSB3cml0aW5nIHRvIEVFUFJPTSBkdXJpbmcgQVNJQyByZXNl
dCB3YXMgdW5zdGFibGUuDQo+Pj4gQnV0IGZvciBFUlJFVkVOVF9BVEhVQl9JTlRFUlJVUFQgYW1k
Z3B1X3Jhc19yZXNldF9ncHUgaXMgY2FsbGVkDQo+Pj4gZGlyZWN0bHkgZnJvbSBJU1IgY29udGV4
dCBhbmQgc28gbG9ja2luZyBpcyBub3QgYWxsb3dlZC4gQWxzbyBpdCdzIA0KPj4+IGlycmVsZXZh
bnQgZm9yDQo+Pj4gdGhpcyBwYXJ0aWxjdWxhciBpbnRlcnJ1cHQgYXMgdGhpcyBpcyBnZW5lcmlj
IFJBUyBpbnRlcnJ1cHQgYW5kIG5vdCANCj4+PiBtZW1vcnkNCj4+PiBlcnJvcnMgc3BlY2lmaWMu
DQo+Pj4NCj4+PiBGaXg6DQo+Pj4gQXZvaWQgY2FsbGluZyBhbWRncHVfcmFzX3Jlc2VydmVfYmFk
X3BhZ2VzIGlmIG5vdCBpbiB0YXNrIGNvbnRleHQuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4NCj4+PiAtLS0NCj4+
PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmggfCA0ICsrKy0NCj4+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4N
Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5o
DQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgNCj4+PiBpbmRl
eCAwMTIwMzRkLi5kZDVkYTNjIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuaA0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9yYXMuaA0KPj4+IEBAIC01MDQsNyArNTA0LDkgQEAgc3RhdGljIGlubGluZSBpbnQg
YW1kZ3B1X3Jhc19yZXNldF9ncHUoc3RydWN0DQo+Pj4gYW1kZ3B1X2RldmljZSAqYWRldiwNCj4+
PiDCoMKgwqDCoMKgIC8qIHNhdmUgYmFkIHBhZ2UgdG8gZWVwcm9tIGJlZm9yZSBncHUgcmVzZXQs
DQo+Pj4gwqDCoMKgwqDCoMKgICogaTJjIG1heSBiZSB1bnN0YWJsZSBpbiBncHUgcmVzZXQNCj4+
PiDCoMKgwqDCoMKgwqAgKi8NCj4+PiAtwqDCoMKgIGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFn
ZXMoYWRldik7DQo+Pj4gK8KgwqDCoCBpZiAoaW5fdGFzaygpKQ0KPj4+ICvCoMKgwqDCoMKgwqDC
oCBhbWRncHVfcmFzX3Jlc2VydmVfYmFkX3BhZ2VzKGFkZXYpOw0KPj4+ICsNCj4+PiDCoMKgwqDC
oMKgIGlmIChhdG9taWNfY21weGNoZygmcmFzLT5pbl9yZWNvdmVyeSwgMCwgMSkgPT0gMCkNCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgc2NoZWR1bGVfd29yaygmcmFzLT5yZWNvdmVyeV93b3JrKTsN
Cj4+PiDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4+IC0tIA0KPj4+IDIuNy40DQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
