Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30159534631
	for <lists+amd-gfx@lfdr.de>; Thu, 26 May 2022 00:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A6910E9D0;
	Wed, 25 May 2022 22:07:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACE210EA0A
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 May 2022 22:07:38 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 h129-20020a1c2187000000b003975cedb52bso209446wmh.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 May 2022 15:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Q7sKJrWCeWlhDVlmgSMW2NcMhM9lTStJjQlrUPtXIXA=;
 b=eopDrfIHJM8IF7mRG8hA1fo2Z2Wv/QglL0DtGpj2qBJXnvOnh1uFoTbEHVqbkZr0hi
 1O2KEk/Z9GSg59UhdSmK3b5z3iVSpalv+n1BwIci6d50WLLJInpEBSGAw4ky71skcvD3
 /b3NE+1mQei8LSfhnv+8SaHZvIbv7uB50EyBNoO8jdsEisPSiaNB0on7Qtwfa6I2YuiZ
 GCbv4e0aOQZctw6zlpkceuWHL3kV8Yso/gqdhaZRhoFUH8r3QRigsVls1uRN5+AABNuZ
 wnVVqB0tjHY354zrffCBXnjwbQ3PE3ULsXel0OiEr4U8q824qwvFh3Ssnth61pUZV7CM
 z9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Q7sKJrWCeWlhDVlmgSMW2NcMhM9lTStJjQlrUPtXIXA=;
 b=35KjfDoBxrk8u0tYX190x3jzMrq/wcTABFiEho+iaihXVWs52JulI3ihIuaD5Z51oj
 j24G+ivMR3mFsxp+2eiOosQnCa4qpnRYpKTQPn918jA+hSPurjxnd/EfgsKcF2ao+QpG
 EpOcbh2mKTRLpdEV56ZaY7han86UT8H/k2sgdb7U6GOuHO3SBrDP0OuocvZHYduo80UM
 S3VE/ImIkCZ6eVmv2HiZfTnJp5fKJEZQ+acRbl26BklelXzOqBWITEWzKk0Je/ZMW/nb
 J+aqiIIN2/p9HCpIu4dKI0Bya1J2tZfTrLxnIFJV0Mq7tEb4xV9EI5qvm18czqjgmFub
 f/mw==
X-Gm-Message-State: AOAM533D+Ip1K0gs2T1AYKexUI7GfGOs9Wshha5l2I4naHfDPe+x7v+z
 +iHh6lAKd+L0DE8YcgyXGtVIlg==
X-Google-Smtp-Source: ABdhPJxRatrP6XqsNDLEYgx/Gmo8kTof4rjho1S2HneKMFITFunNGJP1JxO1h65VIohlIXxM0NUT5A==
X-Received: by 2002:a7b:cb4b:0:b0:397:3dd8:917a with SMTP id
 v11-20020a7bcb4b000000b003973dd8917amr10399106wmj.20.1653516456713; 
 Wed, 25 May 2022 15:07:36 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141]) by smtp.gmail.com with ESMTPSA id
 c15-20020a056000184f00b0020feb9c44c2sm95151wri.20.2022.05.25.15.07.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 May 2022 15:07:36 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [linux-next:master] BUILD REGRESSION
 8cb8311e95e3bb58bd84d6350365f14a718faa6d
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20220525145056.953631743a4c494aabf000dc@linux-foundation.org>
Date: Wed, 25 May 2022 23:07:35 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <F0E25DFF-8256-48FF-8B88-C0E3730A3E5E@jrtc27.com>
References: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
 <20220525145056.953631743a4c494aabf000dc@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
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
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 kvm@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 linux-staging@lists.linux.dev, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-parport@lists.infradead.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 25 May 2022, at 22:50, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> On Thu, 26 May 2022 05:35:20 +0800 kernel test robot <lkp@intel.com> =
wrote:
>=20
>> tree/branch: =
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git =
master
>> branch HEAD: 8cb8311e95e3bb58bd84d6350365f14a718faa6d  Add linux-next =
specific files for 20220525
>>=20
>> Error/Warning reports:
>>=20
>> ...
>>=20
>> Unverified Error/Warning (likely false positive, please contact us if =
interested):
>=20
> Could be so.
>=20
>> mm/shmem.c:1948 shmem_getpage_gfp() warn: should '(((1) << 12) / 512) =
<< folio_order(folio)' be a 64 bit type?
>=20
> I've been seeing this one for a while.  And from this report I can't
> figure out what tool emitted it.  Clang?
>=20
>>=20
>> ...
>>=20
>> |-- i386-randconfig-m021
>> |   `-- =
mm-shmem.c-shmem_getpage_gfp()-warn:should-((()-)-)-folio_order(folio)-be-=
a-bit-type
>=20
> If you're going to use randconfig then shouldn't you make the config
> available?  Or maybe quote the KCONFIG_SEED - presumably there's a way
> for others to regenerate.
>=20
> Anyway, the warning seems wrong to me.
>=20
>=20
> #define PAGE_SIZE               (_AC(1,UL) << PAGE_SHIFT)
>=20
> #define BLOCKS_PER_PAGE  (PAGE_SIZE/512)
>=20
> 	inode->i_blocks +=3D BLOCKS_PER_PAGE << folio_order(folio);
>=20
> so the RHS here should have unsigned long type.  Being able to =
generate
> the cpp output would be helpful.  That requires the .config.

This is i386, so an unsigned long is 32-bit, but i_blocks is a blkcnt_t
i.e. a u64, which makes the shift without a cast of the LHS fishy.

Jess

