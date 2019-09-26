Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 816D9BEE7A
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 11:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062576E06D;
	Thu, 26 Sep 2019 09:31:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417E76E06D
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 09:31:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdDh9mEDRhuxHmk9KHEnflx3gpC3hukU+W29LDoq8KQ/1HK3FuzujmYbGeABoQGYpW3vBiVUdE/NYAbOj1m8+vIiaiaTRavFFTh3jUPFnqFrACvPzY1qbGTN0/fFhsc3ovkwaP/wir0aUHe4V6HwJAac+M2beglH0dQTDTboSn3nylGV1KWluiEie2F26SHG6D2xtCYzb09FzcqCZ6sDEunFIl5ujeMt5W4dQ/4muk6oM2W9Ge9eBz3iewIjo72mMYAiYO3c56378pfFkUnz0qjSzvNHl+MRK0NtbopCrstFJiX3yv+BHHEGtwGjF/3SxUmykjlbUWZJG41Kfc769Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3sUq4yzHV4fyIbKk22ruXWZPo+PoWyQyprBVGD8uis=;
 b=fcJJlR7e7Ew4nq9/NHpf1OeekVVSBLNTiszlzC5LD2sfKjYq8CB4EJ+A+uVP4MFzo0qyGLh7fljwB11OsqilGgD2AOHX2gOHx3XFJQp37SwNZ0inFV9fE0St1gNPwbFvvz0vsldwwfH4vELwSST4QrL4FBlhJd7rmmHGjLAneX+AFovowSIRR2w9RXvJ8zxiRyB4i8FcClCkPaLfCmZZfls+iQqV2memP+KUd+NeqInGj7tWbpM0zFsl5QhlOO37egGv0+c9u+7KHotpuHzUgh9DjCj4qUbymFhjAlmMexhny9uuT6zcKC5vNMXUzGj5wTkp4hDYHe0ahotsqSFc8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB4014.namprd12.prod.outlook.com (10.255.239.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Thu, 26 Sep 2019 09:31:13 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::19b5:2b97:5b3c:8b2a]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::19b5:2b97:5b3c:8b2a%7]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 09:31:13 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amd/powerplay: add sensor lock support for smu
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: add sensor lock support for smu
Thread-Index: AQHVdEhHzfRVuo/jqUeNtM9A+AJVl6c9sFDA
Date: Thu, 26 Sep 2019 09:31:13 +0000
Message-ID: <MN2PR12MB35981FFFBC659EB46A0591928E860@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20190926085607.2510-1-kevin1.wang@amd.com>
 <20190926085607.2510-2-kevin1.wang@amd.com>
