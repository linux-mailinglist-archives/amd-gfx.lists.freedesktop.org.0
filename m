Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF119BFF87
	for <lists+amd-gfx@lfdr.de>; Thu,  7 Nov 2024 09:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E3110E7CE;
	Thu,  7 Nov 2024 08:03:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com
 [45.249.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250F710E091;
 Thu,  7 Nov 2024 01:22:15 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4XkPS22hLjz4f3jXs;
 Thu,  7 Nov 2024 09:21:54 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 553381A0196;
 Thu,  7 Nov 2024 09:22:12 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
 by APP4 (Coremail) with SMTP id gCh0CgCXc4dBFixn_B1EBA--.54545S3;
 Thu, 07 Nov 2024 09:22:11 +0800 (CST)
Subject: Re: [PATCH 6.6 28/28] maple_tree: correct tree corruption on spanning
 store
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Yu Kuai <yukuai1@huaweicloud.com>
Cc: stable@vger.kernel.org, gregkh@linuxfoundation.org,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, viro@zeniv.linux.org.uk,
 brauner@kernel.org, Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 hughd@google.com, willy@infradead.org, sashal@kernel.org,
 srinivasan.shanmugam@amd.com, chiahsuan.chung@amd.com, mingo@kernel.org,
 mgorman@techsingularity.net, chengming.zhou@linux.dev,
 zhangpeng.00@bytedance.com, chuck.lever@oracle.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 maple-tree@lists.infradead.org, linux-mm@kvack.org, yi.zhang@huawei.com,
 yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20241024132009.2267260-1-yukuai1@huaweicloud.com>
 <20241024132225.2271667-1-yukuai1@huaweicloud.com>
 <20241024132225.2271667-13-yukuai1@huaweicloud.com>
 <7740a098-fe11-48f1-a693-df81ef769f08@lucifer.local>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <b677017c-81fb-0f3d-22b6-34d93c59942a@huaweicloud.com>
Date: Thu, 7 Nov 2024 09:22:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7740a098-fe11-48f1-a693-df81ef769f08@lucifer.local>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgCXc4dBFixn_B1EBA--.54545S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXFWUAw4kuF1kGw1kXFW8JFb_yoW5Krykpa
 yDGFWakr4DtF1xuF1vk3y0vas0y3s5tFWrJry5Kw10yF98tF9IqF9Y9w1YvFZ8uw4UGr1I
 vFWYvanrCanayFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUB214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWrXVW3AwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
 kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRJMa0UUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-Mailman-Approved-At: Thu, 07 Nov 2024 08:03:03 +0000
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

Hi,

�� 2024/11/06 23:02, Lorenzo Stoakes д��:
> On Thu, Oct 24, 2024 at 09:22:25PM +0800, Yu Kuai wrote:
> 
>> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
>> index 5328e08723d7..c57b6fc4db2e 100644
>> --- a/lib/maple_tree.c
>> +++ b/lib/maple_tree.c
>> @@ -2239,6 +2239,8 @@ static inline void mas_node_or_none(struct ma_state *mas,
>>
>>   /*
>>    * mas_wr_node_walk() - Find the correct offset for the index in the @mas.
>> + *                      If @mas->index cannot be found within the containing
>> + *                      node, we traverse to the last entry in the node.
>>    * @wr_mas: The maple write state
>>    *
>>    * Uses mas_slot_locked() and does not need to worry about dead nodes.
>> @@ -3655,7 +3657,7 @@ static bool mas_wr_walk(struct ma_wr_state *wr_mas)
>>   	return true;
>>   }
>>
>> -static bool mas_wr_walk_index(struct ma_wr_state *wr_mas)
>> +static void mas_wr_walk_index(struct ma_wr_state *wr_mas)
>>   {
>>   	struct ma_state *mas = wr_mas->mas;
>>
>> @@ -3664,11 +3666,9 @@ static bool mas_wr_walk_index(struct ma_wr_state *wr_mas)
>>   		wr_mas->content = mas_slot_locked(mas, wr_mas->slots,
>>   						  mas->offset);
>>   		if (ma_is_leaf(wr_mas->type))
>> -			return true;
>> +			return;
>>   		mas_wr_walk_traverse(wr_mas);
>> -
>>   	}
>> -	return true;
>>   }
>>   /*
>>    * mas_extend_spanning_null() - Extend a store of a %NULL to include surrounding %NULLs.
>> @@ -3899,8 +3899,8 @@ static inline int mas_wr_spanning_store(struct ma_wr_state *wr_mas)
>>   	memset(&b_node, 0, sizeof(struct maple_big_node));
>>   	/* Copy l_mas and store the value in b_node. */
>>   	mas_store_b_node(&l_wr_mas, &b_node, l_mas.end);
>> -	/* Copy r_mas into b_node. */
>> -	if (r_mas.offset <= r_mas.end)
>> +	/* Copy r_mas into b_node if there is anything to copy. */
>> +	if (r_mas.max > r_mas.last)
>>   		mas_mab_cp(&r_mas, r_mas.offset, r_mas.end,
>>   			   &b_node, b_node.b_end + 1);
>>   	else
>> --
>> 2.39.2
>>
> 
> This is a good example of where you've gone horribly wrong, this relies on
> 31c532a8af57 ("maple_tree: add end of node tracking to the maple state") which
> is not in 6.6.
> 
> You reverted (!!) my backported patch for this that _does not require this_
> only to pull in 31c532a8af57 in order to apply the upstream version of my
> fix over that.
> 
> This is totally unnecessary and I can't see why _on earth_ you would need
> 31c532a8af57.
> 
> You need to correctly identify what patches need to be backported and _fix
> merge conflicts_ accordingly, like I did with the patch that you decided to
> revert.
> 
> In the kernel it is absolutely unacceptable to arbitrarily backport huge
> amounts of patches you don't understand in order to avoid merge conflicts,
> you may be breaking all kinds of things without realising.
> 
> You have to find the _minimal_ change and _fix merge conflicts_.

Thanks for the suggestions, I do understand, however, I'll just give up
this because I'm not confident to fix confilcts for maple tree. Other
folks will have to this if they care about this cve for v6.6.
> 
> Stable is not a playground, it's what millions (billions?) of kernels rely
> upon.
> 
> In any case, I think Liam's reply suggests that we should be looking at
> maybe 1 thing to backport? If we even need to?

Keep using xarray for patch 27 is wrong, I think. xarray is 32-bit and
if the offset overflow, readdir will found nothing, this is more severe
than the orignal cve.
> 
> Please in future be more cautious, and if you are unsure how to proceed,
> cc- the relevant maintainers (+ all authors of patches you intend to
> backport/revert) in an RFC. Thanks.

Of course.

Thanks,
Kuai

> 
> .
> 

