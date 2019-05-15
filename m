Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F8E1FB8A
	for <lists+amd-gfx@lfdr.de>; Wed, 15 May 2019 22:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DCC8919E;
	Wed, 15 May 2019 20:37:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700070.outbound.protection.outlook.com [40.107.70.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D08C8919E
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 May 2019 20:37:10 +0000 (UTC)
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1840.namprd12.prod.outlook.com (10.175.56.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Wed, 15 May 2019 20:37:07 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::202b:98f2:9925:5d47]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::202b:98f2:9925:5d47%2]) with mapi id 15.20.1900.010; Wed, 15 May 2019
 20:37:07 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/vega20: use mode1 reset for RAS and XGMI
Thread-Topic: [PATCH] drm/amdgpu/vega20: use mode1 reset for RAS and XGMI
Thread-Index: AQHVC1zzSAlG2Mfmzk6noJDBU70ONqZspS8A
Date: Wed, 15 May 2019 20:37:07 +0000
Message-ID: <c7736886-3fd6-920f-de3f-fba2cc14777e@amd.com>
References: <20190515202930.15701-1-alexander.deucher@amd.com>
In-Reply-To: <20190515202930.15701-1-alexander.deucher@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0013.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::26)
 To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 900b5fd2-0c1e-4d70-fcef-08d6d97518a7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1840; 
x-ms-traffictypediagnostic: MWHPR12MB1840:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR12MB1840E6624D59484283028A36EA090@MWHPR12MB1840.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:260;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(39860400002)(136003)(366004)(346002)(189003)(199004)(66446008)(316002)(73956011)(66946007)(99286004)(66556008)(66476007)(64756008)(11346002)(68736007)(71200400001)(71190400001)(52116002)(6116002)(2616005)(7736002)(476003)(3846002)(305945005)(110136005)(2501003)(31696002)(86362001)(2906002)(486006)(76176011)(72206003)(53936002)(6436002)(6246003)(26005)(25786009)(6512007)(229853002)(6306002)(8676002)(8936002)(66066001)(36756003)(6486002)(966005)(31686004)(5660300002)(4326008)(256004)(14454004)(446003)(6506007)(386003)(102836004)(478600001)(81156014)(186003)(81166006)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1840;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fokvNQRse0cUAdirUXFKjn2qUiuYUUi9b786rAdeoEqEhgJw/UciLRAbcoRXPslV5eNDkfb5Y+XnwcB3s7BWzxq6wVKRXYtyfjAybWRBXhO+jqa5rBY/PslEKAiuYZJ1KCOtiHT7bD5g57uiWldHgXojv/DGLU6lNmboN4yo5uJvFWrSGvhVj4kS1pBsUpkW+L0IDL33UPW6HnrHN046WCq03GL3IgQteMgMfopXuUtUt8P73TVPzPKjo4pUK7ejaJ/TtsD9oumIkAu8f+mjAJ8DUYJoNNvRQIrRnv9shVfdhznoFxh3d+4Cin3yAbgdV7arB6SWY2ojgkx/FpDDHTJb36yJhhgja74H0+d08MNtrdPdeBnFlKCrJ8QwRT9Mk3j7u1PsdAg1j1PDFzATOh74BBDLFP10BLTjqJ/RrGA=
Content-ID: <F991482CF48EF041928139D84D3DA185@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 900b5fd2-0c1e-4d70-fcef-08d6d97518a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 20:37:07.4963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1840
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ho2uHcm3hXctWRImwmschkcLYYJx/8s6OXSqpt6wWoA=;
 b=WzbTjTSMHJddgTJySbmC9Rv+GLelXKaysCeLzM64d8M0H00c9pkma6ykzJIUqlVwDJwKxxt2fY6DPNEILWvz2AD37nsA4e+D5L50WvYzBRA+eJdcnKwujYIBnI/lLNqNT14zSWRyfal2Kz6gDecVkNhn6OOOCzv9/Kz9MWsTpSU=
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

UmV2aWV3ZWQtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29t
Pg0KDQpBbmRyZXkNCg0KT24gNS8xNS8xOSA0OjI5IFBNLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+
IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCj4NCj4gSWYgUkFTIG9yIFhHTUkgYXJlIGVuYWJs
ZWQsIHlvdSBoYXZlIHRvIHVzZSBtb2RlMSByZXNldCByYXRoZXINCj4gdGhhbiBCQUNPLg0KPg0K
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgfCA5ICsrKysr
KysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zb2MxNS5jDQo+IGluZGV4IDE2Yzc0N2Y4MzhlZS4uY2Y2M2I0ZGFkYTRiIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCj4gQEAgLTY1LDYgKzY1LDggQEAN
Cj4gICAjaW5jbHVkZSAiZGNlX3ZpcnR1YWwuaCINCj4gICAjaW5jbHVkZSAibXhncHVfYWkuaCIN
Cj4gICAjaW5jbHVkZSAiYW1kZ3B1X3NtdS5oIg0KPiArI2luY2x1ZGUgImFtZGdwdV9yYXMuaCIN
Cj4gKyNpbmNsdWRlICJhbWRncHVfeGdtaS5oIg0KPiAgICNpbmNsdWRlIDx1YXBpL2xpbnV4L2tm
ZF9pb2N0bC5oPg0KPg0KPiAgICNkZWZpbmUgbW1NUDBfTUlTQ19DR1RUX0NUUkwwICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDB4MDFiOQ0KPiBAQCAtNDc2LDYgKzQ3OCwxMyBAQCBzdGF0aWMgaW50IHNvYzE1X2FzaWNfcmVz
ZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICBzb2MxNV9hc2ljX2dldF9iYWNvX2NhcGFiaWxpdHkoYWRldiwgJmJhY29fcmVzZXQpOw0KPiAg
ICAgICAgICAgICAgICAgIGVsc2UNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIGJhY29fcmVz
ZXQgPSBmYWxzZTsNCj4gKyAgICAgICAgICAgICAgIGlmIChiYWNvX3Jlc2V0KSB7DQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhbWRncHVfaGl2ZV9pbmZvICpoaXZlID0gYW1kZ3B1
X2dldF94Z21pX2hpdmUoYWRldiwgMCk7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBhbWRncHVfcmFzICpyYXMgPSBhbWRncHVfcmFzX2dldF9jb250ZXh0KGFkZXYpOw0KPiArDQo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChoaXZlIHx8IChyYXMgJiYgcmFzLT5zdXBwb3J0
ZWQpKQ0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJhY29fcmVzZXQgPSBmYWxz
ZTsNCj4gKyAgICAgICAgICAgICAgIH0NCj4gICAgICAgICAgICAgICAgICBicmVhazsNCj4gICAg
ICAgICAgZGVmYXVsdDoNCj4gICAgICAgICAgICAgICAgICBiYWNvX3Jlc2V0ID0gZmFsc2U7DQo+
IC0tDQo+IDIuMjAuMQ0KPg0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
