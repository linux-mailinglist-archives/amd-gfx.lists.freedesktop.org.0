Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCU/Nvlo62m2MgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 24 Apr 2026 14:58:33 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D20A45EC2A
	for <lists+amd-gfx@lfdr.de>; Fri, 24 Apr 2026 14:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6706010E3E9;
	Fri, 24 Apr 2026 12:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="ErBe5CkY";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693C710E069
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 Apr 2026 07:51:27 +0000 (UTC)
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
 by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4g24rm627yz3wV6;
 Fri, 24 Apr 2026 09:50:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
 s=key2; t=1777017048;
 bh=q+xPFMBHJhjI+lv575vR2OklPRNyBbx4ReRSfdrgsok=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ErBe5CkYJiSpCEpAwlGS0YdGEInJklZxc6WkeTyXBue83eWFxfMM8XahI3KvKBpV+
 ggAXh4Ec+kNNHyVYRSkXGwhbtsgZLxwq8ncuaiu0XdoqwIBue9dIBBRDLHIJuMmvYy
 BZJlIEpM13lSxUKLzrUx0HwADjkPXbZHRjMG8pSE91GSSE/E/YWt5C51SGAh21UO32
 3BKv8wfw12Vr4NPf2yCxQcSBx2N04YUi9RVzHefID6ED5TbnR7pPpNLNhENXf7F1cQ
 GU9kUOXj0bkaWvP3mC4Lkuc4VIHJRwSQBv7tLL2pRtoid7cC51iD17h5pnyVhp2pXJ
 gmcolkhFpYCQw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4g24rm3J9Cz3wF7;
 Fri, 24 Apr 2026 09:50:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
X-Spam-Status: No, score=-2.898 required=6.31 tests=[ALL_TRUSTED=-1,
 BAYES_00=-1.9, SPF_PASS=-0.001, URIBL_BLOCKED=0.001,
 URIBL_DBL_BLOCKED_OPENDNS=0.001, URIBL_ZEN_BLOCKED_OPENDNS=0.001]
 autolearn=ham autolearn_force=no
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by policy01-mors.netcup.net (Postfix) with ESMTPS id 4g24rk2NqBz8tc2;
 Fri, 24 Apr 2026 09:50:46 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown
 [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
 by mxe9fb.netcup.net (Postfix) with ESMTPSA id 70984632DF;
 Fri, 24 Apr 2026 09:50:45 +0200 (CEST)
Authentication-Results: mxe9fb;
 spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f)
 smtp.mailfrom=regressions@leemhuis.info
 smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <df82dbc6-623f-4be7-acbc-49157e59764c@leemhuis.info>
Date: Fri, 24 Apr 2026 09:50:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: DC analog support regressed by "drm/amd/display: Sync dcn42 with
 DC 3.2.373"
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>,
 Ray Wu <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>,
 Alex Hung <alex.hung@amd.com>, David Airlie <airlied@gmail.com>,
 Christian <christian.koenig@amd.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20260306031932.136179-1-alex.hung@amd.com>
 <20260306031932.136179-20-alex.hung@amd.com> <7370736.9J7NaK4W3v@timur-max>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <7370736.9J7NaK4W3v@timur-max>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177701704603.204622.11882405151607592230@mxe9fb.netcup.net>
