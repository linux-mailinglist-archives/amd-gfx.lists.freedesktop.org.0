Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1C6A0826
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 19:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA9789DC0;
	Wed, 28 Aug 2019 17:09:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397D089DBF
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 17:08:59 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id j4so941256iog.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 10:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8KlV/jy06a4d7UrRjhaJyE3lxz5U3uy6EUNKd4uhTFw=;
 b=OmWYqANhHlSBrcQN7FOOnKU8P3b/JAh8Y02FjnUE4jkxcWA4x11tuBF5tnyIdYQ8Vg
 zPdMZN9fqJEJ/J0gTnwsuZP0ZWI+o4i0fDHjKXtzI9LZPKCn0WKtGuswj0va39TAGos+
 AaIrCEbhcOKOmQY3kgfY+fU3k4rNNhsfg+qDQAaJL3VZIIvuLqrzg2nFjt5ae3cTnbQV
 Sevwa8JuV1Jwx5smsoGJkF2jYCSItnJuC2Pvutfb8ox/MFqRjfD85KIqb5hMwqf/p0SR
 5j+9szWLKLPOPGUYsbQWwhAgtrjkL2Xj9jOIhTGEwHuq+TlxStBC+E0TbGzd8gu+MutO
 0R0w==
X-Gm-Message-State: APjAAAUjOOwncyVRciWLUbLQjINJ74st88HLIJirpzfI1QMTgx0hFEH1
 NP8mOXBKZpZ7g6Ke1KGdB9zHQ04SSZi2lsR0WaM=
X-Google-Smtp-Source: APXvYqwHwpQpLYlKLKFjhlyhBC6LF7tTIYDEZ3i+oIoUB2KDwdt1YcRytY3JA1xn3DlUAGhwodvt9SWwHro9u6seV6Q=
X-Received: by 2002:a6b:7e07:: with SMTP id i7mr5837707iom.254.1567012138404; 
 Wed, 28 Aug 2019 10:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <7002f783-2223-a524-2c60-03447377bd28@amd.com>
 <20190722153350.29339-1-Joseph.Greathouse@amd.com>
 <c4856ea0-3cd3-1628-54e9-9660be334054@gmail.com>
 <36885047-8915-fb90-fcaa-04f98b4519b1@amd.com>
In-Reply-To: <36885047-8915-fb90-fcaa-04f98b4519b1@amd.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 28 Aug 2019 13:08:22 -0400
Message-ID: <CAAxE2A5MgKswdeHg1YrDs_G7hCuoZAVFuPyoHoA+DbUjA32eHg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: Default disable GDS for compute+gfx
To: zhoucm1 <zhoucm1@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8KlV/jy06a4d7UrRjhaJyE3lxz5U3uy6EUNKd4uhTFw=;
 b=n74F42KAyI0aPLUItZ5eNvqYxiNA0jPH6QGBKQamYFBPyk0DBZaG3uFvztHepvk8KK
 eZ99QFKKXC6Azgt2WXWLdaO4a6IIT4dRux1GQIEnA0Tx2uutNjhGLzL2xmMM+O1HOTG8
 sJwSyhhmz3Ds4fyrDUHlhdwB+59yF/1/zpBpu3n4UnxqI3RfE3OnFjVRDkaq2whlXjU+
 jBRjlnGFGnR8+Zawx/6awUL3J8IOI3a0TqDOUq5Ba5ewQ6hMKcKXd1CujZWWQ+pMiv20
 3S1f5sND7E4ejUiTsgl1r8hZRYne92yjnoF+QmUHXouXro6r3K1LbolTs5AOeDN1pG2W
 7UnA==
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Greathouse,
 Joseph" <Joseph.Greathouse@amd.com>
Content-Type: multipart/mixed; boundary="===============1510991042=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1510991042==
Content-Type: multipart/alternative; boundary="000000000000de525a05913071c7"

--000000000000de525a05913071c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It can't break an older driver, because there is no older driver that
requires the static allocation.

Note that closed source drivers don't count, because they don't need
backward compatibility.

Marek

On Wed, Aug 28, 2019 at 2:44 AM zhoucm1 <zhoucm1@amd.com> wrote:

