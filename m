Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D0761A17A
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Nov 2022 20:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F04710E10D;
	Fri,  4 Nov 2022 19:49:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD66710E10B
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Nov 2022 19:41:02 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id v17so5831671plo.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 04 Nov 2022 12:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xTleQU4VJfAukQnxKaDYAnGqK2WphhJc8fFwPIDZB8o=;
 b=msmwpF6Ois8LGAEpwDgc+v1z3O9zPF/gToUCKqHVslP3hhHCt/dUr3MBgaajqYY8+r
 v8IHIH33Nb8tZyr5wzF1Z1u4/02bw3vX6jbPl/qjsYR+o3kurpTnt8kUpMPNspaplUPj
 EIS1wt0Z83toaM+v3HO8zDdOzYakLB7A3sIXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xTleQU4VJfAukQnxKaDYAnGqK2WphhJc8fFwPIDZB8o=;
 b=NFJxeoXbUgyFFvOfT9f2etUSQmVrATON9pEjWBHqQq3FdgYqd7Tgpsy5Hw9usYtuJR
 H708rveYOBZ73wknNzFAngAOM4qXUwzRadwZGkGJaujtCum2LEPmJKI6HOt5Nxl1TKK3
 4haZjyFAqeJbCxzqTYXrspSjk7TteO/ZU8eY6eUsOxp/L8/ZOie/7TiJzneFgByfvIB6
 E3zHOwzq5DyKGTYFdwBpVKBuPKn7mfYw9REB44pemVfByLWmxtbCpybSec6GxsXGohA4
 fZvAXnndcLbCnxFS16zqDPDrPJpgBEkgPIUrbKfJLpT5oq4Z6RfCgVLBa5mf4IjBevtz
 L2lQ==
X-Gm-Message-State: ACrzQf2HDHJES0H2S8TahSeZYkC3irhpId9wrxIfF/4VEb9ntmVwN2NU
 WIg+W7J5xitN4RMgJc4Ak7SF8w==
X-Google-Smtp-Source: AMsMyM5lPZwJMkVoNQNtETbRNTdHQI/XbapUB0H45rWGJXujIBislKOpf8ovzPpaS4yP5yAJByf1Sw==
X-Received: by 2002:a17:902:aa44:b0:186:7a6b:7bbd with SMTP id
 c4-20020a170902aa4400b001867a6b7bbdmr37459295plr.78.1667590862227; 
 Fri, 04 Nov 2022 12:41:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 ik12-20020a170902ab0c00b00187197c499asm128906plb.164.2022.11.04.12.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 12:41:01 -0700 (PDT)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Fri, 4 Nov 2022 12:41:01 -0700
To: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
Subject: Coverity: kfd_parse_subtype_cache(): Memory - corruptions
Message-ID: <202211041239.2B98F280@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 04 Nov 2022 19:49:44 +0000
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
Cc: Oded Gabbay <oded.gabbay@gmail.com>, Jay Cornwall <Jay.Cornwall@amd.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Amber Lin <Amber.Lin@amd.com>,
 Ben Goz <ben.goz@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-next@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Kent Russell <kent.russell@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20221104 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Fri Dec 8 23:08:59 2017 -0500
    3a87177eb141 ("drm/amdkfd: Add topology support for dGPUs")

Coverity reported the following:

*** CID 1527133:  Memory - corruptions  (OVERRUN)
drivers/gpu/drm/amd/amdkfd/kfd_crat.c:1113 in kfd_parse_subtype_cache()
1107     			props->cache_size = cache->cache_size;
1108     			props->cacheline_size = cache->cache_line_size;
1109     			props->cachelines_per_tag = cache->lines_per_tag;
1110     			props->cache_assoc = cache->associativity;
1111     			props->cache_latency = cache->cache_latency;
1112
vvv     CID 1527133:  Memory - corruptions  (OVERRUN)
vvv     Overrunning array "cache->sibling_map" of 32 bytes by passing it to a function which accesses it at byte offset 63 using argument "64UL". [Note: The source code implementation of the function has been overridden by a builtin model.]
1113     			memcpy(props->sibling_map, cache->sibling_map,
1114     					sizeof(props->sibling_map));
1115
1116     			/* set the sibling_map_size as 32 for CRAT from ACPI */
1117     			props->sibling_map_size = CRAT_SIBLINGMAP_SIZE;
1118

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527133 ("Memory - corruptions")
Fixes: 3a87177eb141 ("drm/amdkfd: Add topology support for dGPUs")

I'm not sure why this suddenly appeared after 5 years, but the read
over-run looks legit:

struct crat_subtype_cache {
        ...
        uint8_t         sibling_map[CRAT_SIBLINGMAP_SIZE];

#define CRAT_SIBLINGMAP_SIZE    32


struct kfd_cache_properties {
        ...
        uint8_t                 sibling_map[CACHE_SIBLINGMAP_SIZE];

#define CACHE_SIBLINGMAP_SIZE 64

Thanks for your attention!

-- 
Coverity-bot
