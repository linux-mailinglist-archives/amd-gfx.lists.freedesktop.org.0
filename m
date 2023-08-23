Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD859785F1A
	for <lists+amd-gfx@lfdr.de>; Wed, 23 Aug 2023 20:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343D210E004;
	Wed, 23 Aug 2023 18:03:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8F110E004;
 Wed, 23 Aug 2023 18:03:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 89C7064C34;
 Wed, 23 Aug 2023 18:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C5FC433C9;
 Wed, 23 Aug 2023 18:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692813810;
 bh=cLsrdluLa3UfuSk6odVJcvVGoDHlOfLYgy6k8Inaock=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pR6SyvVWfeSZvt4t3tidZtFCY5Hddij8mUCsXhVyVkVrrdzlh4RzEO6iLGs6ba2fq
 +OaYOx4a0wl1FDBByC8VK0kLuqydjUp5bE4jvUUEN9QYl4b4OW2I50sFgidaw0AWNE
 jZHDNVc06rdj1Ydo5ypA8xKOBtO9Wj+Jqn5tl5sXeRlYeaJyu/ydaybjMblmUb/U9C
 lJTbFvrcvCJhfGLLM74z/kS0w+YzMxIvvFUP95wsVG6NJnKyrinQ1HHR4io1b/5k/o
 Sy80REl/zqSP2gjFVnKO68B2TEmt3aXoQBeVANHmWk1ZkNSdFVEkoiL88pHBI1OtT9
 YT23EIt8+FJ1w==
Date: Wed, 23 Aug 2023 14:03:28 -0400
From: Sasha Levin <sashal@kernel.org>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH AUTOSEL 6.4 09/11] drm/amdkfd: ignore crat by default
Message-ID: <ZOZJ8LmPgd5PqQgf@sashalap>
References: <20230822113553.3551206-1-sashal@kernel.org>
 <20230822113553.3551206-9-sashal@kernel.org>
 <BN9PR12MB5146FBE3E3940F3AB59EA79DF71FA@BN9PR12MB5146.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <BN9PR12MB5146FBE3E3940F3AB59EA79DF71FA@BN9PR12MB5146.namprd12.prod.outlook.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Mike Lothian <mike@fireburn.co.uk>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Aug 22, 2023 at 03:41:17PM +0000, Deucher, Alexander wrote:
>[Public]
>
>> -----Original Message-----
>> From: Sasha Levin <sashal@kernel.org>
>> Sent: Tuesday, August 22, 2023 7:36 AM
>> To: linux-kernel@vger.kernel.org; stable@vger.kernel.org
>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Kuehling, Felix
>> <Felix.Kuehling@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>;
>> Mike Lothian <mike@fireburn.co.uk>; Sasha Levin <sashal@kernel.org>; Pan,
>> Xinhui <Xinhui.Pan@amd.com>; airlied@gmail.com; daniel@ffwll.ch; amd-
>> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Subject: [PATCH AUTOSEL 6.4 09/11] drm/amdkfd: ignore crat by default
>>
>> From: Alex Deucher <alexander.deucher@amd.com>
>>
>> [ Upstream commit a6dea2d64ff92851e68cd4e20a35f6534286e016 ]
>>
>> We are dropping the IOMMUv2 path, so no need to enable this.
>> It's often buggy on consumer platforms anyway.
>>
>
>This is not needed for stable.

I'll drop all the patches you've pointed out, thanks!

-- 
Thanks,
Sasha
