Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBB2652A3
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 09:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1566E14C;
	Thu, 11 Jul 2019 07:49:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700057.outbound.protection.outlook.com [40.107.70.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726FE6E14C
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jul 2019 07:49:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SURT4wM9u6JnhfMuVDZXPX5y6w9BZy9P4SowF4n/s1dR2sdcHpOfsZnApzvINdulnIeGO16bGeTXd5JtAgG5FzJKwb6IT55PTrjbCnoP0gv6+VJL26kVZCUYGyVQft9ow33pRO9x9KTY74PXlgdmJ7+4Ly04HG9xvwpNL/Bh46gByt2lct5cXDJSuAUCPIN5MKikwvxyWUsYGsAiZrd9RvhgXhcWAX3Utif5QjLCXXhrwymiVUKyYgqqOb+vrruJQuazKjhWpK9acp4f+TN8bDLNbvKh/nEejBJ4jrzjs6FZjuE64zRZlfbjZHJrgCAM8k4y7CtMHRsjtbzFmq+hcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYoPFoBtCO3S18CVg7/gP/NQwq/lkodX8Jiv/aG5HAg=;
 b=MkEDaq9sVDygCEe7Do/ZW/4rI5txaBflvOb/G/UZRmNVzN0Z9yBTUuT6obMNSEEYjwhMTumuwi2odvzeVxmS8X1hpd8DB/zIMzOp4dGfzSCNHWAEbFPlXd8N+3TusIOqTTC98duLkJUPdFiaBSODJAtwqAZfukAhSmN8qORWAugoNkrDhqV7A0VNaqClKY6x4NxcIfckLQ07OuiKSdkXxcInLsrRLMcLfjE0K2YqMZlGw07wGyAmNeMZwgSgCpFnMpO6gzZgwOZCp7XUMTjA/lTRiEEXnzxECuzTjiUlg2U8JFNCWPx1GlyRHz9bMiixBFxk8Anv4gzCVty6H2RGyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB3800.namprd12.prod.outlook.com (52.132.245.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Thu, 11 Jul 2019 07:49:31 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::6cc4:28bf:361f:d486]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::6cc4:28bf:361f:d486%3]) with mapi id 15.20.2052.020; Thu, 11 Jul 2019
 07:49:31 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Feng, Kenneth" <Kenneth.Feng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: bug fix for sysfs
