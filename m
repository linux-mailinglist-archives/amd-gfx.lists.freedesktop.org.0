Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A91D586C94
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Aug 2022 16:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19ED3C52D8;
	Mon,  1 Aug 2022 14:03:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E1714AB25
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Aug 2022 13:57:32 +0000 (UTC)
Date: Mon, 01 Aug 2022 13:57:10 +0000
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="WWIJ2W/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1659362245; x=1659621445;
 bh=CKEKf6HDLS3v8SpbpDmxZCdKCHfbzn+5GXwgaeYpDIY=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=WWIJ2W/4l5E738y2qowpW3CvKf78ejuUoqSkTv4+8AgHa9yxe2oNlUeKnlfZvidSK
 8O6BzBzAsiIljgbxHEi/1LO/lbPj8DZDX98H1lyNNMX9y7uWbtSLGGepm7fXIQlC1b
 sSLqeNR/ISt99Q1pf4ElL3JeLeHJWoureGztiSEyOvta4/62rH8vqyAYdezDXUA3gX
 8GwgpDCOEuZOQm+bHRXsIn6yDiYliS6c3Fv5phuHaT6FHweLKysHPApOMyXlzPNGV1
 BG1vw5aCy0UnsBaxy0FzbM9mOhVy4EQnqXzWm4yMzFO2MCVWWq/Brp22gs/+dlaNH3
 WdRbLJC/YVhsw==
To: Imre Deak <imre.deak@intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/3] drm/amd/display: Fix merge conflict resolution in
 amdgpu_dm_plane.c
Message-ID: <o3jSEcvDEw1afwzuUMylF9fY-EM-Kz5wHJVoktY8yNal0kEyLHa44nNBP1OTb4emiqyTuwxSVeiT52eYgSXYwGHmaGMiI60hDYJOOhS8Q-8=@emersion.fr>
In-Reply-To: <20220801135259.3039679-1-imre.deak@intel.com>
References: <20220801135259.3039679-1-imre.deak@intel.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: intel-gfx@lists.freedesktop.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Acked-by: Simon Ser <contact@emersion.fr>

CC amd-gfx

On Monday, August 1st, 2022 at 15:52, Imre Deak <imre.deak@intel.com> wrote=
:

> The API change introduced in
>
> commit 30c637151cfa ("drm/plane-helper: Export individual helpers")
>
> was missed in the conflict resolution of
>
> commit d93a13bd75b9 ("Merge remote-tracking branch 'drm-misc/drm-misc-nex=
t' into drm-tip")
>
> fix this up.
>
> Fixes: d93a13bd75b9 ("Merge remote-tracking branch 'drm-misc/drm-misc-nex=
t' into drm-tip")
> Cc: Simon Ser contact@emersion.fr
>
> Cc: Thomas Zimmermann tzimmermann@suse.de
>
> Acked-by: Thomas Zimmermann tzimmermann@suse.de
>
> Signed-off-by: Imre Deak imre.deak@intel.com
>
> ---
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 8cd25b2ea0dca..5eb5d31e591de 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1562,7 +1562,7 @@ int dm_drm_plane_get_property(struct drm_plane *pla=
ne,
> static const struct drm_plane_funcs dm_plane_funcs =3D {
> .update_plane =3D drm_atomic_helper_update_plane,
> .disable_plane =3D drm_atomic_helper_disable_plane,
> - .destroy =3D drm_primary_helper_destroy,
> + .destroy =3D drm_plane_helper_destroy,
> .reset =3D dm_drm_plane_reset,
> .atomic_duplicate_state =3D dm_drm_plane_duplicate_state,
> .atomic_destroy_state =3D dm_drm_plane_destroy_state,
> --
> 2.37.1
