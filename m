Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB0A192B07
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Mar 2020 15:22:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374486E86A;
	Wed, 25 Mar 2020 14:22:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC6E6E86A
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Mar 2020 14:22:56 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c81so2667654wmd.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Mar 2020 07:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iZlLpoMpA5YqGTcn//Kc7U4Xn696ptRf5LDnm+ishMc=;
 b=ZB3b0gtckZ0rgVLuZVD379rZhYMliNwq7jbuCs0YVU27AdL5aUCNYdeBVYFuGehDMO
 4k5XVbhPtkEfdDk/+3janwT4fHS8ea1E338EoH+oVYb77KABMmKDXSHh0391040Qcwrq
 7syCE7yJZ8QviTFPYzmynQ34XoF4EkpG1lT45+9HPX37mTJhg3tZGH32QH36zWkt+l9a
 dAvfV4mstyEVKukYk2H525znB/PZZhI4JkFvuVQOJLiCWo4wZ2AsjuZGoN+nimVm256w
 Ki65nev6mp7YY25Zb2JsyU/WhmIexHO4OnUIjNVs2vlVbJsfvckx5tUDX7Xj3jyLtw8l
 uTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iZlLpoMpA5YqGTcn//Kc7U4Xn696ptRf5LDnm+ishMc=;
 b=gD39qOwlSYgoReB8YRaZvd7F5mDAFYO154KXAgSEi/wEeyZS3vMXT3L0g4rpAAqK36
 vyHdA9iz1sAXzT7qzL4aR2CFGLX0gpj4D4SQEaz1KPEeWm7kVPfEzjkiqQXm0/yBJEwu
 ewhJFRRMapOM7m5BsFeB7+oY2HlaD8PMRWD9nkblOdB/Gss8R0tEALdqRDPUnMaVsG0W
 ptA9zs0hHKPDFXi+9Sq8cF4C6yX6xgJgF2c7SfF6dabl9XLihcjvXPiGqCSUCZZPxgcD
 q9VaBK/lIm5E8U3Q8pBPMgELF7opT+AoCv0OZGfWbj/ah3czrxLEIlqa7Eujoby+31ug
 1ckw==
X-Gm-Message-State: ANhLgQ3jZR+rGbUF+spk7GHgrgO7tPSTRbYvSLwCfxodiWFDe7Bbo5lN
 0OcqKqYn6jk6C98IfMCZ+20eHP60pKJJ6v4EuDFPsA==
X-Google-Smtp-Source: ADFU+vsdVdgeevm5HhvX57hwHtI5aatoDk6CqTqZTV5nSzqh09JbnL0iu/TGBwBwrsFCAgvin9WmWuxtUqjxNB4sHIc=
X-Received: by 2002:a1c:cc11:: with SMTP id h17mr3701797wmb.39.1585146175527; 
 Wed, 25 Mar 2020 07:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <1585124676-14143-1-git-send-email-Emily.Deng@amd.com>
In-Reply-To: <1585124676-14143-1-git-send-email-Emily.Deng@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 25 Mar 2020 10:22:44 -0400
Message-ID: <CADnq5_OMPSue71RZAB1wnbYGUNdHdPByAR_tJTGoQNKmnL1MgQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] SWDEV-227605 - Virtual display need to support
 multiple ctrcs
To: Emily Deng <Emily.Deng@amd.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Please fix the subject to be "drm/amdgpu: " rather than SWDEV-....

Alex

On Wed, Mar 25, 2020 at 4:24 AM Emily Deng <Emily.Deng@amd.com> wrote:
>
> The crtc num is determined by virtual_display parameter.
>
> Signed-off-by: Emily Deng <Emily.Deng@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> index 43a1ee3..d791bfe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> @@ -38,7 +38,8 @@ bool amdgpu_virt_mmio_blocked(struct amdgpu_device *adev)
>  void amdgpu_virt_init_setting(struct amdgpu_device *adev)
>  {
>         /* enable virtual display */
> -       adev->mode_info.num_crtc = 1;
> +       if (adev->mode_info.num_crtc == 0)
> +               adev->mode_info.num_crtc = 1;
>         adev->enable_virtual_display = true;
>         adev->ddev->driver->driver_features &= ~DRIVER_ATOMIC;
>         adev->cg_flags = 0;
> --
> 2.7.4
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
