Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C294B4D85A5
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Mar 2022 14:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A025710E40F;
	Mon, 14 Mar 2022 13:05:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA6810E20E
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Mar 2022 02:53:41 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 8DFD85C0112;
 Sun, 13 Mar 2022 22:53:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sun, 13 Mar 2022 22:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=turner.link; h=
 cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=mk9hxX9pdpaTprhpWtmYamoWls5zOpQ2mqbAXe
 YUr48=; b=a5KXI2BZUJhiA3fDQXwftBtJeQjfqVmIUk8KXXTvsbGB7pnI99fXuT
 ZqzBOPwaDNwAPweuJAE/hKTYUob78wbwev83/J/Viqsv+SOPjGIPfqQqiIJ/EqyD
 mZcR12Zt8dnNRCI4T9QXJKiFg4PlCLTViM5WBkhrHVO042BR50fVpbmt0lScv7Dw
 SNB8WqIVDS/KQgfKJlNKERCJvOKHfW5+flWckvaPDCe+1dq51PzpyYM5Zir2Tbkl
 yIcybJjvd4NVtj1/lnQ34GJTOGIRMsbSiTRyDAvKFoUZVEuYvE6MSk6Ze9UpfcH3
 hVQqoKPHht3FfOQrt3PkFAkqc0+Ok9sQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mk9hxX9pdpaTprhpW
 tmYamoWls5zOpQ2mqbAXeYUr48=; b=ENWQVZ/6OdSptCSfVJ9UQ4r1zW+lXOx/8
 4hzi6mFnY8SVDSK51blxdzEyt3JIxXyyF0ZGybf7UQnpAsZZDOtSxxa+CM70TvNh
 C6Z15dLy/cRj6qY4E73Re6K7d/4G1o/KsQvc4t+Q+XnmPWtKLsP9Fj5Kjsd3Gx8G
 D0YcmOGF3ICYXR7GS6fNziTvbVebiChvxMCHsGslkItQ4KFY8H6sypJAHcSdiuc6
 C5mEAWwmC8w4y33hGjTX7RJlOSqn2ebiZ5iTXK+CNz2ivgm29jq4qG9O68limXpm
 Ki79dwLbg2XlVbr0yx2Nx/56TiU4E7O6XAQcLJfmqMJ4WUuVKDDvA==
X-ME-Sender: <xms:M64uYvpRU_NVx3x1jdn7bK_ETsK5smMmf6lGp6z4cVyQVYPOmX9ODQ>
 <xme:M64uYpqfjhzCaPLraVydYPbOoZkACm8OqNVgH8_-jpYONEP527vnu24TWGcPBbcZB
 T3rwKyOmJbHiOIN9w>
X-ME-Received: <xmr:M64uYsOodvFcZ_0A-Drudina2r_Wzl09k17jCQV3d_VYakIXa1a-Lsx08Dws8ES_XqWn5PKbNeB8CsSoJq3g-Ln4EyeOGMdCiZE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvjedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfhfhvffuffgjkfggtgesthdtredttddttdenucfhrhhomheplfgrmhgvshcu
 vfhurhhnvghruceolhhinhhugihkvghrnhgvlhdrfhhoshhssegumhgrrhgtqdhnohhnvg
 drthhurhhnvghrrdhlihhnkheqnecuggftrfgrthhtvghrnhepfffhveeugfevteeileej
 vdeltdegtdeggfeujefgveekueevkeehheehffduleevnecuffhomhgrihhnpegrrhgthh
 hlihhnuhigrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomheplhhinhhugihkvghrnhgvlhdrfhhoshhssegumhgrrhgtqdhnohhnvgdrth
 hurhhnvghrrdhlihhnkh
X-ME-Proxy: <xmx:M64uYi55zF0psFGYdGy0OHLjJYK6VRocUJZ7LgqeOTLP81UHUdb4GQ>
 <xmx:M64uYu6wmns2j2EAVEO2pAAZuIaDGfnQ8SuPM1zsXGwUKnq8IthXXw>
 <xmx:M64uYqjFIZysjikoexKSzSt6J3lGtbaj9QQp8Od8fvlYDXDEdE_IhQ>
 <xmx:M64uYhL9-F_nAtrpjLcqE3yK8XZbMACDoPzp93_XWIM69tV15Z1BQg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Mar 2022 22:53:39 -0400 (EDT)
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
 <877d96to55.fsf@dmarc-none.turner.link>
From: James Turner <linuxkernel.foss@dmarc-none.turner.link>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [REGRESSION] Too-low frequency limit for AMD GPU
 PCI-passed-through to Windows VM
Date: Sun, 13 Mar 2022 14:33:41 -0400
In-reply-to: <877d96to55.fsf@dmarc-none.turner.link>
Message-ID: <87lexdw8gd.fsf@turner.link>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 14 Mar 2022 13:05:37 +0000
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

Hi all,

I've confirmed that changing the `amdgpu_atif_pci_probe_handle` function
to do nothing does make the GPU work properly in the VM. I started with
f9b7f3703ff9 ("drm/amdgpu/acpi: make ATPX/ATCS structures global (v2)")
and changed the function implementation to:

static bool amdgpu_atif_pci_probe_handle(struct pci_dev *pdev)
{
	DRM_DEBUG_DRIVER("Entered amdgpu_atif_pci_probe_handle");
	return false;
}

With that change, the GPU works properly in the VM.

I'm not sure where to go from here. This issue isn't much of a concern
for me anymore, since blacklisting `amdgpu` works for my machine. At
this point, my understanding is that the root problem needs to be fixed
in AMD's Windows GPU driver or Dell's firmware, not the Linux kernel. If
any of the AMD developers on this thread would like to forward it to the
AMD Windows driver team, I'd be happy to work with AMD to fix the issue
properly.

I've added a mention of this issue and workaround to the [Arch Wiki][1]
to make it more discoverable. If anyone has a better place to document
this, please let me know.

Thank you all for your help on this.

[1]: https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF#Too-low_frequency_limit_for_AMD_GPU_passed-through_to_virtual_machine

James
