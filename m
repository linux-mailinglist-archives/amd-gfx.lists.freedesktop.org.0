Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009384D971B
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Mar 2022 10:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0112510E972;
	Tue, 15 Mar 2022 09:05:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744F310E96F;
 Tue, 15 Mar 2022 09:05:35 +0000 (UTC)
Received: from [192.168.0.3] (ip5f5ae8f9.dynamic.kabel-deutschland.de
 [95.90.232.249])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id A107361EA1923;
 Tue, 15 Mar 2022 10:05:33 +0100 (CET)
Message-ID: <cd074d23-ee36-dd5f-bde5-1f5dd41a76be@molgen.mpg.de>
Date: Tue, 15 Mar 2022 10:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm: Fix a infinite loop condition when order becomes 0
Content-Language: en-US
To: Arunpravin.PaneerSelvam@amd.com
References: <20220314194049.534471-1-Arunpravin.PaneerSelvam@amd.com>
 <0b9a8cc2-2f34-48c9-7960-727615eb2edb@molgen.mpg.de>
 <1e410ba3-60d9-6a09-6a5d-625145c1c80a@amd.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <1e410ba3-60d9-6a09-6a5d-625145c1c80a@amd.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, daniel@ffwll.ch, alexander.deucher@amd.com,
 christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Dear Arunpravin,


Am 15.03.22 um 10:01 schrieb Arunpravin:

> On 15/03/22 1:49 pm, Paul Menzel wrote:

>> Am 14.03.22 um 20:40 schrieb Arunpravin:
>>> handle a situation in the condition order-- == min_order,
>>> when order = 0, leading to order = -1, it now won't exit
>>> the loop. To avoid this problem, added a order check in
>>> the same condition, (i.e) when order is 0, we return
>>> -ENOSPC
>>>
>>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>>
>> Please use your full name.
> okay

You might also configure that in your email program.

>>> ---
>>>    drivers/gpu/drm/drm_buddy.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index 72f52f293249..5ab66aaf2bbd 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>
>> In what tree is that file?
>>
> drm-tip - https://cgit.freedesktop.org/drm-tip/tree/
> drm-misc-next - https://cgit.freedesktop.org/drm/drm-misc/tree/
> 
>>> @@ -685,7 +685,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>    			if (!IS_ERR(block))
>>>    				break;
>>>    
>>> -			if (order-- == min_order) {
>>> +			if (!order || order-- == min_order) {
>>>    				err = -ENOSPC;
>>>    				goto err_free;
>>>    			}

Thank you for the hint. So the whole function is:

	do {
		order = min(order, (unsigned int)fls(pages) - 1);
		BUG_ON(order > mm->max_order);
		BUG_ON(order < min_order);

		do {
			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
				/* Allocate traversing within the range */
				block = alloc_range_bias(mm, start, end, order);
			else
				/* Allocate from freelist */
				block = alloc_from_freelist(mm, order, flags);

			if (!IS_ERR(block))
				break;

			if (order-- == min_order) {
				err = -ENOSPC;
				goto err_free;
			}
		} while (1);

		mark_allocated(block);
		mm->avail -= drm_buddy_block_size(mm, block);
		kmemleak_update_trace(block);
		list_add_tail(&block->link, &allocated);

		pages -= BIT(order);

		if (!pages)
			break;
	} while (1);

Was the BUG_ON triggered for your case?

	BUG_ON(order < min_order);

Please give more details.


Kind regards,

Paul
