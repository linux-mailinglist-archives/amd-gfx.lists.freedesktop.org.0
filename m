Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D82CC5C1C6
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jul 2019 19:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6F689A77;
	Mon,  1 Jul 2019 17:11:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780049.outbound.protection.outlook.com [40.107.78.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9725A89A77
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jul 2019 17:11:26 +0000 (UTC)
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3568.namprd12.prod.outlook.com (20.178.240.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Mon, 1 Jul 2019 17:11:24 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::6990:2d9f:875a:817e]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::6990:2d9f:875a:817e%4]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 17:11:24 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amdgpu/gfx9: use reset default for PA_SC_FIFO_SIZE
Thread-Topic: [PATCH 1/2] drm/amdgpu/gfx9: use reset default for
 PA_SC_FIFO_SIZE
Thread-Index: AQHVMBVZ6qZg/nGSEkqISMZhlYGCQKa19f1g
Date: Mon, 1 Jul 2019 17:11:23 +0000
Message-ID: <MN2PR12MB33099EEFB339952E0BFAE3A6ECF90@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190701140019.9881-1-alexander.deucher@amd.com>
In-Reply-To: <20190701140019.9881-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [107.77.221.64]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 296beffe-785b-422a-789e-08d6fe472554
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3568; 
x-ms-traffictypediagnostic: MN2PR12MB3568:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3568D0371CFE0C3D07FA5D60ECF90@MN2PR12MB3568.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(13464003)(199004)(189003)(6306002)(7736002)(66066001)(33656002)(305945005)(14444005)(8936002)(66946007)(55016002)(64756008)(66556008)(66476007)(110136005)(66446008)(76116006)(2906002)(73956011)(74316002)(4326008)(76176011)(99286004)(256004)(3846002)(486006)(8676002)(68736007)(446003)(11346002)(25786009)(316002)(6436002)(476003)(71190400001)(71200400001)(6116002)(102836004)(14454004)(2501003)(966005)(86362001)(72206003)(229853002)(7696005)(5660300002)(6506007)(478600001)(53936002)(6246003)(9686003)(53546011)(26005)(81156014)(186003)(52536014)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3568;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qf8ozY3nRzpxwSHUvGZKALk4deH4RquBvYnyDlIys2qRX8Wf2+YebOWvd1PvmY/AeOV54MteVJwVs4GvfYrwLACohVoTjyXHljp0WeGhdN5PUOQcIcIpNumXRu3ndNc3ckWBpRQUv7AeAgXiwnLD1mi4XJGrp+9oZLRV0LWQLPgvcBo479rYIrjIaYgVrZiT0cpN1xXPG183aqp0xP+eo2nQD+LmPe5oQUrxfPXWQEH1I71zk6rl70NpCYlx9oBk2+IY7dccParEYSXFAZYthedFyd7DtYdYbJR+hr7Ewfn3CTtG4nFK1A/kM0K3RlFflY1oKeOQJuS+lIZtwoP++S6IsP9fEn/asD1Yzb89UzxB6zT9gv+kS2H8FN5f7AnBhNolh1RFk1B/HSyUXwZTYbFIJZMzZ5+wmMX/xk6ntSA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 296beffe-785b-422a-789e-08d6fe472554
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 17:11:23.9861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruihuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3568
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eesHnZWTjjCulPAZcPyTHGqFEhP5aqZ/0PO5+Y4vk7E=;
 b=JhpEQmQsVDHea+r4RKap3FBzSAJCcWa31Ev9Epmfsr7fKE1qTVOvoBmA6fzJMc6DiulUlnf8Isanfu4W8Yd1rW5Eae4wHVGJJxLAJf7qex1NoQXtcQyBPSHsy43v75AetrnqZtSvi4NGb5e7LF/292t0xPxQI8+E/nDVEYaYDLE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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

U2VyaWVzIGFyZSBSZXZpZXdlZC1hbmQtVGVzdGVkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0Bh
bWQuY29tPg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1k
LWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEFsZXggRGV1
Y2hlcg0KU2VudDogTW9uZGF5LCBKdWx5IDEsIDIwMTkgOTowMCBBTQ0KVG86IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1
Y2hlckBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDEvMl0gZHJtL2FtZGdwdS9nZng5OiB1c2Ug
cmVzZXQgZGVmYXVsdCBmb3IgUEFfU0NfRklGT19TSVpFDQoNClJlY29tbWVuZGVkIGJ5IHRoZSBo
dyB0ZWFtLg0KDQpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIHwg
MTkgLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxOSBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQppbmRleCA5YjQxM2Y2ZmE1ODgu
LjViZGQ3YzQyYjAwZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92OV8wLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCkBA
IC0xOTYwLDI1ICsxOTYwLDYgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfY29uc3RhbnRzX2luaXQo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQogCW11dGV4X3VubG9jaygmYWRldi0+c3JibV9t
dXRleCk7DQogDQogCWdmeF92OV8wX2luaXRfY29tcHV0ZV92bWlkKGFkZXYpOw0KLQ0KLQltdXRl
eF9sb2NrKCZhZGV2LT5ncmJtX2lkeF9tdXRleCk7DQotCS8qDQotCSAqIG1ha2luZyBzdXJlIHRo
YXQgdGhlIGZvbGxvd2luZyByZWdpc3RlciB3cml0ZXMgd2lsbCBiZSBicm9hZGNhc3RlZA0KLQkg
KiB0byBhbGwgdGhlIHNoYWRlcnMNCi0JICovDQotCWdmeF92OV8wX3NlbGVjdF9zZV9zaChhZGV2
LCAweGZmZmZmZmZmLCAweGZmZmZmZmZmLCAweGZmZmZmZmZmKTsNCi0NCi0JV1JFRzMyX1NPQzE1
X1JMQyhHQywgMCwgbW1QQV9TQ19GSUZPX1NJWkUsDQotCQkgICAoYWRldi0+Z2Z4LmNvbmZpZy5z
Y19wcmltX2ZpZm9fc2l6ZV9mcm9udGVuZCA8PA0KLQkJCVBBX1NDX0ZJRk9fU0laRV9fU0NfRlJP
TlRFTkRfUFJJTV9GSUZPX1NJWkVfX1NISUZUKSB8DQotCQkgICAoYWRldi0+Z2Z4LmNvbmZpZy5z
Y19wcmltX2ZpZm9fc2l6ZV9iYWNrZW5kIDw8DQotCQkJUEFfU0NfRklGT19TSVpFX19TQ19CQUNL
RU5EX1BSSU1fRklGT19TSVpFX19TSElGVCkgfA0KLQkJICAgKGFkZXYtPmdmeC5jb25maWcuc2Nf
aGl6X3RpbGVfZmlmb19zaXplIDw8DQotCQkJUEFfU0NfRklGT19TSVpFX19TQ19ISVpfVElMRV9G
SUZPX1NJWkVfX1NISUZUKSB8DQotCQkgICAoYWRldi0+Z2Z4LmNvbmZpZy5zY19lYXJseXpfdGls
ZV9maWZvX3NpemUgPDwNCi0JCQlQQV9TQ19GSUZPX1NJWkVfX1NDX0VBUkxZWl9USUxFX0ZJRk9f
U0laRV9fU0hJRlQpKTsNCi0JbXV0ZXhfdW5sb2NrKCZhZGV2LT5ncmJtX2lkeF9tdXRleCk7DQot
DQogfQ0KIA0KIHN0YXRpYyB2b2lkIGdmeF92OV8wX3dhaXRfZm9yX3JsY19zZXJkZXMoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQotLSANCjIuMjAuMQ0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
