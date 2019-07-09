Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EFC62FCF
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2019 06:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACEFD89C7F;
	Tue,  9 Jul 2019 04:58:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690084.outbound.protection.outlook.com [40.107.69.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C7E89C7F
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jul 2019 04:58:55 +0000 (UTC)
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4222.namprd12.prod.outlook.com (10.255.125.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 04:58:53 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 04:58:53 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amdgpu/navi10: add uclk activity sensor
Thread-Topic: [PATCH 1/2] drm/amdgpu/navi10: add uclk activity sensor
Thread-Index: AQHVMhRfnZ8crq0tLUCKS3PXu4p6kKbBwbbw
Date: Tue, 9 Jul 2019 04:58:53 +0000
Message-ID: <MN2PR12MB3344A8BAA1D4C6B823077441E4F10@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190704025822.18970-1-alexander.deucher@amd.com>
In-Reply-To: <20190704025822.18970-1-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 502b4eca-b45b-4b82-deb3-08d7042a242c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4222; 
x-ms-traffictypediagnostic: MN2PR12MB4222:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB4222380EC0735B3E1ED289AEE4F10@MN2PR12MB4222.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(199004)(189003)(13464003)(102836004)(68736007)(8936002)(55016002)(6436002)(110136005)(9686003)(6306002)(6506007)(99286004)(4326008)(6246003)(72206003)(6116002)(53936002)(53546011)(76176011)(3846002)(229853002)(966005)(81156014)(26005)(7696005)(316002)(71190400001)(25786009)(71200400001)(446003)(8676002)(11346002)(33656002)(86362001)(186003)(476003)(81166006)(5660300002)(76116006)(256004)(52536014)(14454004)(66066001)(66556008)(2501003)(73956011)(305945005)(66476007)(66446008)(486006)(64756008)(2906002)(66946007)(478600001)(74316002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4222;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /XHpvbt7Pg73AwirbZJKqMB7WTnOFT8CUbg1Q4iSyDXHXzFntcxgX7MY3c527uQTLyeg5HXS0UU3pWuT2vS2HnrnJfsQ+UmGX0Mbd/3aK++eZiP7jxhZ+2ch8eW50cvjZkwwnAOg2vNp7uzBkFQD7i7dpqRMUwO3149M6hL9n8BYWX3ib7Fn29hszd4PZNT02QGTO4VGl51+1O5SPIg9ZlJ2C3VYxXdUzoaW1+nEH8qf/hj1IOhiXbej4AevE8d3uhDLR2kpO7NGc7Y5NDbLNC+n6M7k6ZqJ84IZxP7WzDBcqWOMDzMZht12ns6PBAkG6U1Khpxai4LVX+xl8ZMBaOKIf7q93DgxNmS1SDFQl8ZWbosXveZGnDRcqRXuIQ3rjRoHsSP6IrxkkLwRdddIoqSr8Br4RY+4Un3R/Y/RE08=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 502b4eca-b45b-4b82-deb3-08d7042a242c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 04:58:53.7672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKLA3xV4csxkWC95+7Fb+2RaTJ09gmVL9roAH/D21C4=;
 b=qRjtu0WhEoSyqc+ad309gKHcd5Nnf9446RYmQvvStCVcd/5M70tbUS5Js/Vf+aevwmIWz6u5SrOtUjQLVNUUDTJetUBNU/MbXU30l/FmO8ZGgFBrlkie1d42URs7KlBa5ZbtLs7whKhdEtZIvzT6TvNF6QFJUO4X+CHqF/jGcAs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEFsZXgNCj4gRGV1Y2hlcg0KPiBTZW50OiBU
aHVyc2RheSwgSnVseSAwNCwgMjAxOSAxMDo1OCBBTQ0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJA
YW1kLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDEvMl0gZHJtL2FtZGdwdS9uYXZpMTA6IGFkZCB1
Y2xrIGFjdGl2aXR5IHNlbnNvcg0KPiANCj4gUXVlcnkgdGhlIG1ldHJpY3MgdGFibGUgZm9yIHRo
ZSBjdXJyZW50IHVjbGsgYWN0aXZpdHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgMTYgKysrKysrKysrKysrKystLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jDQo+IGluZGV4IGUwMDM5
N2Y4NGIyZi4uNTc5NGY3Y2VmMWM4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9uYXZpMTBfcHB0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvbmF2aTEwX3BwdC5jDQo+IEBAIC04NjksNiArODY5LDcgQEAgc3RhdGljIGludCBuYXZp
MTBfZ2V0X2dwdV9wb3dlcihzdHJ1Y3Qgc211X2NvbnRleHQNCj4gKnNtdSwgdWludDMyX3QgKnZh
bHVlKSAgfQ0KPiANCj4gIHN0YXRpYyBpbnQgbmF2aTEwX2dldF9jdXJyZW50X2FjdGl2aXR5X3Bl
cmNlbnQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsDQo+ICsJCQkJCSAgICAgICBlbnVtIGFtZF9w
cF9zZW5zb3JzIHNlbnNvciwNCj4gIAkJCQkJICAgICAgIHVpbnQzMl90ICp2YWx1ZSkNCj4gIHsN
Cj4gIAlpbnQgcmV0ID0gMDsNCj4gQEAgLTg4NCw3ICs4ODUsMTcgQEAgc3RhdGljIGludCBuYXZp
MTBfZ2V0X2N1cnJlbnRfYWN0aXZpdHlfcGVyY2VudChzdHJ1Y3QNCj4gc211X2NvbnRleHQgKnNt
dSwNCj4gIAlpZiAocmV0KQ0KPiAgCQlyZXR1cm4gcmV0Ow0KPiANCj4gLQkqdmFsdWUgPSBtZXRy
aWNzLkF2ZXJhZ2VHZnhBY3Rpdml0eTsNCj4gKwlzd2l0Y2ggKHNlbnNvcikgew0KPiArCWNhc2Ug
QU1ER1BVX1BQX1NFTlNPUl9HUFVfTE9BRDoNCj4gKwkJKnZhbHVlID0gbWV0cmljcy5BdmVyYWdl
R2Z4QWN0aXZpdHk7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9NRU1f
TE9BRDoNCj4gKwkJKnZhbHVlID0gbWV0cmljcy5BdmVyYWdlVWNsa0FjdGl2aXR5Ow0KPiArCQli
cmVhazsNCj4gKwlkZWZhdWx0Og0KPiArCQlwcl9lcnIoIkludmFsaWQgc2Vuc29yIGZvciByZXRy
aWV2aW5nIGNsb2NrIGFjdGl2aXR5XG4iKTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0K
PiANCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gQEAgLTEyNjAsOCArMTI3MSw5IEBAIHN0YXRpYyBp
bnQgbmF2aTEwX3JlYWRfc2Vuc29yKHN0cnVjdCBzbXVfY29udGV4dA0KPiAqc211LA0KPiAgCQkq
KHVpbnQzMl90ICopZGF0YSA9IHBwdGFibGUtPkZhbk1heGltdW1ScG07DQo+ICAJCSpzaXplID0g
NDsNCj4gIAkJYnJlYWs7DQo+ICsJY2FzZSBBTURHUFVfUFBfU0VOU09SX01FTV9MT0FEOg0KPiAg
CWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9HUFVfTE9BRDoNCj4gLQkJcmV0ID0gbmF2aTEwX2dldF9j
dXJyZW50X2FjdGl2aXR5X3BlcmNlbnQoc211LCAodWludDMyX3QNCj4gKilkYXRhKTsNCj4gKwkJ
cmV0ID0gbmF2aTEwX2dldF9jdXJyZW50X2FjdGl2aXR5X3BlcmNlbnQoc211LCBzZW5zb3IsDQo+
ICh1aW50MzJfdA0KPiArKilkYXRhKTsNCj4gIAkJKnNpemUgPSA0Ow0KPiAgCQlicmVhazsNCj4g
IAljYXNlIEFNREdQVV9QUF9TRU5TT1JfR1BVX1BPV0VSOg0KPiAtLQ0KPiAyLjIwLjENCj4gDQo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1n
ZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
