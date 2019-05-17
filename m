Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3BB219DE
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 16:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B193898EE;
	Fri, 17 May 2019 14:34:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F8A898EE
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 14:34:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id n25so6592897wmk.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 07:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qwpbpuYfYmf2s/TC8C3A3U2h0oMMMKi9lEJuDX4nhUc=;
 b=ia+itJE7VFu3NOMAh/BqZm6+33pDJdzCzEnyMuR0q9QouihaVssD2Gl0pTzEKXKcrC
 8O+bpkAzkWbHLni6eUczdvZ3Y57a3zuZwhqMQ9SCXdknOCwG5HKXaUnsS+TjolgHQHkI
 s6nYNr6aa2e437vWww6u4GKFht2UZ7eMJSdlAWwNMWaQAgb2neqTXORPhK/2nQVUkKP6
 XBK9QyTovXGwCuVqYXqHr6449mnWUums3/FXFHpB44yyruIAPQ/CMjRtNCEPEpGxBjwO
 fHCC37RLx2ObE/2iWr6Y5lCczD1bN7j4i0sr4aHBY4qF8D5zzohCXqrX0Rx50Y+XdiBG
 Gmxg==
X-Gm-Message-State: APjAAAUv1PZPQGrS69GiI2gAViXFP//0oxlTpPAsJ7aCIN2TUeqooeHr
 /1wXHBBYqUFFd51i4vIhd3B1pUMvR2EYvl4HAGs=
X-Google-Smtp-Source: APXvYqzLitjm5hQPH8/oe7xsvYF//vcA1/ZpzCiSOrjDfc9Sg6N4Z6VwfGPyx+GcFsOWOhA3O6LTNDaCmJCpciqcUc4=
X-Received: by 2002:a1c:f50a:: with SMTP id t10mr2494655wmh.86.1558103683223; 
 Fri, 17 May 2019 07:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <1558008150-20674-1-git-send-email-yttao@amd.com>
 <MN2PR12MB3039BD8CF5208A1667D34B29E50B0@MN2PR12MB3039.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3039BD8CF5208A1667D34B29E50B0@MN2PR12MB3039.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 May 2019 10:34:30 -0400
Message-ID: <CADnq5_O00Ts0RA+ntfC8Sqfb3WGCi+xE6SwReOXUfJzJji7nTw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: set correct vram_width for vega10 under sriov
To: "Tao, Yintian" <Yintian.Tao@amd.com>
Content-Type: multipart/mixed; boundary="000000000000906a300589164800"
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=qwpbpuYfYmf2s/TC8C3A3U2h0oMMMKi9lEJuDX4nhUc=;
 b=KQr8LssyzlNZxGq5BditVgL3Mvy7zZRLbYCD6H9AEGnTJrO1UMcygTC9mJJnFeGSUa
 tyeZ722CNwMN9g5PJlArL+p1petDt+/u9rtlhuYSpMqSLVkzpH4Yrr8j9U+1Hozq0Khd
 61kt5fZff00RQtg4IO3T72f4wGyeiOzy6dSbwVB8GynTU58Fbh2PF7R2ogl5Kc4qofJI
 TmKY9cFYo/TiVhBz0EVg9MhZn3fr1SGEcX3qamtG/madoQ8kMo46U59+3HEtthmQ9iJ7
 tMSMtbMa70dpLiC/CeooRxu12Jbp3A96z6m422z644ISeuggvvCRv/WmOoeCNaADQ2RY
 UsuQ==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Huang,
 Trigger" <Trigger.Huang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--000000000000906a300589164800
Content-Type: text/plain; charset="UTF-8"

How about combining these two patches into one?  This seems cleaner.

Alex

