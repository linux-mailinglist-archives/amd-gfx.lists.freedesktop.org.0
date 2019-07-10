Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E8564865
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 16:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2891A8982F;
	Wed, 10 Jul 2019 14:31:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750089.outbound.protection.outlook.com [40.107.75.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190B18982F
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 14:31:45 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB2808.namprd12.prod.outlook.com (20.177.126.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Wed, 10 Jul 2019 14:31:40 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b134:9f:3a1e:2b5a]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b134:9f:3a1e:2b5a%5]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 14:31:40 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 2/2] drm/amd/display: Add drm_audio_component support to
 amdgpu_dm
Thread-Topic: [PATCH 2/2] drm/amd/display: Add drm_audio_component support to
 amdgpu_dm
Thread-Index: AQHVNnOjtIXpuwFE4UirbXGlawZdk6bD32qAgAAMDAA=
Date: Wed, 10 Jul 2019 14:31:40 +0000
Message-ID: <fea8c06d-dd4a-ae18-31d9-d0f9d0a0cd88@amd.com>
References: <20190709163019.32085-1-nicholas.kazlauskas@amd.com>
 <20190709163019.32085-2-nicholas.kazlauskas@amd.com>
 <s5hy316q9u8.wl-tiwai@suse.de>
In-Reply-To: <s5hy316q9u8.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::38) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a34b200-fb97-4e5d-cbd8-08d70543529a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2808; 
x-ms-traffictypediagnostic: BYAPR12MB2808:
x-microsoft-antispam-prvs: <BYAPR12MB2808F7B552142BAC9AAEBC5AECF00@BYAPR12MB2808.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(189003)(199004)(51914003)(5660300002)(6512007)(86362001)(4326008)(52116002)(31686004)(26005)(8676002)(102836004)(68736007)(7736002)(478600001)(229853002)(6246003)(2906002)(14444005)(256004)(66066001)(36756003)(71190400001)(71200400001)(25786009)(476003)(2616005)(316002)(3846002)(11346002)(446003)(6116002)(6436002)(6916009)(99286004)(81156014)(54906003)(64756008)(66446008)(66556008)(8936002)(66476007)(6486002)(81166006)(186003)(53936002)(386003)(76176011)(6506007)(14454004)(31696002)(305945005)(66946007)(486006)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2808;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CV0VbOI3lMf/7R/CiE7y6ANkEwhkd0XdtosOo9KjY5EdaC+spWDO3ZdM3BUJTXxa9aci5aO255tpnPrhtF7V+nkowzVhaAijOG/aEuSjwNb6ByjmH4mq1Neic3ni1J2LTC4nmUSUe6LfmBtVB9rI5OZI66+j9HB5cNXFJXt8pV21ciJM9S1mrdTnS1HYoFz3lkHd2pRIUpRBDVqVCnrInn4n/uRmQ17pju4XBbNvXXdveiXZ6FLWzG26QlC/cgor5/vqcCKl/m6QCfggxEmGQt+acqWFRF/Kp+oOndZQ3utmsXDzU+ikdh/QKd9r5Cp1b1Jnp8CRjZi23ZWKFLp8oiL3LjIOH0DK3lUjovMBnwKR9tI3Mg2b+qCo5vHM8DQvcm31zVGw7Edri+g/wrua+k16Hh53x7CxOqHnlCwUcGs=
Content-ID: <F0B1C4B6A3DC0748B3F05F366140F3AF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a34b200-fb97-4e5d-cbd8-08d70543529a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 14:31:40.5996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2808
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12oF37V6DavYC0VyD4c98mM34IXbQWfD1m/134i/rKI=;
 b=rBxsFP7hqtSQCiKU3/7KuZ6TyKDpcSNZoH9WctowXVERDX6Z5SneQ6G7emCbxcuSvoLVVgxSXr6+tFRb2eVbdGVWsO3gO6kIpD52C278sMMUpM2TofYMds41buP8t/MyMjA+to4RdDBt77Ed/jqjKr2NMtkxsu3ASbbJQ7hh3OE=
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
Cc: "Li, Sun
 peng \(Leo\)" <Sunpeng.Li@amd.com>, "Wentland, Harry" <Harry.Wentland@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gNy8xMC8xOSA5OjQ4IEFNLCBUYWthc2hpIEl3YWkgd3JvdGU6DQo+IE9uIFR1ZSwgMDkgSnVs