Thread-Topic: [PATCH] drm/amd/powerplay: bug fix for sysfs
Thread-Index: AQHVN7yTHalDWzcsU0qa+YQfogMR5KbFCs6w
Date: Thu, 11 Jul 2019 07:49:30 +0000
Message-ID: <CH2PR12MB37679D98F73F4259588B3006FEF30@CH2PR12MB3767.namprd12.prod.outlook.com>
References: <1562831100-4555-1-git-send-email-kenneth.feng@amd.com>
In-Reply-To: <1562831100-4555-1-git-send-email-kenneth.feng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5e232d5-c9ba-467b-f440-08d705d44f07
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB3800; 
x-ms-traffictypediagnostic: CH2PR12MB3800:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CH2PR12MB380091A67090EE9B585F5ED6FEF30@CH2PR12MB3800.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(199004)(13464003)(189003)(2906002)(3846002)(478600001)(74316002)(81166006)(8936002)(446003)(256004)(81156014)(8676002)(11346002)(316002)(966005)(229853002)(6246003)(33656002)(7736002)(486006)(4326008)(6116002)(305945005)(476003)(66946007)(110136005)(186003)(26005)(76176011)(99286004)(76116006)(14454004)(5660300002)(53546011)(52536014)(7696005)(66446008)(66556008)(64756008)(66476007)(68736007)(25786009)(102836004)(55016002)(86362001)(9686003)(71200400001)(6306002)(6436002)(6506007)(71190400001)(2501003)(66066001)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3800;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vC9YBGqb5o/hKziboziFgCm5xZNN1MjDTBSN3+x9FC4Xu+LYVr1qzdH/GLVTGq1tMG6W3RmO+Wf5gBzR5Vh1GNbDBG+UFMLNTTshcnyA4l95Z8kG7pfDgYhat7TMerwLglYEjRs+Ekz7JFwuhrVs211zCmqjSOUCC6GcZqLoWSbt2FZpiIWmrs9BHA2xc9emyJ7oZRJUZjlqCm39cdpdybCOnbeshB5/EfTZmGxmtoM/brP7cxW7Bg9WEACGIjtJIWnGgWO1NRb5ZVvPw2SNYfFvhoR4PrRBJfZ3TxVyyrRGXrO8jEX1FfkvkK9ToDYQE9p5cfAWoeRm2q/+J4yuoq5xV6eOtgtjqA4577T4sAjWJ28XMv4aNtJL92MCTQqZmD2s4DTV9jBf0lEwatTbDGpYCc9l3bExgvaNBmUhpag=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e232d5-c9ba-467b-f440-08d705d44f07
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 07:49:30.8874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: feifxu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3800
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYoPFoBtCO3S18CVg7/gP/NQwq/lkodX8Jiv/aG5HAg=;
 b=iJMtOGpQrOVEb8F5Dw1SnmEYStnxvZrpDJNRzF1U8kjRVdSeK73e2KVfki0ja+81I54Ns6zMzq2PxkEZxSRYK3iI+vDey9r+KDWVJe/d2luU2zoanME0/AunQpJ22e6Qi5cEa1BWoSpmaV/4rJGnXrDFH+PDj3UY+Y4i6t32SEk=
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
Cc: "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEZlaWZlaSBYdSA8RmVpZmVpLlh1QGFtZC5jb20+DQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgS2VubmV0aCBGZW5nDQpTZW50OiBUaHVyc2RheSwg
SnVseSAxMSwgMjAxOSAzOjQ1IFBNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
CkNjOiBGZW5nLCBLZW5uZXRoIDxLZW5uZXRoLkZlbmdAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRD
SF0gZHJtL2FtZC9wb3dlcnBsYXk6IGJ1ZyBmaXggZm9yIHN5c2ZzDQoNCndoZW4gd2Ugc2V0IHBy
b2ZpbGVfcGVhayB0byBzeXNmczpwb3dlcl9kcG1fZm9yY2VfcGVyZm9ybWFuY2VfbGV2ZWwsDQp3
ZSBnZXRzIHRoZSB3cm9uZyBzb2NjbGsgbGV2ZWwgYW5kIG1jbGsgbGV2ZWwudGhpcyBwYXRjaCBm
aXggdGhpcyBpc3N1ZS4NCg0KU2lnbmVkLW9mZi1ieTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZl
bmdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9w
cHQuYyB8IDQgKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMNCmlu
ZGV4IDVlZTY1MDguLmNkMzJiMjAgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9uYXZpMTBfcHB0LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L25hdmkxMF9wcHQuYw0KQEAgLTExNTcsMTQgKzExNTcsMTQgQEAgc3RhdGljIGludCBuYXZpMTBf
Z2V0X3Byb2ZpbGluZ19jbGtfbWFzayhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwNCiAJCQlyZXQg
PSBzbXVfZ2V0X2RwbV9sZXZlbF9jb3VudChzbXUsIFNNVV9NQ0xLLCAmbGV2ZWxfY291bnQpOw0K
IAkJCWlmIChyZXQpDQogCQkJCXJldHVybiByZXQ7DQotCQkJKnNjbGtfbWFzayA9IGxldmVsX2Nv
dW50IC0gMTsNCisJCQkqbWNsa19tYXNrID0gbGV2ZWxfY291bnQgLSAxOw0KIAkJfQ0KIA0KIAkJ
aWYoc29jX21hc2spIHsNCiAJCQlyZXQgPSBzbXVfZ2V0X2RwbV9sZXZlbF9jb3VudChzbXUsIFNN
VV9TT0NDTEssICZsZXZlbF9jb3VudCk7DQogCQkJaWYgKHJldCkNCiAJCQkJcmV0dXJuIHJldDsN
Ci0JCQkqc2Nsa19tYXNrID0gbGV2ZWxfY291bnQgLSAxOw0KKwkJCSpzb2NfbWFzayA9IGxldmVs
X2NvdW50IC0gMTsNCiAJCX0NCiAJfQ0KIA0KLS0gDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
