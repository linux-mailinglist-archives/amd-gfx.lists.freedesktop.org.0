Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D55012B2309
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Nov 2020 18:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45F66E5D5;
	Fri, 13 Nov 2020 17:53:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CF96E5D5
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Nov 2020 17:53:05 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p8so10873616wrx.5
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Nov 2020 09:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xPj68Lu2HSJQPgcTn9LAz6Fl99dOe3/N5WRIgGWZGRg=;
 b=OJnGC5TzyajpCTjRXTGq5yizYSyTUdfK1LPtd/r2w1QL8WYqh+5L2n/waJXrgDLxww
 lrWc4lkBAv4tC16/nP4ouhNLGyOxeK6j2Fl5TnlZM7mSraEJEyyTJT/7CxVKZtsAr9R1
 Pu7T6TF4lVp/4OZmPzgonc4PcFhBLLmLlO9/WEr9UED5iTK4iyVmGdUsOYeVrYHFV4G9
 iGZkccvsZn3YFaQtYbcMkVPutUuSp+ikTg8tuJe3k2kuM9NDAMrGUtgabNjhSf8vkphw
 ZQHSgcNJyNs+CDUG2Lm9LH8GiDRbQECXqev+KempfhtjljnpVVxRyV7Pyp0FCbWZESiD
 hAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xPj68Lu2HSJQPgcTn9LAz6Fl99dOe3/N5WRIgGWZGRg=;
 b=Th7u+1z8mG08kWjMaukyb79km9j+uc94ZsGbsQU+vc7ENmDmDt4UR0U7vDwEKGM2qZ
 +j7UsC7TtE1O6WIvH+UgmYWPA9/XcFFhKdScn8/LJ9DxW6fv6ukAxA+UuaiQdSI7oZ7P
 L5PyQ7wYrxwzMKVcY9fYsEtbnPDhLkWKoddaEi6iQAOwxbfKxoHz/L1VFbzUIfTQYDUJ
 qogZ120YMnopVFT5LegUzWQ7NpAI6ulYjPgxmEfPNYxoHI/kh0C7HGLGxwEsDEvvN8aj
 LiUG1VbpsZ4HTlILN70YYzVh5eTlC9uFjXAsiKcgyY0D7q/TXuR414tQcENFaBrI2ovu
 C7cQ==
X-Gm-Message-State: AOAM532ynNObLfRchA7sSVo22KNrZh9He1JQF+AmL02frjHmr6yLcYj9
 ZHP2zRH9vvpj2mgo2TbBLp/2xRuo22jTILXeCcfqKdPk
X-Google-Smtp-Source: ABdhPJzCH4y8njPAsvsUQFGsyuHSAX6/NQGB86OX03gKys4WHU5OtNmoI2QFKjziZlwGZmD6WAr4n7lf+dRi1eLZwr4=
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr5182984wrn.124.1605289982663; 
 Fri, 13 Nov 2020 09:53:02 -0800 (PST)
MIME-Version: 1.0
References: <20201111024840.496679-1-bas@basnieuwenhuizen.nl>
In-Reply-To: <20201111024840.496679-1-bas@basnieuwenhuizen.nl>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2020 12:52:51 -0500
Message-ID: <CADnq5_OEU=YunrRHE=56B7s=vSLERc92B33ZWOXivap=vjfjFg@mail.gmail.com>
Subject: Re: [PATCH 0/3] amdgpu getfb2+modifier improvements
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
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
Cc: "Wentland, Harry" <harry.wentland@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Nov 10, 2020 at 9:48 PM Bas Nieuwenhuizen
<bas@basnieuwenhuizen.nl> wrote:
>
> This has some more improvements for the addfb2 code in amdgpu.
>
> These patches make ffmpeg work with DCC compressed and YUV surfaces
> with kmsgrab, both in the modifier and non-modifier case.

Looks good to me.  Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>
> Bas Nieuwenhuizen (3):
>   drm/amd/display: Store gem objects for planes 1-3
>   drm/amd/display: Set new format info for converted metadata.
>   drm/amd/display: Extract 3rd plane from metadata
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 211 +++++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.h   |   2 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  88 +-------
>  3 files changed, 207 insertions(+), 94 deletions(-)
>
> --
> 2.29.2
>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
