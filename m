Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEIPHHKKumnSXgIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Mar 2026 12:20:18 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DA02BAB65
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Mar 2026 12:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400E710E70D;
	Wed, 18 Mar 2026 11:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="KE88e9PE";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302DD10E70D;
 Wed, 18 Mar 2026 11:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JanA/2zZHMXyx7fH3vCfbO7hGHIw8EbQlWf2MIpaceo=; b=KE88e9PEvvCAIFUz5D3uwwpV6K
 WLxWeCiZZTpORLHaZrWTJXRgKwQg9qAn3Khe8Ah0gkpP1SDvxuxFO6pxuLxuWv4gAmEuybtevDnxR
 aXnFAMFhrsMucGxecPzF9Yq3oH6xgY74GFxse8BQ2kY1ICSI7PKJD5gt/0Y7w0pF4L9382UN+SK5T
 KSazDW6dQExblM9TRjKnTj6H0CdxqcijxGe42RF+PMrQyGAAuqbxI3/tnAUp24PMi6Zv9rEuyKC1z
 Hz0jK56p1KyXtFV/UE1mVo8menlM49nS/6/bmrmm1ZgL/dZFJCj/cKYIpdrs199DH0R29KrjehukM
 4GFqiYiQ==;
Received: from [186.208.74.38] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1w2owD-002kcI-9S; Wed, 18 Mar 2026 12:19:45 +0100
Message-ID: <41100150-a533-4efa-a04a-b015fdfc5622@igalia.com>
Date: Wed, 18 Mar 2026 08:19:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/drm_atomic: duplicate colorop states if plane color
 pipeline in use
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, contact@emersion.fr,
 harry.wentland@amd.com, alex.hung@amd.com, sebastian.wick@redhat.com,
 daniels@collabora.com
Cc: Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20260316210055.234498-1-mwen@igalia.com>
 <9c04afcc-cf00-4dfb-b358-414da5c13f4b@intel.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <9c04afcc-cf00-4dfb-b358-414da5c13f4b@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,emersion.fr,amd.com,redhat.com,collabora.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,igalia.com:email,igalia.com:mid]
X-Rspamd-Queue-Id: C7DA02BAB65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 18/03/2026 06:21, Borah, Chaitanya Kumar wrote:
>
>
> On 3/17/2026 2:22 AM, Melissa Wen wrote:
>> For suspend/resume to work correctly, do for colorop state the same we
>> do for plane/crtc/connector states: duplicate the state of colorops in a
>> color pipeline if it's in use by a given plane when suspending and
>> restore cached colorop states when resuming.
>>
>> Fixes: 2afc3184f3b3 ("drm/plane: Add COLOR PIPELINE property")
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>
>> Hi,
>>
>> I've been working on making gamescope use KMS plane color API, instead
>> of AMD driver-specific color properties [1] and I found this issue
>> during Steam Deck suspend/resume process.
>>
>> Initially I thought I should also set plane color_mgmt_changed to make
>> AMD driver reprogram the color state, but looks like it's not needed
>> (still testing). Therefore, I think the change here is enough to fix it.
>>
>> It applies on top of drm-misc-next and is inspired by commit
>> 6955d6bca053 ("drm/atomic: Add affected colorops with affected planes").
>>
>> [1] https://github.com/ValveSoftware/gamescope/pull/2113
>>
>>   drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++++++++
>>   include/drm/drm_atomic.h            |  3 ++-
>>   2 files changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c 
>> b/drivers/gpu/drm/drm_atomic_helper.c
>> index 26953ed6b53e..683a0e207f71 100644
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
>> @@ -3866,6 +3875,9 @@ int 
>> drm_atomic_helper_commit_duplicated_state(struct drm_atomic_state 
>> *state,
>>       for_each_new_plane_in_state(state, plane, new_plane_state, i)
>>           state->planes[i].old_state = plane->state;
>>   +    for_each_new_colorop_in_state(state, colorop, 
>> new_colorop_state, i)
>> +        state->colorops[i].old_state = colorop->state;
>> +
>
> Nit: Just to maintain the object hierarchy this could be moved above 
> planes.

Ack

>
>>       for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
>>           state->crtcs[i].old_state = crtc->state;
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
>>
>
> Perhaps this should move to a separate patch.

As the unused-variable warning didn't appear without the 
drm_atomic_helper.c changes made here, I think keeping them together is 
the best for context.
I mean, the problem doesn't exist before.

Thanks for reviewing,

Melissa

>
> Otherwise, the changes LGTM.
>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>
>
>>   /**
>>    * for_each_oldnew_plane_in_state - iterate over all planes in an 
>> atomic update
>

