Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B76719FF88
	for <lists+amd-gfx@lfdr.de>; Mon,  6 Apr 2020 22:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20581896BF;
	Mon,  6 Apr 2020 20:54:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 923 seconds by postgrey-1.36 at gabe;
 Mon, 06 Apr 2020 20:46:19 UTC
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726DC89932
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Apr 2020 20:46:19 +0000 (UTC)
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <daniel@iogearbox.net>)
 id 1jLYOQ-0002uT-5R; Mon, 06 Apr 2020 22:30:50 +0200
Received: from [178.195.186.98] (helo=pc-9.home)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1jLYOP-0003f1-Rk; Mon, 06 Apr 2020 22:30:49 +0200
Subject: Re: [PATCH] device_cgroup: Cleanup cgroup eBPF device filter code
To: Roman Gushchin <guro@fb.com>, Odin Ugedal <odin@ugedal.com>
References: <20200403175528.225990-1-odin@ugedal.com>
 <20200403223704.GA306670@carbon.dhcp.thefacebook.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <4264eb59-920e-20da-a256-23b6f0bbc95e@iogearbox.net>
Date: Mon, 6 Apr 2020 22:30:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200403223704.GA306670@carbon.dhcp.thefacebook.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.102.2/25774/Mon Apr  6 14:53:25 2020)
X-Mailman-Approved-At: Mon, 06 Apr 2020 20:54:52 +0000
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
Cc: Harish.Kasiviswanathan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-security-module@vger.kernel.org,
 tj@kernel.org, bpf@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 4/4/20 12:37 AM, Roman Gushchin wrote:
> On Fri, Apr 03, 2020 at 07:55:28PM +0200, Odin Ugedal wrote:
>> Original cgroup v2 eBPF code for filtering device access made it
>> possible to compile with CONFIG_CGROUP_DEVICE=n and still use the eBPF
>> filtering. Change
>> commit 4b7d4d453fc4 ("device_cgroup: Export devcgroup_check_permission")
>> reverted this, making it required to set it to y.
>>
>> Since the device filtering (and all the docs) for cgroup v2 is no longer
>> a "device controller" like it was in v1, someone might compile their
>> kernel with CONFIG_CGROUP_DEVICE=n. Then (for linux 5.5+) the eBPF
>> filter will not be invoked, and all processes will be allowed access
>> to all devices, no matter what the eBPF filter says.
>>
>> Signed-off-by: Odin Ugedal <odin@ugedal.com>
> 
> The patch makes perfect sense to me.
> 
> Acked-by: Roman Gushchin <guro@fb.com>

Tejun, I presume you'll pick this up (given the files this fix touches)?

Thanks,
Daniel
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