>
> On 2019/7/23 =E4=B8=8A=E5=8D=883:08, Christian K=C3=B6nig wrote:
> > Am 22.07.19 um 17:34 schrieb Greathouse, Joseph:
> >> Units in the GDS block default to allowing all VMIDs access to all
> >> entries. Disable shader access to the GDS, GWS, and OA blocks from all
> >> compute and gfx VMIDs by default. For compute, HWS firmware will set
> >> up the access bits for the appropriate VMID when a compute queue
> >> requires access to these blocks.
> >> The driver will handle enabling access on-demand for graphics VMIDs.
>
> gds_switch is depending on job->gds/gws/oa/_base/size.
>
> "[PATCH] drm/amdgpu: remove static GDS, GWS and OA allocation", the
> default allocations in kernel were removed. If some UMD stacks don't
> pass gds/gws/oa allocation to bo_list, then kernel will not enable
> access of them, that will break previous driver.
>
> do we need revert "[PATCH] drm/amdgpu: remove static GDS, GWS and OA
> allocation" ?
>
> -David
>
> >>
> >> Leaving VMID0 with full access because otherwise HWS cannot save or
> >> restore values during task switch.
> >>
> >> v2: Fixed code and comment styling.
> >>
> >> Change-Id: I3d768a96935d2ed1dff09b02c995090f4fbfa539
> >> Signed-off-by: Joseph Greathouse <Joseph.Greathouse@amd.com>
> >
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 25 ++++++++++++++++++------=
-
> >>   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c  | 24 +++++++++++++++++-------
> >>   drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c  | 24 +++++++++++++++++-------
> >>   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c  | 24 +++++++++++++++++-------
> >>   4 files changed, 69 insertions(+), 28 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> >> b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> >> index 73dcb632a3ce..2a9692bc34b4 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> >> @@ -1516,17 +1516,27 @@ static void
> >> gfx_v10_0_init_compute_vmid(struct amdgpu_device *adev)
> >>       }
> >>       nv_grbm_select(adev, 0, 0, 0, 0);
> >>       mutex_unlock(&adev->srbm_mutex);
> >> +}
> >>   -    /* Initialize all compute VMIDs to have no GDS, GWS, or OA
> >> -       acccess. These should be enabled by FW for target VMIDs. */
> >> -    for (i =3D FIRST_COMPUTE_VMID; i < LAST_COMPUTE_VMID; i++) {
> >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_BASE, 2 * i, 0);
> >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_SIZE, 2 * i, 0);
> >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_GWS_VMID0, i, 0);
> >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_OA_VMID0, i, 0);
> >> +static void gfx_v10_0_init_gds_vmid(struct amdgpu_device *adev)
> >> +{
> >> +    int vmid;
> >> +
> >> +    /*
> >> +     * Initialize all compute and user-gfx VMIDs to have no GDS,
> >> GWS, or OA
> >> +     * access. Compute VMIDs should be enabled by FW for target VMIDs=
,
> >> +     * the driver can enable them for graphics. VMID0 should maintain
> >> +     * access so that HWS firmware can save/restore entries.
> >> +     */
> >> +    for (vmid =3D 1; vmid < 16; vmid++) {
> >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_BASE, 2 * vmid, 0);
> >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_SIZE, 2 * vmid, 0);
> >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_GWS_VMID0, vmid, 0);
> >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_OA_VMID0, vmid, 0);
> >>       }
> >>   }
> >>   +
> >>   static void gfx_v10_0_tcp_harvest(struct amdgpu_device *adev)
> >>   {
> >>       int i, j, k;
> >> @@ -1629,6 +1639,7 @@ static void gfx_v10_0_constants_init(struct
> >> amdgpu_device *adev)
> >>       mutex_unlock(&adev->srbm_mutex);
> >>         gfx_v10_0_init_compute_vmid(adev);
> >> +    gfx_v10_0_init_gds_vmid(adev);
> >>     }
> >>   diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> >> b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> >> index 3f98624772a4..48796b6824cf 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> >> @@ -1877,14 +1877,23 @@ static void gfx_v7_0_init_compute_vmid(struct
> >> amdgpu_device *adev)
> >>       }
> >>       cik_srbm_select(adev, 0, 0, 0, 0);
> >>       mutex_unlock(&adev->srbm_mutex);
> >> +}
> >>   -    /* Initialize all compute VMIDs to have no GDS, GWS, or OA
> >> -       acccess. These should be enabled by FW for target VMIDs. */
> >> -    for (i =3D FIRST_COMPUTE_VMID; i < LAST_COMPUTE_VMID; i++) {
> >> -        WREG32(amdgpu_gds_reg_offset[i].mem_base, 0);
> >> -        WREG32(amdgpu_gds_reg_offset[i].mem_size, 0);
> >> -        WREG32(amdgpu_gds_reg_offset[i].gws, 0);
> >> -        WREG32(amdgpu_gds_reg_offset[i].oa, 0);
> >> +static void gfx_v7_0_init_gds_vmid(struct amdgpu_device *adev)
> >> +{
> >> +    int vmid;
> >> +
> >> +    /*
> >> +     * Initialize all compute and user-gfx VMIDs to have no GDS,
> >> GWS, or OA
> >> +     * access. Compute VMIDs should be enabled by FW for target VMIDs=
,
> >> +     * the driver can enable them for graphics. VMID0 should maintain
> >> +     * access so that HWS firmware can save/restore entries.
> >> +     */
> >> +    for (vmid =3D 1; vmid < 16; vmid++) {
> >> +        WREG32(amdgpu_gds_reg_offset[vmid].mem_base, 0);
> >> +        WREG32(amdgpu_gds_reg_offset[vmid].mem_size, 0);
> >> +        WREG32(amdgpu_gds_reg_offset[vmid].gws, 0);
> >> +        WREG32(amdgpu_gds_reg_offset[vmid].oa, 0);
> >>       }
> >>   }
> >>   @@ -1966,6 +1975,7 @@ static void gfx_v7_0_constants_init(struct
> >> amdgpu_device *adev)
> >>       mutex_unlock(&adev->srbm_mutex);
> >>         gfx_v7_0_init_compute_vmid(adev);
> >> +    gfx_v7_0_init_gds_vmid(adev);
> >>         WREG32(mmSX_DEBUG_1, 0x20);
> >>   diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> >> b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> >> index e4028d54f8f7..d2907186bb24 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> >> @@ -3702,14 +3702,23 @@ static void gfx_v8_0_init_compute_vmid(struct
> >> amdgpu_device *adev)
> >>       }
> >>       vi_srbm_select(adev, 0, 0, 0, 0);
> >>       mutex_unlock(&adev->srbm_mutex);
> >> +}
> >>   -    /* Initialize all compute VMIDs to have no GDS, GWS, or OA
> >> -       acccess. These should be enabled by FW for target VMIDs. */
> >> -    for (i =3D FIRST_COMPUTE_VMID; i < LAST_COMPUTE_VMID; i++) {
> >> -        WREG32(amdgpu_gds_reg_offset[i].mem_base, 0);
> >> -        WREG32(amdgpu_gds_reg_offset[i].mem_size, 0);
> >> -        WREG32(amdgpu_gds_reg_offset[i].gws, 0);
> >> -        WREG32(amdgpu_gds_reg_offset[i].oa, 0);
> >> +static void gfx_v8_0_init_gds_vmid(struct amdgpu_device *adev)
> >> +{
> >> +    int vmid;
> >> +
> >> +    /*
> >> +     * Initialize all compute and user-gfx VMIDs to have no GDS,
> >> GWS, or OA
> >> +     * access. Compute VMIDs should be enabled by FW for target VMIDs=
,
> >> +     * the driver can enable them for graphics. VMID0 should maintain
> >> +     * access so that HWS firmware can save/restore entries.
> >> +     */
> >> +    for (vmid =3D 1; vmid < 16; vmid++) {
> >> +        WREG32(amdgpu_gds_reg_offset[vmid].mem_base, 0);
> >> +        WREG32(amdgpu_gds_reg_offset[vmid].mem_size, 0);
> >> +        WREG32(amdgpu_gds_reg_offset[vmid].gws, 0);
> >> +        WREG32(amdgpu_gds_reg_offset[vmid].oa, 0);
> >>       }
> >>   }
> >>   @@ -3779,6 +3788,7 @@ static void gfx_v8_0_constants_init(struct
> >> amdgpu_device *adev)
> >>       mutex_unlock(&adev->srbm_mutex);
> >>         gfx_v8_0_init_compute_vmid(adev);
> >> +    gfx_v8_0_init_gds_vmid(adev);
> >>         mutex_lock(&adev->grbm_idx_mutex);
> >>       /*
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> >> b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> >> index 259a35395fec..bd7f431a24d9 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> >> @@ -2025,14 +2025,23 @@ static void gfx_v9_0_init_compute_vmid(struct
> >> amdgpu_device *adev)
> >>       }
> >>       soc15_grbm_select(adev, 0, 0, 0, 0);
> >>       mutex_unlock(&adev->srbm_mutex);
> >> +}
> >>   -    /* Initialize all compute VMIDs to have no GDS, GWS, or OA
> >> -       acccess. These should be enabled by FW for target VMIDs. */
> >> -    for (i =3D FIRST_COMPUTE_VMID; i < LAST_COMPUTE_VMID; i++) {
> >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_BASE, 2 * i, 0);
> >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_SIZE, 2 * i, 0);
> >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_GWS_VMID0, i, 0);
> >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_OA_VMID0, i, 0);
> >> +static void gfx_v9_0_init_gds_vmid(struct amdgpu_device *adev)
> >> +{
> >> +    int vmid;
> >> +
> >> +    /*
> >> +     * Initialize all compute and user-gfx VMIDs to have no GDS,
> >> GWS, or OA
> >> +     * access. Compute VMIDs should be enabled by FW for target VMIDs=
,
> >> +     * the driver can enable them for graphics. VMID0 should maintain
> >> +     * access so that HWS firmware can save/restore entries.
> >> +     */
> >> +    for (vmid =3D 1; vmid < 16; vmid++) {
> >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_BASE, 2 * vmid, 0);
> >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_SIZE, 2 * vmid, 0);
> >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_GWS_VMID0, vmid, 0);
> >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_OA_VMID0, vmid, 0);
> >>       }
> >>   }
> >>   @@ -2080,6 +2089,7 @@ static void gfx_v9_0_constants_init(struct
> >> amdgpu_device *adev)
> >>       mutex_unlock(&adev->srbm_mutex);
> >>         gfx_v9_0_init_compute_vmid(adev);
> >> +    gfx_v9_0_init_gds_vmid(adev);
> >>   }
> >>     static void gfx_v9_0_wait_for_rlc_serdes(struct amdgpu_device *ade=
v)
> >
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--000000000000de525a05913071c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It can&#39;t break an older driver, because there is =
no older driver that requires the static allocation.</div><div><br></div><d=
iv>Note that closed source drivers don&#39;t count, because they don&#39;t =
need backward compatibility.</div><div><br></div><div>Marek<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed=
, Aug 28, 2019 at 2:44 AM zhoucm1 &lt;<a href=3D"mailto:zhoucm1@amd.com">zh=
oucm1@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><br>
On 2019/7/23 =E4=B8=8A=E5=8D=883:08, Christian K=C3=B6nig wrote:<br>
&gt; Am 22.07.19 um 17:34 schrieb Greathouse, Joseph:<br>
&gt;&gt; Units in the GDS block default to allowing all VMIDs access to all=
<br>
&gt;&gt; entries. Disable shader access to the GDS, GWS, and OA blocks from=
 all<br>
