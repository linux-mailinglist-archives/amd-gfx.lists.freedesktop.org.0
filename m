Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453947E490C
	for <lists+amd-gfx@lfdr.de>; Tue,  7 Nov 2023 20:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58EE10E66A;
	Tue,  7 Nov 2023 19:17:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 597 seconds by postgrey-1.36 at gabe;
 Tue, 07 Nov 2023 17:41:31 UTC
Received: from 6.mo576.mail-out.ovh.net (6.mo576.mail-out.ovh.net
 [46.105.50.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33CF10E634
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Nov 2023 17:41:31 +0000 (UTC)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.4.85])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id C31DB2D855
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Nov 2023 17:26:12 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-xkfc9 (unknown [10.109.138.121])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 6B5531FDBB;
 Tue,  7 Nov 2023 17:26:11 +0000 (UTC)
Received: from RCM-web9.webmail.mail.ovh.net ([151.80.29.21])
 by ghost-submission-6684bf9d7b-xkfc9 with ESMTPSA
 id HPouDjNzSmXyXQEAGls1mg
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 07 Nov 2023 17:26:11 +0000
MIME-Version: 1.0
Date: Tue, 07 Nov 2023 19:26:10 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] drm/amd/pm: clean up redundant comparisons with 0
In-Reply-To: <98e8490e-6608-47a8-890c-f1fe894dac7f@roeck-us.net>
References: <20231107082910.92508-1-jose.pekkarinen@foxhound.fi>
 <98e8490e-6608-47a8-890c-f1fe894dac7f@roeck-us.net>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <65d132b0dbef66039fd6938ecbc2bf68@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 185.220.102.4
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8301260013758293697
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddujedgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeggfffhvfevufgjfhgfkfigohhitgfgsehtkehjtddtreejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepkefhgeduudefgedvleegtddvffeghedvtdekveekjeevvdegiedtfeelhedtiedtnecukfhppeduvdejrddtrddtrddupddukeehrddvvddtrddutddvrdegpdduhedurdektddrvdelrddvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegrmhguqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
X-Mailman-Approved-At: Tue, 07 Nov 2023 19:17:01 +0000
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, skhan@linuxfoundation.org,
 alexander.deucher@amd.com, evan.quan@amd.com, airlied@gmail.com,
 christian.koenig@amd.com, linux-kernel-mentees@lists.linux.dev
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 2023-11-07 16:08, Guenter Roeck wrote:
> On 11/7/23 00:29, José Pekkarinen wrote:
>> There is a couple of function return checks of functions that return
>> unsigned values, and local variables to hold them are also unsigned, 
>> so
>> checking if they are negative will always return false. This patch 
>> will
>> remove them, as well as the never reached code.
>> 
>> drivers/gpu/drm/amd/pm/amdgpu_pm.c:2801:5-8: WARNING: Unsigned 
>> expression compared with zero: val < 0
>> drivers/gpu/drm/amd/pm/amdgpu_pm.c:2814:5-8: WARNING: Unsigned 
>> expression compared with zero: val < 0
>> 
>> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
>> ---
>>   drivers/gpu/drm/amd/pm/amdgpu_pm.c | 4 ----
>>   1 file changed, 4 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c 
>> b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>> index 8bb2da13826f..e7bb1d324084 100644
>> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>> @@ -2798,8 +2798,6 @@ static ssize_t 
>> amdgpu_hwmon_show_power_avg(struct device *dev,
>>   	unsigned int val;
>>     	val = amdgpu_hwmon_get_power(dev, 
>> AMDGPU_PP_SENSOR_GPU_AVG_POWER);
>> -	if (val < 0)
>> -		return val;
>> 
> 
> This is reporting errors returned from amdgpu_hwmon_get_power() as
> large integers.

     Alright, that case it is a false positive, thanks for the comment!

     José.
