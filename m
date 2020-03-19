Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BE518B83D
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Mar 2020 14:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F166E2C0;
	Thu, 19 Mar 2020 13:42:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA376E2C0
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Mar 2020 13:42:25 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id v11so3024751wrm.9
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Mar 2020 06:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K401O2dZT+UpPpUG8W+LRSAk9mlnYFpXdP9sNjxryC0=;
 b=hiLCzJTrlbyaTrfoRaDcp014nuH2yr6o2E9ZeZsLbEgGc2cWL+rzN24IxtuyKgf1X4
 UthIALPayt/+cOOsKBnxl8zL6yOWwgjY8gMA//kb+LZPFpxFR6L9RO0oDfxbjA+Lr6YB
 GUh4IORxsfUBj56lUCR3fRpzgt6J0/5TYEsiYnR2J3l4LnmhZ5dZ2yDkdqG7deR0wI4r
 M9bo32PjyWce7xBnnsWIzO/MW+mwIXHNVbIjtOpxySh46W/EM3E50y9ftxbPXjbQEdEb
 AYSsFiemgfJc9fTpNKEPzSC68EUBEIKO1Go6bUASNXaIFhV+vaA3i3sPEknVwuQMQiAy
 qKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K401O2dZT+UpPpUG8W+LRSAk9mlnYFpXdP9sNjxryC0=;
 b=pOL1lhu0tbOq6JFdDQ/MSO4zziKft+0wohuLesuaw182DshwbG7ztzb9C5+Zp9TxoY
 DjH74KCNY30/AZ1XAbLxkavxXVnYYolHsSfvMdFa0QMFXw2aP22m/RFejNt2OOsBeozj
 8lsU6HDnFlPUd4P347ATFmj85DA5L6oGxnWEkckXZ4FyKdbznleOjg8oB33dmuvW2yqW
 F9T2dmL27fovghmeKK1++djtGFl4dWj/KAqhwY07vFODK41qWVUT2yTseIwExP5TerBQ
 3dIwVjqaAJqXUa/iSxBNpl0REaO8aDhJHdr9kH0tMLL1WQX7YQxtOmp8PLNRowclLA4Q
 o75Q==
X-Gm-Message-State: ANhLgQ0Cu/wLekbERvfOyIm+dRAWrmJp2mtbAtpWSjX3UlFcGsYqUqzW
 8RHsCo5ycD8wg4LVm04+JCix33RnArDFV11EG5c=
X-Google-Smtp-Source: ADFU+vtQ11bS9THs+F93BVLtfCGmWbl2w9Sh9nIS/ii/QL026O9qUjTygFwGeVtf2bOLXUs7cYveUr3Dgqr4WwTRu3E=
X-Received: by 2002:adf:e447:: with SMTP id t7mr4480078wrm.374.1584625344132; 
 Thu, 19 Mar 2020 06:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200318233801.11866-1-alex.sierra@amd.com>
 <20200318233801.11866-2-alex.sierra@amd.com>
In-Reply-To: <20200318233801.11866-2-alex.sierra@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 19 Mar 2020 09:42:12 -0400
Message-ID: <CADnq5_Md=yU2GWdR_9_U2_5LvURU_5br_s6JbX4u8uJEXKZHMA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: ih doorbell size of range changed for
 nbio v7.4
To: Alex Sierra <alex.sierra@amd.com>
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

On Wed, Mar 18, 2020 at 7:38 PM Alex Sierra <alex.sierra@amd.com> wrote:
>
> [Why]
> nbio v7.4 size of ih doorbell range is 64 bit. This requires 2 DWords per register.
>
> [How]
> Change ih doorbell size from 2 to 4. This means two Dwords per ring.
> Current configuration uses two ih rings.
>
> Change-Id: Iae28c22dd6e650f56286bfa0d9e002a8562fa855
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>

Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
> index 149d386590df..263dbb1f92ee 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
> @@ -185,7 +185,7 @@ static void nbio_v7_4_ih_doorbell_range(struct amdgpu_device *adev,
>
>         if (use_doorbell) {
>                 ih_doorbell_range = REG_SET_FIELD(ih_doorbell_range, BIF_IH_DOORBELL_RANGE, OFFSET, doorbell_index);
> -               ih_doorbell_range = REG_SET_FIELD(ih_doorbell_range, BIF_IH_DOORBELL_RANGE, SIZE, 2);
> +               ih_doorbell_range = REG_SET_FIELD(ih_doorbell_range, BIF_IH_DOORBELL_RANGE, SIZE, 4);
>         } else
>                 ih_doorbell_range = REG_SET_FIELD(ih_doorbell_range, BIF_IH_DOORBELL_RANGE, SIZE, 0);
>
> --
> 2.17.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
