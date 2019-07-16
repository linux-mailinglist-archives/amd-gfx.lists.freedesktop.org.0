Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C59D96A1C9
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 07:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125416E090;
	Tue, 16 Jul 2019 05:16:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750079.outbound.protection.outlook.com [40.107.75.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74666E090
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 05:16:28 +0000 (UTC)
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB3847.namprd12.prod.outlook.com (52.132.245.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 16 Jul 2019 05:16:24 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::6cc4:28bf:361f:d486]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::6cc4:28bf:361f:d486%3]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 05:16:24 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: avoid access before allocation
Thread-Topic: [PATCH] drm/amd/powerplay: avoid access before allocation
Thread-Index: AQHVOF0y+b5jeg9IOEyEdIQxDs88QabMuVOAgAABHrA=
Date: Tue, 16 Jul 2019 05:16:24 +0000
Message-ID: <CH2PR12MB3767DA3553CE405117274FA1FECE0@CH2PR12MB3767.namprd12.prod.outlook.com>
References: <20190712025439.16511-1-evan.quan@amd.com>
 <MN2PR12MB334419B332848A4DE7AE5F67E4CE0@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB334419B332848A4DE7AE5F67E4CE0@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a73bff3-f19d-42e6-152e-08d709acbf5a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB3847; 
x-ms-traffictypediagnostic: CH2PR12MB3847:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CH2PR12MB3847A9B4F6E77E9D4E324E30FECE0@CH2PR12MB3847.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:196;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(13464003)(199004)(189003)(71190400001)(2501003)(71200400001)(25786009)(86362001)(110136005)(11346002)(486006)(446003)(476003)(478600001)(966005)(14444005)(33656002)(66066001)(256004)(76116006)(66476007)(316002)(66446008)(66556008)(64756008)(66946007)(7736002)(305945005)(68736007)(53936002)(6246003)(55016002)(14454004)(26005)(186003)(81166006)(102836004)(74316002)(6436002)(6506007)(53546011)(229853002)(8936002)(8676002)(81156014)(5660300002)(52536014)(76176011)(3846002)(6306002)(99286004)(6116002)(9686003)(7696005)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3847;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cdpDpBdgCcvJGmxQCpWkd+zTHUiHcRez0QMjQnpBXfhh4P7jVJA382hPds5lilzmx8d9XeygxVFHPIaCCxq4sZkRfxU7CoIJeIWNBylgEEur6fzv9+NRPYwCoGQAoc5GkNLNxoi+FCgfSW5z+j/JqWbGV7bqjHBnZyNWuQxpuetk3YJS/yaP7VBD59PwZj/9EsB9Wogp+YfCzKt2Cm2EBkI6jEbHawBf2GVDw8I8PHySaH6xeO1KRyN54TDnEfND7g4Mn3KxfGW4Pim+Vm5fj1atwnq7KQGXk5owPaRnVxwzIcywHUgEcNNooHuHWY/Mne04lIcp7j5suiuFwRbOQd08qMXOzy2kwgc/TwjygCq7hkVQOYPoUyAScta+89gPqU+pf8jqkKMeNkX1g1PVmwsw9o2Dp0P+857WSunq+/Q=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a73bff3-f19d-42e6-152e-08d709acbf5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 05:16:24.4012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: feifxu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3847
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXs1uVcPqU7HkrGLoXAe1j9hJyj9VXdyQklo6MvRSAw=;
 b=MnX9H6hXuXrotrRpsIlhau9Eh3blKDDqOLn9RLCB8qPJ1mo5pwn2qZ3t3veeuInR3LWlRGwyakglKbxj5Zu0ok3E5kGYD07tRvigmLEtjsnzpeN0Au3Ah29fnYxjsZVsct/4sBhBZbZ19ZMG31QtwGisPm80LJ4tWJUSFMynzSU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Feifei.Xu@amd.com; 
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

