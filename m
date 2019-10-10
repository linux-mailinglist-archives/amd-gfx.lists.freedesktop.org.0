Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E28D2A02
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 14:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110A46E23F;
	Thu, 10 Oct 2019 12:51:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on0616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6586E23F
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 12:51:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQPmwWDF5dBsJ6zsB2Z4b/UR0IiMmqq9Y+NtrwWE0tSAQxTwxSh3eqpNluTpASlbGBVHFS8Cvqv/nzjm/LZdAlamWRauDgytjV5OrJbKA7E0DoC1+P2c2VBxnNMnoknYVjXai9EB2znzqfGn9q4/ayD2QrejNgMlBvW6Ypl40WTiKJCKHONrsTKDY65G/kx2bbUuSwTbRJ2hGZLIc1r47nc0prQm7OkrAYePtWkCxy2GjZTgpypn5Jm2v26vltzpI7CKu8dBEpVBTy1rsU63QP780aip88P93pnRqfg+gxEiRCUHwtqepUac8x8fs0h1pkuyohT1wEvA8ToEIltUlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CInFauheyXQxpAL6zAKgKhcHboK+nfeq8yO2ijIgqjc=;
 b=Qm+JTWZefgatAab0d3OVyxIbK/Gjfz+GZeWGu8pseETOClTMpgd5yvkAtp+EUAxSR0vXndhal8buiaGnC/j9cUZJ25erzjLGAzQDYnUSzKy+4AXGrJvmcpag95zPNJbOP+WCxNqPfpN26FGgjYjJEFrmjXPqygrZJKN6y6kpp+clpucLBKwv3bhirxUom1a5KOaAl2qNgBe1yq7rfh+f3P7DRxhwRxCVmHmlWUZJdEdCb2MGB9GMMQa2nI/y3e3RLZxyiR9qWNmxTWaKWdSGxPzrWMnQUbIYmGe7ZIoNp5KcKohRwuFN00k3mSUEdQU6eUUd/XceOO31dr27NBwdcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB2405.namprd12.prod.outlook.com (52.132.140.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 10 Oct 2019 12:51:02 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::b016:c350:87e7:dede]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::b016:c350:87e7:dede%9]) with mapi id 15.20.2347.016; Thu, 10 Oct 2019
 12:51:02 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/discovery: reserve discovery data at the top
 of VRAM
Thread-Topic: [PATCH] drm/amdgpu/discovery: reserve discovery data at the top
 of VRAM
