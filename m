Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A466CB51
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 10:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDE16E352;
	Thu, 18 Jul 2019 08:56:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810081.outbound.protection.outlook.com [40.107.81.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140FB6E352
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 08:56:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2HRURKsDIgGwx816PGszsedyw7UdJ9AiBDR7Uiiwyqs1QdN8DNqXL9YIw5DSdN/8KXP6YQFyODRKkSCtCGcW+k1U+CNZGPyshuK+1iSYi/dPWX34P/p/O2zn1OAvEtkPX0PtMfadR09qQMCgPMhlcO37NxlfJksIfM/zhTz1JzA+6gCQa6oUVQpuB30Jk3R48XklxwduxlRvKQUqXTEDhk9ie2lc+dQtlsrocEVWGA5UVeOFKOaNINyvpSx1UIUVFxDMlAOy/zxot419El2HZNIijEUSXBfGy+VAuTSa1kAI5uqJQCEohExSr7wXs/PR30bOWgTatLQCm5HWxDLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGI7pCLRn9u8RYJN2IuY+odMIdsQerdQA9m3ZnE4HvE=;
 b=iLpPLQxEjT4FR6fWu8BwBLksZNhxz20hT2dspGqKQrX4LlpiniTFOXM5CPjU+FvFCBZsOsYlc+rsVwmlrmF57B9+joao9D/xVvb+KhB94ZaP5xyepk2AKVa+o7C3bJBHlDDY7nbKTgMX3fucVaSDhHXK1xnTiWgBG+3+BFLW2EQlSCivifr8f/yesBl/P1RSdQhGbnPaG1i344lEeoaSCEawEb2tqKLpcQO6ENxkYNYzQKB45uBs/wVGPy+2MEtZD0ugdJNl50v1q/+j2VHAZLsfasZFHlXZT906+8MKmNwL0vz1BVFEg5tepE+/hYgD+H16nQua4pRjmcSTDhikkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB3928.namprd12.prod.outlook.com (52.132.244.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Thu, 18 Jul 2019 08:56:40 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::6cc4:28bf:361f:d486]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::6cc4:28bf:361f:d486%3]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 08:56:40 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 4/4] drm/amdgpu: drop ras self test
