Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C68ED3807
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 05:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8750D6E3F9;
	Fri, 11 Oct 2019 03:50:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740072.outbound.protection.outlook.com [40.107.74.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBABA6E3F9
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 03:50:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WetYNQERQVruoxzEX5SLN9/lc1YbAKbPE6mgHoD5iCS4fmguEOpdI4nHPEWfmWeU797drbbx2eOvKAdYF46kzJpRrhk9Hj4QV49s5sSA17uMZ6v2Y+RvEvqvN/IHXUaLk7g9wV9CNCvEsBY+fkixp3dL3isKyfE9JK0gPNxpXgripWjtT3SYXuc8GbPWRlQACnsW3zeq8/Bt6vO7fATiraD8xLTy+I0V/1nANL3+oddcxoUuzDFbl8NbuyavMNbed9OqMYiOMTVZLkSF2AUUc4/jD0Gk5No3qIyvjDtTvXIqoBGcONLVYKzff3t+iPEJmi0lngeXBFigbjPLYs9MKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQjEdMR09LgdcCxFW3b4/CkCz/OmMxmAXHtKX+vuArM=;
 b=eeBFhT1/KnqF8hVWUdZEtfCErEhddVcYd/R5ff9Et6Ki2z1iHXExQ9hHhE4KPwTd/9Jx0ZT4oOgmh+SH4SJ9aTwkAVVPEqDD8vlPHp5xPxVtrsP1d4RCe72Obq5QVGJWig1F1YDm69DNsyjG40eHZip+vvA0vdF+eLaOM5ZyXcmSo978xx5fUVlfxkZpyXxtL9ynaLyDhean0IWSuUjtU8Nc18fP7Ds+WpluPlNEWJKy3zxCzhiwk1QcmmkCj9Ytx4PRxYU0Iji6ElO8hziSnT/Qw64kc75M0uFygmlE/efGxLqxxmE8GSwGOvJTsFWAGWFLKrLqQDJdGGwFX3sWsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB4143.namprd12.prod.outlook.com (10.255.224.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Fri, 11 Oct 2019 03:50:40 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::d003:9b5a:b346:b32b]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::d003:9b5a:b346:b32b%7]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 03:50:40 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/swSMU: custom UMD pstate peak clock for navi14
