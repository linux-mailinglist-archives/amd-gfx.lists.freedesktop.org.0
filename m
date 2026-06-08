Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uIhyLoU9J2qEtwIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 09 Jun 2026 00:09:09 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4281865AE43
	for <lists+amd-gfx@lfdr.de>; Tue, 09 Jun 2026 00:09:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Lq52nAwS;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F6210E0B6;
	Mon,  8 Jun 2026 22:09:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042DB10E0B6
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jun 2026 22:09:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 088156001D;
 Mon,  8 Jun 2026 22:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A311F00893;
 Mon,  8 Jun 2026 22:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780956543;
 bh=Vf4KV/Op+GCD+8s2g1BpM2ZXvm3GjRLZVA0QNpLP9II=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Lq52nAwSWBA0ASzi+/c36WvWckTTUheWrAqw5zcVFj1KVuNu8GgVDTsiD7D5q7RqU
 h6ngq9g1+bKSwb8DHU5LnXB8qdfA9HQIGpU7lRibq2Fkjwvl4t1wdDn6doEGTR8Qpt
 TtpB2B1Dp92hAIWi5COy6dcu7Np9w3DGEriEBdTsHHkdITyjHS4t/GKgOwMpE6K27S
 Gdq5RFKMdvAalnTd2OlAw+ejlllhAhswpSDrxLL+/8JD1QO3AR8ld05uSqpEOnIYwa
 /izlvVzXTjtzg9aRodC1J3vBCm/BDI8+EiodVusuV2NDav80s7aiFiJtVqRmFh2KmP
 POI75G7OHQSWQ==
Date: Mon, 8 Jun 2026 15:08:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Yang Wang <kevinyang.wang@amd.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nsc@kernel.org
Subject: Re: [PATCH] kbuild: normalize paths in quiet compile output
Message-ID: <20260608220859.GC2340474@ax162>
References: <20260608070039.4069917-1-kevinyang.wang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608070039.4069917-1-kevinyang.wang@amd.com>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kevinyang.wang@amd.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nsc@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nathan@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ax162:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4281865AE43

Hi Yang,

On Mon, Jun 08, 2026 at 03:00:39PM +0800, Yang Wang wrote:
> Composite objects may contain relative components in their member object
> paths. This can make quiet compile output include noisy dot-dot components,
> for example:
> 
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_module.o
> 
> Use the existing normalize_path helper for quiet C and assembly compile
> output so the same target is printed as:
> 
>   CC [M]  drivers/gpu/drm/amd/amdkfd/kfd_module.o
> 
> The actual compile commands still use $@, so object paths, dependency
> tracking and generated files are unchanged.
> 
> Signed-off-by: Yang Wang <kevinyang.wang@amd.com>

While I agree that the dots are ugly, I do not want to take this change
because it makes it harder to figure out how to build these .o files
individually. For example:

  $ make -kj"$(nproc)" ARCH=x86_64 CROSS_COMPILE=x86_64-linux- mrproper allmodconfig drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_module.o
  ...
    CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_module.o

works for building this file individually but the normalized path
produced by this patch

  $ make -kj"$(nproc)" ARCH=x86_64 CROSS_COMPILE=x86_64-linux- mrproper allmodconfig drivers/gpu/drm/amd/amdkfd/kfd_module.o
  ...
    CC      drivers/gpu/drm/amd/amdkfd/kfd_module.o
  In file included from drivers/gpu/drm/amd/amdkfd/kfd_module.c:26:
  drivers/gpu/drm/amd/amdkfd/kfd_priv.h:46:10: fatal error: kgd_kfd_interface.h: No such file or directory
     46 | #include <kgd_kfd_interface.h>
        |          ^~~~~~~~~~~~~~~~~~~~~
  compilation terminated.
  make[7]: *** [scripts/Makefile.build:289: drivers/gpu/drm/amd/amdkfd/kfd_module.o] Error 1

does not.

> ---
>  scripts/Makefile.lib | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 28a1c08e3b22..7d1589d993a8 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -239,7 +239,7 @@ ifdef CONFIG_LTO_CLANG
>  cmd_ld_single = $(if $(objtool-enabled)$(is-single-obj-m), ; $(LD) $(ld_flags) -r -o $(tmp-target) $@; mv $(tmp-target) $@)
>  endif
>  
> -quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
> +quiet_cmd_cc_o_c = CC $(quiet_modtag)  $(call normalize_path,$@)
>        cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $< \
>  		$(cmd_ld_single) \
>  		$(cmd_objtool)
> @@ -254,7 +254,7 @@ define rule_cc_o_c
>  	$(call cmd,warn_shared_object)
>  endef
>  
> -quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
> +quiet_cmd_as_o_S = AS $(quiet_modtag)  $(call normalize_path,$@)
>        cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $< $(cmd_objtool)
>  
>  define rule_as_o_S
> -- 
> 2.47.3
> 

-- 
Cheers,
Nathan
