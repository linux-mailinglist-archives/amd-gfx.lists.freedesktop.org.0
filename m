Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE3E687390
	for <lists+amd-gfx@lfdr.de>; Thu,  2 Feb 2023 04:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0FC10E2D7;
	Thu,  2 Feb 2023 03:02:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A41410E088
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 Feb 2023 01:08:18 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id B62BD3200A7A;
 Wed,  1 Feb 2023 20:08:14 -0500 (EST)
Received: from imap50 ([10.202.2.100])
 by compute6.internal (MEProxy); Wed, 01 Feb 2023 20:08:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1675300094; x=1675386494; bh=393xPKJKfY
 /8d1G07ko6nYGhFyfE4P61UQ4EPe1PY0w=; b=DGpYVDqYZoAir7gS/jBBw7RMQe
 MWS+ar1T1io/UJfQBy+Gig54QMqc6BFeTXAZeb4JXMVmVDGNdDRUEZ7NLq/rjskn
 UaQLoepSVu44fZhSAgrIBQ7Bp60u4RR94kM4YBjazEPBdZgjfJzQY9f3YMUgLMiZ
 kvb5umEAFmogtCLw1Yw/bamxfFQY+UG6jTFp+TTQBuJyDyZkMgpExHkKD/nbFUgj
 Mx7Nbky/hQMvWgBtOgi9c0n96fhy/9RBy3sxuP+YQhSCER5qKBWEVR8hv3at5CP1
 6/cPA6k3eiFaaMTKMcC1tm05MfKS639sxmxBCN622efS87YIoejQB/vK6pxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1675300094; x=1675386494; bh=393xPKJKfY/8d1G07ko6nYGhFyfE
 4P61UQ4EPe1PY0w=; b=JxfzcEDWHIN6iT/UW/DKNncolyHFNGsUoobadPvAiNBx
 4jUTq3HDzq0H1uHud5xlo1KHDjJFlKGA1Cz00rxctqcpd3ZTIXHwb4Skss/ujDp2
 +b0qpjOnNlnhuMbzLLtA9l1at0yy9RdAL7W1W9TgpiV6A/fjTfuTlxpvS1krvEj8
 IHQRAtdDEntR/XBxMBSJiAACHR7q9laCn2sZ1ql8wuvrzKR5raDqbC2aZqYnZ6PB
 e6mSXx4S5uBW5fbxqT6YdAG6jtZXKKOcqArVsVGfxxAHnY3j7PRS0guWAsEGTSqz
 w2MGzfM4/hRs7CNKxbeU/cYn2omGWGWoQDXyqV8YwA==
X-ME-Sender: <xms:_QzbY-WTlRjVicya1zrlXA1b12oygeUMtzMLZlK4K-_NZq89jz7KJQ>
 <xme:_QzbY6nSoQ8uQatMd5fJScpCenw_AZ1BeyfFRU5WmrwpeeNawkEeQd2DZLEv06InB
 52C-pJWMeMGjzSkYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefjedgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpeelgfejleeuleefvdefieetgfeghedutdfftdekgeekhfdvueegfedv
 feegveeiueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgu
 rhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:_QzbYybgVsSI2-T2X1ZgHkWom-ZjJ1v15qYY7_HdsQs785vD4Jf0cw>
 <xmx:_QzbY1UAS4J6T6menWKwt-VloKmyO0X-guJrpDvJS_dT72S7IX8aew>
 <xmx:_QzbY4lG2xwwSfADF-4IXcqUXr1X_si0uI0_Zqe-iLI9ns3muBGfAA>
 <xmx:_gzbYxeNtPB-IcBuKujXA1mLxFWMTf35Xmw_Bw75jV6QTvLOl7gM7A>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4DE401700090; Wed,  1 Feb 2023 20:08:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-107-g82c3c54364-fm-20230131.002-g82c3c543
