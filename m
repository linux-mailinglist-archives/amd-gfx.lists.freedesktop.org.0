Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D85C7824CF
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Aug 2023 09:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C729A10E207;
	Mon, 21 Aug 2023 07:46:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by gabe.freedesktop.org (Postfix) with SMTP id D783310E1F5;
 Mon, 21 Aug 2023 06:52:38 +0000 (UTC)
Received: from [172.30.11.106] (unknown [180.167.10.98])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id E04366061F6CA; 
 Mon, 21 Aug 2023 14:52:34 +0800 (CST)
Message-ID: <e07b89c3-4a1b-67e6-c434-7c8aef62d68e@nfschina.com>
Date: Mon, 21 Aug 2023 14:52:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/amdgpu: Avoid possible buffer overflow
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <7ac675b6-a000-6ad7-36f3-a3ce186414b6@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 21 Aug 2023 07:46:03 +0000
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
Cc: yifan1.zhang@amd.com, guchun.chen@amd.com, lijo.lazar@amd.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, le.ma@amd.com, dri-devel@lists.freedesktop.org,
 Yuliang.Shi@amd.com, candice.li@amd.com, Hawking.Zhang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 2023/8/21 14:47, Christophe JAILLET wrote:
> Le 21/08/2023 à 08:19, Su Hui a écrit :
>> smatch error:
>> drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1257 
>> amdgpu_discovery_reg_base_init() error:
>> testing array offset 'adev->vcn.num_vcn_inst' after use.
>>
>> change the assignment order to avoid buffer overflow.
>>
>> Fixes: c40bdfb2ffa4 ("drm/amdgpu: fix incorrect VCN revision in SRIOV")
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> index 8e1cfc87122d..ba95526c3d45 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> @@ -1250,11 +1250,12 @@ static int 
>> amdgpu_discovery_reg_base_init(struct amdgpu_device *adev)
>>                    *     0b10 : encode is disabled
>>                    *     0b01 : decode is disabled
>>                    */
>> - adev->vcn.vcn_config[adev->vcn.num_vcn_inst] =
>> -                    ip->revision & 0xc0;
>> +
>>                   ip->revision &= ~0xc0;
>>                   if (adev->vcn.num_vcn_inst <
>>                       AMDGPU_MAX_VCN_INSTANCES) {
>> + adev->vcn.vcn_config[adev->vcn.num_vcn_inst] =
>> +                        ip->revision & 0xc0;
>
> Hi,
> I don't think that the patch is correct.
>
> Because of the "ip->revision &= ~0xc0" which is now above it, 
> "ip->revision & 0xc0" should now always be 0.
>
> Maybe both lines should be moved within the "if"?
>
> CJ

Hi,

Oh, really sorry for this, I just missed this line.
you are right, I will send v2 soon.
Thanks for your reminder!

Su Hui

>
>
>
>
>
>> adev->vcn.num_vcn_inst++;
>>                       adev->vcn.inst_mask |=
>>                           (1U << ip->instance_number);
>
