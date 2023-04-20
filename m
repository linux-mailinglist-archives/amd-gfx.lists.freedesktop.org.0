Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EBE6E9875
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Apr 2023 17:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71AB610EC91;
	Thu, 20 Apr 2023 15:37:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39ABB10E07F
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Apr 2023 15:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vxTVIFedeaDzSeEN8LdVzAH2WZ08uoCdcejVk2bRSig=; b=J4bKaRgHrDJmsY0+rG+w3fGmT3
 2Hv3bNBQfVIUql3wgIpoLBgGI4rxML79SH1Nn41NFQ60/wFQwtrfR8s2nTGS8pRYFA+jBWZ9gIt4C
 6xkJGq68ZuBIIkgZg73vVvfcWw1SevMXWrB2J4p91pzy6M8kUZPvp4r1DXV7EtBK7ipPB19alCjbq
 GTfmS+McSON1H3g2c2bmYTo+OXpB716lBPSFPOOKSzfrAchuzOSVM7elzolmkohq0ahMP+L3BkHuX
 wqptzNGlJ6F+d7nrfs5UvaO2ekVcixQWqNsPqKVVnGKItDuhJThsr30JITPgpOQFKvn/MITv/y52d
 yfYUcUKQ==;
Received: from 201-92-79-199.dsl.telesp.net.br ([201.92.79.199]
 helo=[192.168.1.60]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ppWKP-0072VA-WA; Thu, 20 Apr 2023 17:36:11 +0200
Message-ID: <caf5bfc9-89d2-1320-4386-2c026ec3afcc@igalia.com>
Date: Thu, 20 Apr 2023 12:36:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 6.1.y] drm/amdgpu/vcn: Disable indirect SRAM on Vangogh
 broken BIOSes
Content-Language: en-US
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
References: <20230418221522.1287942-1-gpiccoli@igalia.com>
 <BL1PR12MB514405B37FC8691CB24F9DADF7629@BL1PR12MB5144.namprd12.prod.outlook.com>
 <be4babae-4791-11f3-1f0f-a46480ce3db2@igalia.com>
 <BL1PR12MB51443694A5FEFA899704B3EBF7629@BL1PR12MB5144.namprd12.prod.outlook.com>
 <9b9a28f5-a71f-bb17-8783-314b1d30c51f@igalia.com>
 <ZEEzNSEq-15PxS8r@kroah.com>
 <94b63d19-4151-c294-50eb-c325ea9c699f@igalia.com>
 <ZEFUGSlqQu3v8ryf@kroah.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <ZEFUGSlqQu3v8ryf@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 20 Apr 2023 15:37:44 +0000
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
Cc: "sashal@kernel.org" <sashal@kernel.org>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>, "Liu,
 Leo" <Leo.Liu@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 20/04/2023 12:02, gregkh@linuxfoundation.org wrote:
>> [...]
>>> Which "one" are you referring to here?
>>>
>>> confused,
>>>
>>> greg k-h
>>
>> This one, sent in this email thread.
> 
> I don't have "this email thread" anymore, remember, some of us get
> thousand+ emails a day...

I don't really understand the issue to be honest, we are talking in the
very email thread! The email was sent April/18, it's not old or anything.

But in any case, for reference, this is the original email from the lore
archives:
https://lore.kernel.org/stable/20230418221522.1287942-1-gpiccoli@igalia.com/

> 
>> The title of the patch is "drm/amdgpu/vcn: Disable indirect SRAM on
>> Vangogh broken BIOSes", target is 6.1.y and (one of the) upstream
>> hash(es) is 542a56e8eb44 heh
> 
> But that commit says it fixes a problem in the 6.2 tree, why is this
> relevant for 6.1.y?
> 

That is explained in the email and the very reason for that, is the
duplicate hashes we are discussing here.

The fix commit in question points the "Fixes:" tag to 82132ecc5432
("drm/amdgpu: enable Vangogh VCN indirect sram mode"), which appears to
be in 6.2 tree, right?

But notice that 9a8cc8cabc1e ("drm/amdgpu: enable Vangogh VCN indirect
sram mode") is the *same* offender and..is present on 6.1 !

In other words, when I first wrote this fix, I just checked the tree
quickly and came up with "Fixes: 82132ecc5432", but to be thorough, I
should have pointed the fixes tag to 9a8cc8cabc1e, to pick it on 6.1.y.


tl;dr: the offender is present on 6.1.y, but this fix is not, hence I'm
hereby requesting the merge. Some backport/context adjustment was
necessary and it was properly tested in the Steam Deck.

Thanks,


Guilherme
