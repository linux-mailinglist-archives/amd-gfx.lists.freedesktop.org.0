Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D162C813FE
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 10:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693E089D42;
	Mon,  5 Aug 2019 08:15:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe46::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77D589D42
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 08:15:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7p0WbE/LmMVPRXWH7mpgrszDfOzzJcIgl7uH6EPmsP6wdOBxmseS4z5kTUUBHrlm0HfTQxZxqTl1UgNp1oblHEA4TQEH3VNq0ziX3CREEu7ASJRXPfxw4EP/Ps38Fuht4rTUydqJXuJ0UOEO2AhtZ0bissUZMFL4ENn75LesKOwHykVHercuT8vy3vEplGnJdTZFxFxtFrjaNIgkApaomEF1WiuUuH4syn24580VLrjpuxDoLS6d0aU49797Ptgm0zJgsC/F0YnCCSLmCQSEcfGFU0Ck8LCfRbx1cmvmC5JboM0LZi6YtBsjgrmJZc/SycdQ2YW5P7pIR237yqScg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZz7MzdB8BIUMTF3e3g1ijQDo+Z02Mnv5UQqSeneIi0=;
 b=OAO3p6AkIYi7Mfpu9/EFGX+FpLfZBkyPFDPSIsLUMx26tHvXvny9h0rcsZgNI9zHYUCKXswZpaAPUSukf4wKWWF4trCZaj0LBTcAP5ijbuzp4hrCTiTLsSAxaigh9RfvOC1tSaBm8ugx94RTWirzBN7n/dSWojJLv3p9oa+8g9Nop2hjmFC0BYs3OWbPmZ3ORDl84vyIDemHvjSCNbD8SXQpk1nYmNE5zniuRGmCA1ujA6Eo1yzwWCbsMAngkVctpUfvJCUb0mr4YBSDFp5aADDTePMYYHjm+q4oYuVH1/vhg3uKkYOdwfqvds+qMWtzEeUdEufda5CMGUUoLnDgeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB2568.namprd12.prod.outlook.com (52.132.141.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Mon, 5 Aug 2019 08:15:05 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e%3]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 08:15:05 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [PATCH] drm/amdgpu: update ras sysfs feature info
Thread-Topic: [PATCH] drm/amdgpu: update ras sysfs feature info
Thread-Index: AQHVS2Rt1iYG/yilwEGD8WZ3EfxSkabsNOFA
Date: Mon, 5 Aug 2019 08:15:04 +0000
Message-ID: <DM5PR12MB14183A68E61B70184BEC459FFCDA0@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190805080408.20770-1-tao.zhou1@amd.com>
In-Reply-To: <20190805080408.20770-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b9cb059-de45-46dc-68a4-08d7197d058c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2568; 
x-ms-traffictypediagnostic: DM5PR12MB2568:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB25689D9A2BA567342C796020FCDA0@DM5PR12MB2568.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:88;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(189003)(13464003)(199004)(6116002)(3846002)(6306002)(110136005)(256004)(2906002)(71200400001)(6436002)(81166006)(81156014)(14444005)(64756008)(76116006)(66446008)(66476007)(66946007)(66556008)(71190400001)(8676002)(229853002)(8936002)(316002)(14454004)(966005)(6246003)(6506007)(76176011)(53936002)(15650500001)(7696005)(102836004)(476003)(99286004)(66066001)(2501003)(52536014)(305945005)(53546011)(74316002)(7736002)(11346002)(446003)(9686003)(486006)(86362001)(68736007)(5660300002)(6636002)(478600001)(186003)(4326008)(26005)(55016002)(25786009)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2568;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hr7Z5eiECqh9NgxEgyCwgnCp2KqIW1TLnxFnLGFDYdwBxPX+UfxBOHmqTgo93JI344V/9RXLuA5U3YnEx03Pd0vayHZTmZIGI7+mzs7dW64GObDsuPzmqa4lR18DqMEc5ZdF+XHl6QBxLNPA4+BHcFR7eqZ9D821lpVSiZ6EvHCgxKxYQ+Ku4thlTssrKOTxw+MqZoe7k1k2k5gX3kl1dtoxM1j/TrEwmBrRkr5uyJVcmdvNxRmImKqXAPcLugqqncN3Xcnky34MLMwBjUstjPPMNYi5znocSQR02NIyzD5YOh+hfDpHWzn02Eg7s3P9cf6wOciDbCZOntLFy7X/5tLrDk1bz7khOYMF+swM6TAzz+k9OHokdW6JtkefFhKcO3hMicudKtyBTEOVJ4IqpM45US747DXBsZ9fdIhPX0E=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b9cb059-de45-46dc-68a4-08d7197d058c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 08:15:04.7230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2568
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZz7MzdB8BIUMTF3e3g1ijQDo+Z02Mnv5UQqSeneIi0=;
 b=VHDgwim27dUihRHMZ4IAIwaWbPGPhHMV7cb/0DAyOK8uxE4tvuorKvfxDZnSZ3ImoYdPjzKNl/QLWRstqeCswSms0QNfcbD6qAWpK5vAgnuP3/jZpHIF9ecuvodl6H7S9HakaImxaMuRbVcErBFIXAI1qCK7Pvyw92UZd1BP+6Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVn
YXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4
IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVGFv
IFpob3UNClNlbnQ6IDIwMTnlubQ45pyINeaXpSAxNjowNA0KVG86IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBQYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPjsgWmhhbmcsIEhh
d2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCkNjOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFA
YW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogdXBkYXRlIHJhcyBzeXNmcyBm
ZWF0dXJlIGluZm8NCg0KcmVtb3ZlIGNvbmZ1c2VkIHJhcyBlcnJvciB0eXBlIGluZm8NCg0KU2ln
bmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMTcgKysrKystLS0tLS0tLS0tLS0NCiAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KaW5kZXggZDJlOGE4NWY2ZTM4Li4zNjk2
NTEyNDdiMjMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmFzLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KQEAg
LTc4NywyNSArNzg3LDE4IEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9yYXNfc3lzZnNfZmVhdHVy
ZXNfcmVhZChzdHJ1Y3QgZGV2aWNlICpkZXYsDQogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
ID0gZGRldi0+ZGV2X3ByaXZhdGU7DQogCXN0cnVjdCByYXNfY29tbW9uX2lmIGhlYWQ7DQogCWlu
dCByYXNfYmxvY2tfY291bnQgPSBBTURHUFVfUkFTX0JMT0NLX0NPVU5UOw0KLQlpbnQgaTsNCisJ
aW50IGksIGVuYWJsZWQ7DQogCXNzaXplX3QgczsNCi0Jc3RydWN0IHJhc19tYW5hZ2VyICpvYmo7
DQogDQogCXMgPSBzY25wcmludGYoYnVmLCBQQUdFX1NJWkUsICJmZWF0dXJlIG1hc2s6IDB4JXhc
biIsIGNvbi0+ZmVhdHVyZXMpOw0KIA0KIAlmb3IgKGkgPSAwOyBpIDwgcmFzX2Jsb2NrX2NvdW50
OyBpKyspIHsNCiAJCWhlYWQuYmxvY2sgPSBpOw0KKwkJZW5hYmxlZCA9IGFtZGdwdV9yYXNfaXNf
ZmVhdHVyZV9lbmFibGVkKGFkZXYsICZoZWFkKTsNCiANCi0JCWlmIChhbWRncHVfcmFzX2lzX2Zl
YXR1cmVfZW5hYmxlZChhZGV2LCAmaGVhZCkpIHsNCi0JCQlvYmogPSBhbWRncHVfcmFzX2ZpbmRf
b2JqKGFkZXYsICZoZWFkKTsNCi0JCQlzICs9IHNjbnByaW50ZigmYnVmW3NdLCBQQUdFX1NJWkUg
LSBzLA0KLQkJCQkJIiVzOiAlc1xuIiwNCi0JCQkJCXJhc19ibG9ja19zdHIoaSksDQotCQkJCQly
YXNfZXJyX3N0cihvYmotPmhlYWQudHlwZSkpOw0KLQkJfSBlbHNlDQotCQkJcyArPSBzY25wcmlu
dGYoJmJ1ZltzXSwgUEFHRV9TSVpFIC0gcywNCi0JCQkJCSIlczogZGlzYWJsZWRcbiIsDQotCQkJ
CQlyYXNfYmxvY2tfc3RyKGkpKTsNCisJCXMgKz0gc2NucHJpbnRmKCZidWZbc10sIFBBR0VfU0la
RSAtIHMsDQorCQkJCSIlcyByYXMgZmVhdHVyZSBtYXNrOiAlc1xuIiwNCisJCQkJcmFzX2Jsb2Nr
X3N0cihpKSwgZW5hYmxlZD8ib24iOiJvZmYiKTsNCiAJfQ0KIA0KIAlyZXR1cm4gczsNCi0tIA0K
Mi4xNy4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
