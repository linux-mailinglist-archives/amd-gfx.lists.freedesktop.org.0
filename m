Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0765EB10BF
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 16:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918686E090;
	Thu, 12 Sep 2019 14:10:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820088.outbound.protection.outlook.com [40.107.82.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB616E090
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 14:10:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dl1Ak+S+B0t0y/nQeQYwBTvkMqN77C95W290s+o7V360tXaqDhm87hvqWAUFdDkpwb9ZsXeDeL6R1YWql9mkG+puKClbNllxAGr+zJbm7Rl1NgDXroEBOqLHO5X1KotHp5Ki4hG1o9w/YRHd768hn6JSvMi2NNFSMLGWCJ/LdLP2ge3pYt0y9ZZF981h7JQjKVv0F0pqIXHcodKkqCBJNe2crJ6AR1j7FhEGkh8zIrMt8lsKN61ES5MD8E7m0IIndKFqyPcVUKj8xdwEGJUuCONKmSckoskxi1N521ZP/WAtkgh1lnnIuljhBYdz0diEUJ1OoXVP39cUft5/Y9J5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHx5tDPG91B8vz0qqlKFwmxp6zKGOg+TbY+vhgY/U2Q=;
 b=G+dP/DXC1CBIROhTeC3qvZYKKyPaDQrHQ3pdzePRW359U4w69H7W8Gvtrxm3nggwhH7CFR3rmpL5UFJiEK5isjIhmUNZBiWvV117YZEPDbxCeYZB1LQ5Zb7QD+hfGmDLwSQNsTut798itsKmNdzEu2DImGTUk9bxLEmM6iu8iYFGPlfvjQpeNZbzo+Lof17Smq1oEjTsWMYod0fgNrDzZ3tY5LQnKKQc0s9UexiZfmAQbrR3ECI2/jI8QQu80osSaNsDWlcKwjChR2zsbb99OVRU2aGRhL0X4tafgpyoPMoMVdeGqocwGGO5vCD+tyCTiH3q2mdSMZOF57xWA4Htow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1616.namprd12.prod.outlook.com (10.172.53.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Thu, 12 Sep 2019 14:09:56 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0%11]) with mapi id 15.20.2263.016; Thu, 12 Sep
 2019 14:09:56 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Fix mutex lock from atomic context.
