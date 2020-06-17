Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 523241FD11D
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2020 17:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F246E0CB;
	Wed, 17 Jun 2020 15:36:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD326E970
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2020 15:28:38 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id k22so1814804qtm.6
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2020 08:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YWvFZzs3KP9lJjMgLteUxWcl0AN5fcCF6bv79uFgihI=;
 b=fPvsZiRmvOrvrQ4yxrTzKd5CSIveZ17z50EpolEl+pPAK7HUWF0QJZmXtSGVDOakfw
 7DHwzIzE2lNcGxpAtO8aw08z/gM8Y21yy9DIXMANO2ubUa3TWdA4GmPrzu72SDfRdvmF
 BClIRqEbNJmDflVkgdFD+OnXmF0SaCCsk8z9/TyDuufHGuZdnpCUVgkaPeljCUzfOGUP
 iou8x9GwNeXqpb+7LiV1ym/MPlGBad5o331/0hIUNzTl2FFPtmlIOP+y+IRR8Ia8Spm0
 VHrOAMJcFDHzlMiG7WUr4U2IvrrqHhxtahUa25x/jrfaWVB1Q09VlgzgQNmhTWG78o/m
 b3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YWvFZzs3KP9lJjMgLteUxWcl0AN5fcCF6bv79uFgihI=;
 b=rfcC7DeQKr7Dfnl26vWXD9tTP1lTnq54Q9tuPQ26EzqT6dIOBVf8dQnKQCk62WRJ2t
 YXXUD0o5d3BXVv7Jo70oKHOLbkcD0evIIK9BpG+s4HHswaka8AFFFzomhr7oFD4kaxVF
 Nq3kViRWg9JstCKfMWI82qSmt1aPR7cPSKvIv/59DLgdk7onx8zd7wIyvUOnDqaCU9+X
 bjRWgTy4+E33dTuTl4CzM58mQPqrg7JYh/0gU45+PwPp8kKUEa07olPq/0cXlysCTy0P
 lN8f+Y9UJdLjepqOiPGroxjacR3HxJ3mONqgHVdqlohK9XdaHxluA4zyJjD+OrPFtkb7
 OoFw==
X-Gm-Message-State: AOAM532P1BFS2FMhhjo6pJc7XAjBCbwr8QyPbK0dTwfURn/MdqnYHl7K
 ZYJGITngQBBzS/DX/agnp5QUEg==
X-Google-Smtp-Source: ABdhPJzZDttOnjxPbTFDeZHyWDfba0peOY2A/3G4231dt912/147Xnlp7RMkFB2VSf50LuX5ZTAibw==
X-Received: by 2002:ac8:468a:: with SMTP id g10mr27323795qto.6.1592407717080; 
 Wed, 17 Jun 2020 08:28:37 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id f127sm210137qkb.55.2020.06.17.08.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 08:28:35 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
 id 1jlZzP-009d7z-9q; Wed, 17 Jun 2020 12:28:35 -0300
Date: Wed, 17 Jun 2020 12:28:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
Message-ID: <20200617152835.GF6578@ziepe.ca>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-5-daniel.vetter@ffwll.ch>
 <b11c2140-1b9c-9013-d9bb-9eb2c1906710@shipmail.org>
 <20200611083430.GD20149@phenom.ffwll.local>
 <20200611141515.GW6578@ziepe.ca>
 <20200616120719.GL20149@phenom.ffwll.local>
 <CAKMK7uE7DKUo9Z+yCpY+mW5gmKet8ugbF3yZNyHGqsJ=e-g_hA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uE7DKUo9Z+yCpY+mW5gmKet8ugbF3yZNyHGqsJ=e-g_hA@mail.gmail.com>
X-Mailman-Approved-At: Wed, 17 Jun 2020 15:36:35 +0000
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Jun 17, 2020 at 08:48:50AM +0200, Daniel Vetter wrote:

> Now my understanding for rdma is that if you don't have hw page fault
> support,

The RDMA ODP feature is restartable HW page faulting just like nouveau
has. The classical MR feature doesn't have this. Only mlx5 HW supports
ODP today.

> It's only gpus (I think) which are in this awkward in-between spot
> where dynamic memory management really is much wanted, but the hw
> kinda sucks. Aside, about 10+ years ago we had a similar problem with
> gpu hw, but for security: Many gpu didn't have any kinds of page
> tables to isolate different clients from each another. drivers/gpu
> fixed this by parsing&validating what userspace submitted to make sure
> it's only every accessing its own buffers. Most gpus have become
> reasonable nowadays and do have proper per-process pagetables (gpu
> process, not the pasid stuff), but even today there's still some of
> the old model left in some of the smallest SoC.

But I still don't understand why a dma fence is needed inside the GPU
driver itself in the notifier.

Surely the GPU driver can block and release the notifier directly from
its own command processing channel?

Why does this fence and all it entails need to leak out across
drivers?

Jason
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
