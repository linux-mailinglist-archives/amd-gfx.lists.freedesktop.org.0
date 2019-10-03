Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AAECB271
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 01:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541FD6EA99;
	Thu,  3 Oct 2019 23:44:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E060D6EA8B
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 22:45:54 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o18so4563632wrv.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 03 Oct 2019 15:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LF/bd8qPa88SwpekktshLWswJ9rbNMVpj+YBGpYpdpU=;
 b=Ltyoixkxf3+PkEIPR6qCRgnaa1Bi3aDkPPfL6+A+O4a+qv8aRqJVlgWPPo7lK+TC/Q
 0KEzkbHdfwrj38qxwjM84Blpzn2KCgTogIzH8uM10X3ZyjegUUJKVRQaJBP6V+0WOYzG
 hjZ+t1/6wwNMRKXi9Yo6sf/thvnoyDIeNGIAw1DnKxCnJL95tBHyPjY3SgkqJ/eY5QNj
 y/wE5iLDBNA1y3U0UeEodo3ad00KeYcvtqZA7bTee+G2Q7oBAqHFxC4VnPL5zrqe98eC
 65lXQlCSZwrP+6n1WYYRLm8sohTyyhUtHLHUaqDcpdZsrEjUcAaVruVhoPIYwDQYbjaR
 6d+g==
X-Gm-Message-State: APjAAAXNfMNV+CpCdgwi43ddslFHEgX/pLv7IYFEn8oTegAMVy/A82sB
 YzImmJ/smxy+1JGsoXMDz5P7nsSVueZumuUaxo6nOsac
X-Google-Smtp-Source: APXvYqyaAs27PYH0eokmvLWPihwy1NIpWjXvUYePIsFmLs7/W0weW+i46q3dSu8hzkKXCxbIMoj70Ou5LM59pxj1qyQ=
X-Received: by 2002:adf:e791:: with SMTP id n17mr9677259wrm.388.1570142753282; 
 Thu, 03 Oct 2019 15:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191003190653.15455-1-Philip.Yang@amd.com>
In-Reply-To: <20191003190653.15455-1-Philip.Yang@amd.com>
From: Joe Barnett <thejoe@gmail.com>
Date: Thu, 3 Oct 2019 15:45:42 -0700
Message-ID: <CAHpbJO9_7iJ2Deay1CVq8qLdS6OmR8DOfbT+hVLDLLYnS49T0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: user pages array memory leak fix
To: "Yang, Philip" <Philip.Yang@amd.com>
X-Mailman-Approved-At: Thu, 03 Oct 2019 23:44:06 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=LF/bd8qPa88SwpekktshLWswJ9rbNMVpj+YBGpYpdpU=;
 b=CNfP1oH3STd3Vf9ykBXmP2S3KpM7YHjSrq014tnOsVtIi4HlpAF0ZXRPDTgjvbvrzl
 HnV7ya035ij4MnowmRp03AU4auzH0JyXetuN1xWCYT41GIKeG3z1N9SExefEAO0d2yMb
 9Ya79wiK5PGaTwEZaziOSO3RAo5JpCpsGMAvoiidW+00trohY6q1/EwiP2UPlZMQ9B2t
 fipAnEMXWYEQou0woYd8IH9fvGkmeDMra2ECrKar43VMSRTCP9X8qG10FbxSdQP6rziH
 B7SRTg5lZbOxGoIsKysSWmPQ3UfpmYjbgVo+uAvFqK3+piLhVilbRBxwl2hvcb5Qms6G
 N5GQ==
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
Content-Type: multipart/mixed; boundary="===============0865380307=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0865380307==
Content-Type: multipart/alternative; boundary="0000000000000e5e630594095965"

--0000000000000e5e630594095965
Content-Type: text/plain; charset="UTF-8"

I've tested applying v2 of this patch against a v5.3 tagged kernel and it
appears to fix the issue I reported.

Thanks,
-Joe

On Thu, Oct 3, 2019 at 12:07 PM Yang, Philip <Philip.Yang@amd.com> wrote:

