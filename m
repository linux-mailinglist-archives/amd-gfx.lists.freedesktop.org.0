Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFACE309BB8
	for <lists+amd-gfx@lfdr.de>; Sun, 31 Jan 2021 12:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759316E2C8;
	Sun, 31 Jan 2021 11:50:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6CE6E114
 for <amd-gfx@lists.freedesktop.org>; Sun, 31 Jan 2021 01:03:39 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id q20so9108377pfu.8
 for <amd-gfx@lists.freedesktop.org>; Sat, 30 Jan 2021 17:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=hSBYDxZn5/M7G0OS88+UqBJx7yJ7nHUBiYaAGSX3hI4=;
 b=iIYzfLNBZl/AqmiCioUXu8Aq2eCpRcgawdqxPP3HhSm9qyMyUCW11GBzrbEQ2bssVX
 JwkXwi9kfHMn/aTu5H4E/pDS6rG/XF61pGtW9wMV9g0BPRx9ATjERfIKPMI6RvND1npU
 IfNVXj+f+9SN6WB7j/PjFXHALpAh4NGbEzy2u2UdGlJ3KGNmX0wyCbvigqcXonbW1GwR
 nuzVqItsOzZEaGEhCLUDNMH1KPJuEzgAv4RhMBpJNPJh+YsFmt9KCa/af4gVEL1DJYCP
 n38VX/FIx+r8MyKvfQt99Nu7h7bl/F8hHBxDTnLRPb/SYZsuvwqztuPqvj8bJjnH8g2V
 DT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=hSBYDxZn5/M7G0OS88+UqBJx7yJ7nHUBiYaAGSX3hI4=;
 b=HdWRfPGak6VTEmw8MyISYX8DciwqRwj/2tGnrj2xNtk2KPWMFt1QlBo2HlvkRq2m1i
 Kulcd13YR4m6xD3dWau2iL9DMYmyBrL9HgfqVDAnB/TTtlMS6wA5IJjAswHXqOHd4kI4
 aXgjc0ghf98wFfpzuNCOdEcqLUfJtEh8QNHdTyLV2vaoBmHpj1XNfEm4ziztE4e9NnQc
 MdW2cwhNvtH0jckuNOFIAIMGX2acKhx9chq15r8q4mFERfVX5icwYNCk7UXqiWQfRpad
 R3RjogKwvjysbqZoNerRya1G9+R8DNiqmXoc7JMLKSaoxkMbA/2qeiDvu6eqRwqdABme
 bjtQ==
X-Gm-Message-State: AOAM531b40KJMnv7aj5nOsEf/hmlYVo5GeFiz7GhFl82S4TIVifbBeql
 BSxMGaskrT8ul/pO5hDa5p0I0w==
X-Google-Smtp-Source: ABdhPJy+R/8tuQgdgWpNSHa2PErQxpdaxVaI2dnWesYu836FngbTUWRUj1PTnBOFY/744Cgi5LQNSw==
X-Received: by 2002:a63:7e10:: with SMTP id z16mr10880619pgc.263.1612055018549; 
 Sat, 30 Jan 2021 17:03:38 -0800 (PST)
Received: from [2620:15c:17:3:4a0f:cfff:fe51:6667]
 ([2620:15c:17:3:4a0f:cfff:fe51:6667])
 by smtp.gmail.com with ESMTPSA id 14sm3081438pgp.83.2021.01.30.17.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 17:03:37 -0800 (PST)
Date: Sat, 30 Jan 2021 17:03:37 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: Re: [bug] 5.11-rc5 brought page allocation failure issue [ttm][amdgpu]
In-Reply-To: <4ce29a7e-f58a-aeb4-bef-34a7eada70d0@google.com>
Message-ID: <e0c2c823-5f-efe8-cd87-6dd6cc33a33@google.com>
References: <CABXGCsNazWZQGfSnFgQ_K5_H9uBQ=8gBdFORXrU1FEMGMohO2w@mail.gmail.com>
 <4ce29a7e-f58a-aeb4-bef-34a7eada70d0@google.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="1482994552-1916433268-1612055017=:606041"
X-Mailman-Approved-At: Sun, 31 Jan 2021 11:50:13 +0000
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
Cc: ckoenig.leichtzumerken@gmail.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1482994552-1916433268-1612055017=:606041
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 30 Jan 2021, David Rientjes wrote:

> On Sun, 31 Jan 2021, Mikhail Gavrilov wrote:
> 
> > The 5.11-rc5 (git 76c057c84d28) brought a new issue.
> > Now the kernel log is flooded with the message "page allocation failure".
> > 
> > Trace:
> > msedge:cs0: page allocation failure: order:10,
> 
> Order-10, wow!
> 
> ttm_pool_alloc() will start at order-10 and back off trying smaller orders 
> if necessary.  This is a regression introduced in
> 
> commit bf9eee249ac2032521677dd74e31ede5429afbc0
> Author: Christian König <christian.koenig@amd.com>
> Date:   Wed Jan 13 14:02:04 2021 +0100
> 
>     drm/ttm: stop using GFP_TRANSHUGE_LIGHT
> 
> Namely, it removed the __GFP_NOWARN that we otherwise require.  I'll send 
> a patch in reply.
> 

Looks like Michel Dänzer <michel@daenzer.net> already sent a patch that 
should fix this:
https://lore.kernel.org/lkml/20210128095346.2421-1-michel@daenzer.net/
--1482994552-1916433268-1612055017=:606041
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--1482994552-1916433268-1612055017=:606041--
