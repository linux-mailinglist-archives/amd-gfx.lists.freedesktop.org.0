Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D4D907B8
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 20:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC21D6E972;
	Fri, 16 Aug 2019 18:25:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7269A89F8E
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 15:14:54 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 201so4962079qkm.9
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 08:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fov2CgaO1O1CFkZX4IfqnTZnTK7C3zpSvYgzXGSY56g=;
 b=fDhs/2Fc6OjXt1Jz3WsMT+M9f8S+s7CKQ5cNB3qFrvEF25Ylg+E6R0Do8CbZAMWc4w
 m0oNWrvhtcHZjDLtOhQHpniLfuylpsnGmydjrTDiVJpwaInPyiV4EBjML7inPyfw4yja
 h/euTdu0YA4NosKm1qLlCgw8XcU3Dl9ihO3zMCJMk4VllMGQ3KxdnZcXSev6e1B3qZG6
 QcCUNTlad2gBiumON+z4SHUuOBZg4SsZG+rdBu9blc70cUZsHc2iogHYvu1F/uFDAjn7
 u2/dTuBhvSQrhtULa3FawOZeQcxv01sUCdIbx3wIT7BzzJzrgz0xSL8DqFVrxh/d0A/k
 a8Eg==
X-Gm-Message-State: APjAAAVgxDvEvf6u/2mRgha0dpWkFxz2wwHYtMODOOrDNUhD+H90zudy
 M+p+mO9YEpelgLINnVQaplxtfQ==
X-Google-Smtp-Source: APXvYqxJQYOJO15q7RlRP/vufAQqFSxN3g0+gtugu+v5p95C5icfuXRjyKSuaK0zmQH83GKJGhGMfA==
X-Received: by 2002:a05:620a:1590:: with SMTP id
 d16mr9385834qkk.18.1565968493491; 
 Fri, 16 Aug 2019 08:14:53 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id o127sm3158342qkd.104.2019.08.16.08.14.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Aug 2019 08:14:53 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hydwK-0003JY-LJ; Fri, 16 Aug 2019 12:14:52 -0300
Date: Fri, 16 Aug 2019 12:14:52 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org
Subject: Re: [PATCH v3 hmm 00/11] Add mmu_notifier_get/put for managing mmu
 notifier registrations
Message-ID: <20190816151452.GA8562@ziepe.ca>
References: <20190806231548.25242-1-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806231548.25242-1-jgg@ziepe.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 16 Aug 2019 18:25:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fov2CgaO1O1CFkZX4IfqnTZnTK7C3zpSvYgzXGSY56g=;
 b=oy5sZFjQp1BCVaEwQsb3+KNPFbSHSZHWPBMzBnqM3YkM8M6TeLN/TchFjkEdsICSuJ
 1C+Aqtldy/Y4ldUDXhcLTuhfNncF7+Dyd3fNJ1bom3uP8hS9LridrmdEdsAQXWEZtKjz
 7XP3pkdVorvFX0x7VQ1DMygwaFOvfV+UwasgUORcn3BEim4b1kFT8oE06M97uDUrjOv5
 mMHA/Z8hsM7HRGW+maHrZQD/1QDaaYGCk/ab/4r4vI2lVu52wx2id8gV5icj3phd9BLt
 KUOXu736r5AT7W/9wY/TxeK4Ryn6yfFSyNCnwDYASLlBBEV0NjKDADW49yLgEKf3SWZn
 2lUw==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Dimitri Sivanich <sivanich@sgi.com>,
 Gavin Shan <shangw@linux.vnet.ibm.com>, Andrea Righi <andrea@betterlinux.com>,
 linux-rdma@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 iommu@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDg6MTU6MzdQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IFRoaXMgc2VyaWVzIGlzIGFscmVhZHkgZW50YW5nbGVkIHdpdGggcGF0Y2hlcyBp
biB0aGUgaG1tICYgUkRNQSB0cmVlIGFuZAo+IHdpbGwgcmVxdWlyZSBzb21lIGdpdCB0b3BpYyBi
cmFuY2hlcyBmb3IgdGhlIFJETUEgT0RQIHN0dWZmLiBJIGludGVuZCBmb3IKPiBpdCB0byBnbyB0
aHJvdWdoIHRoZSBobW0gdHJlZS4KCj4gSmFzb24gR3VudGhvcnBlICgxMSk6Cj4gICBtbS9tbXVf
bm90aWZpZXJzOiBob2lzdCBkb19tbXVfbm90aWZpZXJfcmVnaXN0ZXIgZG93bl93cml0ZSB0byB0
aGUKPiAgICAgY2FsbGVyCj4gICBtbS9tbXVfbm90aWZpZXJzOiBkbyBub3Qgc3BlY3VsYXRpdmVs
eSBhbGxvY2F0ZSBhIG1tdV9ub3RpZmllcl9tbQo+ICAgbW0vbW11X25vdGlmaWVyczogYWRkIGEg
Z2V0L3B1dCBzY2hlbWUgZm9yIHRoZSByZWdpc3RyYXRpb24KPiAgIG1pc2Mvc2dpLWdydTogdXNl
IG1tdV9ub3RpZmllcl9nZXQvcHV0IGZvciBzdHJ1Y3QgZ3J1X21tX3N0cnVjdAo+ICAgaG1tOiB1
c2UgbW11X25vdGlmaWVyX2dldC9wdXQgZm9yICdzdHJ1Y3QgaG1tJwo+ICAgZHJtL3JhZGVvbjog
dXNlIG1tdV9ub3RpZmllcl9nZXQvcHV0IGZvciBzdHJ1Y3QgcmFkZW9uX21uCj4gICBkcm0vYW1k
a2ZkOiBmaXggYSB1c2UgYWZ0ZXIgZnJlZSByYWNlIHdpdGggbW11X25vdGlmZXIgdW5yZWdpc3Rl
cgo+ICAgZHJtL2FtZGtmZDogdXNlIG1tdV9ub3RpZmllcl9wdXQKCk90aGVyIHRoYW4gdGhlc2Ug
cGF0Y2hlczoKCj4gICBSRE1BL29kcDogdXNlIG1tdV9ub3RpZmllcl9nZXQvcHV0IGZvciAnc3Ry
dWN0IGliX3Vjb250ZXh0X3Blcl9tbScKPiAgIFJETUEvb2RwOiByZW1vdmUgaWJfdWNvbnRleHQg
ZnJvbSBpYl91bWVtCj4gICBtbS9tbXVfbm90aWZpZXJzOiByZW1vdmUgdW5yZWdpc3Rlcl9ub19y
ZWxlYXNlCgpUaGlzIHNlcmllcyBoYXMgYmVlbiBhcHBsaWVkLgoKSSB3aWxsIGFwcGx5IHRoZSBP
RFAgcGF0Y2hlcyB3aGVuIHRoZSBzZXJpZXMgdGhleSBkZXBlbmQgb24gaXMgbWVyZ2VkCnRvIHRo
ZSBSRE1BIHRyZWUKCkFueSBmdXJ0aGVyIGFja3MvcmVtYXJrcyBJIHdpbGwgYW5ub3RhdGUsIHRo
YW5rcyBpbiBhZHZhbmNlCgpUaGFua3MgdG8gYWxsIHJldmlld2VycywKSmFzb24KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