Thread-Topic: [PATCH 4/4] drm/amdgpu: drop ras self test
Thread-Index: AQHVPUG2cKayVrU+20G0fW8Is4BaSqbQEtKQ
Date: Thu, 18 Jul 2019 08:56:40 +0000
Message-ID: <CH2PR12MB37677B2BF5E1299FBAC3C08AFEC80@CH2PR12MB3767.namprd12.prod.outlook.com>
References: <1563438014-29690-1-git-send-email-Hawking.Zhang@amd.com>
 <1563438014-29690-4-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1563438014-29690-4-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb58fd11-8b67-4f54-1e70-08d70b5dd980
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB3928; 
x-ms-traffictypediagnostic: CH2PR12MB3928:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CH2PR12MB3928EF5A8886C25458AF533AFEC80@CH2PR12MB3928.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(13464003)(199004)(189003)(66066001)(446003)(11346002)(6436002)(6116002)(3846002)(26005)(53936002)(476003)(102836004)(186003)(33656002)(966005)(478600001)(14454004)(25786009)(256004)(14444005)(486006)(110136005)(316002)(71190400001)(305945005)(7736002)(2501003)(74316002)(4326008)(99286004)(8676002)(6246003)(86362001)(7696005)(5660300002)(66556008)(55016002)(6306002)(2906002)(76176011)(9686003)(66446008)(53546011)(52536014)(229853002)(6506007)(71200400001)(66946007)(64756008)(66476007)(8936002)(76116006)(81156014)(81166006)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3928;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HK8vmLSA52AhNtSnczdBGgH0xXBkWXihZtSZAYgAt85TbYFGTmha/X5zg0VhyfbomxDSyLsmPqq3t3mtbc0YoCxwdh0Z0s99VZ/nGQXwIzUIfzKbXnOIWq6NxUxYfuFyw28LMTZP5ez5/30zs+4HP5MBwTQTBnnZZSoJIckfHH1VAhzVOOSYJs8MYtModyXuk3BUwDy4TFMC517IQD6ZSRKkIIjtUP2M74DC2FgGQwb/GX8K3k88ksvKi/jTjPj8nTweM8FzrgMwfSrBXotDugypZXaftNq3dEIit6nizPt7QgvAA9OkkaN39wGo45nltJqaL04+fi3wckpcA5GhowiSRgeuEHRvnPtYKI3h7RjB8XSdL9JFQY6i/EWnX1HjT1OI80sVoUUDiV5z+abFAdWBEQGhgOU9s7mFrPm9wus=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb58fd11-8b67-4f54-1e70-08d70b5dd980
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 08:56:40.4401 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: feifxu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3928
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGI7pCLRn9u8RYJN2IuY+odMIdsQerdQA9m3ZnE4HvE=;
 b=EtyQE4Imb2Z/aQyS6Q1FkFKcGegoLoKYeP22NMRqxHY4kQm3pvw9coIp3i759D8pxrtZeDJYA62SX/3uuin2YPJSgG8NFp9vgm6104By7MG3XPBiqn5fB1ZldCMfNhmMSkYrIAXAEuE9yxUtcPfB5m0w5CjYldKmEdn0T5Keykw=
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNClNlcmllcyBpcyBSZXZpZXdlZC1ieTogRmVpZmVpIFh1IDxGZWlmZWkuWHVAYW1kLmNvbT4N
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91
bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBIYXdraW5nIFpoYW5nDQpT
ZW50OiBUaHVyc2RheSwgSnVseSAxOCwgMjAxOSA0OjIwIFBNDQpUbzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCkNjOiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29t
Pg0KU3ViamVjdDogW1BBVENIIDQvNF0gZHJtL2FtZGdwdTogZHJvcCByYXMgc2VsZiB0ZXN0DQoN
CnRoaXMgZnVuY3Rpb24gaXMgbm90IG5lZWRlZCBhbnkgbW9yZS4gZXJyb3IgaW5qZWN0aW9uIGlz
IHRoZSBvbmx5IHdheSB0byB2YWxpZGF0ZSByYXMgYnV0IGl0IGNhbid0IGJlIGV4ZWN1dGVkIGlu
IGFtZGdwdV9yYXNfaW5pdCwgd2hlcmUgZ3B1IGlzIGV2ZW4gbm90IGluaXRpYWxpemVkDQoNClNp
Z25lZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCi0tLQ0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDcgLS0tLS0tLQ0KIDEg
ZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Jhcy5jDQppbmRleCA1ZWU3M2Y1Li40YTUwYmVmIDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCkBAIC02NiwxMSArNjYsNiBAQCBzdGF0aWMgaW50IGFt
ZGdwdV9yYXNfcmVzZXJ2ZV92cmFtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCAgc3RhdGlj
IGludCBhbWRncHVfcmFzX3JlbGVhc2VfdnJhbShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwN
CiAJCXN0cnVjdCBhbWRncHVfYm8gKipib19wdHIpOw0KIA0KLXN0YXRpYyB2b2lkIGFtZGdwdV9y
YXNfc2VsZl90ZXN0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KSAtew0KLQkvKiBUT0RPICov
DQotfQ0KLQ0KIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9yYXNfZGVidWdmc19yZWFkKHN0cnVjdCBm
aWxlICpmLCBjaGFyIF9fdXNlciAqYnVmLA0KIAkJCQkJc2l6ZV90IHNpemUsIGxvZmZfdCAqcG9z
KQ0KIHsNCkBAIC0xNTIxLDggKzE1MTYsNiBAQCBpbnQgYW1kZ3B1X3Jhc19pbml0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQ0KIAlpZiAoYW1kZ3B1X3Jhc19mc19pbml0KGFkZXYpKQ0KIAkJ
Z290byBmc19vdXQ7DQogDQotCWFtZGdwdV9yYXNfc2VsZl90ZXN0KGFkZXYpOw0KLQ0KIAlEUk1f
SU5GTygiUkFTIElORk86IHJhcyBpbml0aWFsaXplZCBzdWNjZXNzZnVsbHksICINCiAJCQkiaGFy
ZHdhcmUgYWJpbGl0eVsleF0gcmFzX21hc2tbJXhdXG4iLA0KIAkJCWNvbi0+aHdfc3VwcG9ydGVk
LCBjb24tPnN1cHBvcnRlZCk7DQotLQ0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