On Thu, May 16, 2019 at 10:39 PM Tao, Yintian <Yintian.Tao@amd.com> wrote:
>
> Ping...
>
> Hi Christian and Alex
>
>
> Can you help review this? Thanks in advance.
>
>
> Best Regards
> Yintian Tao
>
> -----Original Message-----
> From: Yintian Tao <yttao@amd.com>
> Sent: Thursday, May 16, 2019 8:03 PM
> To: amd-gfx@lists.freedesktop.org
> Cc: Tao, Yintian <Yintian.Tao@amd.com>; Huang, Trigger <Trigger.Huang@amd.com>
> Subject: [PATCH] drm/amdgpu: set correct vram_width for vega10 under sriov
>
> For Vega10 SR-IOV, vram_width can't be read from ATOM as RAVEN, and DF related registers is not readable, seems hardcord is the only way to set the correct vram_width
>
> Signed-off-by: Trigger Huang <Trigger.Huang@amd.com>
> Signed-off-by: Yintian Tao <yttao@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index c221570..a417763 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -848,6 +848,13 @@ static int gmc_v9_0_mc_init(struct amdgpu_device *adev)
>                 adev->gmc.vram_width = numchan * chansize;
>         }
>
> +       /* For Vega10 SR-IOV, vram_width can't be read from ATOM as RAVEN,
> +        * and DF related registers is not readable, seems hardcord is the
> +        * only way to set the correct vram_width */
> +       if (amdgpu_sriov_vf(adev) && (adev->asic_type == CHIP_VEGA10)) {
> +               adev->gmc.vram_width = 2048;
> +       }
> +
>         /* size in MB on si */
>         adev->gmc.mc_vram_size =
>                 adev->nbio_funcs->get_memsize(adev) * 1024ULL * 1024ULL;
> --
> 2.7.4
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--000000000000906a300589164800
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amdgpu-gmc9-set-vram_width-properly-for-SR-IOV.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amdgpu-gmc9-set-vram_width-properly-for-SR-IOV.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jvs6oh4p0>
X-Attachment-Id: f_jvs6oh4p0

RnJvbSAyOGNmZjU4OWU1NjQwODdkMjJlOWJlMzViYThmOTBlMGEzMDQwOWU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IEZyaSwgMTcgTWF5IDIwMTkgMDk6MzE6NDMgLTA1MDAKU3ViamVjdDogW1BBVENI
XSBkcm0vYW1kZ3B1L2dtYzk6IHNldCB2cmFtX3dpZHRoIHByb3Blcmx5IGZvciBTUi1JT1YKCkZv
ciBTUi1JT1YsIHZyYW1fd2lkdGggY2FuJ3QgYmUgcmVhZCBmcm9tIEFUT00gYXMKUkFWRU4sIGFu
ZCBERiByZWxhdGVkIHJlZ2lzdGVycyBpcyBub3QgcmVhZGFibGUsIHNvIGhhcmRjb3JkCmlzIHRo
ZSBvbmx5IHdheSB0byBzZXQgdGhlIGNvcnJlY3QgdnJhbV93aWR0aC4KClNpZ25lZC1vZmYtYnk6
IFRyaWdnZXIgSHVhbmcgPFRyaWdnZXIuSHVhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogWWlu
dGlhbiBUYW8gPHl0dGFvQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jIHwgMTAgKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCmluZGV4
IDU5YzU4MGJkNWEzYi4uOTc1MGI2MzJlOWFhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192OV8wLmMKQEAgLTgzNSw4ICs4MzUsMTYgQEAgc3RhdGljIGludCBnbWNfdjlfMF9tY19pbml0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWludCBjaGFuc2l6ZSwgbnVtY2hhbjsKIAlp
bnQgcjsKIAotCWlmIChhbWRncHVfZW11X21vZGUgIT0gMSkKKwlpZiAoYW1kZ3B1X3NyaW92X3Zm
KGFkZXYpKSB7CisJCS8qIEZvciBWZWdhMTAgU1ItSU9WLCB2cmFtX3dpZHRoIGNhbid0IGJlIHJl
YWQgZnJvbSBBVE9NIGFzIFJBVkVOLAorCQkgKiBhbmQgREYgcmVsYXRlZCByZWdpc3RlcnMgaXMg
bm90IHJlYWRhYmxlLCBzZWVtcyBoYXJkY29yZCBpcyB0aGUKKwkJICogb25seSB3YXkgdG8gc2V0
IHRoZSBjb3JyZWN0IHZyYW1fd2lkdGgKKwkJICovCisJCWFkZXYtPmdtYy52cmFtX3dpZHRoID0g
MjA0ODsKKwl9IGVsc2UgaWYgKGFtZGdwdV9lbXVfbW9kZSAhPSAxKSB7CiAJCWFkZXYtPmdtYy52
cmFtX3dpZHRoID0gYW1kZ3B1X2F0b21maXJtd2FyZV9nZXRfdnJhbV93aWR0aChhZGV2KTsKKwl9
CisKIAlpZiAoIWFkZXYtPmdtYy52cmFtX3dpZHRoKSB7CiAJCS8qIGhibSBtZW1vcnkgY2hhbm5l
bCBzaXplICovCiAJCWlmIChhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUpCi0tIAoyLjIwLjEKCg==
--000000000000906a300589164800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--000000000000906a300589164800--