In-Reply-To: <20190926085607.2510-2-kevin1.wang@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be31f146-fe99-4c47-392c-08d7426445f5
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB4014:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4014D9371F816A3D00A5DC858E860@MN2PR12MB4014.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(199004)(189003)(13464003)(2501003)(6436002)(33656002)(476003)(7736002)(55016002)(9686003)(6246003)(11346002)(446003)(478600001)(6506007)(53546011)(8676002)(81166006)(81156014)(52536014)(102836004)(8936002)(76176011)(7696005)(99286004)(186003)(25786009)(5660300002)(229853002)(26005)(86362001)(71200400001)(71190400001)(256004)(4326008)(316002)(66066001)(14444005)(64756008)(66556008)(66446008)(486006)(66476007)(76116006)(110136005)(66946007)(2906002)(3846002)(74316002)(6116002)(305945005)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4014;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sc9a4j7C43n3hSqoaDF6iuRyAShqha13zp/5r30wDciAzGLTB1AG/uJitruP3AqNPEobRD9LLCMMl+9cwKsjX8xxwoxQk0YPdyHuVjkJFC/Y9lqz40NJWCXSrB8ATig823bebyn2rRILZGLrtPwl6OmgfgWqAkV1IsmyaXP7C3x1pyU/0QNzqbk32ds6ETMvj3xBEiDXWKBLTZIOEWN/5x+zAG/4mQ4i+UwnFk1QsaRPF/bzYcoCZAcSyRsYxih45LqgjQ8S/Vn2suP1kXIptEl/45Qw9Zr74Pw3evWjqPYPFSjMUYtmYTQEI9yNYcAWwyCY6JqtgTBwN/yo44LvmN+VASRuvHsHWdlPOMHTS/Yt3EY0vgYj6RK8Rjn2DUUrPKWFzSbozAkeD1VBz9q/jAuYpQkzoFVDldzl6+j3SO8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be31f146-fe99-4c47-392c-08d7426445f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 09:31:13.2986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iwwunj6BSRDFBxo2R/SnfReuC1haPMzof2jmm/cSNj5yS0k5MuPY8DmZyq6/9tMk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4014
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3sUq4yzHV4fyIbKk22ruXWZPo+PoWyQyprBVGD8uis=;
 b=fQpPNVyhSUZnJWgAvH1NsxX5C/H+qfYbmdOihsCiE42CyMiT93AGL+o8py8sH8jeSOBpoa1D8/NiVet2/esmtpmOsBweTxD6OPYN3xGGjYhmyUOUdVUqaY7FhGns7w3irjrxgv2eW6Os9hwj0XXdsnQ+MD4ybWf2S+1esAeXs3w=
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGVyZSdzIHRoZSBjYXNlOiB0aGUgdXNlciBtb2RlIGRyaXZlciBhbmQgdGhlIHRlc3RlciBhY2Nl
c3MgdGhlIHN5c2ZzIHNpbXVsdGFuZW91c2x5LgpUaGF0IGNhdXNlcyB0aGUgbWVzc2FnZS9wYXJh
bWV0ZXIgbWlzbWF0Y2guClJldmlld2VkLWJ5OiBLZW5uZXRoIEZlbmcgPGtlbm5ldGguZmVuZ0Bh
bWQuY29tPgoKCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCkZyb206IFdhbmcsIEtldmluKFlh
bmcpIApTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDI2LCAyMDE5IDQ6NTYgUE0KVG86IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNv
bT47IEZlbmcsIEtlbm5ldGggPEtlbm5ldGguRmVuZ0BhbWQuY29tPjsgV2FuZywgS2V2aW4oWWFu
ZykgPEtldmluMS5XYW5nQGFtZC5jb20+ClN1YmplY3Q6IFtQQVRDSCAyLzJdIGRybS9hbWQvcG93
ZXJwbGF5OiBhZGQgc2Vuc29yIGxvY2sgc3VwcG9ydCBmb3Igc211Cgp3aGVuIG11bHRpdGhyZWFk
aW5nIGFjY2VzcyBzeXNmcyBvZiBhbWRncHVfcG1faW5mbyBhdCB0aGUgc2FtZXRpbWUuCnRoZSBz
d3NtdSBkcml2ZXIgY2F1c2Ugc211IGZpcm13YXJlIGhhbmcuCgplZzoKc2luZ2xlIHRocmVhZCBh
Y2Nlc3M6Ck1lc3NhZ2UgQSArIFBhcmFtIEEgPT0+IHJpZ2h0Ck1lc3NhZ2UgQiArIFBhcmFtIEIg
PT0+IHJpZ2h0Ck1lc3NhZ2UgQyArIFBhcmFtIEMgPT0+IHJpZ2h0Cm11bHRpdGhyZWFkaW5nIGFj
Y2VzczoKTWVzc2FnZSBBICsgUGFyYW0gQiA9PT4gZXJyb3IKTWVzc2FnZSBCICsgUGFyYW0gQSA9
PT4gZXJyb3IKTWVzc2FnZSBDICsgUGFyYW0gQyA9PT4gcmlnaHQKCnRoZSBwYXRjaCB3aWxsIGFk
ZCBzZW5zb3IgbG9jayhtdXRleCkgdG8gYXZvaWQgdGhpcyBlcnJvci4KClNpZ25lZC1vZmYtYnk6
IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jICAgICB8IDIgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jICAgfCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9uYXZpMTBfcHB0LmMgICAgIHwgMiArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvdmVnYTIwX3BwdC5jICAgICB8IDIgKysKIDUgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3Nt
dS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IDIz
MjkzZTE1NjM2Yi4uZGY1MTBjYjg2ZGE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvYW1kZ3B1X3NtdS5jCkBAIC04NDAsNiArODQwLDggQEAgc3RhdGljIGludCBzbXVfc3dfaW5p
dCh2b2lkICpoYW5kbGUpCiAJc211LT5zbXVfYmFjby5zdGF0ZSA9IFNNVV9CQUNPX1NUQVRFX0VY
SVQ7CiAJc211LT5zbXVfYmFjby5wbGF0Zm9ybV9zdXBwb3J0ID0gZmFsc2U7CiAKKwltdXRleF9p
bml0KCZzbXUtPnNlbnNvcl9sb2NrKTsKKwogCXNtdS0+d2F0ZXJtYXJrc19iaXRtYXAgPSAwOwog
CXNtdS0+cG93ZXJfcHJvZmlsZV9tb2RlID0gUFBfU01DX1BPV0VSX1BST0ZJTEVfQk9PVFVQX0RF
RkFVTFQ7CiAJc211LT5kZWZhdWx0X3Bvd2VyX3Byb2ZpbGVfbW9kZSA9IFBQX1NNQ19QT1dFUl9Q
Uk9GSUxFX0JPT1RVUF9ERUZBVUxUOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvYXJjdHVydXNfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9h
cmN0dXJ1c19wcHQuYwppbmRleCBhMDQ3YTdlYzM2OTguLmI5YjdiNzMzNTRhMCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMKQEAgLTEwMjUsNiArMTAy
NSw3IEBAIHN0YXRpYyBpbnQgYXJjdHVydXNfcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUsCiAJaWYgKCFkYXRhIHx8ICFzaXplKQogCQlyZXR1cm4gLUVJTlZBTDsKIAorCW11dGV4
X2xvY2soJnNtdS0+c2Vuc29yX2xvY2spOwogCXN3aXRjaCAoc2Vuc29yKSB7CiAJY2FzZSBBTURH
UFVfUFBfU0VOU09SX01BWF9GQU5fUlBNOgogCQkqKHVpbnQzMl90ICopZGF0YSA9IHBwdGFibGUt
PkZhbk1heGltdW1ScG07IEBAIC0xMDUxLDYgKzEwNTIsNyBAQCBzdGF0aWMgaW50IGFyY3R1cnVz
X3JlYWRfc2Vuc29yKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCWRlZmF1bHQ6CiAJCXJldCA9
IHNtdV9zbWNfcmVhZF9zZW5zb3Ioc211LCBzZW5zb3IsIGRhdGEsIHNpemUpOwogCX0KKwltdXRl
eF91bmxvY2soJnNtdS0+c2Vuc29yX2xvY2spOwogCiAJcmV0dXJuIHJldDsKIH0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCmluZGV4IDVjODk4NDQ0
ZmY5Ny4uYmM0YjczZTA3MThlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9pbmMvYW1kZ3B1X3NtdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2luYy9hbWRncHVfc211LmgKQEAgLTM1MCw2ICszNTAsNyBAQCBzdHJ1Y3Qgc211X2NvbnRleHQK
IAljb25zdCBzdHJ1Y3Qgc211X2Z1bmNzCQkqZnVuY3M7CiAJY29uc3Qgc3RydWN0IHBwdGFibGVf
ZnVuY3MJKnBwdF9mdW5jczsKIAlzdHJ1Y3QgbXV0ZXgJCQltdXRleDsKKwlzdHJ1Y3QgbXV0ZXgJ
CQlzZW5zb3JfbG9jazsKIAl1aW50NjRfdCBwb29sX3NpemU7CiAKIAlzdHJ1Y3Qgc211X3RhYmxl
X2NvbnRleHQJc211X3RhYmxlOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEw
X3BwdC5jCmluZGV4IGRiMmUxODFiYTQ1YS4uYzBiNjQwZDhkOWUxIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCkBAIC0xMzg3LDYgKzEzODcsNyBAQCBzdGF0
aWMgaW50IG5hdmkxMF9yZWFkX3NlbnNvcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAlpZigh
ZGF0YSB8fCAhc2l6ZSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKKwltdXRleF9sb2NrKCZzbXUtPnNl
bnNvcl9sb2NrKTsKIAlzd2l0Y2ggKHNlbnNvcikgewogCWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9N
QVhfRkFOX1JQTToKIAkJKih1aW50MzJfdCAqKWRhdGEgPSBwcHRhYmxlLT5GYW5NYXhpbXVtUnBt
OyBAQCAtMTQxMCw2ICsxNDExLDcgQEAgc3RhdGljIGludCBuYXZpMTBfcmVhZF9zZW5zb3Ioc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJZGVmYXVsdDoKIAkJcmV0ID0gc211X3NtY19yZWFkX3Nl
bnNvcihzbXUsIHNlbnNvciwgZGF0YSwgc2l6ZSk7CiAJfQorCW11dGV4X3VubG9jaygmc211LT5z
ZW5zb3JfbG9jayk7CiAKIAlyZXR1cm4gcmV0OwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvdmVnYTIwX3BwdC5jCmluZGV4IDkwODJkYTE1NzhkMS4uZjY1NWViZDliYTIyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCkBAIC0zMDE3LDYgKzMw
MTcsNyBAQCBzdGF0aWMgaW50IHZlZ2EyMF9yZWFkX3NlbnNvcihzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSwKIAlpZighZGF0YSB8fCAhc2l6ZSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKKwltdXRleF9s
b2NrKCZzbXUtPnNlbnNvcl9sb2NrKTsKIAlzd2l0Y2ggKHNlbnNvcikgewogCWNhc2UgQU1ER1BV
X1BQX1NFTlNPUl9NQVhfRkFOX1JQTToKIAkJKih1aW50MzJfdCAqKWRhdGEgPSBwcHRhYmxlLT5G
YW5NYXhpbXVtUnBtOyBAQCAtMzA0Miw2ICszMDQzLDcgQEAgc3RhdGljIGludCB2ZWdhMjBfcmVh
ZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJZGVmYXVsdDoKIAkJcmV0ID0gc211
X3NtY19yZWFkX3NlbnNvcihzbXUsIHNlbnNvciwgZGF0YSwgc2l6ZSk7CiAJfQorCW11dGV4X3Vu
bG9jaygmc211LT5zZW5zb3JfbG9jayk7CiAKIAlyZXR1cm4gcmV0OwogfQotLQoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
