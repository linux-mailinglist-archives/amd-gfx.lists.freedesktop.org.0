Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHNLD8wU4WnoogAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Apr 2026 18:56:44 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3787412276
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Apr 2026 18:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A7810E902;
	Thu, 16 Apr 2026 16:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Wt7Uc8DV";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA3010E8FF;
 Thu, 16 Apr 2026 16:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VAMs7rlBSaiNSscoEgpk4adl1TJRSox0dqWNZR973AY=; b=Wt7Uc8DVdEB/YkpYnJNGFuLM6E
 SjoE6+lOGepPbSYux0xhUVvhyMNOtXMbtWlxsf4eTXNp2mbTtSkuK1CoMoA5rTOwi0+Mp9giyAyVU
 DbC+GhRXyt/kucba9ejtSAfj0J+1IwmM3dgySjclNdmuEbuvMtlDcR5RYV/daHgnRY+zOxSGkUTpU
 mIkLyuMS5IISWZguw9wXUU1kkGL1zn/9x1hK6dSU+pcp1DDiENlmjBfFG4RFYEsfKX5HUQLM635fk
 d3y+UYb/KxJ5m3NguGlmGBSonJAB8Gto1BF+tvdCiLtThBSzr8cxSbUPN2lBtGHoDelL1oYjAJ9UF
 9j8p7SJQ==;
Received: from [186.208.73.228] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wDQ0g-00H5OP-GM; Thu, 16 Apr 2026 18:56:10 +0200
Message-ID: <ed695e84-88d9-49e4-a171-1372ecc84746@igalia.com>
Date: Thu, 16 Apr 2026 13:56:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/drm_atomic: duplicate colorop states if plane
 color pipeline in use
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, contact@emersion.fr,
 sebastian.wick@redhat.com, harry.wentland@amd.com, daniels@collabora.com
Cc: Alex Hung <alex.hung@amd.com>, Uma Shankar <uma.shankar@intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
References: <20260318163629.300627-1-mwen@igalia.com>
 <7139d8f8-36df-4951-a3c9-d82f6ac636be@intel.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <7139d8f8-36df-4951-a3c9-d82f6ac636be@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,emersion.fr,redhat.com,amd.com,collabora.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.962];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E3787412276
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 19/03/2026 03:38, Borah, Chaitanya Kumar wrote:
>
>
> On 3/18/2026 9:57 PM, Melissa Wen wrote:
>> For suspend/resume to work correctly, do for colorop state the same we
>> do for plane/crtc/connector states: duplicate the state of colorops in a
>> color pipeline if it's in use by a given plane when suspending and
>> restore cached colorop states when resuming.
>>
>> Fixes: 2afc3184f3b3 ("drm/plane: Add COLOR PIPELINE property")
>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>> Reviewed-by: Alex Hung <alex.hung@amd.com>
>> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>
>> Changes from v1 
>> (https://lore.kernel.org/dri-devel/20260316210055.234498-1-mwen@igalia.com/):
>> - keep the object hierarchy (Chaitanya)
>> - add r-b from Harry, Alex H. and Chaitanya (pending to confirm)
>>
>> Chaitanya,
>>
>> I kept the fix for unused-variable warning together because the warning
>> only appears with this new usage of for_each_new_colorop_in_state() in
>> drm_atomic_helper_commit_duplicated_state() here. Let me know if you
>> don't agree with this approach.
>>
>
> Please go ahead. Just add a "while at it" to the commit message.

Applied to drm-misc-fixes with the suggested change in the commit message.

Thanks!

Melissa

>
>> Melissa
>>
>> ---
>>   drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++++++++
>>   include/drm/drm_atomic.h            |  3 ++-
>>   2 files changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c 
>> b/drivers/gpu/drm/drm_atomic_helper.c
>> index 26953ed6b53e..481f92a03683 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -3751,6 +3751,13 @@ drm_atomic_helper_duplicate_state(struct 
>> drm_device *dev,
>>               err = PTR_ERR(plane_state);
>>               goto free;
>>           }
>> +
>> +        if (plane_state->color_pipeline) {
>> +            err = drm_atomic_add_affected_colorops(state, plane);
>> +            if (err)
>> +                goto free;
>> +        }
>> +
>>       }
>>         drm_connector_list_iter_begin(dev, &conn_iter);
>> @@ -3856,6 +3863,8 @@ int 
>> drm_atomic_helper_commit_duplicated_state(struct drm_atomic_state 
>> *state,
>>       int i, ret;
>>       struct drm_plane *plane;
>>       struct drm_plane_state *new_plane_state;
>> +    struct drm_colorop *colorop;
>> +    struct drm_colorop_state *new_colorop_state;
>>       struct drm_connector *connector;
>>       struct drm_connector_state *new_conn_state;
>>       struct drm_crtc *crtc;
>> @@ -3863,6 +3872,9 @@ int 
>> drm_atomic_helper_commit_duplicated_state(struct drm_atomic_state 
>> *state,
>>         state->acquire_ctx = ctx;
>>   +    for_each_new_colorop_in_state(state, colorop, 
>> new_colorop_state, i)
>> +        state->colorops[i].old_state = colorop->state;
>> +
>>       for_each_new_plane_in_state(state, plane, new_plane_state, i)
>>           state->planes[i].old_state = plane->state;
>>   diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
>> index 0b1b32bcd2bd..96fd32a3e92c 100644
>> --- a/include/drm/drm_atomic.h
>> +++ b/include/drm/drm_atomic.h
>> @@ -1102,7 +1102,8 @@ void drm_state_dump(struct drm_device *dev, 
>> struct drm_printer *p);
>>           for_each_if ((__state)->colorops[__i].ptr &&        \
>>                    ((colorop) = (__state)->colorops[__i].ptr,    \
>>                     (void)(colorop) /* Only to avoid 
>> unused-but-set-variable warning */, \
>> -                  (new_colorop_state) = 
>> (__state)->colorops[__i].new_state, 1))
>> +                  (new_colorop_state) = 
>> (__state)->colorops[__i].new_state,\
>> +                  (void)(new_colorop_state) /* Only to avoid 
>> unused-but-set-variable warning */, 1))
>>     /**
>>    * for_each_oldnew_plane_in_state - iterate over all planes in an 
>> atomic update
>