Mime-Version: 1.0
Message-Id: <76f4dea0-9a39-4238-a213-0167477f5d54@app.fastmail.com>
In-Reply-To: <63da97b5.3V1HSQEat507LFIr%lkp@intel.com>
References: <63da97b5.3V1HSQEat507LFIr%lkp@intel.com>
Date: Thu, 02 Feb 2023 11:37:20 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Neal Liu" <neal_liu@aspeedtech.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 66eee64b235411d512bed4d672c2d00683239daf
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 02 Feb 2023 03:02:01 +0000
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
Cc: devicetree@vger.kernel.org, kbuild test robot <lkp@intel.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-msm@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, kvmarm@lists.cs.columbia.edu,
 Linux Memory Management List <linux-mm@kvack.org>, kvmarm@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi Neal,

On Thu, 2 Feb 2023, at 03:17, kernel test robot wrote:
> tree/branch: 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
> master
> branch HEAD: 66eee64b235411d512bed4d672c2d00683239daf  Add linux-next 
> specific files for 20230201
>
>
> Unverified Error/Warning (likely false positive, please contact us if 
> interested):
>
> drivers/crypto/aspeed/aspeed-acry.c:295:37: sparse: sparse: incorrect 
> type in assignment (different base types)
> drivers/crypto/aspeed/aspeed-acry.c:305:28: sparse: sparse: cast 
> removes address space '__iomem' of expression
> drivers/crypto/aspeed/aspeed-acry.c:606:24: sparse: sparse: symbol 
> 'aspeed_acry_akcipher_algs' was not declared. Should it be static?

Can you please look into these issues with the ACRY driver?

Cheers,

Andrew

>
> elapsed time: 722m
>
> configs tested: 69
> configs skipped: 2
>
> gcc tested configs:
> x86_64                          rhel-8.3-func
> x86_64                    rhel-8.3-kselftests
> ia64                             allmodconfig
> x86_64                            allnoconfig
> um                             i386_defconfig
> um                           x86_64_defconfig
> arc                                 defconfig
> i386                                defconfig
> x86_64                              defconfig
> alpha                               defconfig
> arm                                 defconfig
> mips                             allyesconfig
> x86_64                           rhel-8.3-syz
> x86_64               randconfig-a001-20230130
> x86_64                         rhel-8.3-kunit
> x86_64               randconfig-a003-20230130
> x86_64                           rhel-8.3-bpf
> powerpc                           allnoconfig
> x86_64               randconfig-a004-20230130
> x86_64                               rhel-8.3
> x86_64               randconfig-a002-20230130
> powerpc                          allmodconfig
> sh                               allmodconfig
> x86_64               randconfig-a006-20230130
> x86_64                           allyesconfig
> i386                          randconfig-a001
> x86_64                           rhel-8.3-kvm
> i386                          randconfig-a003
> x86_64               randconfig-a005-20230130
> arm64                            allyesconfig
> i386                             allyesconfig
> i386                          randconfig-a005
> arc                  randconfig-r043-20230129
> i386                          randconfig-c001
> arm                              allyesconfig
> s390                                defconfig
> s390                             allmodconfig
> arm                  randconfig-r046-20230129
> arm                  randconfig-r046-20230130
> s390                             allyesconfig
> arc                  randconfig-r043-20230130
> m68k                             allyesconfig
> m68k                             allmodconfig
> alpha                            allyesconfig
> arc                              allyesconfig
>
> clang tested configs:
> x86_64                          rhel-8.3-rust
> x86_64               randconfig-a012-20230130
> x86_64               randconfig-a013-20230130
> x86_64               randconfig-a011-20230130
> x86_64               randconfig-a014-20230130
> i386                 randconfig-a013-20230130
> i386                          randconfig-a002
> i386                 randconfig-a012-20230130
> i386                 randconfig-a014-20230130
> i386                          randconfig-a004
> x86_64               randconfig-a015-20230130
> i386                 randconfig-a015-20230130
> x86_64               randconfig-a016-20230130
> i386                 randconfig-a011-20230130
> hexagon              randconfig-r041-20230129
> i386                 randconfig-a016-20230130
> riscv                randconfig-r042-20230129
> i386                          randconfig-a006
> riscv                randconfig-r042-20230130
> hexagon              randconfig-r045-20230130
> hexagon              randconfig-r041-20230130
> hexagon              randconfig-r045-20230129
> s390                 randconfig-r044-20230129
> s390                 randconfig-r044-20230130
>
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
