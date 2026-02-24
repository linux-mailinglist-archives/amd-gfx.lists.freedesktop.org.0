Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H7IBrFhnWksPQQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Feb 2026 09:30:41 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3958183B2A
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Feb 2026 09:30:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D96110E196;
	Tue, 24 Feb 2026 08:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YzfFO3Nu";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D716F10E196
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Feb 2026 08:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=26gwwFtYgoRaDTWHVy0kA/oIvhwFvekOjwFu4c2zZbo=; b=YzfFO3NuD/L187Xw+GQbxeq/wN
 Vulg/K/x1XWw+fkZqeQ4A773MFOgu0uBYYqw086OPNHXDvrYRvesL56fAd5JZ2R8Kn69xf8gOre7J
 c29Hlx6TzDqiLEz23aw0I2v/s7gmg3hohdOdRsTqMdfKbXRAAtsg7N+D11Ks0jUkIWQQO++31Clnu
 31Emfz3yXDcogEZGqh9trJ+1AGKfjtzinL1Os8NhsJAO7qrB5i/iiuozAudXsaEWSQtug84aGbpYR
 O+OVQazqFXm/a8ph8vpBrzaw4aa6GW9Ho13DRdZWnYiJZsQizXtI0eTOYFmD9Ry5v9Ywlrxwnh9BJ
 9eAH1QsQ==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vunoR-004fX7-3m; Tue, 24 Feb 2026 09:30:35 +0100
Message-ID: <f6817133-8246-4a64-abf6-b1f373ca4682@igalia.com>
Date: Tue, 24 Feb 2026 08:30:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm/amdgpu/userq: initialize gobj_read/write in
 amdgpu_userq_signal_ioctl
To: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
References: <20260224082443.4002292-1-sunil.khatri@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260224082443.4002292-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:sunil.khatri@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.972];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: A3958183B2A
X-Rspamd-Action: no action


On 24/02/2026 08:24, Sunil Khatri wrote:
> In case num_read_bo_handles or num_write_bo_handles is zero the ptrs
> remain uninitialized and during free cause a fault. So to handle such
> cases we better set the gobj_read and gobj_write to NULL.

Hmm I thought this cannot be after dbce431756f8 ("drm/gem: Make 
drm_gem_objects_lookup() self-cleaning on failure v6"):

int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
			   int count, struct drm_gem_object ***objs_out)
{
	struct drm_gem_object **objs;
	u32 *handles;
	int ret;

	*objs_out = NULL;

	if (!count)
		return 0;

So if count is zero, pointer is initialized to zero.

Maybe the branch you tested with does not have that patch?

But in any case, no harm in zero initializing so you can mark my r-b for 
both.

Regards,

Tvrtko

> 
> Fixes: 3cf117572294 ("drm/amdgpu/userq: Use drm_gem_objects_lookup in amdgpu_userq_signal_ioctl")
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> index 18e77b61b201..e53e14e3bf2d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> @@ -465,7 +465,7 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
>   	const unsigned int num_read_bo_handles = args->num_bo_read_handles;
>   	struct amdgpu_fpriv *fpriv = filp->driver_priv;
>   	struct amdgpu_userq_mgr *userq_mgr = &fpriv->userq_mgr;
> -	struct drm_gem_object **gobj_write, **gobj_read;
> +	struct drm_gem_object **gobj_write = NULL, **gobj_read = NULL;
>   	u32 *syncobj_handles, num_syncobj_handles;
>   	struct amdgpu_userq_fence *userq_fence;
>   	struct amdgpu_usermode_queue *queue;

