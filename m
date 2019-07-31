Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9E07BE44
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 12:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EA189C05;
	Wed, 31 Jul 2019 10:22:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800041.outbound.protection.outlook.com [40.107.80.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437C889C05
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 10:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aU2838yc23Jnn6gKmO7EwI1VDVYrqd9EWxUH/81UrUJQHkvK+ypa/KwE4PWocJ+nPzsu3vvzaHfmHukd9fK/++RnzbWTj1Wg9jba4H4Cb+GpzQjsNVtPyhzRtCiompriV5dSwIV1LJodk5vFqVsOjuNomclD9N4he8JdW5fLYjVNDcw61TyNgrzNL1tEn3Hod0Lw8BRUm3YX89UkjB0/4kV3NjV1LKJgGzS1PpmdD1H86e0MgXkJS2T6890oMUMErrEroGnojqGF2+Kq0DZEVCv7WjbugUDm0AgUrjmnylnPW2F47ZYseabqgrCirSxadm6CahcyXz6DOhWW8mm+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LEWs+f/1bnnu9EuE8LDwsugiOKNEcbVKTa6P5QfWXg=;
 b=efcWDwfB468mqrh25pqNCot2De5HMftccZbRPD+zI8aE+RshjYF4SoUgyHXtFRIZbu4W+JtTUqY4JAMa0xG4iztc7C6YMpRnFJ9P7xrEDoTncSjnnfbtO5BaeLfRF9G0urYeoRR26cRz+Kt0M1DRFRc0RNjm4Kv0nVcjg+ecDyEmncjIUJOy5Oc96CrgnomQKGIVsnd36BTIQkwIoU4tgxE+KjgsJpyHKdXsaPMhNyKwf+jvqts78AFCR+mXdXEOKflMAuQRrcZORc2MOgVV3XggD70bYhTgMvdFyYZdT56yvArI5+Vp6HfEr4tcKAAE0qlWyNQJl0qcgkjaGGcMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3866.namprd12.prod.outlook.com (10.255.173.211) by
 DM6PR12MB3594.namprd12.prod.outlook.com (20.178.199.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Wed, 31 Jul 2019 10:21:57 +0000
Received: from DM6PR12MB3866.namprd12.prod.outlook.com
 ([fe80::b15f:a397:7816:93b3]) by DM6PR12MB3866.namprd12.prod.outlook.com
 ([fe80::b15f:a397:7816:93b3%5]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 10:21:57 +0000
From: "Gao, Likun" <Likun.Gao@amd.com>
To: Paul Gover <pmw.gover@yahoo.co.uk>
Subject: RE: AMDPU breaks suspend after kernel 5.0
Thread-Topic: AMDPU breaks suspend after kernel 5.0
Thread-Index: AQHVRtt4rNKBF448jUaBoGilmDsjw6bkaT7w
Date: Wed, 31 Jul 2019 10:21:57 +0000
Message-ID: <DM6PR12MB38662B2D1D1484202A22C85CEFDF0@DM6PR12MB3866.namprd12.prod.outlook.com>
References: <1857879.T0pfAYGBzp@acer>
In-Reply-To: <1857879.T0pfAYGBzp@acer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1130dc9-9f33-4527-12c2-08d715a0eaf6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(49563074)(7193020);
 SRVR:DM6PR12MB3594; 
x-ms-traffictypediagnostic: DM6PR12MB3594:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB3594B2BFD16C2D099B3D573EEFDF0@DM6PR12MB3594.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(13464003)(189003)(199004)(66476007)(5024004)(66556008)(66946007)(66446008)(6306002)(66616009)(71190400001)(14454004)(66574012)(71200400001)(52536014)(4326008)(6116002)(8936002)(966005)(478600001)(64756008)(81166006)(6246003)(7736002)(476003)(76116006)(66066001)(486006)(86362001)(3846002)(53546011)(8676002)(186003)(53936002)(9686003)(99936001)(7696005)(102836004)(68736007)(2906002)(6436002)(55016002)(74316002)(99286004)(25786009)(15650500001)(81156014)(26005)(11346002)(33656002)(5660300002)(316002)(305945005)(6506007)(229853002)(256004)(14444005)(76176011)(446003)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3594;
 H:DM6PR12MB3866.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: E0dQnigqW14Wvvdj2z7M6Smwg47rxSEYsjtM+RH7aubyTtUzn4JSo/dOfC/3n3JS+R2TghIstdeNIwW97n/ECPBwqxXiv3sSpbHOSJ503OUonjkBra7/jCmmstY933k7OVOx0AnT5VzXtmR3MyFYsiJnoX8rZJitNRpUqW2THL+RRX4TeEu+RaB2lhFAEBZYnNCgaPdfzPy55mzFAkwfbulFptxBi3AjyrJQ+TmBpBvBH8D3z3PD7dEHLX/nRV/p2Is1o5MJV6tUMrP0qzF1mvtuYd8ZEZWt9OwR5CdcmPYUQnfvUMXAlr244B0X1acFMgp9EaZbqxm+cPXUtyKUTTjJOl8E0iQPiVdKbklrBTzaa1OtY0IM6oB+MPc5xNi24898hT7RUrEAJM2q95Jqy9Syn/ro5d4LPDKfY+JEn90=
Content-Type: multipart/mixed;
 boundary="_002_DM6PR12MB38662B2D1D1484202A22C85CEFDF0DM6PR12MB3866namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1130dc9-9f33-4527-12c2-08d715a0eaf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 10:21:57.6280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: likgao@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3594
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LEWs+f/1bnnu9EuE8LDwsugiOKNEcbVKTa6P5QfWXg=;
 b=IMlLg7hiJ26VZnFr4zJJvx1RrIQDWtfnzMInPX5TwJD7mPfN5PLIXbnfPy5ijMhOla8Cv1qvmNeClZnIYEDmO2NfF2zXmVrh7ief48o/tvqD5iMlIzSpCYhOSRhL3Yk4OT5sYVlnnyTRycDckdl9O50zTmj8pC3IS9z+Dj3mWjc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Likun.Gao@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_002_DM6PR12MB38662B2D1D1484202A22C85CEFDF0DM6PR12MB3866namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Gover,

Sorry for responds late, can you help to give a try to add the patch attach=
ed and share me the related result and logs?=20
Besides, do you have tried to revert this commit to see whether it's good?
Thanks.

Regards,
Likun

-----Original Message-----
From: Paul Gover <pmw.gover@yahoo.co.uk>=20
Sent: Tuesday, July 30, 2019 9:34 PM
To: Gao, Likun <Likun.Gao@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Subject: AMDPU breaks suspend after kernel 5.0

Hi Likun,

Sorry if you don't want emails like this.  I added info. to
https://bugs.freedesktop.org/show_bug.cgi?id=3D110258
but people on Gentoo forums said email would be better.

Git bisect lead me to you:
---------------
106c7d6148e5aadd394e6701f7e498df49b869d1 is the first bad commit commit 106=
c7d6148e5aadd394e6701f7e498df49b869d1
Author: Likun Gao <Likun.Gao@amd.com>
Date:   Thu Nov 8 20:19:54 2018 +0800

    drm/amdgpu: abstract the function of enter/exit safe mode for RLC
   =20
    Abstract the function of amdgpu_gfx_rlc_enter/exit_safe_mode and some p=
art of rlc_init to improve the reusability of RLC.
   =20
    Signed-off-by: Likun Gao <Likun.Gao@amd.com>
    Acked-by: Christian K=F6nig <christian.koenig@amd.com>
    Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

:040000 040000 8f3b365496f3bbd380a62032f20642ace51c8fef=20
e14ec968011019e3f601df3f15682bb9ae0bafc6 M      drivers
---------------------
Symptoms are when resuming after pm-suspend, the screen is blank or corrupt=
, the keyboard dead, and syslog shows
--------------------
kernel: [   81.096666] [drm:amdgpu_job_timedout] *ERROR* ring gfx timeout,=
=20
signaled seq=3D51, emitted seq=3D52
kernel: [   81.096671] [drm] IP block:gfx_v8_0 is hung!
kernel: [   81.096734] [drm] GPU recovery disabled.
---------------------
or similar.  The problem occurs with all kernels since 5.0 up to and includ=
ing 5.3-rc2.  My laptop is:

HP 15-bw0xx
cpu:AMD A9-9420 RADEON R5, 5 COMPUTE CORES 2C+3G with integrated graphics:
Stoney [Radeon R2/R3/R4/R5 Graphics] [1002:98E4]

There are several similar reports on the web, most or all for Stoney hardwa=
re, but that might be a coincidence as laptop users are more concerned abou=
t suspend, and there are a lot of laptops with similar integrated graphics =
motherboards.

I'm running Gentoo with a custom kernel, the most relevant bits of the conf=
ig CONFIG_DRM_AMDGPU=3Dy # CONFIG_DRM_AMDGPU_SI is not set # CONFIG_DRM_AMD=
GPU_CIK is not set # CONFIG_DRM_AMDGPU_USERPTR is not set

If you tell me how, I'm willing to try to collect traces etc.

Paul Gover



--_002_DM6PR12MB38662B2D1D1484202A22C85CEFDF0DM6PR12MB3866namp_
Content-Type: application/octet-stream;
	name="0001-drm-amdgpu-debug-for-gfx-v8-Stoney-pm-suspend.patch"
Content-Description: 0001-drm-amdgpu-debug-for-gfx-v8-Stoney-pm-suspend.patch
Content-Disposition: attachment;
	filename="0001-drm-amdgpu-debug-for-gfx-v8-Stoney-pm-suspend.patch";
	size=1492; creation-date="Wed, 31 Jul 2019 08:55:54 GMT";
	modification-date="Wed, 31 Jul 2019 08:55:54 GMT"
Content-Transfer-Encoding: base64

RnJvbSBmNmFkNjMzNzY3YjQxNzhmZWYyMDQwNzExNDE3ZTcxZTkzZjQxMmI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMaWt1biBHYW8gPExpa3VuLkdhb0BhbWQuY29tPgpEYXRlOiBX
ZWQsIDMxIEp1bCAyMDE5IDEzOjUyOjA3ICswODAwClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdw
dTogZGVidWcgZm9yIGdmeCB2OCBTdG9uZXkgcG0tc3VzcGVuZAoKU2lnbmVkLW9mZi1ieTogTGlr
dW4gR2FvIDxMaWt1bi5HYW9AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmxjLmMgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9ybGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9ybGMuYwpp
bmRleCBjODc5M2U2Li41OTgxZmY1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcmxjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3JsYy5jCkBAIC0zNiw2ICszNiw4IEBACiAgKi8KIHZvaWQgYW1kZ3B1X2dmeF9ybGNfZW50ZXJf
c2FmZV9tb2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogeworCXByaW50aygiZ2Z4djgg
c2FmZSBtb2RlIHN0YXRlIGlzICVkIHRvIGVudGVyXG4iLAorCSAgICAgICBhZGV2LT5nZngucmxj
LmluX3NhZmVfbW9kZSk7CiAJaWYgKGFkZXYtPmdmeC5ybGMuaW5fc2FmZV9tb2RlKQogCQlyZXR1
cm47CiAKQEAgLTYwLDYgKzYyLDggQEAgdm9pZCBhbWRncHVfZ2Z4X3JsY19lbnRlcl9zYWZlX21v
ZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAgKi8KIHZvaWQgYW1kZ3B1X2dmeF9ybGNf
ZXhpdF9zYWZlX21vZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CisJcHJpbnRrKCJn
Znh2OCBzYWZlIG1vZGUgc3RhdGUgaXMgJWQgdG8gZXhpdFxuIiwKKwkgICAgICAgYWRldi0+Z2Z4
LnJsYy5pbl9zYWZlX21vZGUpOwogCWlmICghKGFkZXYtPmdmeC5ybGMuaW5fc2FmZV9tb2RlKSkK
IAkJcmV0dXJuOwogCkBAIC0xNDUsNyArMTQ5LDcgQEAgaW50IGFtZGdwdV9nZnhfcmxjX2luaXRf
Y3NiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWRzdF9wdHIgPSBhZGV2LT5nZngucmxj
LmNzX3B0cjsKIAlhZGV2LT5nZngucmxjLmZ1bmNzLT5nZXRfY3NiX2J1ZmZlcihhZGV2LCBkc3Rf
cHRyKTsKIAlhbWRncHVfYm9fa3VubWFwKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqKTsK
LQlhbWRncHVfYm9fdW5waW4oYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmopOworCS8vYW1k
Z3B1X2JvX3VucGluKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqKTsKIAlhbWRncHVfYm9f
dW5yZXNlcnZlKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqKTsKIAogCXJldHVybiAwOwot
LSAKMi43LjQKCg==

--_002_DM6PR12MB38662B2D1D1484202A22C85CEFDF0DM6PR12MB3866namp_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--_002_DM6PR12MB38662B2D1D1484202A22C85CEFDF0DM6PR12MB3866namp_--
