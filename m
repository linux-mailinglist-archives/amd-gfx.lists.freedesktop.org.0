Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DmPFS9zsmmuMgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Mar 2026 09:02:55 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C5626E8D4
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Mar 2026 09:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCF610E994;
	Thu, 12 Mar 2026 08:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tNkVHSp8";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C67410E993;
 Thu, 12 Mar 2026 08:02:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EF78E42D74;
 Thu, 12 Mar 2026 08:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCBEEC4CEF7;
 Thu, 12 Mar 2026 08:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773302570;
 bh=rOOCLsoaLb28ovZSPnnf45HbMo0fTfq5uGTva0TuFEQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tNkVHSp8aV7sS5Qk8ZaP4YOYE3mNMhJYj4DmpuqlQBMhNBxfQEgf8486GJNvAiRHp
 MjMaRBZfReUBmhgrs6728xWBOWF4A4S/BzAg8r7uWZNZbdNRHCdSXfsVudVZ0J9JkZ
 t+N18ZiT0BUcn1/TPy4tgu+nU+v4WT9jxXghR/jt6jIRgUFC75uUjFLMNde8af3N+r
 G40d3r8OJ2fCn1AGmRFq7KBdbV7hFjbIIUDevdo7b+CZmaeZQdKDR/qkp6yrT80LSb
 rUV58KFYHWBBd6nCzlm5zDNWGEQpM5nxfHp69ha3J7GZQjnJSu0J18yqnqsbePElLo
 4/rXki/MNjOKQ==
Date: Thu, 12 Mar 2026 01:02:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Calvin Owens <calvin@wbinvd.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Charlene Liu <charlene.liu@amd.com>,
 Ovidiu Bunea <ovidiu.bunea@amd.com>, Alex Hung <alex.hung@amd.com>,
 Dan Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Christian Koenig <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 llvm@lists.linux.dev
Subject: Re: [REGRESSION][PATCH] drm/amd/display: Fix uninitialized variable
 which breaks full LTO
Message-ID: <20260312080245.GA3988095@ax162>
References: <ef7266eb7802ce6d68ebd9356477e9671f0c94e0.1773116305.git.calvin@wbinvd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef7266eb7802ce6d68ebd9356477e9671f0c94e0.1773116305.git.calvin@wbinvd.org>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,amd.com,igalia.com,gmail.com,ffwll.ch,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 84C5626E8D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Calvin,

On Mon, Mar 09, 2026 at 09:24:57PM -0700, Calvin Owens wrote:
> Commit e1b385726f7f ("drm/amd/display: Add additional checks for PSP
> footer size") introduced a use of an uninitialized stack variable
> in dm_dmub_sw_init() (region_params.bss_data_size).
> 
> Interestingly, this seems to cause no issue on normal kernels. But when
> full LTO is enabled, it causes the compiler to "optimize" out huge
> swaths of amdgpu initialization code, and the driver is unusable:

Yeah, this appears to be a very unfortunate case of "clang encountered known
undefined behavior and stopped code generation", which we would like to
avoid but figuring out a proper upstreamable solution is hard. The most
recent attempt:

  https://github.com/llvm/llvm-project/pull/146791

My guess is that LTO allows inlining of
dmub_srv_get_fw_meta_info_from_raw_fw() into dm_dmub_sw_init(), at which
point it can see that the result of accessing an uninitialized
region_params.bss_data_size will be used through
fw_meta_info_params.fw_bss_data and gives up generating the rest of the
function.

>     amdgpu 0000:03:00.0: [drm] Loading DMUB firmware via PSP: version=0x07002F00
>     amdgpu 0000:03:00.0: sw_init of IP block <dm> failed 5
>     amdgpu 0000:03:00.0: amdgpu_device_ip_init failed
>     amdgpu 0000:03:00.0: Fatal error during GPU init
> 
> It surprises me that neither gcc nor clang emit a warning about this: I
> only found it by bisecting the LTO breakage.

gcc's -Wmaybe-uninitialized is disabled by default for the kernel but
even enabling it with KCFLAGS does not show an instance here, which I
find quite surprising... for clang, it is harder because the warning
happens early in the frontend where it might not be able to track a
value that well.

> Fix by using the old value for region_params.bss_data_size in place of
> the uninitialized reference, which makes amdgpu work with LTO again.
> 
> Fixes: e1b385726f7f ("drm/amd/display: Add additional checks for PSP footer size")
> Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index b3d6f2cd8ab6..e69e61163ae9 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2554,7 +2554,7 @@ static int dm_dmub_sw_init(struct amdgpu_device *adev)
>  	fw_meta_info_params.fw_inst_const = adev->dm.dmub_fw->data +
>  					    le32_to_cpu(hdr->header.ucode_array_offset_bytes) +
>  					    PSP_HEADER_BYTES_256;
> -	fw_meta_info_params.fw_bss_data = region_params.bss_data_size ? adev->dm.dmub_fw->data +
> +	fw_meta_info_params.fw_bss_data = le32_to_cpu(hdr->bss_data_bytes) ? adev->dm.dmub_fw->data +

Maybe it would be better to use fw_meta_info_params.bss_data_size
instead of le32_to_cpu(hdr->bss_data_bytes)? Obviously it is the same
value but it would result in a smaller change. It seems likely that this
was just a copy and paste failure.

>  					  le32_to_cpu(hdr->header.ucode_array_offset_bytes) +
>  					  le32_to_cpu(hdr->inst_const_bytes) : NULL;
>  	fw_meta_info_params.custom_psp_footer_size = 0;
> -- 
> 2.47.3
> 