IDIwMTkgMTg6MzA6MTkgKzAyMDAsDQo+IE5pY2hvbGFzIEthemxhdXNrYXMgd3JvdGU6DQo+Pg0K
Pj4gW1doeV0NCj4+IFRoZSBkcm1fYXVkaW9fY29tcG9uZW50IGNhbiBiZSB1c2VkIHRvIGdpdmUg
cGluIEVMRCBub3RpZmljYXRpb25zDQo+PiBkaXJlY3RseSB0byB0aGUgc291bmQgZHJpdmVyLiBU
aGlzIGZpeGVzIGF1ZGlvIGVuZHBvaW50cyBkaXNhcHBlYXJpbmcNCj4+IGR1ZSB0byBtaXNzaW5n
IHVuc29saWNpdGVkIG5vdGlmaWNhdGlvbnMuDQo+Pg0KPj4gW0hvd10NCj4+IFNlbmQgdGhlIG5v
dGlmaWNhdGlvbiB2aWEgdGhlIGF1ZGlvIGNvbXBvbmVudCB3aGVuZXZlciB3ZSBlbmFibGUgb3IN
Cj4+IGRpc2FibGUgYXVkaW8gc3RhdGUgb24gYSBzdHJlYW0uIFRoaXMgbWF0Y2hlcyB3aGF0IGk5
MTUgZG9lcyB3aXRoDQo+PiB0aGVpciBkcm1fYXVkaW9fY29tcG9uZW50IGFuZCB3aGF0IFRha2Fz
aGkgSXdhaSdzIHByb3Bvc2VkIGhhY2sgZm9yDQo+PiByYWRlb24vYW1kcGd1IGRpZC4NCj4+DQo+
PiBUaGlzIGlzIGEgYml0IGRlbGF5ZWQgaW4gd2hlbiB0aGUgbm90aWZpY2F0aW9uIGFjdHVhbGx5
IG9jY3VycywgaG93ZXZlci4NCj4+IFdlIHdhaXQgdW50aWwgYWZ0ZXIgYWxsIHRoZSBwcm9ncmFt
bWluZyBpcyBjb21wbGV0ZSByYXRoZXIgdGhhbiBzZW5kaW5nDQo+PiB0aGUgbm90aWZpY2F0aW9u
IG1pZCBzZXF1ZW5jZS4NCj4+DQo+PiBQYXJ0aWN1bGFyIGNhcmUgaXMgbmVlZGVkIGZvciB0aGUg
Z2V0IEVMRCBjYWxsYmFjayBzaW5jZSBpdCBjYW4gaGFwcGVuDQo+PiBvdXRzaWRlIHRoZSBsb2Nr
aW5nIGFuZCBmZW5jaW5nIERSTSBkb2VzIGZvciBhdG9taWMgY29tbWl0cy4NCj4+DQo+PiBDYzog
VGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPg0KPj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBh
bWQuY29tPg0KPj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPg0K
Pj4gU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2th
c0BhbWQuY29tPg0KPiANCj4gVGhhbmtzIGZvciB0aGUgcGF0Y2gsIHRoaXMgaGFzIGJlZW4gYSBs
b25nLXN0YW5kaW5nIFRPRE8gZm9yIG1lLCB0b28hDQo+IA0KPiBEbyB5b3UgaGF2ZSB0aGUgcGF0
Y2ggZm9yIEhELWF1ZGlvIHBhcnQgYXMgd2VsbD8gIE9yIHlvdSB0ZXN0ZWQgd2l0aA0KPiBteSBv
bGQgcGF0Y2g/ICBUaGVuIEknbGwgcmVzdXJyZWN0IG15IHBhdGNoIHNldCBhcyB3ZWxsLg0KDQpJ
J3ZlIHRlc3RlZCB0aGlzIHNlcmllcyB3aXRoIGFuZCB3aXRob3V0IHRoYXQgcGF0Y2guIFRoZSBu
b3RpZmljYXRpb25zIA0Kd29yayBhbmQgdGhlIGRyaXZlciB3aWxsIHF1ZXJ5IGJhY2sgd2l0aCBn
ZXRfZWxkIGFzIGV4cGVjdGVkLg0KDQpXaXRob3V0IHRoZSBwYXRjaCBpdCBzaG91bGQganVzdCBy
ZXRhaW4gdGhlIGV4aXN0aW5nIGJlaGF2aW9yLg0KDQo+IA0KPiBUaGlzIHBhdGNoIGl0c2VsZiBs
b29rcyBhbG1vc3QgZ29vZC4gIE9uZSBjYXZlYXQgaXMgdGhhdCB5b3UgbWlnaHQNCj4gd2FudCB0
aGUgcmV2ZXJzZSBzZWxlY3Qgb2YgQ09ORklHX1NORF9IREFfQ09NUE9ORU5ULCBzb21ldGhpbmcg
bGlrZToNCg0KSSBjYW4gdHJ5IGFkZGluZyB0aGlzIHNlbGVjdCBiYXNlZCBvbiBEQyBmb3Igbm93
IChzaW5jZSBpdCdzIHRoZSBvbmx5IA0KcGFydCB0aGF0IGFjdHVhbGx5IHVzZXMgaXQgYXQgdGhl
IG1vbWVudCkuDQoNCj4gDQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL0tjb25m
aWcNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL0tjb25maWcNCj4gQEAgLTIyMyw2ICsyMjMsNyBA
QCBjb25maWcgRFJNX0FNREdQVQ0KPiAgIAlzZWxlY3QgQkFDS0xJR0hUX0NMQVNTX0RFVklDRQ0K
PiAgIAlzZWxlY3QgSU5URVJWQUxfVFJFRQ0KPiAgIAlzZWxlY3QgQ0hBU0gNCj4gKwlzZWxlY3Qg
U05EX0hEQV9DT01QT05FTlQgaWYgU05EX0hEQV9DT1JFDQo+ICAgCWhlbHANCj4gICAJICBDaG9v
c2UgdGhpcyBvcHRpb24gaWYgeW91IGhhdmUgYSByZWNlbnQgQU1EIFJhZGVvbiBncmFwaGljcyBj
YXJkLg0KPiAgIA0KPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09DQo+IA0KPiBPdGhlciB0aGFuIHRoYXQsIGZlZWwgZnJlZSB0
byB0YWtlIG15IHItYiB0YWc6DQo+ICAgIFJldmlld2VkLWJ5OiBUYWthc2hpIEl3YWkgPHRpd2Fp
QHN1c2UuZGU+DQoNClRoYW5rcyBmb3IgdGhlIHJldmlldyENCg0KSnVzdCB0byBub3RlLCBhdWRp
byBpcyBjdXJyZW50bHkgYnJva2VuIGFmdGVyIGhvdHBsdWcgYXQgdGhlIG1vbWVudCBmb3IgDQpB
TURHUFUgd2l0aCBEQyBlbmFibGVkLCBidXQgdGhpcyBpcyB1bnJlbGF0ZWQgdG8gdGhpcyBwYXJ0
aWN1bGFyIHNlcmllcy4gDQpJIGhhdmUgYSBwYXRjaCB0aGF0IHJlc29sdmVzIHRoYXQgaXNzdWUg
dGhhdCBzaG91bGQgc2hvdyB1cCBzb21ldGltZSANCnNvb24gb24gYW1kZ2Z4Lg0KDQpOaWNob2xh
cyBLYXpsYXVza2FzDQoNCj4gDQo+IA0KPiB0aGFua3MsDQo+IA0KPiBUYWthc2hpDQo+IA0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