DQpSZXZpZXdlZC1ieTogRmVpZmVpIFh1IDxGZWlmZWkuWHVAYW1kLmNvbT4NCg0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFF1YW4sIEV2YW4NClNlbnQ6IFR1ZXNkYXks
IEp1bHkgMTYsIDIwMTkgMToxMiBQTQ0KVG86IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29t
PjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRy
bS9hbWQvcG93ZXJwbGF5OiBhdm9pZCBhY2Nlc3MgYmVmb3JlIGFsbG9jYXRpb24NCg0KUGluZy4u
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRXZhbiBRdWFuIDxldmFu
LnF1YW5AYW1kLmNvbT4NCj4gU2VudDogRnJpZGF5LCBKdWx5IDEyLCAyMDE5IDEwOjU1IEFNDQo+
IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogUXVhbiwgRXZhbiA8RXZh
bi5RdWFuQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZC9wb3dlcnBsYXk6IGF2
b2lkIGFjY2VzcyBiZWZvcmUgYWxsb2NhdGlvbg0KPiANCj4gTm8gYWNjZXNzIGJlZm9yZSBhbGxv
Y2F0aW9uLg0KPiANCj4gQ2hhbmdlLUlkOiBJYTFkNzg3ODZmMjQwMGNkMWNkMjI3ZDFhYjZlYTRj
NmE3MTYxOWU0Yw0KPiBTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyB8
IDExICsrKysrKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L3ZlZ2EyMF9wcHQuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2Ey
MF9wcHQuYw0KPiBpbmRleCA5ZTNlNzM3OTI2YWEuLmM3MDI2MmU2ZTI1MCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYw0KPiBAQCAtNDQxLDcgKzQ0
MSw2IEBAIHN0YXRpYyBpbnQgdmVnYTIwX3N0b3JlX3Bvd2VycGxheV90YWJsZShzdHJ1Y3QNCj4g
c211X2NvbnRleHQgKnNtdSkgIHsNCj4gIAlBVE9NX1ZlZ2EyMF9QT1dFUlBMQVlUQUJMRSAqcG93
ZXJwbGF5X3RhYmxlID0gTlVMTDsNCj4gIAlzdHJ1Y3Qgc211X3RhYmxlX2NvbnRleHQgKnRhYmxl
X2NvbnRleHQgPSAmc211LT5zbXVfdGFibGU7DQo+IC0JaW50IHJldDsNCj4gDQo+ICAJaWYgKCF0
YWJsZV9jb250ZXh0LT5wb3dlcl9wbGF5X3RhYmxlKQ0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4g
QEAgLTQ1NSw5ICs0NTQsNyBAQCBzdGF0aWMgaW50IHZlZ2EyMF9zdG9yZV9wb3dlcnBsYXlfdGFi
bGUoc3RydWN0DQo+IHNtdV9jb250ZXh0ICpzbXUpDQo+ICAJdGFibGVfY29udGV4dC0+dGhlcm1h
bF9jb250cm9sbGVyX3R5cGUgPSBwb3dlcnBsYXlfdGFibGUtDQo+ID51Y1RoZXJtYWxDb250cm9s
bGVyVHlwZTsNCj4gIAl0YWJsZV9jb250ZXh0LT5URFBPRExpbWl0ID0gbGUzMl90b19jcHUocG93
ZXJwbGF5X3RhYmxlLQ0KPiA+T3ZlckRyaXZlOFRhYmxlLk9EU2V0dGluZ3NNYXhbQVRPTV9WRUdB
MjBfT0RTRVRUSU5HX1BPV0VSUEVSDQo+IENFTlRBR0VdKTsNCj4gDQo+IC0JcmV0ID0gdmVnYTIw
X3NldHVwX29kOF9pbmZvcm1hdGlvbihzbXUpOw0KPiAtDQo+IC0JcmV0dXJuIHJldDsNCj4gKwly
ZXR1cm4gMDsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgaW50IHZlZ2EyMF9hcHBlbmRfcG93ZXJwbGF5
X3RhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211KSBAQCAtDQo+IDE1MDcsNiArMTUwNCwxMiBA
QCBzdGF0aWMgaW50IHZlZ2EyMF9zZXRfZGVmYXVsdF9vZDhfc2V0dHRpbmdzKHN0cnVjdA0KPiBz
bXVfY29udGV4dCAqc211KQ0KPiANCj4gIAlzbXUtPm9kX3NldHRpbmdzID0gKHZvaWQgKilvZDhf
c2V0dGluZ3M7DQo+IA0KPiArCXJldCA9IHZlZ2EyMF9zZXR1cF9vZDhfaW5mb3JtYXRpb24oc211
KTsNCj4gKwlpZiAocmV0KSB7DQo+ICsJCXByX2VycigiUmV0cmlldmUgYm9hcmQgT0QgbGltaXRz
IGZhaWxlZCFcbiIpOw0KPiArCQlyZXR1cm4gcmV0Ow0KPiArCX0NCj4gKw0KPiAgCWlmIChzbXVf
ZmVhdHVyZV9pc19lbmFibGVkKHNtdSwNCj4gU01VX0ZFQVRVUkVfRFBNX1NPQ0NMS19CSVQpKSB7
DQo+ICAJCWlmIChvZDhfc2V0dGluZ3MtDQo+ID5vZF9mZWF0dXJlX2NhcGFiaWxpdGllc1tBVE9N
X1ZFR0EyMF9PREZFQVRVUkVfR0ZYQ0xLX0xJTUlUU10gJiYNCj4gIAkJICAgIG9kOF9zZXR0aW5n
cy0NCj4gPm9kX3NldHRpbmdzX21heFtPRDhfU0VUVElOR19HRlhDTEtfRk1BWF0gPiAwICYmDQo+
IC0tDQo+IDIuMjEuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
