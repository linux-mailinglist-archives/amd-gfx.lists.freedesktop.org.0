Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D3542A0BA
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Oct 2021 11:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3041C6E81F;
	Tue, 12 Oct 2021 09:08:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56AEB6E81F
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 Oct 2021 09:08:34 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5ae924.dynamic.kabel-deutschland.de
 [95.90.233.36])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id BA4A561E64761;
 Tue, 12 Oct 2021 11:08:32 +0200 (CEST)
Subject: Re: [PATCH v5] amd/display: only require overlay plane to cover whole
 CRTC on ChromeOS
To: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <hwentlan@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Sean Paul <seanpaul@chromium.org>, amd-gfx@lists.freedesktop.org
References: <20211011151609.452132-1-contact@emersion.fr>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <0ad9c8ef-974f-8b94-d8c9-35efd9f1f1b3@molgen.mpg.de>
Date: Tue, 12 Oct 2021 11:08:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211011151609.452132-1-contact@emersion.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Dear Simon,


Am 11.10.21 um 17:16 schrieb Simon Ser:
> Commit ddab8bd788f5 ("drm/amd/display: Fix two cursor duplication when
> using overlay") changed the atomic validation code to forbid the
> overlay plane from being used if it doesn't cover the whole CRTC. The
> motivation is that ChromeOS uses the atomic API for everything except

s/motivation/problem/

> the cursor plane (which uses the legacy API). Thus amdgpu must always
> be prepared to enable/disable/move the cursor plane at any time without
> failing (or else ChromeOS will trip over).

What ChromeOS version did you test with? Are there plans to improve 
ChromeOS?

> As discussed in [1], there's no reason why the ChromeOS limitation
> should prevent other fully atomic users from taking advantage of the
> overlay plane. Let's limit the check to ChromeOS.

How do we know, no other userspace programs are affected, breaking 
Linux’ no-regression in userspace policy?

> v4: fix ChromeOS detection (Harry)
> 
> v5: fix conflict with linux-next
> 
> [1]: https://lore.kernel.org/amd-gfx/JIQ_93_cHcshiIDsrMU1huBzx9P9LVQxucx8hQArpQu7Wk5DrCl_vTXj_Q20m_L-8C8A5dSpNcSJ8ehfcCrsQpfB5QG_Spn14EYkH9chtg0=@emersion.fr/
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Harry Wentland <hwentlan@amd.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> Fixes: ddab8bd788f5 ("drm/amd/display: Fix two cursor duplication when using overlay")
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 29 +++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index f35561b5a465..2eeda1fec506 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -10594,6 +10594,31 @@ static int add_affected_mst_dsc_crtcs(struct drm_atomic_state *state, struct drm
>   }
>   #endif
>   
> +static bool is_chromeos(void)
> +{
> +	struct mm_struct *mm = current->mm;
> +	struct file *exe_file;
> +	bool ret;
> +
> +	/* ChromeOS renames its thread to DrmThread. Also check the executable
> +	 * name. */
> +	if (strcmp(current->comm, "DrmThread") != 0 || !mm)
> +		return false;
> +
> +	rcu_read_lock();
> +	exe_file = rcu_dereference(mm->exe_file);
> +	if (exe_file && !get_file_rcu(exe_file))
> +		exe_file = NULL;
> +	rcu_read_unlock();
> +
> +	if (!exe_file)
> +		return false;
> +	ret = strcmp(exe_file->f_path.dentry->d_name.name, "chrome") == 0;
> +	fput(exe_file);
> +
> +	return ret;
> +}
> +
>   static int validate_overlay(struct drm_atomic_state *state)
>   {
>   	int i;
> @@ -10601,6 +10626,10 @@ static int validate_overlay(struct drm_atomic_state *state)
>   	struct drm_plane_state *new_plane_state;
>   	struct drm_plane_state *primary_state, *overlay_state = NULL;
>   
> +	/* This is a workaround for ChromeOS only */
> +	if (!is_chromeos())
> +		return 0;

I would have expected the check to be the other way around, as no the 
behavior on non-Chrome OS is changed?

> +

Could some log be added, if ChromeOS is detected?

>   	/* Check if primary plane is contained inside overlay */
>   	for_each_new_plane_in_state_reverse(state, plane, new_plane_state, i) {
>   		if (plane->type == DRM_PLANE_TYPE_OVERLAY) {
> 


Kind regards,

Paul
