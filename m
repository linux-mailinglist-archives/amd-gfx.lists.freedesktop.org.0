Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C62839337D
	for <lists+amd-gfx@lfdr.de>; Thu, 27 May 2021 18:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89086F420;
	Thu, 27 May 2021 16:16:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0046F420
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 May 2021 16:16:49 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 n3-20020a9d74030000b029035e65d0a0b8so703113otk.9
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 May 2021 09:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=661TwtL7Z2Csl6G7T/SxzclEFjcn12VBFQ73fJ0OOVQ=;
 b=thh086vG+dIoBX2SgqKTAhWePuXYhWm6NfdW3lLsIg5gTSZUAwsKIx00vKlJUm9Qt0
 bsNXcm7qqRfvWmUKadBvdYsdcwTMm0i6gQAByrFTDSQ9/iR+qwbFOLqXRL1fn8myvUaB
 AHfuIkTNsKQdnFuevtG4n4ASQjWY91OUHD6bDKLuhy4jwviAjPhmPeGbsSaxT7cNbr/Z
 KOoL6VlpuzWutSripeZKWXqpU+4pzYq/PIFhJr+ZDPQ1Su/5eXN1dpf30hN8+c4US+wf
 ko0AnrU/q5eHTDjB7MqpQGpxGblwTqV3EiMhCnfLnqhzVQwUGBn3z+0H6DvY5P/z7pIB
 YBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=661TwtL7Z2Csl6G7T/SxzclEFjcn12VBFQ73fJ0OOVQ=;
 b=R5ASkqyvDFDr2cDVJQQQNLX6SeXzqne0RGUrjB89kTTIncqbO/PsH8lxYF0W9LMKgm
 0MBYAz98Opb41jHQMjUbYTdm/8iuHf/IQM+8Ehfjm7d7a3h27bAB+OLQ+zchszIpIU4O
 F+N/uBp/XH9KfYAb/FQa+YmnU9h6KYkNu1KZHK8wCpcFHd3/xmyGqucanqc4ZAq+OtN5
 786r4fclU13wjqKZ0Sxjz/e1Cd76lYRgMGbXCMEPwftKEtbKybEuV/BfEZgIPODCjaF8
 9OBHIL8beN4MkcxskADJYe7Rg87pqy+HuqUz65Cl93wt2KpkX6wQ4uzpSYQHIuGFCsO/
 cffw==
X-Gm-Message-State: AOAM532Ag/jSJQe/hA3nfVGGCjRffxceTxbxqevd/jlbp3WOpCgmV4AC
 KiY5XGCUEevA3DSB/fSot5YAU27wm44tTCMwh84Dsf/6zn0=
X-Google-Smtp-Source: ABdhPJxxRg5zCdK6xUXAd3siCXPpAaJzmbQWTt4A3/pevTNOLF6ws9aSt/4yglhavDEbOtIXd2ctsn+ovmEbCoawTKY=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr3431303otl.132.1622132208841; 
 Thu, 27 May 2021 09:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210527160857.63335-1-veerabadhran.gopalakrishnan@amd.com>
In-Reply-To: <20210527160857.63335-1-veerabadhran.gopalakrishnan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 May 2021 12:16:37 -0400
Message-ID: <CADnq5_M5UQ6XifXwT5EStFrGv3d4Gb7RQksLOjYmxgrnDgPwHg@mail.gmail.com>
Subject: Re: [PATCH] tests/amdgpu: Add VCN test support for Biege Goby
To: Veerabadhran Gopalakrishnan <veerabadhran.gopalakrishnan@amd.com>
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Tao Zhou <tao.zhou1@amd.com>, Leo Liu <leo.liu@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Please open a libdrm merge request in gitlab for this.
https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/

Alex

On Thu, May 27, 2021 at 12:09 PM <veerabadhran.gopalakrishnan@amd.com> wrote:
>
> From: Veerabadhran Gopalakrishnan <veerabadhran.gopalakrishnan@amd.com>
>
> Added Beige Goby chip id in vcn test.
>
> Signed-off-by: Veerabadhran Gopalakrishnan <veerabadhran.gopalakrishnan@amd.com>
> ---
>  tests/amdgpu/vcn_tests.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/amdgpu/vcn_tests.c b/tests/amdgpu/vcn_tests.c
> index 628b4910..15d573d3 100644
> --- a/tests/amdgpu/vcn_tests.c
> +++ b/tests/amdgpu/vcn_tests.c
> @@ -142,7 +142,8 @@ CU_BOOL suite_vcn_tests_enable(void)
>         } else if (family_id == AMDGPU_FAMILY_NV) {
>                 if (chip_id == (chip_rev + 0x28) ||
>                     chip_id == (chip_rev + 0x32) ||
> -                   chip_id == (chip_rev + 0x3c)) {
> +                   chip_id == (chip_rev + 0x3c) ||
> +                   chip_id == (chip_rev + 0x46)) {
>                         reg.data0 = 0x10;
>                         reg.data1 = 0x11;
>                         reg.cmd = 0xf;
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
