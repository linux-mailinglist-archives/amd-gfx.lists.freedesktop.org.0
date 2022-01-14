Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E19648E240
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jan 2022 02:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F7B10EB44;
	Fri, 14 Jan 2022 01:46:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FDE10EB47
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jan 2022 01:46:39 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id hv15so12094830pjb.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 13 Jan 2022 17:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bkqHKFcqNq4gb3jt/dwVidqQ5ehBpW6sVTKKduTND5U=;
 b=bw/xTIGkLnDSX9jnLJvwk5GLgnDjyrWwq8Y3tVvHRP6pWVepDvUpb24R90CZqhCC9L
 aPDuN+fjx5ZNM0lh6Ev1Rdp4FW9LQb33SYHXU/i36i7j63RSdUSEMkqSEA++xM1uPNqV
 StKVAv05ywvQcPh5touaCbEXJCmFgXsvK6N0KqdBzM1f06SgAVOAiKA6wnUrjGh+1pkZ
 II8T7YG2HfpxuY7x8xiehN6DY67dV2M4AyZiCLEvFd+uVW/sDwMW8qmu4OQr/Bm715bX
 85ItrhYElmFILfdvKOBwMu6otmSLygtM3c7AqcLmHK/BN7pWlStOp7FR0HmGMDn/1OFP
 2dJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bkqHKFcqNq4gb3jt/dwVidqQ5ehBpW6sVTKKduTND5U=;
 b=kETes6j9HYLxs/3QM7NogIZ81gLMwrmJrIsr0ceMsvnP0vT0E4ZdrRV/fZ8q3m4U00
 WSg0jR+K3kN/9ITjKOWdI206rntZCkULbup+btYN7lPVgJCbMPHuP91+d1eWHSpSrQCZ
 R0rgQITDOU5Byj1sDyuDDOSXtPOP1ppGxPapOjZVUSozbJ+crRmL1GjOYTYmypjuMftw
 QLwy+wFPtWUk1K3PZkxdNwKK7xbf/mSBGhJpiBApQqYE7EhPPKmpN0Du/gA1GuKf75xS
 OV6vhPEJsJbXTu94eWUHJiCycTuSA1MSc6bvsB7ltvwoYvmkc60WSofVmzSDwwjYnJI1
 fmwg==
X-Gm-Message-State: AOAM531Cdf9/TSGpx9DvfgJ3DeiiWV2wRb+9dv2v/CZ5GBUHa+XuJ+YC
 rhPK6KRALhuWApy8YMm70EEKlQ==
X-Google-Smtp-Source: ABdhPJx1n2buo+IEu0BN44/SXSTvAhCpZgcA1x+30GjD3bQ1/gPeJucU2x/Go977cYZdYlI7KOzxEg==
X-Received: by 2002:a17:90b:3a87:: with SMTP id
 om7mr16573934pjb.16.1642124798972; 
 Thu, 13 Jan 2022 17:46:38 -0800 (PST)
Received: from [10.16.129.73] (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id a9sm3713554pfo.169.2022.01.13.17.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 17:46:38 -0800 (PST)
Message-ID: <4d77b583-ce3f-89e5-75e1-ccfd661c5198@igel.co.jp>
Date: Fri, 14 Jan 2022 10:46:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [RFC PATCH v2 0/3] Add support modifiers for drivers whose planes
 only support linear layout
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>
References: <20220113094419.12433-1-etom@igel.co.jp>
 <CAPj87rPk3_8LdnwWJ3BhtJnRuR+_WHg2hfdgK2R4SMacPGCrUQ@mail.gmail.com>
From: Esaki Tomohito <etom@igel.co.jp>
In-Reply-To: <CAPj87rPk3_8LdnwWJ3BhtJnRuR+_WHg2hfdgK2R4SMacPGCrUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Takanari Hayama <taki@igel.co.jp>, Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Simon Ser <contact@emersion.fr>,
 Alex Deucher <alexander.deucher@amd.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi Daniel-san,

Thank you for your comments.

On 2022/01/13 22:44, Daniel Stone wrote:
> Hi Esaki-san,
> 
> On Thu, 13 Jan 2022 at 09:44, Tomohito Esaki <etom@igel.co.jp> wrote:
>> Some drivers whose planes only support linear layout fb do not support format
>> modifiers.
>> These drivers should support modifiers, however the DRM core should handle this
>> rather than open-coding in every driver.
>>
>> In this patch series, these drivers expose format modifiers based on the
>> following suggestion[1].
> 
> Thanks for the series, it looks like the right thing to do.
> 
> Can you please change the patch ordering though? At the moment there
> will be a bisection break at patch #1, because the legacy drivers will
> suddenly start gaining modifier support, before it is removed in patch
> #2.
> 
> I think a better order would be:
>    1: add fb_modifiers_not_supported flag to core and drivers
>    2: add default modifiers (and set allow_fb_modifiers) if
> fb_modifiers_not_supported flag is not set
>    3: remove allow_fb_modifiers flag
> 
I agree to your proposal.
I will fix these patches.

-- 
--------------------------
株式会社イーゲル
江崎　朋人
etom@igel.co.jp