> user_pages array should be freed regardless if user pages are
> invalidated after bo is created because HMM change to always allocate
> user pages array to get user pages while parsing user page bo.
>
> Don't need to to get user pages while creating bo because user pages
> will only be used after parsing user page bo.
>
> Bugzilla: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1844962
>
> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 23 +----------------------
>  2 files changed, 2 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 49b767b7238f..e861de259def 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -498,7 +498,7 @@ static int amdgpu_cs_list_validate(struct
> amdgpu_cs_parser *p,
>                 if (r)
>                         return r;
>
> -               if (binding_userptr) {
> +               if (lobj->user_pages) {
>                         kvfree(lobj->user_pages);
>                         lobj->user_pages = NULL;
>                 }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index a828e3d0bfbd..3ccd61d69964 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -283,7 +283,6 @@ int amdgpu_gem_create_ioctl(struct drm_device *dev,
> void *data,
>  int amdgpu_gem_userptr_ioctl(struct drm_device *dev, void *data,
>                              struct drm_file *filp)
>  {
> -       struct ttm_operation_ctx ctx = { true, false };
>         struct amdgpu_device *adev = dev->dev_private;
>         struct drm_amdgpu_gem_userptr *args = data;
>         struct drm_gem_object *gobj;
> @@ -326,32 +325,12 @@ int amdgpu_gem_userptr_ioctl(struct drm_device *dev,
> void *data,
>                         goto release_object;
>         }
>
> -       if (args->flags & AMDGPU_GEM_USERPTR_VALIDATE) {
> -               r = amdgpu_ttm_tt_get_user_pages(bo, bo->tbo.ttm->pages);
> -               if (r)
> -                       goto release_object;
> -
> -               r = amdgpu_bo_reserve(bo, true);
> -               if (r)
> -                       goto user_pages_done;
> -
> -               amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_GTT);
> -               r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
> -               amdgpu_bo_unreserve(bo);
> -               if (r)
> -                       goto user_pages_done;
> -       }
> -
>         r = drm_gem_handle_create(filp, gobj, &handle);
>         if (r)
> -               goto user_pages_done;
> +               goto release_object;
>
>         args->handle = handle;
>
> -user_pages_done:
> -       if (args->flags & AMDGPU_GEM_USERPTR_VALIDATE)
> -               amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm);
> -
>  release_object:
>         drm_gem_object_put_unlocked(gobj);
>
> --
> 2.17.1
>
>

--0000000000000e5e630594095965
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ve tested applying v2 of this patch against a v=
5.3 tagged kernel and it appears to fix the issue I reported.</div><div><br=
></div><div>Thanks,</div><div>-Joe<br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 3, 2019 at 12:07 PM=
 Yang, Philip &lt;<a href=3D"mailto:Philip.Yang@amd.com">Philip.Yang@amd.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>user_pages array should be freed regardless if user pages are<br>
invalidated after bo is created because HMM change to always allocate<br>
user pages array to get user pages while parsing user page bo.<br>
<br>
Don&#39;t need to to get user pages while creating bo because user pages<br=
>
will only be used after parsing user page bo.<br>
<br>
Bugzilla: <a href=3D"https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1=
844962" rel=3D"noreferrer" target=3D"_blank">https://bugs.launchpad.net/ubu=
ntu/+source/linux/+bug/1844962</a><br>
<br>
Signed-off-by: Philip Yang &lt;<a href=3D"mailto:Philip.Yang@amd.com" targe=
t=3D"_blank">Philip.Yang@amd.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c=C2=A0 |=C2=A0 2 +-<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 23 +----------------------<=
br>
=C2=A02 files changed, 2 insertions(+), 23 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_cs.c<br>
index 49b767b7238f..e861de259def 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
@@ -498,7 +498,7 @@ static int amdgpu_cs_list_validate(struct amdgpu_cs_par=
ser *p,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return r;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (binding_userptr=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (lobj-&gt;user_p=
ages) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 kvfree(lobj-&gt;user_pages);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 lobj-&gt;user_pages =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_gem.c<br>
index a828e3d0bfbd..3ccd61d69964 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
@@ -283,7 +283,6 @@ int amdgpu_gem_create_ioctl(struct drm_device *dev, voi=
d *data,<br>
=C2=A0int amdgpu_gem_userptr_ioctl(struct drm_device *dev, void *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_file *filp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_operation_ctx ctx =3D { true, false =
};<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct amdgpu_device *adev =3D dev-&gt;dev_priv=
ate;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_amdgpu_gem_userptr *args =3D data;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_gem_object *gobj;<br>
@@ -326,32 +325,12 @@ int amdgpu_gem_userptr_ioctl(struct drm_device *dev, =
void *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto release_object;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (args-&gt;flags &amp; AMDGPU_GEM_USERPTR_VAL=
IDATE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D amdgpu_ttm_tt=
_get_user_pages(bo, bo-&gt;tbo.ttm-&gt;pages);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto release_object;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D amdgpu_bo_res=
erve(bo, true);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto user_pages_done;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_bo_placement=
_from_domain(bo, AMDGPU_GEM_DOMAIN_GTT);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D ttm_bo_valida=
te(&amp;bo-&gt;tbo, &amp;bo-&gt;placement, &amp;ctx);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_bo_unreserve=
(bo);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto user_pages_done;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D drm_gem_handle_create(filp, gobj, &amp;ha=
ndle);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto user_pages_don=
e;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto release_object=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 args-&gt;handle =3D handle;<br>
<br>
-user_pages_done:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (args-&gt;flags &amp; AMDGPU_GEM_USERPTR_VAL=
IDATE)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_ttm_tt_get_u=
ser_pages_done(bo-&gt;tbo.ttm);<br>
-<br>
=C2=A0release_object:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_gem_object_put_unlocked(gobj);<br>
<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--0000000000000e5e630594095965--

--===============0865380307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0865380307==--