Thread-Topic: [PATCH] drm/amdgpu/swSMU: custom UMD pstate peak clock for navi14
Thread-Index: AQHVf84HIcvjNtombEWf59fV2faqMqdUzk4Q
Date: Fri, 11 Oct 2019 03:50:40 +0000
Message-ID: <MN2PR12MB3598874EA3546A794BAC6F7E8E970@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20191011005107.29716-1-kevin1.wang@amd.com>
In-Reply-To: <20191011005107.29716-1-kevin1.wang@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aaea6c33-72b4-47e2-4cd4-08d74dfe2f0b
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB4143:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB414398695ED0577DEC726D508E970@MN2PR12MB4143.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:466;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(13464003)(189003)(199004)(52536014)(33656002)(110136005)(99286004)(54906003)(256004)(81166006)(25786009)(305945005)(7736002)(76116006)(8936002)(74316002)(8676002)(81156014)(55016002)(102836004)(86362001)(66946007)(9686003)(71200400001)(71190400001)(76176011)(316002)(66476007)(66446008)(64756008)(66556008)(6506007)(7696005)(53546011)(14454004)(478600001)(2906002)(2501003)(11346002)(229853002)(486006)(476003)(186003)(446003)(66066001)(4326008)(5660300002)(6246003)(6436002)(3846002)(6116002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4143;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tO9+e0KDi/qGMJ/ffPlSlB2WE0ZtMlbbAQ5SVfInszptfXn4bjaRTsy88uugsXJVkiQyBhbECZK5SgC30rWzo4x+WLk/XTE3lnH2d5ysEBf0yUzhCmBKByTpOuHPt/alSB36nJ4DSD0WXLktfUqCoeUFv9Awj967k5DyfhvMyDJ7SoIddFnVsYmpFCXbP7ND7hl2zQTzf8MaVpNUuNIaXMWqYBWHsysjZzPURuBSy8pomZi/eud8uTpzyEt8GkkAZEonu4p0beUI1oMySGP8PNDutnxGDEhxe7yGnctOnOEjLQCCF/SndIu95ulnq2fuA4yluodBl/pNnenmlokbe4u3UoeUmlalYOwojKl4kQTztQgiO86T2wmJ8DjRIuRoRSsVDGwlvPzOaLIj29hwNoe/hpjLZKi5ANwQWz38pIg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaea6c33-72b4-47e2-4cd4-08d74dfe2f0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 03:50:40.1246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VDla5Ed5dR5jIck7fWfiQUulOlQx6urQBv+PU87aqSXwOMJZpuF4inPJyf00RBiz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4143
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQjEdMR09LgdcCxFW3b4/CkCz/OmMxmAXHtKX+vuArM=;
 b=FCJ+xi1mp7cMsHtJ4/4nk8dsW8XlCQaD9qyTN6xfih6Dm2tidJ53HF8c1f1PWPm5HkB+1qdkNcQlW1DVnPVASbdrFdsXI0EwpniBAH0cK0lUbLh7fDxgBwO6nsdUgmerk2QrW40OKX/D25yI7POo0dPwilmnBHHI0cUpDDp2aC8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Cc: "Hesik, Christopher" <Christopher.Hesik@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+CgoKLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogV2FuZywgS2V2aW4oWWFuZykgClNlbnQ6IEZyaWRh
eSwgT2N0b2JlciAxMSwgMjAxOSA4OjUyIEFNClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpDYzogRmVuZywgS2VubmV0aCA8S2VubmV0aC5GZW5nQGFtZC5jb20+OyBaaGFuZywgSGF3
a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgSGVzaWssIENocmlzdG9waGVyIDxDaHJpc3Rv
cGhlci5IZXNpa0BhbWQuY29tPjsgV2FuZywgS2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFtZC5j
b20+ClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdS9zd1NNVTogY3VzdG9tIFVNRCBwc3RhdGUg
cGVhayBjbG9jayBmb3IgbmF2aTE0CgphZGQgbmF2aTE0IHVtZCBwc3RhdGUgcGVhayBjbG9jayBz
dXBwb3J0LgoKTkFWSTE0X1VNRF9QU1RBVEVfUEVBS19YVF9HRlhDTEsgICAxNjcwIE1IegpOQVZJ
MTRfVU1EX1BTVEFURV9QRUFLX1hUTV9HRlhDTEsgIDE0NDggTUh6IE5BVkkxNF9VTURfUFNUQVRF
X1BFQUtfWExNX0dGWENMSyAgMTE4MSBNSHogTkFWSTE0X1VNRF9QU1RBVEVfUEVBS19YVFhfR0ZY
Q0xLICAxNzE3IE1IegpOQVZJMTRfVU1EX1BTVEFURV9QRUFLX1hMX0dGWENMSyAgIDE0NDggTUh6
CgpTaWduZWQtb2ZmLWJ5OiBLZXZpbiBXYW5nIDxrZXZpbjEud2FuZ0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyB8IDUzICsrKysrKysrKysr
KysrKystLS0tLS0gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuaCB8
ICA2ICsrKwogMiBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggNjZh
M2ZjZDdiMWQwLi44MGU5NmUzNDEyYWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9uYXZpMTBfcHB0LmMKQEAgLTE0NjcsMTggKzE0NjcsNDcgQEAgc3RhdGljIGludCBuYXZpMTBf
c2V0X3BlYWtfY2xvY2tfYnlfZGV2aWNlKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogCXVpbnQz
Ml90IHNjbGtfZnJlcSA9IDAsIHVjbGtfZnJlcSA9IDA7CiAJdWludDMyX3QgdWNsa19sZXZlbCA9
IDA7CiAKLQlzd2l0Y2ggKGFkZXYtPnBkZXYtPnJldmlzaW9uKSB7Ci0JY2FzZSAweGYwOiAvKiBY
VFggKi8KLQljYXNlIDB4YzA6Ci0JCXNjbGtfZnJlcSA9IE5BVkkxMF9QRUFLX1NDTEtfWFRYOwot
CQlicmVhazsKLQljYXNlIDB4ZjE6IC8qIFhUICovCi0JY2FzZSAweGMxOgotCQlzY2xrX2ZyZXEg
PSBOQVZJMTBfUEVBS19TQ0xLX1hUOworCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7CisJY2Fz
ZSBDSElQX05BVkkxMDoKKwkJc3dpdGNoIChhZGV2LT5wZGV2LT5yZXZpc2lvbikgeworCQljYXNl
IDB4ZjA6IC8qIFhUWCAqLworCQljYXNlIDB4YzA6CisJCQlzY2xrX2ZyZXEgPSBOQVZJMTBfUEVB
S19TQ0xLX1hUWDsKKwkJCWJyZWFrOworCQljYXNlIDB4ZjE6IC8qIFhUICovCisJCWNhc2UgMHhj
MToKKwkJCXNjbGtfZnJlcSA9IE5BVkkxMF9QRUFLX1NDTEtfWFQ7CisJCQlicmVhazsKKwkJZGVm
YXVsdDogLyogWEwgKi8KKwkJCXNjbGtfZnJlcSA9IE5BVkkxMF9QRUFLX1NDTEtfWEw7CisJCQli
cmVhazsKKwkJfQogCQlicmVhazsKLQlkZWZhdWx0OiAvKiBYTCAqLwotCQlzY2xrX2ZyZXEgPSBO
QVZJMTBfUEVBS19TQ0xLX1hMOworCWNhc2UgQ0hJUF9OQVZJMTQ6CisJCXN3aXRjaCAoYWRldi0+
cGRldi0+cmV2aXNpb24pIHsKKwkJY2FzZSAweGM3OiAvKiBYVCAqLworCQljYXNlIDB4ZjQ6CisJ
CQlzY2xrX2ZyZXEgPSBOQVZJMTRfVU1EX1BTVEFURV9QRUFLX1hUX0dGWENMSzsKKwkJCWJyZWFr
OworCQljYXNlIDB4YzE6IC8qIFhUTSAqLworCQljYXNlIDB4ZjI6CisJCQlzY2xrX2ZyZXEgPSBO
QVZJMTRfVU1EX1BTVEFURV9QRUFLX1hUTV9HRlhDTEs7CisJCQlicmVhazsKKwkJY2FzZSAweGMz
OiAvKiBYTE0gKi8KKwkJY2FzZSAweGYzOgorCQkJc2Nsa19mcmVxID0gTkFWSTE0X1VNRF9QU1RB
VEVfUEVBS19YTE1fR0ZYQ0xLOworCQkJYnJlYWs7CisJCWNhc2UgMHhjNTogLyogWFRYICovCisJ
CWNhc2UgMHhmNjoKKwkJCXNjbGtfZnJlcSA9IE5BVkkxNF9VTURfUFNUQVRFX1BFQUtfWExNX0dG
WENMSzsKKwkJCWJyZWFrOworCQlkZWZhdWx0OiAvKiBYTCAqLworCQkJc2Nsa19mcmVxID0gTkFW
STE0X1VNRF9QU1RBVEVfUEVBS19YTF9HRlhDTEs7CisJCQlicmVhazsKKwkJfQogCQlicmVhazsK
KwlkZWZhdWx0OgorCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKIAlyZXQgPSBzbXVfZ2V0X2RwbV9s
ZXZlbF9jb3VudChzbXUsIFNNVV9VQ0xLLCAmdWNsa19sZXZlbCk7IEBAIC0xNTAxLDEwICsxNTMw
LDYgQEAgc3RhdGljIGludCBuYXZpMTBfc2V0X3BlYWtfY2xvY2tfYnlfZGV2aWNlKHN0cnVjdCBz
bXVfY29udGV4dCAqc211KSAgc3RhdGljIGludCBuYXZpMTBfc2V0X3BlcmZvcm1hbmNlX2xldmVs
KHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIGFtZF9kcG1fZm9yY2VkX2xldmVsIGxldmVs
KSAgewogCWludCByZXQgPSAwOwotCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gc211LT5h
ZGV2OwotCi0JaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX05BVkkxMCkKLQkJcmV0dXJuIC1F
SU5WQUw7CiAKIAlzd2l0Y2ggKGxldmVsKSB7CiAJY2FzZSBBTURfRFBNX0ZPUkNFRF9MRVZFTF9Q
Uk9GSUxFX1BFQUs6CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9u
YXZpMTBfcHB0LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmgK
aW5kZXggNjIwZmYxN2MyZmVmLi5hMzdlMzdjNWYxMDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9uYXZpMTBfcHB0LmgKQEAgLTI3LDYgKzI3LDEyIEBACiAjZGVmaW5lIE5BVkkx
MF9QRUFLX1NDTEtfWFQgIAkJKDE3NTUpCiAjZGVmaW5lIE5BVkkxMF9QRUFLX1NDTEtfWEwgIAkJ
KDE2MjUpCiAKKyNkZWZpbmUgTkFWSTE0X1VNRF9QU1RBVEVfUEVBS19YVF9HRlhDTEsgICAgICAo
MTY3MCkKKyNkZWZpbmUgTkFWSTE0X1VNRF9QU1RBVEVfUEVBS19YVE1fR0ZYQ0xLICAgICAoMTQ0
OCkKKyNkZWZpbmUgTkFWSTE0X1VNRF9QU1RBVEVfUEVBS19YTE1fR0ZYQ0xLICAgICAoMTE4MSkK
KyNkZWZpbmUgTkFWSTE0X1VNRF9QU1RBVEVfUEVBS19YVFhfR0ZYQ0xLICAgICAoMTcxNykKKyNk
ZWZpbmUgTkFWSTE0X1VNRF9QU1RBVEVfUEVBS19YTF9HRlhDTEsgICAgICAoMTQ0OCkKKwogZXh0
ZXJuIHZvaWQgbmF2aTEwX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpOwog
CiAjZW5kaWYKLS0KMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
