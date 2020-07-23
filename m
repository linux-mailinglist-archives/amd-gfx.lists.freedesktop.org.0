Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2169922BACA
	for <lists+amd-gfx@lfdr.de>; Fri, 24 Jul 2020 02:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242376E8A5;
	Fri, 24 Jul 2020 00:11:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0672B6E486
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 Jul 2020 22:32:19 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id w17so3324258ply.11
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 Jul 2020 15:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rcHiH1Tqs5ADJ+MGb3vcjbWBOdmK6BVfKbafmPqedI4=;
 b=lvaXW0EH58h+/+Oelkh/2EltLVN21JeGtH9oA9rq4r7QwYFgUzxZHdbdpcj6L0OT4+
 NUzurvHLRVuiuFxDjQ4s+3XcN+azqQ4Z9/kmtqIXftHCj7BYQ13jO1kHZnF5qpLkb/5/
 Db2jc9KY+6XmdRAlWCgKbg6WL/mHQCeBQS4JM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rcHiH1Tqs5ADJ+MGb3vcjbWBOdmK6BVfKbafmPqedI4=;
 b=Xt0Qt9hzXWad+acRkbZleVnKOPMnHJpe1qXfBJGJTM4rUTuVH1+Tgn5++xSRS1ODQ3
 wqhkRv+lRPgBi8CVA2TKQGr5OypYAJx39gQ8GVKnzE6cxQk09AaEUoF1glMvvlQcssfB
 YoFo3s+llwHqvLT/IeauINbgrI3HCbxLqgFvAt0jVcARHjy4cn0FTWXgLgYGlsKtsem9
 LokygKRrxHNOfYfwy7fO6HkhKokS88ZTdBQi+GhIWk4R2oqNquRbLPari3ee6MkSBMuH
 f+j1PkWPXy+1XVty+0VjddSMDbBNGQhEiwP7zxmo5hj6skE8in/FvP1xlxcE7HZ0kajW
 JHGw==
X-Gm-Message-State: AOAM531ClYuorEgKdje8OGX0NY4Cj0qKL1SE4AjgQnj58ZPWryrwIleG
 lc/qo7VA2B4xXp/Zry/aPMc7Xw==
X-Google-Smtp-Source: ABdhPJx/HbAN/k8ICmlNADe+1VuDo0tfRRzSOZ3OPXagZgfd/TkGMW8mipyokLFnWdO7JgsaGPhN/w==
X-Received: by 2002:a17:90a:1b64:: with SMTP id
 q91mr2452247pjq.119.1595543538591; 
 Thu, 23 Jul 2020 15:32:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m68sm3815562pje.24.2020.07.23.15.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 15:32:17 -0700 (PDT)
Date: Thu, 23 Jul 2020 15:32:16 -0700
From: Kees Cook <keescook@chromium.org>
To: Mazin Rezk <mnrzk@protonmail.com>
Subject: Re: [PATCH] amdgpu_dm: fix nonblocking atomic commit use-after-free
Message-ID: <202007231524.A24720C@keescook>
References: <YIGsJ9LlFquvBI2iWPKhJwjKBwDUr_C-38oVpLJJHJ5rDCY_Zrrv392o6UPNxHoeQrcpLYC9U4fZdpD9ilz6Amg2IxkSexGLQMCQIBek8rc=@protonmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIGsJ9LlFquvBI2iWPKhJwjKBwDUr_C-38oVpLJJHJ5rDCY_Zrrv392o6UPNxHoeQrcpLYC9U4fZdpD9ilz6Amg2IxkSexGLQMCQIBek8rc=@protonmail.com>
X-Mailman-Approved-At: Fri, 24 Jul 2020 00:11:04 +0000
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
Cc: "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>,
 "anthony.ruhier@gmail.com" <anthony.ruhier@gmail.com>,
 "1i5t5.duncan@cox.net" <1i5t5.duncan@cox.net>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
 "regressions@leemhuis.info" <regressions@leemhuis.info>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "mphantomx@yahoo.com.br" <mphantomx@yahoo.com.br>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Jul 23, 2020 at 09:10:15PM +0000, Mazin Rezk wrote:
> When amdgpu_dm_atomic_commit_tail is running in the workqueue,
> drm_atomic_state_put will get called while amdgpu_dm_atomic_commit_tail is
> running, causing a race condition where state (and then dm_state) is
> sometimes freed while amdgpu_dm_atomic_commit_tail is running. This bug has
> occurred since 5.7-rc1 and is well documented among polaris11 users [1].
> 
> Prior to 5.7, this was not a noticeable issue since the freelist pointer
> was stored at the beginning of dm_state (base), which was unused. After
> changing the freelist pointer to be stored in the middle of the struct, the
> freelist pointer overwrote the context, causing dc_state to become garbage
> data and made the call to dm_enable_per_frame_crtc_master_sync dereference
> a freelist pointer.
> 
> This patch fixes the aforementioned issue by calling drm_atomic_state_get
> in amdgpu_dm_atomic_commit before drm_atomic_helper_commit is called and
> drm_atomic_state_put after amdgpu_dm_atomic_commit_tail is complete.
> 
> According to my testing on 5.8.0-rc6, this should fix bug 207383 on
> Bugzilla [1].
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=207383

Nice work tracking this down!

> Fixes: 3202fa62f ("slub: relocate freelist pointer to middle of object")

I do, however, object to this Fixes tag. :) The flaw appears to have
been with amdgpu_dm's reference tracking of "state" in the nonblocking
case. (How this reference counting is supposed to work correctly, though,
I'm not sure.) If I look at where the drm helper was split from being
the default callback, it looks like this was what introduced the bug:

da5c47f682ab ("drm/amd/display: Remove acrtc->stream")

? 3202fa62f certainly exposed it much more quickly, but there was a race
even without 3202fa62f where something could have realloced the memory
and written over it.

-- 
Kees Cook
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