&gt;&gt; compute and gfx VMIDs by default. For compute, HWS firmware will s=
et<br>
&gt;&gt; up the access bits for the appropriate VMID when a compute queue<b=
r>
&gt;&gt; requires access to these blocks.<br>
&gt;&gt; The driver will handle enabling access on-demand for graphics VMID=
s.<br>
<br>
gds_switch is depending on job-&gt;gds/gws/oa/_base/size.<br>
<br>
&quot;[PATCH] drm/amdgpu: remove static GDS, GWS and OA allocation&quot;, t=
he <br>
default allocations in kernel were removed. If some UMD stacks don&#39;t <b=
r>
pass gds/gws/oa allocation to bo_list, then kernel will not enable <br>
access of them, that will break previous driver.<br>
<br>
do we need revert &quot;[PATCH] drm/amdgpu: remove static GDS, GWS and OA <=
br>
allocation&quot; ?<br>
<br>
-David<br>
<br>
&gt;&gt;<br>
&gt;&gt; Leaving VMID0 with full access because otherwise HWS cannot save o=
r<br>
&gt;&gt; restore values during task switch.<br>
&gt;&gt;<br>
&gt;&gt; v2: Fixed code and comment styling.<br>
&gt;&gt;<br>
&gt;&gt; Change-Id: I3d768a96935d2ed1dff09b02c995090f4fbfa539<br>
&gt;&gt; Signed-off-by: Joseph Greathouse &lt;<a href=3D"mailto:Joseph.Grea=
thouse@amd.com" target=3D"_blank">Joseph.Greathouse@amd.com</a>&gt;<br>
&gt;<br>
&gt; Reviewed-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koen=
ig@amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 25 +++++++++++++++=
+++-------<br>
&gt;&gt; =C2=A0 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c=C2=A0 | 24 ++++++++++=
+++++++-------<br>
&gt;&gt; =C2=A0 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c=C2=A0 | 24 ++++++++++=
+++++++-------<br>
&gt;&gt; =C2=A0 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c=C2=A0 | 24 ++++++++++=
+++++++-------<br>
&gt;&gt; =C2=A0 4 files changed, 69 insertions(+), 28 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c <br>
&gt;&gt; b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
&gt;&gt; index 73dcb632a3ce..2a9692bc34b4 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
&gt;&gt; @@ -1516,17 +1516,27 @@ static void <br>
&gt;&gt; gfx_v10_0_init_compute_vmid(struct amdgpu_device *adev)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nv_grbm_select(adev, 0, 0, 0, 0);<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&amp;adev-&gt;srbm_mut=
ex);<br>
&gt;&gt; +}<br>
&gt;&gt; =C2=A0 -=C2=A0=C2=A0=C2=A0 /* Initialize all compute VMIDs to have=
 no GDS, GWS, or OA<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acccess. These should be ena=
bled by FW for target VMIDs. */<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 for (i =3D FIRST_COMPUTE_VMID; i &lt; LAST_COM=
PUTE_VMID; i++) {<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32_SOC15_OFFSET(GC=
, 0, mmGDS_VMID0_BASE, 2 * i, 0);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32_SOC15_OFFSET(GC=
, 0, mmGDS_VMID0_SIZE, 2 * i, 0);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32_SOC15_OFFSET(GC=
, 0, mmGDS_GWS_VMID0, i, 0);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32_SOC15_OFFSET(GC=
, 0, mmGDS_OA_VMID0, i, 0);<br>
&gt;&gt; +static void gfx_v10_0_init_gds_vmid(struct amdgpu_device *adev)<b=
r>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int vmid;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 /*<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * Initialize all compute and user-gfx VM=
IDs to have no GDS, <br>
&gt;&gt; GWS, or OA<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * access. Compute VMIDs should be enable=
d by FW for target VMIDs,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * the driver can enable them for graphic=
s. VMID0 should maintain<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * access so that HWS firmware can save/r=
estore entries.<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 for (vmid =3D 1; vmid &lt; 16; vmid++) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32_SOC15_OFFSET(GC=
, 0, mmGDS_VMID0_BASE, 2 * vmid, 0);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32_SOC15_OFFSET(GC=
, 0, mmGDS_VMID0_SIZE, 2 * vmid, 0);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32_SOC15_OFFSET(GC=
, 0, mmGDS_GWS_VMID0, vmid, 0);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32_SOC15_OFFSET(GC=
, 0, mmGDS_OA_VMID0, vmid, 0);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; =C2=A0 +<br>
&gt;&gt; =C2=A0 static void gfx_v10_0_tcp_harvest(struct amdgpu_device *ade=
v)<br>
&gt;&gt; =C2=A0 {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int i, j, k;<br>
&gt;&gt; @@ -1629,6 +1639,7 @@ static void gfx_v10_0_constants_init(struct =
<br>
&gt;&gt; amdgpu_device *adev)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&amp;adev-&gt;srbm_mut=
ex);<br>
&gt;&gt; =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfx_v10_0_init_compute_vmid(=
adev);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 gfx_v10_0_init_gds_vmid(adev);<br>
&gt;&gt; =C2=A0 =C2=A0 }<br>
&gt;&gt; =C2=A0 diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c <br>
&gt;&gt; b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c<br>
&gt;&gt; index 3f98624772a4..48796b6824cf 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c<br>
&gt;&gt; @@ -1877,14 +1877,23 @@ static void gfx_v7_0_init_compute_vmid(str=
uct <br>
&gt;&gt; amdgpu_device *adev)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cik_srbm_select(adev, 0, 0, 0, 0);<=
br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&amp;adev-&gt;srbm_mut=
ex);<br>
&gt;&gt; +}<br>
&gt;&gt; =C2=A0 -=C2=A0=C2=A0=C2=A0 /* Initialize all compute VMIDs to have=
 no GDS, GWS, or OA<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acccess. These should be ena=
bled by FW for target VMIDs. */<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 for (i =3D FIRST_COMPUTE_VMID; i &lt; LAST_COM=
PUTE_VMID; i++) {<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32(amdgpu_gds_reg_=
offset[i].mem_base, 0);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32(amdgpu_gds_reg_=
offset[i].mem_size, 0);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32(amdgpu_gds_reg_=
offset[i].gws, 0);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32(amdgpu_gds_reg_=
offset[i].oa, 0);<br>
&gt;&gt; +static void gfx_v7_0_init_gds_vmid(struct amdgpu_device *adev)<br=
>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int vmid;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 /*<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * Initialize all compute and user-gfx VM=
IDs to have no GDS, <br>
&gt;&gt; GWS, or OA<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * access. Compute VMIDs should be enable=
d by FW for target VMIDs,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * the driver can enable them for graphic=
s. VMID0 should maintain<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * access so that HWS firmware can save/r=
estore entries.<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 for (vmid =3D 1; vmid &lt; 16; vmid++) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32(amdgpu_gds_reg_=
offset[vmid].mem_base, 0);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32(amdgpu_gds_reg_=
offset[vmid].mem_size, 0);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32(amdgpu_gds_reg_=
offset[vmid].gws, 0);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32(amdgpu_gds_reg_=
offset[vmid].oa, 0);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; =C2=A0 @@ -1966,6 +1975,7 @@ static void gfx_v7_0_constants_init(s=
truct <br>
&gt;&gt; amdgpu_device *adev)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&amp;adev-&gt;srbm_mut=
ex);<br>
&gt;&gt; =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfx_v7_0_init_compute_vmid(a=
dev);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 gfx_v7_0_init_gds_vmid(adev);<br>
&gt;&gt; =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32(mmSX_DEBUG_1, 0x20);<=
br>
&gt;&gt; =C2=A0 diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c <br>
&gt;&gt; b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c<br>
&gt;&gt; index e4028d54f8f7..d2907186bb24 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c<br>
&gt;&gt; @@ -3702,14 +3702,23 @@ static void gfx_v8_0_init_compute_vmid(str=
uct <br>
&gt;&gt; amdgpu_device *adev)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vi_srbm_select(adev, 0, 0, 0, 0);<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&amp;adev-&gt;srbm_mut=
ex);<br>
&gt;&gt; +}<br>
&gt;&gt; =C2=A0 -=C2=A0=C2=A0=C2=A0 /* Initialize all compute VMIDs to have=
 no GDS, GWS, or OA<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acccess. These should be ena=
bled by FW for target VMIDs. */<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 for (i =3D FIRST_COMPUTE_VMID; i &lt; LAST_COM=
PUTE_VMID; i++) {<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32(amdgpu_gds_reg_=
offset[i].mem_base, 0);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32(amdgpu_gds_reg_=
offset[i].mem_size, 0);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32(amdgpu_gds_reg_=
offset[i].gws, 0);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32(amdgpu_gds_reg_=
offset[i].oa, 0);<br>
&gt;&gt; +static void gfx_v8_0_init_gds_vmid(struct amdgpu_device *adev)<br=
>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int vmid;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 /*<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * Initialize all compute and user-gfx VM=
IDs to have no GDS, <br>
&gt;&gt; GWS, or OA<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * access. Compute VMIDs should be enable=
d by FW for target VMIDs,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * the driver can enable them for graphic=
s. VMID0 should maintain<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * access so that HWS firmware can save/r=
estore entries.<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 for (vmid =3D 1; vmid &lt; 16; vmid++) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32(amdgpu_gds_reg_=
offset[vmid].mem_base, 0);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32(amdgpu_gds_reg_=
offset[vmid].mem_size, 0);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32(amdgpu_gds_reg_=
offset[vmid].gws, 0);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32(amdgpu_gds_reg_=
offset[vmid].oa, 0);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; =C2=A0 @@ -3779,6 +3788,7 @@ static void gfx_v8_0_constants_init(s=
truct <br>
&gt;&gt; amdgpu_device *adev)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&amp;adev-&gt;srbm_mut=
ex);<br>
&gt;&gt; =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfx_v8_0_init_compute_vmid(a=
dev);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 gfx_v8_0_init_gds_vmid(adev);<br>
&gt;&gt; =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(&amp;adev-&gt;grb=
m_idx_mutex);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c <br>
&gt;&gt; b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c<br>
&gt;&gt; index 259a35395fec..bd7f431a24d9 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c<br>
&gt;&gt; @@ -2025,14 +2025,23 @@ static void gfx_v9_0_init_compute_vmid(str=
uct <br>
&gt;&gt; amdgpu_device *adev)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 soc15_grbm_select(adev, 0, 0, 0, 0)=
;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&amp;adev-&gt;srbm_mut=
ex);<br>
&gt;&gt; +}<br>
&gt;&gt; =C2=A0 -=C2=A0=C2=A0=C2=A0 /* Initialize all compute VMIDs to have=
 no GDS, GWS, or OA<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acccess. These should be ena=
bled by FW for target VMIDs. */<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 for (i =3D FIRST_COMPUTE_VMID; i &lt; LAST_COM=
PUTE_VMID; i++) {<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32_SOC15_OFFSET(GC=
, 0, mmGDS_VMID0_BASE, 2 * i, 0);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32_SOC15_OFFSET(GC=
, 0, mmGDS_VMID0_SIZE, 2 * i, 0);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32_SOC15_OFFSET(GC=
, 0, mmGDS_GWS_VMID0, i, 0);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32_SOC15_OFFSET(GC=
, 0, mmGDS_OA_VMID0, i, 0);<br>
&gt;&gt; +static void gfx_v9_0_init_gds_vmid(struct amdgpu_device *adev)<br=
>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 int vmid;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 /*<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * Initialize all compute and user-gfx VM=
IDs to have no GDS, <br>
&gt;&gt; GWS, or OA<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * access. Compute VMIDs should be enable=
d by FW for target VMIDs,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * the driver can enable them for graphic=
s. VMID0 should maintain<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * access so that HWS firmware can save/r=
estore entries.<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 for (vmid =3D 1; vmid &lt; 16; vmid++) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32_SOC15_OFFSET(GC=
, 0, mmGDS_VMID0_BASE, 2 * vmid, 0);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32_SOC15_OFFSET(GC=
, 0, mmGDS_VMID0_SIZE, 2 * vmid, 0);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32_SOC15_OFFSET(GC=
, 0, mmGDS_GWS_VMID0, vmid, 0);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WREG32_SOC15_OFFSET(GC=
, 0, mmGDS_OA_VMID0, vmid, 0);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; =C2=A0 @@ -2080,6 +2089,7 @@ static void gfx_v9_0_constants_init(s=
truct <br>
&gt;&gt; amdgpu_device *adev)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&amp;adev-&gt;srbm_mut=
ex);<br>
&gt;&gt; =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfx_v9_0_init_compute_vmid(a=
dev);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 gfx_v9_0_init_gds_vmid(adev);<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; =C2=A0 =C2=A0 static void gfx_v9_0_wait_for_rlc_serdes(struct amdg=
pu_device *adev)<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; amd-gfx mailing list<br>
&gt; <a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank">amd=
-gfx@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" rel=
=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/lis=
tinfo/amd-gfx</a><br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank">amd-gfx@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/amd-gfx</a></blockquote></div>

--000000000000de525a05913071c7--

--===============1510991042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1510991042==--