Thread-Index: AQHVf2j9PPq8LK37v0ODkpqUDKo3+adT05QQ
Date: Thu, 10 Oct 2019 12:51:02 +0000
Message-ID: <DM5PR12MB1418C4006E799EF1C344C544FC940@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20191010124757.17427-1-xiaojie.yuan@amd.com>
In-Reply-To: <20191010124757.17427-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cde5e086-d70c-4352-f004-08d74d8081e5
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB2405:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB2405A97582094F4A8AE1A3CBFC940@DM5PR12MB2405.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(13464003)(189003)(486006)(186003)(33656002)(2906002)(102836004)(316002)(110136005)(53546011)(6506007)(7696005)(99286004)(446003)(52536014)(11346002)(6116002)(3846002)(476003)(26005)(86362001)(76176011)(305945005)(5660300002)(7736002)(25786009)(74316002)(2501003)(8936002)(81166006)(81156014)(8676002)(66946007)(4326008)(76116006)(66556008)(66476007)(64756008)(14454004)(478600001)(66446008)(229853002)(55016002)(6246003)(9686003)(6436002)(66066001)(256004)(71200400001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2405;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SbJ9sfWvx78OwVMZ7gxp7ZV/2bdSzv3fZ7CYpXREUYVCxxvNqzD3nkW3tCyklKwAydvPqEqrDyjBvMWNvfP6OEN4fbRCZxudmCu7lSexLfv1pRweC36TAt6eL9nmSHg8QD4Rqpvs6IRwwocjiKUqpwkjzDYcBInROZ390SPRaWlGnbSvUpowI2FMRYFDCbkTc9mVjTct7zDktPVg3Wt4X5omtIOxK5tubNXs3CN/Klk+1O2vVFAoJA2Z4Q8pVJfq6qS5T6jTkybMTFbgeH4hHFjHiReALdXsg87VWagNh5JVbtAqxzGgwvgz9MzLKbfAXsYLADNLCosVDd7tTog/VaX3wiV0MwbqLeoBYkmyh5AcrdJmwDUxwi2gmH5yRG1gAxEpLRrEm3F1/vgj4l0QXFXHqYAh783dVs0OgZGQKHE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cde5e086-d70c-4352-f004-08d74d8081e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 12:51:02.4058 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PBU87qqMKO2GzV7wodU8hBDV5DDplQfFf5ETMzVMnKSw9ulwXB5GhIpBiLKs9egILaFYeHBVsaAE/+VkN5PfPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2405
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CInFauheyXQxpAL6zAKgKhcHboK+nfeq8yO2ijIgqjc=;
 b=g3IHZU14XHNEk6qyb/9t+kedptqWMUWTWhm/4i3FdekztwnjZRS4hKmvVX6F0qqaz9tdPu2u5PInNx7q5/oyX4a1CjctYQ2gNlupJEv0OaVKGBCuwGjxerGejufFHPMXUeOSO8GT/gFo6sbK1dPMkOwGkszspuoaGVmEKZ9CEQk=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGxlYXNlIGFkZCBkZWZpbmUgb24gdG1yIG1lbW9yeSBzaXplIGluc3RlYWQgb2YgaGFyZC1jb2Rl
LiBPdGhlciB0aGFuIHRoYXQgdGhlIHBhdGNoIGlzDQpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFu
ZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KDQpSZWdhcmRzLA0KSGF3a2luZw0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFl1YW4sIFhpYW9qaWUgPFhpYW9qaWUuWXVhbkBhbWQu
Y29tPiANClNlbnQ6IDIwMTnlubQxMOaciDEw5pelIDIwOjQ4DQpUbzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCkNjOiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29t
PjsgWGlhbywgSmFjayA8SmFjay5YaWFvQGFtZC5jb20+OyBZdWFuLCBYaWFvamllIDxYaWFvamll
Lll1YW5AYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdS9kaXNjb3Zlcnk6IHJl
c2VydmUgZGlzY292ZXJ5IGRhdGEgYXQgdGhlIHRvcCBvZiBWUkFNDQoNCklQIERpc2NvdmVyeSBk
YXRhIGlzIFRNUiBmZW5jZWQgYnkgdGhlIGxhdGVzdCBQU1AgQkwsIHNvIHdlIG5lZWQgdG8gcmVz
ZXJ2ZSB0aGlzIHJlZ2lvbi4NCg0KU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamll
Lnl1YW5AYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5o
ICAgICB8ICAxICsNCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgfCAx
NSArKysrKysrKysrKysrKysNCiAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCmluZGV4IGJlMGIyYzY5YzIyMy4uNjc3NTY0
N2YwYmE1IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgN
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQpAQCAtODEyLDYgKzgx
Miw3IEBAIHN0cnVjdCBhbWRncHVfZGV2aWNlIHsNCiAJdWludDhfdAkJCQkqYmlvczsNCiAJdWlu
dDMyX3QJCQliaW9zX3NpemU7DQogCXN0cnVjdCBhbWRncHVfYm8JCSpzdG9sZW5fdmdhX21lbW9y
eTsNCisJc3RydWN0IGFtZGdwdV9ibwkJKmRpc2NvdmVyeV9tZW1vcnk7DQogCXVpbnQzMl90CQkJ
Ymlvc19zY3JhdGNoX3JlZ19vZmZzZXQ7DQogCXVpbnQzMl90CQkJYmlvc19zY3JhdGNoW0FNREdQ
VV9CSU9TX05VTV9TQ1JBVENIXTsNCiANCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dHRtLmMNCmluZGV4IGVkZmZjODgzNTQ5YS4uYzNkN2ViNjg1YTIzIDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCkBAIC0xOTU1LDYgKzE5NTUsMTggQEAgaW50IGFt
ZGdwdV90dG1faW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAJCQkJICAgIE5VTEws
ICZzdG9sZW5fdmdhX2J1Zik7DQogCWlmIChyKQ0KIAkJcmV0dXJuIHI7DQorDQorCS8qDQorCSAq
IHJlc2VydmUgb25lIFRNUiAoNjRLKSBtZW1vcnkgYXQgdGhlIHRvcCBvZiBWUkFNIHdoaWNoIGhv
bGRzDQorCSAqIElQIERpc2NvdmVyeSBkYXRhIGFuZCBpcyBwcm90ZWN0ZWQgYnkgUFNQLg0KKwkg
Ki8NCisJciA9IGFtZGdwdV9ib19jcmVhdGVfa2VybmVsKGFkZXYsIDY0IDw8IDEwLCBQQUdFX1NJ
WkUsDQorCQkJCSAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLA0KKwkJCQkgICAgJmFkZXYtPmRp
c2NvdmVyeV9tZW1vcnksDQorCQkJCSAgICBOVUxMLCBOVUxMKTsNCisJaWYgKHIpDQorCQlyZXR1
cm4gcjsNCisNCiAJRFJNX0lORk8oImFtZGdwdTogJXVNIG9mIFZSQU0gbWVtb3J5IHJlYWR5XG4i
LA0KIAkJICh1bnNpZ25lZCkgKGFkZXYtPmdtYy5yZWFsX3ZyYW1fc2l6ZSAvICgxMDI0ICogMTAy
NCkpKTsNCiANCkBAIC0yMDI0LDYgKzIwMzYsOSBAQCB2b2lkIGFtZGdwdV90dG1fbGF0ZV9pbml0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KIAl2b2lkICpzdG9sZW5fdmdhX2J1ZjsNCiAJ
LyogcmV0dXJuIHRoZSBWR0Egc3RvbGVuIG1lbW9yeSAoaWYgYW55KSBiYWNrIHRvIFZSQU0gKi8N
CiAJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZhZGV2LT5zdG9sZW5fdmdhX21lbW9yeSwgTlVMTCwg
JnN0b2xlbl92Z2FfYnVmKTsNCisNCisJLyogcmV0dXJuIHRoZSBJUCBEaXNjb3ZlcnkgVE1SIG1l
bW9yeSBiYWNrIHRvIFZSQU0gKi8NCisJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZhZGV2LT5kaXNj
b3ZlcnlfbWVtb3J5LCBOVUxMLCBOVUxMKTsNCiB9DQogDQogLyoqDQotLQ0KMi4yMC4xDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
