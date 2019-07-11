Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32FC652EC
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 10:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B7389EB1;
	Thu, 11 Jul 2019 08:14:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740071.outbound.protection.outlook.com [40.107.74.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0E489EB1
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jul 2019 08:14:13 +0000 (UTC)
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3696.namprd12.prod.outlook.com (10.255.86.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Thu, 11 Jul 2019 08:14:12 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2073.008; Thu, 11 Jul 2019
 08:14:12 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Feng, Kenneth" <Kenneth.Feng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: bug fix for sysfs
Thread-Topic: [PATCH] drm/amd/powerplay: bug fix for sysfs
Thread-Index: AQHVN7yTdM1g4Iau5ECGpkDR+DqmsqbFEaug
Date: Thu, 11 Jul 2019 08:14:11 +0000
Message-ID: <MN2PR12MB334478BBC6BF900531703301E4F30@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1562831100-4555-1-git-send-email-kenneth.feng@amd.com>
In-Reply-To: <1562831100-4555-1-git-send-email-kenneth.feng@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1004d8bb-7ac1-443e-3cad-08d705d7c19b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3696; 
x-ms-traffictypediagnostic: MN2PR12MB3696:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB36963515DE8F33549AE4EA66E4F30@MN2PR12MB3696.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(13464003)(199004)(189003)(3846002)(6116002)(966005)(5660300002)(4326008)(68736007)(256004)(486006)(2501003)(53936002)(2906002)(478600001)(25786009)(9686003)(476003)(229853002)(71200400001)(33656002)(71190400001)(6246003)(55016002)(6306002)(11346002)(76116006)(446003)(102836004)(26005)(316002)(81166006)(81156014)(66066001)(110136005)(8936002)(86362001)(66946007)(99286004)(7736002)(76176011)(7696005)(305945005)(6506007)(66446008)(66476007)(66556008)(64756008)(74316002)(14454004)(53546011)(186003)(52536014)(8676002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3696;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Yd+0rJnhY7cHWei1LqIUEUtMZLOgtsAvdhVBgPtzRGbq/pIYS7tJGGQBYwUocTgQbYRQdmugFIUwt2e2gxUiTvFoH7JJqi9kdAR2ZvEhEV4gxt4q3a1sZEwgUdwV+2MHWWtd1xiNB2LCxXupqqPNgWP985zi49qs1y4Hoy48brFEJ5o+FdJojnhxb8cYi/yQ/VyQdFlCL8fAU2X1on0K5i84MhDuAbpL8ONQXwdf4afAE31FJLc9ZwddmogX4a/KHOg9tZvK9TaFnYPzgO98LXoRhbi2w6t1cDeRV70ABIZ7rIUdU9jNr7Rz+YGPwtIAug/r5mqm6n9u3AeMD8i/LPUFIjknBk7GEikWWnILEl74xXv1g+IEnmPGYee6H2tN0DMY8zozi0KWyLL7xjwNBBSBSSbts9pjSJ/lLV7qsgs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1004d8bb-7ac1-443e-3cad-08d705d7c19b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 08:14:11.7959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3696
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/212vfxb2p4sZLN0kcMgKoevmUMnV9aTVNexW5gm3mY=;
 b=1hH/zA9W1nSG3LsRPnXaYu4YCZbpGok6ylTuf+zRFnJWW72rXyjR+Ea7wQv+JS6l8G/1hD0+qhwB3n1eH9MMIcXLWAdRDl6e1PdQVfJ4AYvRbt5YA2Y6/fcNdoDshi6Sb/vfwNA04sU1KyCB1LiCyDPdGpPouKaWb4CpehTfpRE=
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
Cc: "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IEtlbm5ldGggRmVuZw0KPiBTZW50OiBU
aHVyc2RheSwgSnVseSAxMSwgMjAxOSAzOjQ1IFBNDQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBDYzogRmVuZywgS2VubmV0aCA8S2VubmV0aC5GZW5nQGFtZC5jb20+DQo+
IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZC9wb3dlcnBsYXk6IGJ1ZyBmaXggZm9yIHN5c2ZzDQo+
IA0KPiB3aGVuIHdlIHNldCBwcm9maWxlX3BlYWsgdG8gc3lzZnM6cG93ZXJfZHBtX2ZvcmNlX3Bl
cmZvcm1hbmNlX2xldmVsLA0KPiB3ZSBnZXRzIHRoZSB3cm9uZyBzb2NjbGsgbGV2ZWwgYW5kIG1j
bGsgbGV2ZWwudGhpcyBwYXRjaCBmaXggdGhpcyBpc3N1ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgNCArKy0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYw0KPiBpbmRleCA1ZWU2NTA4Li5jZDMy
YjIwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBf
cHB0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5j
DQo+IEBAIC0xMTU3LDE0ICsxMTU3LDE0IEBAIHN0YXRpYyBpbnQgbmF2aTEwX2dldF9wcm9maWxp
bmdfY2xrX21hc2soc3RydWN0DQo+IHNtdV9jb250ZXh0ICpzbXUsDQo+ICAJCQlyZXQgPSBzbXVf
Z2V0X2RwbV9sZXZlbF9jb3VudChzbXUsIFNNVV9NQ0xLLA0KPiAmbGV2ZWxfY291bnQpOw0KPiAg
CQkJaWYgKHJldCkNCj4gIAkJCQlyZXR1cm4gcmV0Ow0KPiAtCQkJKnNjbGtfbWFzayA9IGxldmVs
X2NvdW50IC0gMTsNCj4gKwkJCSptY2xrX21hc2sgPSBsZXZlbF9jb3VudCAtIDE7DQo+ICAJCX0N
Cj4gDQo+ICAJCWlmKHNvY19tYXNrKSB7DQo+ICAJCQlyZXQgPSBzbXVfZ2V0X2RwbV9sZXZlbF9j
b3VudChzbXUsIFNNVV9TT0NDTEssDQo+ICZsZXZlbF9jb3VudCk7DQo+ICAJCQlpZiAocmV0KQ0K
PiAgCQkJCXJldHVybiByZXQ7DQo+IC0JCQkqc2Nsa19tYXNrID0gbGV2ZWxfY291bnQgLSAxOw0K
PiArCQkJKnNvY19tYXNrID0gbGV2ZWxfY291bnQgLSAxOw0KPiAgCQl9DQo+ICAJfQ0KPiANCj4g
LS0NCj4gMi43LjQNCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
