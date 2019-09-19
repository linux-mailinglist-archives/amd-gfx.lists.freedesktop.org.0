Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30329B83AD
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 23:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416256FBE6;
	Thu, 19 Sep 2019 21:49:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F60A6FBE6
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 21:47:58 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id h33so4499545edh.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 14:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dEP4asvWahvB/ByMxaI4e4W6i3Uh1P6APAc6QuG8yno=;
 b=tx0vGqRQw6Or5MWP5rwtKgAZYmZHbPAH145n0ddNSWioqS5JIvhOPlJV6cqaZetiE7
 kWSJ2RwLlVkvgIrBxHyo/FY5semf/bfnc7YkQgu/4PIXKlbD7r0OW7x9Y3dEQUYMx/Uw
 4xZis0yBvBzK+cBMeDE0s0xm4hg/+F2IIkbA8pexyWv93zq6Hxu6l15Iwpuir8IRKh5V
 6L+JH+vHADXlKjGYjI906vWAv4dihJbtWP3AP8KUcfCXu4VdX0ajHtlvHeH0GNsQhhao
 0HAo30qT3KTcb+SILsWclPiF1NzNoxRRl1lWO9qdmZzuFSwOc6Z2S765WfNSEhiCZryC
 QFKg==
X-Gm-Message-State: APjAAAVAbDvLcTTuXfGVPYm236w7Kw1+TaUM7DRgJVh5+gzdqdx2AkuN
 9hEnkTis0fB+M87yyps0A3aRI3NEj2A=
X-Google-Smtp-Source: APXvYqynTIRxGcZc4LshXGFYCw3TWlACMMQVaY0VpBrg1kDlMQfmid3KkzXlvm9s+4E5MyT+0Gdp9g==
X-Received: by 2002:a05:6402:6c6:: with SMTP id
 n6mr17936160edy.162.1568929677017; 
 Thu, 19 Sep 2019 14:47:57 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42])
 by smtp.gmail.com with ESMTPSA id h10sm1867634edf.81.2019.09.19.14.47.56
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2019 14:47:56 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id i16so51549wmd.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 14:47:56 -0700 (PDT)
X-Received: by 2002:a1c:110:: with SMTP id 16mr27409wmb.88.1568929256997; Thu,
 19 Sep 2019 14:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190828183758.11553-1-rrangel@chromium.org>
In-Reply-To: <20190828183758.11553-1-rrangel@chromium.org>
From: Raul Rangel <rrangel@chromium.org>
Date: Thu, 19 Sep 2019 15:40:45 -0600
X-Gmail-Original-Message-ID: <CAHQZ30AGSxmjn4q6=bi6dJO1uSdpcG5jPGfUX7R2t2489qt9gw@mail.gmail.com>
Message-ID: <CAHQZ30AGSxmjn4q6=bi6dJO1uSdpcG5jPGfUX7R2t2489qt9gw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: fix struct init in update_bounding_box
To: amd-gfx@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 19 Sep 2019 21:49:32 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dEP4asvWahvB/ByMxaI4e4W6i3Uh1P6APAc6QuG8yno=;
 b=BmDj/yVXQI1xNehGBnaYafRi6EGb9bKgZd31R41qDqeJeU7zMho89QecXC+w2uIsh2
 06xxE6KKmvtBFgXmmxpi8gh0LjFMbEHLCkAMiBsQcYWYdDXd6CHyYwfani0b8ENaleZq
 5+x/lDA7+CqTzQa8/5dvIrCX9BmVycjFGxTHk=
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Charlene Liu <charlene.liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Nikola Cornij <nikola.cornij@amd.com>, David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJpZW5kbHkgcGluZyBmb3IgcmV2aWV3LgoKVGhhbmtzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