Thread-Topic: [PATCH] drm/amdgpu: Fix mutex lock from atomic context.
Thread-Index: AQHVaA/Asx1vpdHBGkKaZL/KBwFVFaclzGCAgAB4KACAAAYxAIAA/seAgAAG9EOAAJuvgIAAKzyA
Date: Thu, 12 Sep 2019 14:09:55 +0000
Message-ID: <1caeca1e-40e7-9b59-37f9-47704903655f@amd.com>
References: <1568144487-27802-1-git-send-email-andrey.grodzovsky@amd.com>
 <MN2PR12MB3054A0B4D399377417213B76B0B10@MN2PR12MB3054.namprd12.prod.outlook.com>
 <d35cc3f6-ff46-175e-3a92-5f7948f97bef@amd.com>
 <603add77-1476-ebc8-69f9-2cf88a788a6b@amd.com>
 <SN6PR12MB2813F0DFFE8EC027AAF6D6DAF1B00@SN6PR12MB2813.namprd12.prod.outlook.com>
 <MWHPR12MB14533B06E13B86E54520E991EAB00@MWHPR12MB1453.namprd12.prod.outlook.com>
 <MN2PR12MB3054CE8F6F6097847B188457B0B00@MN2PR12MB3054.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3054CE8F6F6097847B188457B0B00@MN2PR12MB3054.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::23)
 To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f14f2ecb-3441-4ea8-ea1f-08d7378ae354
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1616; 
x-ms-traffictypediagnostic: MWHPR12MB1616:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1616F1AA3A4A149A95D4434DEAB00@MWHPR12MB1616.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(13464003)(52314003)(189003)(199004)(14444005)(6436002)(256004)(476003)(71200400001)(71190400001)(31696002)(2906002)(6116002)(446003)(3846002)(186003)(2616005)(5660300002)(36756003)(4326008)(486006)(76176011)(86362001)(11346002)(52116002)(6486002)(102836004)(6512007)(2501003)(66946007)(66066001)(305945005)(64756008)(66476007)(66446008)(66556008)(7736002)(53936002)(6246003)(99286004)(229853002)(31686004)(478600001)(14454004)(81156014)(8676002)(316002)(81166006)(110136005)(386003)(25786009)(26005)(8936002)(53546011)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1616;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wDTlilOYZWBHmdFqYESNGOmTX1xfWyBD/GgZhGDDdiXLIb3Msl+v7Busf43tZ04+3UMUABf9wbyWCTKCJHk/QgUoJF0ZgAZj+vbLdA34KZq5a+WJfv6DLhoU0SW4TSX1qzPUKo2cps4BNWf0R9ujPj5YJwRvqsqiI29CpCMTltuQ3VlKQmO4c0eBipVvJSeUme0Gk7fiqfLsJoTyuD7F9Zl2HYY7WRqWXLnbQZdtMLU+ZkUcV9rbANJ1CwennMOPbGBGt4N/qvvbj+Ix2Cpj0PSjJjozVYmUitmHFKKWsZjPH5GTAesDL+M2TtfRM4yIsU3yd7A/Qhop+B/pwJY/DxWi64QeVw1nf96CdoEpWx1Q/SgBa/snOUiwF1FDP/4V2j9Z7GvwuknZ6Z7vl0YLrcF3YEZEUqp8ix6SW3IEwPQ=
Content-ID: <5E33BEDB17633B4183E6C00CDCE45111@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14f2ecb-3441-4ea8-ea1f-08d7378ae354
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 14:09:55.9290 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9tFXr+KBgCFVOAGjaNVGq3RGWbc4GaVZ2DA6rqJiah0DrUkETDyfcGAsOXPubhsbdbCdVg1/4a4/PJJQGHuF1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1616
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHx5tDPG91B8vz0qqlKFwmxp6zKGOg+TbY+vhgY/U2Q=;
 b=olyHv2rDLvmTFy5GrnGAPFyOACpaDuvSyEP5SLnTpsJJKMT4tOOztP6NSxD2hGWtMeNQS8RVuXAqCycP48noP4TkQZ7X7fU8E19DlAxvFeN+S17Y1YQtRMyOuNC3iNYVwYts1H3cBEMNfDsbe8WFfxZ6uQ54yoGQGedko+xkbKc=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSBhbSBub3Qgc3VyZSBWUkFNIGxvc3MgaGFwcGVucyBldmVyeSB0aW1lLCBidXQgd2hlbiBpdCBk
