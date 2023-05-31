Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEB6718910
	for <lists+amd-gfx@lfdr.de>; Wed, 31 May 2023 20:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FB610E1D7;
	Wed, 31 May 2023 18:10:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E4F10E1DA
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 May 2023 18:10:24 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6af896f0908so43653a34.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 May 2023 11:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685556623; x=1688148623;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OvB/EIw8hyUB1DhdZetQIGB8Tr9NMWgLR5++PEOYxL0=;
 b=K/rC6g5IcwGwohe3/dnEslr3qkKgrt/sg4XZ+WnmVfkEGgJEZ/rxybqUFe4HklrQlH
 IA+ead1Nsz0C6gU2bxZLgNPYPjyXmIOzm2RybNrQGNt+VpoZRoywVVyoCuS3sI3RloH1
 QazrayVB3nvHpAmY7LO/j/59mXdPX+ti9ag77TOivZqYiJfFJMHvOPCDje7CwNMo+s+3
 CzgYhLTrPkWTn83XN3jM/3a1iAAv7629CIBhQL53XlncLn86k7JS1VXg5OWfQ5Nff5p0
 wN0RZvFUF/SV8LRhJdgV9JIJYASrsRLDPUafGgwIZ2fMblvhJgqzN7Qb/e8K0kICvW66
 KEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685556623; x=1688148623;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OvB/EIw8hyUB1DhdZetQIGB8Tr9NMWgLR5++PEOYxL0=;
 b=RDh9qMMdn9PiGkDiv7OUXcVTK8VCZKCIA9HQyvqxTgNDyBevC36JrCjF8DuO+QiM3F
 Csd3mz7G5O9g07y50eovDQn2p9I+cDavYPc6fI4S327u7GIie5V7O8x8tq5h5m4iEd3x
 UG1DmPgOGlUJkuUPZr4lR+w4oxFtulpqKXNy5IgwjeWWZ4eg82twVYVXE9OrzO4m/IBj
 U6ULpDDz2vKmvrgcHhN8WbC7w3bNKmwlxTRB5rZqc+gVYGwwlBb0R3Ex++9ko7judE5K
 lHSI3RvGAFh1Fz9yeYaIe+CaWsEQVZ4pm/c77IyCT8dMs8yQX/hixjeLgflJUEaqAxlA
 KD1g==
X-Gm-Message-State: AC+VfDy/5UVsl/XBGVAC2InYnwjL7ya0eFQEOv1TTZ2gE/0grp7Wdv3H
 g9TvPmt5afGyQ4TlGKlYzFNOzki44byEvTw8GXo=
X-Google-Smtp-Source: ACHHUZ65sjy7iS+qdHuo9Yvf8C25qGJW5QBGnHj6lswI1wDRlRRNeWqe2SwFo71DXHFFxCxUNWMq48X7NXkXrJCcFd4=
X-Received: by 2002:a4a:41c5:0:b0:555:33cd:cd76 with SMTP id
 x188-20020a4a41c5000000b0055533cdcd76mr2889453ooa.2.1685556622899; Wed, 31
 May 2023 11:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230530184846.3108466-1-srinivasan.shanmugam@amd.com>
In-Reply-To: <20230530184846.3108466-1-srinivasan.shanmugam@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 31 May 2023 14:10:10 -0400
Message-ID: <CADnq5_OUr9eJEDJOepzggsjk1A_PVX1mwOOBPyQ5=9fE6+P+wg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix up kdoc 'ring' parameter in
 sdma_v6_0_ring_pad_ib
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

On Tue, May 30, 2023 at 2:49=E2=80=AFPM Srinivasan Shanmugam
<srinivasan.shanmugam@amd.com> wrote:
>
> Fix this warning by adding 'ring' arguments to kdoc.
>
> gcc with W=3D1
> drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:1128: warning: Function parameter =
or member 'ring' not described in 'sdma_v6_0_ring_pad_ib'
>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v6_0.c
> index 967849c59ebe..3b03dda854fd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> @@ -1121,6 +1121,7 @@ static void sdma_v6_0_vm_set_pte_pde(struct amdgpu_=
ib *ib,
>  /**
>   * sdma_v6_0_ring_pad_ib - pad the IB
>   * @ib: indirect buffer to fill with padding
> + * @ring: amdgpu ring pointer
>   *
>   * Pad the IB with NOPs to a boundary multiple of 8.
>   */
> --
> 2.25.1
>
