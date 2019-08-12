Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BA9895BE
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Aug 2019 05:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B3D6E427;
	Mon, 12 Aug 2019 03:21:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700060.outbound.protection.outlook.com [40.107.70.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08FA6E427
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 03:21:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIoKXnf0gJh20gJvJwOPO0XDJEBsUGt3a6BdCoGu4VOZki/B78aPg305Aw6ASGh9L6i5zjFrhktBrGmK4A+gArYljaQtMwGy8CSoGQ/3M8KzD884VsMa2ADOVAqWvV+WMwC0i21bYLMYeCsuBNwGCxF/lQVTiCZlpL/LFbUDYFaerS6VzPPDSYp1vPn0U/g9vUUc3k8eS5b/clbacbNVuvtOmTibE9zvsW7OkaN99mbiQNogvSqqc9ZKJNILmuy0lasMH7SdPDKB/3W7lg2j8sc88BLKIbLBN+Fw1wrBRFryMoUMOawHzv/i7fxHA6XKsRX1PXaZqjf/GP/ySYZZgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIbdkNs0S0CAVSez239un9WaOfLzKCzQWD5KhrylTz0=;
 b=DE0aiqJ+5sZ/ytcLoAtjv3ekPWpjHnorJOKGCJ/n0UI0RxmJ0ajE9ZvzRmH8uImEoF8ybAlXDektWyzFqRmhJMmjDqW9NjjYSC0picI/pTU1XQ930OQ9V/+g2Qq8bqpLzB//eLADCnF+XEU5Gr+6GRQWqW+ZE+BaSUU+OfpYZS74+rci04rLiI1C3OXmm5AcrisxlX1cXAH6aGyZRMBGCITS+9xErEqOq06kV69wF5GE8K92sctJX5Y8qW5lXjOEUzPJbQ11Lugnu649/d5uf9EAjzGdfkb1GwM6rW1dZwviY5Kq49Hvydx2dWzaLpCA2zrqO8Gd337TgFIrIEcT+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2709.namprd12.prod.outlook.com (20.177.124.10) by
 BYAPR12MB3175.namprd12.prod.outlook.com (20.179.92.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Mon, 12 Aug 2019 03:21:41 +0000
Received: from BYAPR12MB2709.namprd12.prod.outlook.com
 ([fe80::f598:f57:e1cc:3b0b]) by BYAPR12MB2709.namprd12.prod.outlook.com
 ([fe80::f598:f57:e1cc:3b0b%5]) with mapi id 15.20.2157.020; Mon, 12 Aug 2019
 03:21:41 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, Alex Deucher
 <alexdeucher@gmail.com>
Subject: RE: libdrm patch merge request
Thread-Topic: libdrm patch merge request
Thread-Index: AdVNybWC+tQHNTX/QmCty/NITmdI3AARE8KAABDQ6NAAGtLKgAB/sU8Q
Date: Mon, 12 Aug 2019 03:21:41 +0000
Message-ID: <BYAPR12MB270902B9061E9B34F7A810A5F1D30@BYAPR12MB2709.namprd12.prod.outlook.com>
References: <BYAPR12MB27097A9CC4333FD798966B30F1D70@BYAPR12MB2709.namprd12.prod.outlook.com>
 <CADnq5_N5TrBKCH_S+=eDXxQQ-VwEvONn1aGyicSrL3B38BJhSA@mail.gmail.com>
 <DM6PR12MB27141A339F87664639DB5F9BF1D60@DM6PR12MB2714.namprd12.prod.outlook.com>
 <2d11b7f4-c9f5-cdc4-9e23-e54ca470f0eb@daenzer.net>
In-Reply-To: <2d11b7f4-c9f5-cdc4-9e23-e54ca470f0eb@daenzer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a6482f8-83c7-4696-4126-08d71ed431e3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3175; 
x-ms-traffictypediagnostic: BYAPR12MB3175:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB317500556DFF77C572CB9B28F1D30@BYAPR12MB3175.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(13464003)(199004)(189003)(256004)(66446008)(5024004)(4326008)(66946007)(76116006)(99286004)(66066001)(6306002)(3480700005)(55016002)(446003)(6116002)(9686003)(66556008)(14444005)(74316002)(86362001)(71200400001)(3846002)(66476007)(76176011)(110136005)(71190400001)(52536014)(54906003)(7696005)(66574012)(64756008)(102836004)(53546011)(305945005)(8676002)(6506007)(25786009)(229853002)(186003)(33656002)(8936002)(81166006)(81156014)(26005)(966005)(6246003)(7736002)(6436002)(5660300002)(14454004)(53936002)(478600001)(316002)(2906002)(486006)(11346002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3175;
 H:BYAPR12MB2709.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Hy+2k98VAhAWLEJL359hhrxEK9aNjINXfx6gUqzzGyWFJEstoK5iBwisXXx0edn+5XZAGMnOGw38JyZAbkmhD733hCRoPXUMUlAQRL3dJltU8V3Qq9zKmQWAykg0EMy/0Bx0Ud1L4KU80m2yJ1C7yBWZqKkmO5KcIbPJau4+50nHQ72AtcoZO2cwe3hmxOef0c3enleC/8Bd6SPu8Kp7l38YPYSljc7zGEVG3lc31RWhOrpdH+nVwuz9e4RMSyGV8vNVGKhw7wj7VgQErZsB6qcU9YGwWnxy9xL6d8CKlJOkNWRu2lF5VEcQckNhNOOFCV268XUgUrXWnHfBnqMLYduTG4/zxq0cwXOfnRRs77t9jvNg99wUstHQBh6pVbkCaAB6skflRCMNrpba9uizPQGYnczGznAWPmmYWMtTzKs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a6482f8-83c7-4696-4126-08d71ed431e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 03:21:41.3942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VHXmrmPaUrBSPZX4aBYmvxXYCVSDdXGJnmP7SHUPJWHBnIA7Pf7vjkkAR1eNIVDGkiYrTGHQWDQa3rveAqx2Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3175
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIbdkNs0S0CAVSez239un9WaOfLzKCzQWD5KhrylTz0=;
 b=JehY0FMgOFrVwSH14dRsjkhjQvaAt3p6SShk1Xi/tZIwAeRylgKMfPEex+sBpbFtwQr2ROXk7qv4pXHJ1sE4DjuIDIc83rPQRQ4XdCw21+QGGP+IK9Sdpzya5qpHHnFS//bVGUHHkXhY4D0xtn6QScqJS/AZb7xTEYJcNAyhnyk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Li, Candice" <Candice.Li@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgTWljaGVsLA0KDQpNeSBiYWQuIFNvcnJ5IGZvciB0aGF0Lg0KTXkgc29sdXRpb24gaXMgdG8g
dGFrZSB0aGUgZmlyc3Qgc3VnZ2VzdGlvbiBmcm9tIHlvdSwgd2lsbCBwcmVwYXJlIG9uZSBwYXRj
aCBzb29uIGZvciB0aGlzLg0KDQpSZWdhcmRzLA0KR3VjaHVuDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIubmV0PiANClNl
bnQ6IEZyaWRheSwgQXVndXN0IDksIDIwMTkgMTA6MTMgUE0NClRvOiBDaGVuLCBHdWNodW4gPEd1
Y2h1bi5DaGVuQGFtZC5jb20+OyBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4N
CkNjOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+
OyBMaSwgQ2FuZGljZSA8Q2FuZGljZS5MaUBhbWQuY29tPjsgTGksIERlbm5pcyA8RGVubmlzLkxp
QGFtZC5jb20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KU3ViamVj
dDogUmU6IGxpYmRybSBwYXRjaCBtZXJnZSByZXF1ZXN0DQoNCg0KVGhpcyBicm9rZSB0aGUgQ0kg
cGlwZWxpbmU6DQpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9kcm0vcGlwZWxp
bmVzLzU0OTAzDQoNCkxvb2tzIGxpa2UgdGhlIHByb2JsZW0gaXMgdGhhdCB0aGUgYXV0b3Rvb2xz
IGJ1aWxkIGRvZXNuJ3QgcHJvcGVybHkgZGlzYWJsZSB0aGUgYW1kZ3B1IHRlc3RzIHdoZW4gdGhl
IGpzb24tYyBsaWJyYXJ5IGlzIG1pc3NpbmcuIEkgc3VnZ2VzdCB0aGUgZm9sbG93aW5nOg0KDQox
LiBBZGQgYSBIQVZFX0pTT05DIGd1YXJkIGluIHRlc3RzL01ha2VmaWxlLmFtIDIuIEFkZCBsaWJq
c29uLWMtZGV2IHRvIHRoZSBwYWNrYWdlcyBpbnN0YWxsZWQgYnkgdGhlIG9sZGVzdC1hdXRvdG9v
bHMNCiAgIGpvYiBpbiAuZ2l0bGFiLWNpLnltbA0KDQoNClVudGlsIGxpYmRybSB1c2VzIEdpdExh
YiBtZXJnZSByZXF1ZXN0cyB0byBjYXRjaCB0aGlzIGtpbmQgb2YgaXNzdWUgYmVmb3JlIGl0IGhp
dHMgbWFzdGVyLCBwbGVhc2UgcHVzaCBjaGFuZ2VzIHRvIGEgYnJhbmNoIGluIGEgZm9ya2VkIHBl
cnNvbmFsIHJlcG9zaXRvcnkgYW5kIG1ha2Ugc3VyZSB0aGUgQ0kgcGlwZWxpbmUgY29tZXMgYmFj
ayBncmVlbiBiZWZvcmUgYXNraW5nIGZvciB0aGVtIHRvIGJlIHB1c2hlZCB0byBtYXN0ZXIuDQoN
Cg0KVGhhbmtzLA0KDQoNCk9uIDIwMTktMDgtMDkgMzoyNSBhLm0uLCBDaGVuLCBHdWNodW4gd3Jv
dGU6DQo+IFRoYW5rcywgQWxleC4NCj4gDQo+IFJlZ2FyZHMsDQo+IEd1Y2h1bg0KPiANCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hl
ckBnbWFpbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDksIDIwMTkgMToyNCBBTQ0KPiBU
bzogQ2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPg0KPiBDYzogRGV1Y2hlciwgQWxl
eGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgDQo+IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IExpLCANCj4gQ2Fu
ZGljZSA8Q2FuZGljZS5MaUBhbWQuY29tPjsgTGksIERlbm5pcyA8RGVubmlzLkxpQGFtZC5jb20+
OyBaaGFuZywgDQo+IEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCj4gU3ViamVjdDog
UmU6IGxpYmRybSBwYXRjaCBtZXJnZSByZXF1ZXN0DQo+IA0KPiBEb25lIQ0KPiANCj4gQWxleA0K
PiANCj4gT24gVGh1LCBBdWcgOCwgMjAxOSBhdCA1OjE4IEFNIENoZW4sIEd1Y2h1biA8R3VjaHVu
LkNoZW5AYW1kLmNvbT4gd3JvdGU6DQo+Pg0KPj4gSGkgQWxleCwNCj4+DQo+Pg0KPj4NCj4+IFdv
dWxkIHlvdSBtaW5kIG1lcmdpbmcgYXR0YWNoZWQgMyBwYXRjaGVzIHRvIGxpYmRybSBtYXN0ZXIg
YnJhbmNoPw0KPj4NCj4+IFRoZXNlIGNoYW5nZXMgYXJlIGltcGxlbWVudGVkIGZvciBnZnggYW5k
IHVtYyByYXMgaW5qZWN0IHVuaXQgdGVzdCBieSBhbWRncHVfdGVzdC4NCj4+DQo+PiBUaGFua3Mg
YSBsb3QuDQo+Pg0KPj4NCj4+DQo+PiBSZWdhcmRzLA0KPj4NCj4+IEd1Y2h1bg0KPj4NCj4+DQo+
Pg0KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+
IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFt
ZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KPiAN
Cg0KDQotLSANCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgIGh0dHBzOi8vd3d3LmFtZC5jb20NCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAg
ICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3Blcg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
