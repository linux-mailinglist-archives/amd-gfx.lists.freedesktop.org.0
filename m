Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1D7A9813B
	for <lists+amd-gfx@lfdr.de>; Wed, 23 Apr 2025 09:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6C410E414;
	Wed, 23 Apr 2025 07:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.b="PsnDhtPJ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from omta034.useast.a.cloudfilter.net
 (omta034.useast.a.cloudfilter.net [44.202.169.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC65D10E5ED
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Apr 2025 14:58:44 +0000 (UTC)
Received: from eig-obgw-5008a.ext.cloudfilter.net ([10.0.29.246])
 by cmsmtp with ESMTPS
 id 7Au6u74KHXshw7F56u7f1M; Tue, 22 Apr 2025 14:58:40 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id 7F55uqns5UxvT7F55uR5uJ; Tue, 22 Apr 2025 14:58:39 +0000
X-Authority-Analysis: v=2.4 cv=SqKW6uO0 c=1 sm=1 tr=0 ts=6807ae9f
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=DefJii25N9YVshmqbOOoLg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7T7KSl7uo7wA:10
 a=PSu1ETixf5sBndSe_uoA:9 a=QEXdDO2ut3YA:10 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=362QBWDd5ZiO6ndloP1DpdL86Gvb0ZeD5+An3yP217A=; b=PsnDhtPJq1bDwtmaYnpreoHLlv
 C4KLDwbCRKFfmzeJlQInWUm9SAZVI14Segt9eVRE1tTKN79QBcfeg8geq/H9BMGFFdNCKNoaENe3K
 D61LSeoOQ0XciiRq8kbeICHVonQOX3RmVWj9mFGiT6/FvnkkjGSoB1okrR+QmXCy8w5lMILysxdju
 o0s4u79iVDzCcUIPoDxG2/auA9PlCU27824AHu93nr9YAxffUxxz7dFUsFKnIWs8QXRkH5FKrr/7E
 /OLuvdd2vVapd4msIxcFjjx1qaVwAIjj0ypNvAJAAoYzwIZ+s53Ww3vfDZub7wz56xDZOiH47Ha8I
 fkSI6Gog==;
Received: from [201.172.174.139] (port=39278 helo=[192.168.15.14])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.1)
 (envelope-from <gustavo@embeddedor.com>) id 1u7F53-00000003gRD-3TRS;
 Tue, 22 Apr 2025 09:58:38 -0500
Message-ID: <d07b4edc-6048-4c10-b8ac-dcccd5a932d3@embeddedor.com>
Date: Tue, 22 Apr 2025 08:58:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/amd/pm: Avoid multiple
 -Wflex-array-member-not-at-end warnings
To: Alex Deucher <alexdeucher@gmail.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kenneth Feng <kenneth.feng@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Kees Cook <keescook@chromium.org>
References: <Z678TNhCbTk363Tw@kspp>
 <864c7dd5-0deb-4adb-a1cf-c8a809514d7e@embeddedor.com>
 <217b00f5-d03d-4624-9ba9-d838199ef7b9@embeddedor.com>
 <CADnq5_M5Jv4A5CXAKY2Qd-dhrfmecnauRtVY_ghSsut7i=KNww@mail.gmail.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <CADnq5_M5Jv4A5CXAKY2Qd-dhrfmecnauRtVY_ghSsut7i=KNww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.174.139
X-Source-L: No
X-Exim-ID: 1u7F53-00000003gRD-3TRS
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.14]) [201.172.174.139]:39278
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGEjX3Ha7jdrsbUo2zILlCCjF/go0K1zdcqq1souDkY29pI9srs31K9xKKru2Ql9zutlfr03YclKTxcUvtQjxnrzmce3GmFkUmvkmhVkaxVfZOgzGA6R
 iC6ZbLzHMPiIxmB71141x/2iBkCX+M/pmly10ZDG4QRKxB1MlFMRisZSPKdO6Z+MtZgve0M5j7ZHjDNxWvoacxGNs6Y75TmjRl+ELZpNSxHoEJkkh3Xq6+Un
X-Mailman-Approved-At: Wed, 23 Apr 2025 07:38:20 +0000
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



On 16/04/25 09:04, Alex Deucher wrote:
> Can you resend, I can't seem to find the original emails.
> Additionally, all of the NISLANDS structures are unused in amdgpu, so
> those could be removed.

Okay, I'll take a look.

Thanks

-Gustavo