X-NC-CID: RKmzBR7hlRLGi7BGHvblUZI5R5G2qb2GlgMyhkR/THktSzjkVdc=
X-Mailman-Approved-At: Fri, 24 Apr 2026 12:58:30 +0000
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
X-Rspamd-Queue-Id: 4D20A45EC2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[leemhuis.info];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:timur.kristof@gmail.com,m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:aurabindo.pillai@amd.com,m:roman.li@amd.com,m:wayne.lin@amd.com,m:chiahsuan.chung@amd.com,m:jerry.zuo@amd.com,m:daniel.wheeler@amd.com,m:Ray.Wu@amd.com,m:ivan.lipski@amd.com,m:alex.hung@amd.com,m:airlied@gmail.com,m:christian.koenig@amd.com,m:regressions@lists.linux.dev,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[regressions@leemhuis.info,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,amd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[regressions@leemhuis.info,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,leemhuis.info:dkim,leemhuis.info:mid]

On 4/13/26 15:09, Timur Kristóf wrote:
> This patch breaks analog connector support in DCE, both for analog encoders 
> and DP bridge encoders, because it deletes key functions such as 
> dce110_enable_analog_link_output, dce110_prepare_ddc, 
> dce110_external_encoder_control, and more.
> 
> With this patch applied, when you connect an analog monitor you just get a 
> crash in DC from trying to call link->dc->hwss.enable_analog_link_output() 
> which is now NULL.
> 
> This is basically undoing all the work I did for supporting old GPUs with DC.
> I think either this commit should be reverted or someone should add back the 
> analog support bits that were removed. I'm happy to help with that if needed.
> What do you guys think?

I noticed that a patch to fix this mistake is ready by now:
drm/amd/display: Restore analog connector support --
https://lore.kernel.org/all/20260418003539.1862136-1-Roman.Li@amd.com/

And from that thread the fix was even "merged" somewhere. But I can't
see this in -next or Alex' drm-fixes-7.1 pull, so I assume it will miss
-rc1 (please corrent me if I'm wrong). Is that something to be concerned
about?

Ciao, Thorsten

> As a side question, why was this commit merged without any review or ack?
> 
> Thanks & best regards,
> Timur
> 
> On 2026. március 6., péntek 4:13:45 közép-európai nyári idő Alex Hung wrote:
>> From: Roman Li <Roman.Li@amd.com>
>>
>> This patch provides a bulk merge to align driver
>> support for DCN42 with Display Core version 3.2.373.
>>
>> It includes upgrade for:
>> - clk_mgr
>> - dml2/dml21
>> - optc
>> - hubp
>> - mpc
>> - optc
>> - hwseq
>>
>> Signed-off-by: Roman Li <Roman.Li@amd.com>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> ---
>>  .../gpu/drm/amd/display/dc/bios/bios_parser.c |  11 +-
>>  .../display/dc/clk_mgr/dcn42/dcn42_clk_mgr.c  | 141 +++--
>>  .../display/dc/clk_mgr/dcn42/dcn42_clk_mgr.h  |   2 +-
>>  drivers/gpu/drm/amd/display/dc/core/dc.c      |  95 ++-
>>  .../gpu/drm/amd/display/dc/core/dc_stream.c   |  41 +-
>>  .../gpu/drm/amd/display/dc/core/dc_surface.c  |   9 +
>>  drivers/gpu/drm/amd/display/dc/dc.h           |  59 +-
>>  .../gpu/drm/amd/display/dc/dc_bios_types.h    |   3 +-
>>  drivers/gpu/drm/amd/display/dc/dc_hw_types.h  |   2 +-
>>  drivers/gpu/drm/amd/display/dc/dc_plane.h     |   1 +
>>  drivers/gpu/drm/amd/display/dc/dc_types.h     |  24 +
>>  .../amd/display/dc/dccg/dcn401/dcn401_dccg.c  |  20 +
>>  .../drm/amd/display/dc/dce/dmub_hw_lock_mgr.c |  16 +
>>  .../drm/amd/display/dc/dce/dmub_hw_lock_mgr.h |  13 +
>>  .../dml2_0/dml21/dml21_translation_helper.c   |  30 +-
>>  .../amd/display/dc/dml2_0/dml21/dml21_utils.c |   1 +
>>  .../display/dc/dml2_0/dml21/dml21_wrapper.c   |  14 +-
>>  .../dml21/inc/bounding_boxes/dcn42_soc_bb.h   | 308 ++++------
>>  .../dml21/inc/dml_top_display_cfg_types.h     |  13 +
>>  .../dc/dml2_0/dml21/inc/dml_top_types.h       |   2 +
>>  .../dml21/src/dml2_core/dml2_core_dcn4.c      | 204 +++----
>>  .../dml21/src/dml2_core/dml2_core_factory.c   |   1 +
>>  .../dml21/src/dml2_core/dml2_core_utils.c     |  63 +-
>>  .../dml21/src/dml2_core/dml2_core_utils.h     |   2 +
>>  .../dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c      |   1 -
>>  .../dml21/src/dml2_dpmm/dml2_dpmm_factory.c   |   1 +
>>  .../dml2_0/dml21/src/dml2_mcg/dml2_mcg_dcn4.h |   2 +-
>>  .../dml21/src/dml2_mcg/dml2_mcg_dcn42.h       |   5 +-
>>  .../dml21/src/dml2_mcg/dml2_mcg_factory.c     |   1 +
>>  .../dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |   6 +
>>  .../dml21/src/dml2_pmo/dml2_pmo_factory.c     |   4 +-
>>  .../dml21/src/dml2_pmo/dml2_pmo_factory.h     |   2 +-
>>  .../dml21/src/dml2_top/dml2_top_interfaces.c  |   1 +
>>  .../dml21/src/dml2_top/dml2_top_legacy.c      |   1 -
>>  .../src/inc/dml2_internal_shared_types.h      |   3 +
>>  .../drm/amd/display/dc/dml2_0/dml2_wrapper.c  |   3 +-
>>  .../amd/display/dc/dpp/dcn30/dcn30_dpp_cm.c   |   2 +
>>  .../display/dc/dpp/dcn401/dcn401_dpp_dscl.c   |  21 +
>>  .../hpo/dcn31/dcn31_hpo_dp_stream_encoder.c   |   5 +
>>  .../amd/display/dc/hubp/dcn401/dcn401_hubp.c  | 201 ++++---
>>  .../amd/display/dc/hubp/dcn401/dcn401_hubp.h  |  23 +-
>>  .../amd/display/dc/hubp/dcn42/dcn42_hubp.c    |  85 ++-
>>  .../amd/display/dc/hubp/dcn42/dcn42_hubp.h    |  16 +-
>>  .../amd/display/dc/hwss/dce110/dce110_hwseq.c | 136 +++--
>>  .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 412 +++++--------
>>  .../amd/display/dc/hwss/dcn42/dcn42_hwseq.c   | 553 +++---------------
>>  .../amd/display/dc/hwss/dcn42/dcn42_hwseq.h   |  10 +-
>>  .../amd/display/dc/hwss/dcn42/dcn42_init.c    |   8 +-
>>  drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h  |  36 +-
>>  .../gpu/drm/amd/display/dc/inc/hw/hw_shared.h |  18 +-
>>  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   | 112 ++--
>>  drivers/gpu/drm/amd/display/dc/inc/resource.h |   1 +
>>  .../amd/display/dc/mpc/dcn401/dcn401_mpc.c    | 177 +++---
>>  .../amd/display/dc/mpc/dcn401/dcn401_mpc.h    |  25 +-
>>  .../drm/amd/display/dc/mpc/dcn42/dcn42_mpc.c  | 390 ++----------
>>  .../drm/amd/display/dc/mpc/dcn42/dcn42_mpc.h  |  50 +-
>>  .../amd/display/dc/optc/dcn10/dcn10_optc.h    |   2 +-
>>  .../amd/display/dc/optc/dcn42/dcn42_optc.c    | 105 +++-
>>  .../amd/display/dc/optc/dcn42/dcn42_optc.h    |  13 +-
>>  .../dc/resource/dcn42/dcn42_resource.c        |  10 +-
>>  .../dcn401/dcn401_soc_and_ip_translator.c     |   3 +
>>  .../dcn42/dcn42_soc_and_ip_translator.c       |  12 +-
>>  .../gpu/drm/amd/display/dmub/inc/dmub_cmd.h   |  38 +-
>>  .../include/asic_reg/dcn/dcn_4_2_0_offset.h   |   2 +
>>  .../include/asic_reg/dcn/dcn_4_2_0_sh_mask.h  |   9 +
>>  65 files changed, 1596 insertions(+), 1984 deletions(-)
> 
> 
> 
> 
> 

