Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E2E4CF382
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Mar 2022 09:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F0B10E1C5;
	Mon,  7 Mar 2022 08:26:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C06010E1A3
 for <amd-gfx@lists.freedesktop.org>; Mon,  7 Mar 2022 03:52:42 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C20F658010F;
 Sun,  6 Mar 2022 22:52:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 06 Mar 2022 22:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=turner.link; h=
 cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=bwDctYCk0Fg/pF78gRaQUi8ymG1aY/DQC+BW/U
 UN48c=; b=dweBiPbo/ulGMiJYLHMNoYgpNsCzKA9axIatIkN33eaeKPHOcBXt5i
 AJe0xaZ+JWtAISpeA7rTaISlmZuAHEyGHG+yCvs8SFTy0PuUas/9brKq2dFfR34L
 ay8fKKKymtuyTY3qUuGthMmrC8lY/Rgl3PzfRtUO6f6HrViEZ3CnMOEChzAWoNDF
 VUS9QPBPD+yUcghpY09ONyNs2cErywxyPZpN5Sx+X/qPpuYECtU2qru4IGkAzFX1
 Pv30QjBmuqB596TA5ZZ+OOrfKLZHGoD2qJxp2WJac0cL4YkKUEYzb5PN3j6kGIUl
 jneXzG2ZVy/4AnQpIQwbUQn8V9QRRuXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bwDctYCk0Fg/pF78g
 RaQUi8ymG1aY/DQC+BW/UUN48c=; b=WfHzcjOoiiCcGMm3x8k7VhFtOPE/fB8By
 pWIcRF2B5Kr4KBIzRk/3DOVM+ejebImh3v+r8tS1XTd12QVoi6fRquF/5/50wSIP
 kxG9o+qz/bT2CjqXadDohi+UC//+2Gd/6NPR2WoRpZeJPdS2Na5BVAosy7AnqWyh
 7mx5ui4a8ez1nvnk7TQ7ULvddigoMWUhg4YEtp4uqlW36nZujqTU7Zo5Je2IH1hL
 REy2n7ZofkWAz1mJmIEdDnwrUHX5l1atQJwiDODhJyhMvMBjIEG+1cW1DJm+iM0x
 8qZ/QQQpcG6XVJ9OCAdB3YABTuQetYwZT58v0b4EKOQhU5Swwb3Xw==
X-ME-Sender: <xms:h4ElYvR3eeo-IrQIsa8Y76T_YeKtDGdWJhIT6keRvchcmNBaiv2xDQ>
 <xme:h4ElYgxnY2wuHeRmEAhyox32M_a5xB0IObtFHFFCU1ZHXUWtq_INXtn12cHIK4sNK
 Tb0dYjRAVEYByYsyg>
X-ME-Received: <xmr:h4ElYk0AWNOzQtOoR0Ec8gDwHlwIB7IeoLiBs1oS0JJlZzAyz1-KXkrejhVuHf7zyfP0BqK0Y0OSvC6Dqpct_GaHW7690JJBfPk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddufedgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfhfhvffuffgjkfggtgesthdtredttddttdenucfhrhhomheplfgrmhgvshcu
 vfhurhhnvghruceolhhinhhugihkvghrnhgvlhdrfhhoshhssegumhgrrhgtqdhnohhnvg
 drthhurhhnvghrrdhlihhnkheqnecuggftrfgrthhtvghrnheptedvfeduheeiueefgffh
 vdetiedttdevhfeiteeuhfelveduvedttdffgffggfetnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheplhhinhhugihkvghrnhgvlhdrfhhoshhs
 segumhgrrhgtqdhnohhnvgdrthhurhhnvghrrdhlihhnkh
X-ME-Proxy: <xmx:h4ElYvC6nF4BukqsBJmwN7piJccMseMnus6BFP9Il0PT5ffb8UM-Tg>
 <xmx:h4ElYoj8MsoE-uua4Uz2ZOLBvND06_HZGTRjAkvPGD3Nc7FIjT3yBg>
 <xmx:h4ElYjpS3iSJG8SS2kgtPTNg5E4lNoqTakNtzp4OrIJW2lN2W6Jw_w>
 <xmx:h4ElYnQVgx9m6v7HDDqfeXetNTImZOmqSkI5HoMEf65c8YKEwjpb1g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 6 Mar 2022 22:52:39 -0500 (EST)
References: <87ee57c8fu.fsf@turner.link>
 <acd2fd5e-d622-948c-82ef-629a8030c9d8@leemhuis.info>
 <87a6ftk9qy.fsf@dmarc-none.turner.link> <87zgnp96a4.fsf@turner.link>
 <fc2b7593-db8f-091c-67a0-ae5ffce71700@leemhuis.info>
 <CADnq5_Nr5-FR2zP1ViVsD_ZMiW=UHC1wO8_HEGm26K_EG2KDoA@mail.gmail.com>
 <87czkk1pmt.fsf@dmarc-none.turner.link>
 <BYAPR12MB46140BE09E37244AE129C01A975C9@BYAPR12MB4614.namprd12.prod.outlook.com>
 <87sftfqwlx.fsf@dmarc-none.turner.link>
 <BYAPR12MB4614E2CFEDDDEAABBAB986A0975E9@BYAPR12MB4614.namprd12.prod.outlook.com>
 <87ee4wprsx.fsf@turner.link>
 <4b3ed7f6-d2b6-443c-970e-d963066ebfe3@amd.com>
 <87pmo8r6ob.fsf@turner.link>
 <5a68afe4-1e9e-c683-e06d-30afc2156f14@leemhuis.info>
 <CADnq5_MCKTLOfWKWvi94Q9-d5CGdWBoWVxEYL3YXOpMiPnLOyg@mail.gmail.com>
 <87pmnnpmh5.fsf@dmarc-none.turner.link>
 <CADnq5_NG_dQCYwqHM0umjTMg5Uud6zC4=MiscH91Y9v7mW9bJA@mail.gmail.com>
 <092b825a-10ff-e197-18a1-d3e3a097b0e3@leemhuis.info>
From: James Turner <linuxkernel.foss@dmarc-none.turner.link>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [REGRESSION] Too-low frequency limit for AMD GPU
 PCI-passed-through to Windows VM
Date: Sun, 06 Mar 2022 21:12:52 -0500
In-reply-to: <092b825a-10ff-e197-18a1-d3e3a097b0e3@leemhuis.info>
Message-ID: <877d96to55.fsf@dmarc-none.turner.link>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 07 Mar 2022 08:26:53 +0000
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, "Lazar, Lijo" <lijo.lazar@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Alex Deucher <alexdeucher@gmail.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi Thorsten,

My understanding at this point is that the root problem is probably not
in the Linux kernel but rather something else (e.g. the machine firmware
or AMD Windows driver) and that the change in
f9b7f3703ff9 ("drm/amdgpu/acpi: make ATPX/ATCS structures global (v2)")
simply exposed the underlying problem.

This week, I'll double-check that this is the case by disabling the
`amdgpu_atif_pci_probe_handle` function and testing again. I'll post the
results here.

James
