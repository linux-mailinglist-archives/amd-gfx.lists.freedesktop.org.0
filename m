Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B80C18B834
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Mar 2020 14:40:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751E26E2C0;
	Thu, 19 Mar 2020 13:40:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4BE6EA05
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Mar 2020 11:50:30 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id f20so1461904qtq.6
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Mar 2020 04:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lBTUj1y9VtUDCn4ytJFEQ/eoQI6G7k2EQxvY7AJpV3c=;
 b=Q9ERC6iPr6C3r4Aftx8b5gwyrS/P6NkAng74KreczcNsHr53jWHlVKuPvCBBh0StdU
 b7wzRK/4QaptzavqQqjoxQtuj+QaqaBcHLAt+n2RM2aODrw/YIvYJOcY6oY/jhXWMdNl
 gFsDyu8l5L6Q4p5/Vec/nQL4ZF96TI6lmJ+GksJOA5nnA/U56BWjdrmmQuHmwq16PEgF
 vEDyKh6pD2UZZlm0QaUjZJg9ezYYrp/3bLf3kWlZYm9kIylqHOwtEoZBn6QJwP79CInq
 PaTsPCn3AYjQRE8u84qlU4iAzPC4kAqGszh17G2RZLFuZX+xqHCLjAuidtRaW2LMrHIM
 4mJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lBTUj1y9VtUDCn4ytJFEQ/eoQI6G7k2EQxvY7AJpV3c=;
 b=rItNpqqFNK+nMlwutyseLygilIXd2GptL3ZhjL+ZroeBauUby7oFGHL81BEqrvLsfI
 0Om4MbqF0ZGi9n3xmxveIU7t4Osnnhoqwlbdnom+xWATXju8sgXrnqZCw/HaJFtJ60Vi
 PLqWzFqU6M7Is3XP8oqB3pgK5+OMYFScHG+bnhI2bD/vbnzAmAESt8ZVQ9wlwUszZVhI
 TQUl+wnfbxkEIvXM14IFgON0hD9uWD6a6njcsXUflwsyHkDvCx2t8dw2uq7x1t+nhkx/
 hm8twa3ZLYYOzbWSDqUhIt0D/tNo3W6K8TGUo4jQ4mzOPrX5GZV5X3tjjTl8FjUjtTOs
 66AQ==
X-Gm-Message-State: ANhLgQ3xUkchXvHDyJTxYsbvQj6/JqRze3+mE5cB3WhhM/Q8wb0mNu/J
 rwZ6H8eUb4xWpLjJE6ndAncMqC3QOocogw==
X-Google-Smtp-Source: ADFU+vsIVebb1InTyDcl4fZPuH+UAvQ5tH6FZmi6I4UE9Qq4JBH+2FeGy/XT9qJsD57BNhHjEf5qDA==
X-Received: by 2002:ac8:24a7:: with SMTP id s36mr2441422qts.357.1584618629621; 
 Thu, 19 Mar 2020 04:50:29 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id h138sm1339362qke.86.2020.03.19.04.50.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 19 Mar 2020 04:50:28 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jEtgx-0004ip-P2; Thu, 19 Mar 2020 08:50:27 -0300
Date: Thu, 19 Mar 2020 08:50:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: ensure device private pages have an owner v2
Message-ID: <20200319115027.GI20941@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
 <20200319002849.GG20941@ziepe.ca> <20200319071633.GA32522@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319071633.GA32522@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 19 Mar 2020 13:40:03 +0000
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
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Mar 19, 2020 at 08:16:33AM +0100, Christoph Hellwig wrote:
> On Wed, Mar 18, 2020 at 09:28:49PM -0300, Jason Gunthorpe wrote:
> > > Changes since v1:
> > >  - split out the pgmap->owner addition into a separate patch
> > >  - check pgmap->owner is set for device private mappings
> > >  - rename the dev_private_owner field in struct migrate_vma to src_owner
> > >  - refuse to migrate private pages if src_owner is not set
> > >  - keep the non-fault device private handling in hmm_range_fault
> > 
> > I'm happy enough to take this, did you have plans for a v3?
> 
> I think the only open question is if merging 3 and 4 might make sense.
> It's up to you if you want it resent that way or not.

Now that I understand that amdgpu doesn't set the 'do not return
device_private pages' flag, I think the split is fine, I'll grab it as
is then today

Thanks,
Jason
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
