Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1606E3997ED
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Jun 2021 04:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEA26EEBB;
	Thu,  3 Jun 2021 02:12:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CDE6EEBB
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Jun 2021 02:11:58 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 5-20020a9d01050000b02903c700c45721so3282435otu.6
 for <amd-gfx@lists.freedesktop.org>; Wed, 02 Jun 2021 19:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EdGjMnjURBtM9alnjR3o+7pFgJCTZiIXFzmFyr6/AT8=;
 b=CSW2LxANx7KVzwG3s+eePgC4qwp1f4wM5DNvEsql7qETmS8y6MWkVGiKmdO3c3yd95
 qqV0qyVBl1NwDisEMcBoZ/LlrpDP7DzO2fSGYSqg1vcFdX7We0/Aq1WNWI3AUeJ4TFB4
 hyfoaarLzcy7z/8e6wyNo22YYXTq79wjFog0uqykmA0eJSfHtuuUJ8qchzGn5zI1h9rL
 XgfJq0muEzQ43+NOYKFS6m5Y1Cn5vnuRnJ4q2mCmx7xRos/3cGCs63LV5O8PQsMxx9D6
 dznDuEWxPrxD3OpoWDTVYUYP97V8pxbXU7+aVwzSNiaRGMoYuO+7VjeMoUQgmTnG6NUz
 1Qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EdGjMnjURBtM9alnjR3o+7pFgJCTZiIXFzmFyr6/AT8=;
 b=tr9FoJf/xqaY6WY6dmVRZl37CVgC7RXQ/eU/+VkSSCGSy3hpNgnJmbF7ymoWUqqIDp
 OYgOJtNEWPWqVPhcLyo2oiJosI5W4k8HochQMnCr2PtER/5Hj+LNC/IjcyrpH7qtLqn/
 qrcymZ2X2bEM7TvMyugU4A3vJ5Yba/SKVA7pgoven8CIEoKkBRNpGlXwjhwP6Tx3xVtH
 WoZ9HFeqiVi6GDHSWAw+bF4xstyjHBGSMIHwewPyer0cMvUoAJSV/lvT/8/Imb/xYQ+F
 9U1MUdjqpPYyoJYoqtYuL3IJPvBVg/6Fwvnzx796fQ07DlozdUcI0s5p5ntWLANNeVpL
 Sv9w==
X-Gm-Message-State: AOAM532UQDA04d61qZ79o+n9iOyQ2vom/agkbYn95rmzrPijpbnZei4L
 D/022kqncCIlk/HqZuCqtC0YkzHpI3gCXOVVRYd/2lqh
X-Google-Smtp-Source: ABdhPJwyf0VGoOpf5G+GKcODWypNvgICkDNdd3m1SzJfyV4rBAXeiBVHkVLpGl2yE3yKzTGMvkmz4dcwsSxH0+MqYnc=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr29198874otl.132.1622686317442; 
 Wed, 02 Jun 2021 19:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <30855000.34f9.179ccbc8079.Coremail.chenlei18s@ict.ac.cn>
 <CADnq5_Mg+kVrXNLsNW8ZYS9JMmch4Jg5iAzOdCqyPru8UpmctA@mail.gmail.com>
 <66ba8554.40b87.179cf463340.Coremail.chenlei18s@ict.ac.cn>
In-Reply-To: <66ba8554.40b87.179cf463340.Coremail.chenlei18s@ict.ac.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Jun 2021 22:11:46 -0400
Message-ID: <CADnq5_PN+-N+QCuAGJeyEHLJ_WuX_vUf=fDgjruwHcKtD15v0Q@mail.gmail.com>
Subject: Re: Re: [BUG] Data race when use PACKET3_DMA_DATA?
To: Chen Lei <chenlei18s@ict.ac.cn>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Jun 2, 2021 at 8:29 PM Chen Lei <chenlei18s@ict.ac.cn> wrote:
>
> Hi Alex. Thanks for your quick reply.
> I first submit the OpenCL kernel packet and then submit the DMA DATA packet. And the OpenCL kernel reads the value written by the DMA DATA packet.
> If I understand you correctly, that is because the CP engine continues on to process the DMA DATA packet after launching the OpenCL kernel. If so, is there any way to sync the CP engine until the OpenCL kernel is complete?
>

Once the kernel has been dispatched to the shader cores, the CP will
continue to execute packets in the queue.  If you want it to wait for
the pipeline to drain you'll need to insert a fence packet (e.g.,
RELEASE_MEM).

Alex

>
> &gt; -----Original Messages-----
> &gt; From: "Alex Deucher" <alexdeucher@gmail.com>
> &gt; Sent Time: 2021-06-02 21:37:51 (Wednesday)
> &gt; To: "Chen Lei" <chenlei18s@ict.ac.cn>
> &gt; Cc: "amd-gfx list" <amd-gfx@lists.freedesktop.org>
> &gt; Subject: Re: [BUG] Data race when use PACKET3_DMA_DATA?
> &gt;
> &gt; On Wed, Jun 2, 2021 at 8:44 AM Chen Lei <chenlei18s@ict.ac.cn> wrote:
> &gt; &gt;
> &gt; &gt; Hi, I noticed that there are two ways to do DMA for amd gpu: the SDMA copy packet and the PM4 dma packet.
> &gt; &gt;
> &gt; &gt; I had tested the PM4 dma packet:  PACKET3_DMA_DATA. In most of time, it works.
> &gt; &gt;
> &gt; &gt; But when I launch an OpenCL kernel followed by a host-to-gpu DMA packet, it seems that the OpenCL kernel read the new value written by the following DMA packet.
> &gt; &gt;
> &gt; &gt; Both the OpenCL kernel and the PM4 dma packet are submitted using the amdgpu_cs_ioctl, and they are submitted to the same ring.
> &gt; &gt;
> &gt; &gt; I was not family with the hardware details. According to my understanding, because the ring is FIFO, there is no need for any explicit synchronization between the OpenCL kernel launch packet and the dma packet. So the result looked weird. And when I add the synchronization(i.e. amdgpu_cs_wait_ioctl) before the dma packet, everything is OK.
> &gt; &gt;
> &gt; &gt; Was it a hardware bug or did I miss something?
> &gt; &gt;
> &gt;
> &gt; The CP DMA engine is separate from the various CP micro engines.  When
> &gt; there is a DMA DATA packet, the DMA operation is offloaded to the CP
> &gt; DMA engine and the CP engine that processed the packet continues on to
> &gt; the next packet.  You need to use the ENGINE_SEL and CP_SYNC bits in
> &gt; the DMA DATA packet to specify the behavior you want.  The ENGINE_SEL
> &gt; bit selects which CP engine processes the packet (PFP or ME) and the
> &gt; CP_SYNC bit stops further packet processing on the selected engine
> &gt; until the DMA is complete.
> &gt;
> &gt; Alex
> </chenlei18s@ict.ac.cn></amd-gfx@lists.freedesktop.org></chenlei18s@ict.ac.cn></alexdeucher@gmail.com>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
