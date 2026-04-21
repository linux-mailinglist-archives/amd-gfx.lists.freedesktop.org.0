Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SK0AKHeG6GkNLQIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Apr 2026 10:27:35 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C4B443727
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Apr 2026 10:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8089D10E97A;
	Wed, 22 Apr 2026 08:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lm/DFZOJ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC23510E887;
 Tue, 21 Apr 2026 11:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776772467; x=1808308467;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iCgphbDcBdNyS1sSqpE8VpK1xeMLyIcHxuNcGysEPt0=;
 b=lm/DFZOJ9/YqyFnSwfCyAoXGchv8AonNfk9YHqjHlwxY8mpqD2DbKtZF
 PX0umWqtgQx0BWmBzxRzP2CI8ef803VRtg7Oor3KebJ3bzN1pyAM2N6mq
 3DiGeRJ3+Sxe3GbeKqf2VWoTfrPTsmZKVs0WT06YtcaqmkSNXTxerH1Hj
 NxIED4ay0LByLvacXZp89Ng86BMfbICDZKS/fYPT8ryyf1OMJlmja6nPL
 qLaLogsIxYHypxVIM8t4jy7cByDf/7d/+NQJKeXZ5yvlgdXQHQXhu8ddj
 6JncI0ezUygWS2/6cd6WfyrbHD3Q4qYVbfiqg9kMVFNTExhLXmZm5zNDa Q==;
X-CSE-ConnectionGUID: h/7h1XyiT5yhD84CCnIZ3w==
X-CSE-MsgGUID: vez0jMHIShOqfUSvgyDBeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="76733435"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="76733435"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 04:54:26 -0700
X-CSE-ConnectionGUID: VubRT5JtSDiNCWy/slIh2A==
X-CSE-MsgGUID: SpkNe7dCSlS+hlep7bO+tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="231127258"
Received: from cliu5-mobl.gar.corp.intel.com (HELO [10.125.160.168])
 ([10.125.160.168])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 04:54:26 -0700
Message-ID: <d551bc50-e14d-4664-8df3-8fdd377e09c8@linux.intel.com>
Date: Tue, 21 Apr 2026 04:54:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: fix zero-size GDS range init on RDNA4
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <bug-221376-2300@https.bugzilla.kernel.org/>
 <20260420215717.223372-1-arjan@linux.intel.com>
 <34718f21-712a-4161-98e0-079dd9390ae6@amd.com>
Content-Language: en-US
From: Arjan van de Ven <arjan@linux.intel.com>
In-Reply-To: <34718f21-712a-4161-98e0-079dd9390ae6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Apr 2026 08:27:32 +0000
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[arjan@linux.intel.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:dkim,intel.com:email];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 47C4B443727
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/2026 11:42 PM, Christian König wrote:
> On 4/20/26 23:57, arjan@linux.intel.com wrote:
>>
>> RDNA4 (GFX 12) hardware removes the GDS, GWS, and OA on-chip memory
>> resources. The gfx_v12_0 initialisation code correctly leaves
>> adev->gds.gds_size, adev->gds.gws_size, and adev->gds.oa_size at
>> zero to reflect this.
>>
>> amdgpu_ttm_init() unconditionally calls amdgpu_ttm_init_on_chip() for
>> each of these resources regardless of size. When the size is zero,
>> amdgpu_ttm_init_on_chip() forwards the call to ttm_range_man_init(),
>> which calls drm_mm_init(mm, 0, 0). drm_mm_init() immediately fires
>> DRM_MM_BUG_ON(start + size <= start) -- trivially true when size is
>> zero -- crashing the kernel during modprobe of amdgpu on an RX 9070 XT.
> 
> Mhm in general not a bad idea, but we are having tons of GFX 12 systems in our test machines and nothing is crashing there.
> 
> We are clearly missing something here. Is that on an upstream kernel or something backported?
> 

the reported oops/etc say 6.18.22 so that does not sound like something crazy backported

(https://bugzilla.kernel.org/show_bug.cgi?id=221376)