b2VzIEkgd291bGQgDQphc3N1bWUgeW91IHdvdWxkIGhhdmUgdG8gcmVzZXJ2ZSB0aGVtIGFnYWlu
IGFzIHRoZSBwYWdlIHRhYmxlcyBjb250ZW50IA0Kd2FzIGxvc3QuIE9uIHRoZSBvdGhlciBoYW5k
IEkgZG8gcmVtZW1iZXIgd2Uga2VlcCBzaGFkb3cgc3lzdGVtIG1lbW9yeSANCmNvcGllcyBvZiBh
bGwgcGFnZSB0YWJsZXMgc28gbWF5YmUgdGhhdCBub3QgYW4gaXNzdWUsIHNvIHllcywganVzdCB0
cnkgDQp0byBhbGxvY2F0ZSB0aGUgYmFkIHBhZ2UgYWZ0ZXIgcmVzZXQgYW5kIGlmIGl0J3Mgc3Rp
bGwgcmVzZXJ2ZWQgeW91IHdpbGwgDQpmYWlsLg0KDQpBbmRyZXkNCg0KT24gOS8xMi8xOSA3OjM1
IEFNLCBaaG91MSwgVGFvIHdyb3RlOg0KPiBIaSBBbmRyZXk6DQo+DQo+IEFyZSB5b3Ugc3VyZSBv
ZiB0aGUgVlJBTSBjb250ZW50IGxvc3MgYWZ0ZXIgZ3B1IHJlc2V0PyBJJ20gbm90IHZlcnkgZmFt
aWxpYXIgd2l0aCB0aGUgZGV0YWlsIG9mIGdwdSByZXNldCBhbmQgSSdsbCBkbyBleHBlcmltZW50
IHRvIGNvbmZpcm0gdGhlIGNhc2UgeW91IG1lbnRpb25lZC4NCj4NCj4gUmVnYXJkcywNCj4gVGFv
DQo+DQo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogR3JvZHpvdnNreSwg
QW5kcmV5IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPg0KPj4gU2VudDogMjAxOeW5tDnmnIgx
MuaXpSAxMDozMg0KPj4gVG86IENoZW4sIEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT47IFpo
b3UxLCBUYW8NCj4+IDxUYW8uWmhvdTFAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+PiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQu
Y29tPg0KPj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogRml4IG11dGV4IGxvY2sg
ZnJvbSBhdG9taWMgY29udGV4dC4NCj4+DQo+PiBUaGF0IG5vdCB3aGF0IEkgbWVhbnQuIExldCdz
IHNheSB5b3UgaGFuZGxlZCBvbmUgYmFkIHBhZ2UgaW50ZXJydXB0IGFuZCBhcw0KPj4gYSByZXN1
bHQgaGF2ZSBvbmUgYmFkIHBhZ2UgcmVzZXJ2ZWQuIE5vdyB1bnJlbGF0ZWQgZ2Z4IHJpbmcgdGlt
ZW91dA0KPj4gaGFwcGVucyB3aGljaCB0cmlnZ2VycyBHUFUgcmVzZXQgYW5kIFZSQU0gbG9zcy4g
V2hlbiB5b3UgY29tZSBiYWNrIGZyb20NCj4+IHJlc2V0IGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRf
cGFnZXMgd2lsbCBiZSBjYWxsZWQgYnV0IHNpbmNlIGxhc3RfcmVzZXJ2ZWQNCj4+ID09IGRhdGFf
Y291bnQgdGhlIGJhZCBwYWdlIHdpbGwgbm90IGJlIHJlc2VydmVkIGFnYWluLCBtYXliZSB3ZSBz
aG91bGQganVzdA0KPj4gc2V0IGRhdGEtPmxhc3RfcmVzZXJ2ZWQgdG8gMCBhZ2FpbiBpZiBWUkFN
IHdhcyBsb3N0IGR1cmluZyBBU0lDIHJlc2V0Li4uDQo+Pg0KPj4gQW5kcmV5DQo+Pg0KPj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4gRnJvbTogQ2hlbiwgR3Vj
aHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPg0KPj4gU2VudDogMTEgU2VwdGVtYmVyIDIwMTkgMjE6
NTM6MDMNCj4+IFRvOiBHcm9kem92c2t5LCBBbmRyZXk7IFpob3UxLCBUYW87IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBDYzogRGV1Y2hlciwgQWxleGFuZGVyDQo+PiBTdWJqZWN0
OiBSRTogW1BBVENIXSBkcm0vYW1kZ3B1OiBGaXggbXV0ZXggbG9jayBmcm9tIGF0b21pYyBjb250
ZXh0Lg0KPj4NCj4+IENvbW1lbnQgaW5saW5lLg0KPj4NCj4+IFJlZ2FyZHMsDQo+PiBHdWNodW4N
Cj4+DQo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogR3JvZHpvdnNreSwg
QW5kcmV5IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPg0KPj4gU2VudDogV2VkbmVzZGF5LCBT
ZXB0ZW1iZXIgMTEsIDIwMTkgMTA6NDEgUE0NCj4+IFRvOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFA
YW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBDYzogQ2hlbiwgR3Vj
aHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyDQo+PiA8QWxleGFu
ZGVyLkRldWNoZXJAYW1kLmNvbT4NCj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWRncHU6
IEZpeCBtdXRleCBsb2NrIGZyb20gYXRvbWljIGNvbnRleHQuDQo+Pg0KPj4gT24gc2Vjb25kIHRo
b3VnaCB0aGlzIHdpbGwgYnJlYWsgIHdoYXQgYWJvdXQgcmVzZXJ2aW5nIGJhZCBwYWdlcyB3aGVu
DQo+PiByZXNldHRpbmcgR1BVIGZvciBub24gUkFTIGVycm9yIHJlYXNvbiBzdWNoIGFzIG1hbnVh
bCByZXNldCAsUzMgb3IgcmluZw0KPj4gdGltZW91dCwgKGFtZGdwdV9yYXNfcmVzdW1lLT5hbWRn
cHVfcmFzX3Jlc2V0X2dwdSkgc28gaSB3aWxsIGtlZXAgdGhlDQo+PiBjb2RlIGFzIGlzLg0KPj4N
Cj4+IEFub3RoZXIgcG9zc2libGUgaXNzdWUgaW4gZXhpc3RpbmcgY29kZSAtIGxvb2tzIGxpa2Ug
bm8gcmVzZXJ2YXRpb24gd2lsbCB0YWtlDQo+PiBwbGFjZSBpbiB0aG9zZSBjYXNlIGV2ZW4gbm93
IGFzIGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMNCj4+IGRhdGEtPmxhc3RfcmVzZXJ2ZWQg
d2lsbCBiZSBlcXVhbCB0byBkYXRhLT5jb3VudCAsIG5vID8gTG9va3MgbGlrZSBmb3INCj4+IHRo
aXMgY2FzZSB5b3UgbmVlZCB0byBhZGQgZmxhZyB0byBGT1JDRSByZXNlcnZhdGlvbiBmb3IgYWxs
IHBhZ2VzIGZyb20NCj4+IDAgdG8gZGF0YS0+Y291bm50Lg0KPj4gW0d1Y2h1bl1ZZXMsIGxhc3Rf
cmVzZXJ2ZWQgaXMgbm90IHVwZGF0ZWQgYW55IG1vcmUsIHVubGVzcyB3ZSB1bmxvYWQgb3VyDQo+
PiBkcml2ZXIuIFNvIGl0IG1heWJlIGFsd2F5cyBlcXVhbCB0byBkYXRhLT5jb3VudCwgdGhlbiBu
byBuZXcgYmFkIHBhZ2Ugd2lsbA0KPj4gYmUgcmVzZXJ2ZWQuDQo+PiBJIHNlZSB3ZSBoYXZlIG9u
ZSBlZXByb20gcmVzZXQgYnkgdXNlciwgY2FuIHdlIHB1dCB0aGlzIGxhc3RfcmVzZXJ2ZWQgY2xl
YW4NCj4+IG9wZXJhdGlvbiB0byB1c2VyIGluIHRoZSBzYW1lIHN0YWNrIGFzIHdlbGw/DQo+Pg0K
Pj4gQW5kcmV5DQo+Pg0KPj4gT24gOS8xMS8xOSAxMDoxOSBBTSwgQW5kcmV5IEdyb2R6b3Zza3kg
d3JvdGU6DQo+Pj4gSSBsaWtlIHRoaXMgbXVjaCBtb3JlLCBJIHdpbGwgcmVsb2NhdGUgdG8NCj4+
PiBhbWRncHVfdW1jX3Byb2Nlc3NfcmFzX2RhdGFfY2IgYW4gcHVzaC4NCj4+Pg0KPj4+IEFuZHJl
eQ0KPj4+DQo+Pj4gT24gOS8xMC8xOSAxMTowOCBQTSwgWmhvdTEsIFRhbyB3cm90ZToNCj4+Pj4g
YW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9wYWdlcyBpcyBvbmx5IHVzZWQgYnkgdW1jIGJsb2NrLCBz
byBhbm90aGVyDQo+Pj4+IGFwcHJvYWNoIGlzIHRvIG1vdmUgaXQgaW50byBhbWRncHVfdW1jX3By
b2Nlc3NfcmFzX2RhdGFfY2IuDQo+Pj4+IEFueXdheSwgZWl0aGVyIHdheSBpcyBPSyBhbmQgdGhl
IHBhdGNoIGlzOg0KPj4+Pg0KPj4+PiBSZXZpZXdlZC1ieTogVGFvIFpob3UgPHRhby56aG91MUBh
bWQuY29tPg0KPj4+Pg0KPj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+Pj4+IEZy
b206IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0KPj4+Pj4g
U2VudDogMjAxOeW5tDnmnIgxMeaXpSAzOjQxDQo+Pj4+PiBUbzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4+Pj4+IENjOiBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+
OyBaaG91MSwgVGFvDQo+Pj4+PiA8VGFvLlpob3UxQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5k
ZXINCj4+IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsNCj4+Pj4+IEdyb2R6b3Zza3ksIEFu
ZHJleSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT4NCj4+Pj4+IFN1YmplY3Q6IFtQQVRDSF0g
ZHJtL2FtZGdwdTogRml4IG11dGV4IGxvY2sgZnJvbSBhdG9taWMgY29udGV4dC4NCj4+Pj4+DQo+
Pj4+PiBQcm9ibGVtOg0KPj4+Pj4gYW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9wYWdlcyB3YXMgbW92
ZWQgdG8gYW1kZ3B1X3Jhc19yZXNldF9ncHUNCj4+Pj4+IGJlY2F1c2Ugd3JpdGluZyB0byBFRVBS
T00gZHVyaW5nIEFTSUMgcmVzZXQgd2FzIHVuc3RhYmxlLg0KPj4+Pj4gQnV0IGZvciBFUlJFVkVO
VF9BVEhVQl9JTlRFUlJVUFQgYW1kZ3B1X3Jhc19yZXNldF9ncHUgaXMgY2FsbGVkDQo+Pj4+PiBk
aXJlY3RseSBmcm9tIElTUiBjb250ZXh0IGFuZCBzbyBsb2NraW5nIGlzIG5vdCBhbGxvd2VkLiBB
bHNvIGl0J3MNCj4+Pj4+IGlycmVsZXZhbnQgZm9yIHRoaXMgcGFydGlsY3VsYXIgaW50ZXJydXB0
IGFzIHRoaXMgaXMgZ2VuZXJpYyBSQVMNCj4+Pj4+IGludGVycnVwdCBhbmQgbm90IG1lbW9yeSBl
cnJvcnMgc3BlY2lmaWMuDQo+Pj4+Pg0KPj4+Pj4gRml4Og0KPj4+Pj4gQXZvaWQgY2FsbGluZyBh
bWRncHVfcmFzX3Jlc2VydmVfYmFkX3BhZ2VzIGlmIG5vdCBpbiB0YXNrIGNvbnRleHQuDQo+Pj4+
Pg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92
c2t5QGFtZC5jb20+DQo+Pj4+PiAtLS0NCj4+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuaCB8IDQgKysrLQ0KPj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+Pj4NCj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgNCj4+Pj4+IGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQo+Pj4+PiBpbmRleCAwMTIwMzRkLi5kZDVkYTNj
IDEwMDY0NA0KPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
cy5oDQo+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgN
Cj4+Pj4+IEBAIC01MDQsNyArNTA0LDkgQEAgc3RhdGljIGlubGluZSBpbnQgYW1kZ3B1X3Jhc19y
ZXNldF9ncHUoc3RydWN0DQo+Pj4+PiBhbWRncHVfZGV2aWNlICphZGV2LA0KPj4+Pj4gICAgICAg
IC8qIHNhdmUgYmFkIHBhZ2UgdG8gZWVwcm9tIGJlZm9yZSBncHUgcmVzZXQsDQo+Pj4+PiAgICAg
ICAgICogaTJjIG1heSBiZSB1bnN0YWJsZSBpbiBncHUgcmVzZXQNCj4+Pj4+ICAgICAgICAgKi8N
Cj4+Pj4+IC0gICAgYW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9wYWdlcyhhZGV2KTsNCj4+Pj4+ICsg
ICAgaWYgKGluX3Rhc2soKSkNCj4+Pj4+ICsgICAgICAgIGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRf
cGFnZXMoYWRldik7DQo+Pj4+PiArDQo+Pj4+PiAgICAgICAgaWYgKGF0b21pY19jbXB4Y2hnKCZy
YXMtPmluX3JlY292ZXJ5LCAwLCAxKSA9PSAwKQ0KPj4+Pj4gICAgICAgICAgICBzY2hlZHVsZV93
b3JrKCZyYXMtPnJlY292ZXJ5X3dvcmspOw0KPj4+Pj4gICAgICAgIHJldHVybiAwOw0KPj4+Pj4g
LS0NCj4+Pj4+IDIuNy40DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
