Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C909568770C
	for <lists+amd-gfx@lfdr.de>; Thu,  2 Feb 2023 09:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DED10E03A;
	Thu,  2 Feb 2023 08:13:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B016C10E1D0
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 Feb 2023 05:19:06 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 14D823200907;
 Thu,  2 Feb 2023 00:19:03 -0500 (EST)
Received: from imap50 ([10.202.2.100])
 by compute6.internal (MEProxy); Thu, 02 Feb 2023 00:19:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1675315142; x=1675401542; bh=qlB8J5fcQ9
 pWFGZPh4fvEz5uOnYTgBjr7dz+WP8j5yc=; b=Dkrt63HtIe6vqployzDjAFGg6L
 YWsfnUolSV9YToK6J0XcZpBbyRMwKffcs6c6PspuyKxA5FDVZmhNC2zBMyZ19tqQ
 uazskdwpzP7acDAdBylGVWotvR+xame+DNvgfuxdPWtKW9iG9xgFMNIvPD0gKMpR
 fko2tgLTCHv4SFzLW2yH1j4HY4lXQVILhYGFaKF7Gf7Ia9tY1GYYygJJq5jHJ4zJ
 eDsbHKRKRaHPRFTjWHp7o7eKDOAV+ThsTX4FTc92LnvCtG1G0uiGNjqgqDphaLDj
 GfjlCuQtpqb9VScZ/fmse+7Yp9t6atvCYqGf/1OpOKgktIpRZOtnO/BD2T3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1675315142; x=1675401542; bh=qlB8J5fcQ9pWFGZPh4fvEz5uOnYT
 gBjr7dz+WP8j5yc=; b=Brz+nTBfPhT7mfU2URl1sQT+Gn+skyv9wCEli/6Rgu+6
 EVU+zWfliZW6k4izI6Hl26mlHhCVnivLV+ld+4PdePm1D97vISJwK97lXhtm5h/J
 UCCSQJT+MpZezEylekW2/7qbrEkbDiXbLbL6Y6HHB/QJZ+AJZQfV2m2OYDrSrdTt
 ZELV3Nwd5h9ldz6t/7wmo0sr/3TAEM32x0ts3uYHppxdLeAnyOn4AF/42B2ObMRh
 RFBIreOxwdAv8MnrCVONw2iZYwt6UPZPgc+meIu4tWHWtVqO39jzlcfDxHyS4vsc
 yJAs9i7HGv/jgY27K0Fx4xBcdJJrXd8jHdNP4wxnng==
X-ME-Sender: <xms:xkfbY3GLvG03Yvc7lDMoY4m0yFTOUpnLTq4PeyavsBv49HJYZ20eSA>
 <xme:xkfbY0UBsfDzpqQACwkLaAGnxZsw3tAGOVfopqDnA6jXhm87o69vG3P3luH-qyrxo
 -JuMHpc9-cUH8bC8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefjedgkeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpeeujedvleduveetfffhlefhtdfgfedvteffhefhtedtheeffefggeei
 fedvheehhfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhoiihlrggsshdrohhrgh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgu
 rhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:xkfbY5LgfXvw1p-Z0x93AFPz6dQvAP8X_Mg835dKllBOCGvaYO0WQw>
 <xmx:xkfbY1E215NRPYIJpqDp6dXQF6PmZZIBKleovQk9FN5piRGEm3v2LA>
 <xmx:xkfbY9WqXtrtEDIk8nPnHLUzZf_JjSCOfvCOp8DrJj4iYtUWashmbg>
 <xmx:xkfbY2OcSQi637wFrBWuNAma7rjwfzhtm43HxYrfBxju2yj6GU2CkA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 413C81700089; Thu,  2 Feb 2023 00:19:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-107-g82c3c54364-fm-20230131.002-g82c3c543
Mime-Version: 1.0
Message-Id: <8f165a30-4adc-4a39-a467-4cd3d466e850@app.fastmail.com>
In-Reply-To: <TY2PR06MB321334CFD4ED1BD4AF97965380D69@TY2PR06MB3213.apcprd06.prod.outlook.com>
References: <63da97b5.3V1HSQEat507LFIr%lkp@intel.com>
 <76f4dea0-9a39-4238-a213-0167477f5d54@app.fastmail.com>
 <TY2PR06MB321334CFD4ED1BD4AF97965380D69@TY2PR06MB3213.apcprd06.prod.outlook.com>
Date: Thu, 02 Feb 2023 15:48:35 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Neal Liu" <neal_liu@aspeedtech.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 66eee64b235411d512bed4d672c2d00683239daf
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 02 Feb 2023 08:13:07 +0000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 kbuild test robot <lkp@intel.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
 Linux Memory Management List <linux-mm@kvack.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>



On Thu, 2 Feb 2023, at 13:29, Neal Liu wrote:
>> Hi Neal,
>> 
>> On Thu, 2 Feb 2023, at 03:17, kernel test robot wrote:
>> > tree/branch:
>> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> > master
>> > branch HEAD: 66eee64b235411d512bed4d672c2d00683239daf  Add
>> linux-next
>> > specific files for 20230201
>> >
>> >
>> > Unverified Error/Warning (likely false positive, please contact us if
>> > interested):
>> >
>> > drivers/crypto/aspeed/aspeed-acry.c:295:37: sparse: sparse: incorrect
>> > type in assignment (different base types)
>> > drivers/crypto/aspeed/aspeed-acry.c:305:28: sparse: sparse: cast
>> > removes address space '__iomem' of expression
>> > drivers/crypto/aspeed/aspeed-acry.c:606:24: sparse: sparse: symbol
>> > 'aspeed_acry_akcipher_algs' was not declared. Should it be static?
>> 
>> Can you please look into these issues with the ACRY driver?
>> 
>> Cheers,
>> 
>> Andrew
>
> I just send patch to fix the first 2 warnings,

Thanks.

> and the last one warning 
> is already fixed by another patch.
> [PATCH-next] crypto: aspeed: fix type warnings
> https://patchwork.ozlabs.org/project/linux-aspeed/patch/20230119014859.1900136-1-yangyingliang@huawei.com/
> Thanks
>

Great!

Andrew
