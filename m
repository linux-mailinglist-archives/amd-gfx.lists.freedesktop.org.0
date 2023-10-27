Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 411BD7D9CBE
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Oct 2023 17:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0FB10E9E6;
	Fri, 27 Oct 2023 15:18:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDF710E9E6
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Oct 2023 15:18:27 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6cd0963c61cso1400730a34.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Oct 2023 08:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698419906; x=1699024706; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LbYRlMn7DLilYFLLkcz/FVCYPtbZKKNkLpWvWlURUhM=;
 b=O/DEhaytwIp8jA2OLhF/FErGvgQxsXwsRpPIdEgNmhUs7TG8GPhS4ZuP21whMpHfVv
 mwDkPbdqw9DaFjn6f2viM7bPhbN3+ThbtrUsJGttf++eVohPuC6npjWB5dy5egX/tucF
 9ym7VpJiKyNPqwfq1OcdtQITNzFSIXLTxilQa7rMM1uZd92/o430f1T54oTYB6u0yG0U
 JkSNjb6tITKPfZ7/rA0RTMbeYmosrOSL/hSjsrRS9en2B2uAuK9vDRckn7gOOWuR4xN/
 OMSCaepXFClFkj7uJRCOe2iCelfO4b4oGY2x7c0GwvyKmHpkb9TTxmVMQuYGM5fgXgOv
 fwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698419906; x=1699024706;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LbYRlMn7DLilYFLLkcz/FVCYPtbZKKNkLpWvWlURUhM=;
 b=se2xgtOnNv5/aNWtmOhDzdWZZ9y43phdUVkboVUy4cHlL8i65TGGCFVD03nZnJeXL0
 TuiqOw9Zudmu2cQx0E7nyHIj02UWtn39OKNchswwIHA1bpyUqfeBHUscxN1Blrvd1pl5
 bHpwSpFnTYIARoPn2j1oPeHcd4khrRmTWJrP43yslF2xe+UBBLzlBHHZHqVLTEzjl6Mp
 RIFGZ/6GXmgCeZyKzlPEhpkjtd92uBKbcoGfh2GDgbtLfXwWcWHAmO11DnwLG69NqbUg
 PThbBvna5G3UGcJmq0vm+BYxGYBZpVftKlAl7i1gFnKhq0VOJIL4TmmRrifOIxAoBm6u
 tuWw==
X-Gm-Message-State: AOJu0Yx6nSZCimQdUME2//XOpijF2bSsnmlqu4StDAqB+j7l0qhjM/qv
 8lMef2jahQQMAfV86GxZaVjHiB2KUyn8O4RLFO0=
X-Google-Smtp-Source: AGHT+IFdLYvmaggodUXrtvT3GPx1l+q961ec1k72DyvQdT4zQOd+mwC+uoPNiG1AYmXdiBe8fbMjKo69p1/0gw/4Guc=
X-Received: by 2002:a05:6870:1290:b0:1ea:554:45a with SMTP id
 16-20020a056870129000b001ea0554045amr3062251oal.24.1698419906596; Fri, 27 Oct
 2023 08:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20231026220525.23682-1-coelacanth_dream@protonmail.com>
 <20231026220525.23682-2-coelacanth_dream@protonmail.com>
In-Reply-To: <20231026220525.23682-2-coelacanth_dream@protonmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 27 Oct 2023 11:18:15 -0400
Message-ID: <CADnq5_OXLyKicsBCH5NA=-eT7iYWm1zyRd2KJ2oDc9DDYwqE1w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: Remove unused variables from
 amdgpu_show_fdinfo
To: Umio Yasuno <coelacanth_dream@protonmail.com>
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
Cc: robdclark@chromium.org, neil.armstrong@linaro.org, shashank.sharma@amd.com,
 amd-gfx@lists.freedesktop.org, robdclark@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Applied the series.  Thanks!

Alex

On Thu, Oct 26, 2023 at 6:43=E2=80=AFPM Umio Yasuno
<coelacanth_dream@protonmail.com> wrote:
>
> Remove unused variables from amdgpu_show_fdinfo
>
> Signed-off-by: Umio Yasuno <coelacanth_dream@protonmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_fdinfo.c
> index e9b5d1903..b960ca7ba 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> @@ -55,21 +55,15 @@ static const char *amdgpu_ip_name[AMDGPU_HW_IP_NUM] =
=3D {
>
>  void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>  {
> -       struct amdgpu_device *adev =3D drm_to_adev(file->minor->dev);
>         struct amdgpu_fpriv *fpriv =3D file->driver_priv;
>         struct amdgpu_vm *vm =3D &fpriv->vm;
>
>         struct amdgpu_mem_stats stats;
>         ktime_t usage[AMDGPU_HW_IP_NUM];
> -       uint32_t bus, dev, fn, domain;
>         unsigned int hw_ip;
>         int ret;
>
>         memset(&stats, 0, sizeof(stats));
> -       bus =3D adev->pdev->bus->number;
> -       domain =3D pci_domain_nr(adev->pdev->bus);
> -       dev =3D PCI_SLOT(adev->pdev->devfn);
> -       fn =3D PCI_FUNC(adev->pdev->devfn);
>
>         ret =3D amdgpu_bo_reserve(vm->root.bo, false);
>         if (ret)
> --
> 2.42.0
>
>
