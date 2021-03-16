Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3657E33D534
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Mar 2021 14:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B2789F8B;
	Tue, 16 Mar 2021 13:53:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23016E239
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Mar 2021 08:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615883878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZwYMPkghKSi78ypCL3Mf4zRzURyEmjf0Bxk8gD4fMyM=;
 b=MtHquEMpqAuAJfFG4Jo4q8PLCK1keAWIfwcUA8Ihku6pqEAJmyDMWZ2bzp209YrLnksfO9
 CY0aZSxOVWFLE14fEJPKr35h20ddX5SNIcDh13UZtFEajYwLIsWdrZAo30K/ZZMgafxiav
 tgnH6HIzK9elUlf4/4bdjobuCrX9zQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-dlWIF-f9MoiE1W-ClZevFw-1; Tue, 16 Mar 2021 04:37:52 -0400
X-MC-Unique: dlWIF-f9MoiE1W-ClZevFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E845192D78C;
 Tue, 16 Mar 2021 08:37:51 +0000 (UTC)
Received: from [10.36.114.203] (ovpn-114-203.ams2.redhat.com [10.36.114.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E63460C13;
 Tue, 16 Mar 2021 08:37:48 +0000 (UTC)
Subject: Re: slow boot with 7fef431be9c9 ("mm/page_alloc: place pages to tail
 in __free_pages_core()")
To: "Liang, Liang (Leo)" <Liang.Liang@amd.com>,
 Mike Rapoport <rppt@linux.ibm.com>
References: <MW3PR12MB4537B49678884A1EB1F75AB5F36E9@MW3PR12MB4537.namprd12.prod.outlook.com>
 <0AE49D98-171A-42B9-9CFC-9193A9BD3346@redhat.com>
 <YEzCm/Uwvw7kKpd7@linux.ibm.com>
 <22437770-956e-f7b4-a8f6-3f1cc28c3ec2@redhat.com>
 <MW3PR12MB45371072D7C3FDA6986C6318F36B9@MW3PR12MB4537.namprd12.prod.outlook.com>
 <YFBVNEC7jMZxwleL@linux.ibm.com>
 <MW3PR12MB453781F0AD49AF3787DE4230F36B9@MW3PR12MB4537.namprd12.prod.outlook.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <0cc972a1-5b40-3017-33f8-b2610489ee18@redhat.com>
Date: Tue, 16 Mar 2021 09:37:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <MW3PR12MB453781F0AD49AF3787DE4230F36B9@MW3PR12MB4537.namprd12.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mailman-Approved-At: Tue, 16 Mar 2021 13:53:10 +0000
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 George Kennedy <george.kennedy@oracle.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 16.03.21 09:00, Liang, Liang (Leo) wrote:
> [AMD Public Use]
> 
> Hi Mike,
> 
> Thanks for help. The patch works for me and boot time back to normal. So it's a fix, or just WA?

Hi Leo,

excluding up to 16 MiB of memory on every system just because that 
single platform is weird is not acceptable.

I think we have to figure out

a) why that memory is so special. This is weird.
b) why the platform doesn't indicate it in a special way. Why is it 
ordinary system RAM but still *that* slow?
c) how we can reliably identify such memory and exclude it.

I'll have a peek at the memory layout of that machine from boot logs 
next to figure out if we can answer any of these questions.

Just to verify: this does happen on multiple machines, not just a single 
one? (i.e., we're not dealing with faulty RAM)

-- 
Thanks,

David / dhildenb

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
