Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6914C84D
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 09:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459C96E544;
	Thu, 20 Jun 2019 07:22:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6582B6E377
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Jun 2019 11:34:54 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id a15so19377308qtn.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Jun 2019 04:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Lo9X66uznaZ6SGYkNk0Sx1BYJ1CIYwurC70zh2R4uz8=;
 b=pO777ij0CHrA0Br+osjgp4+mWizpujtck2NiDgxRxRmR0Sco81Fhj1egRWREDhPp7X
 jaal8GMB1arHkV+lztcGYppUnDvrV1Lgp2NbFhTKbULR3jgMxy0MGNseB5nXzhOWfpSL
 TbT6Oi8DMsOkaa0Ws1BUukC9fBVHtQ/yrxHFCBt/1Thp864tAwF6FXkxFBMBnqvqxNuo
 2j8G75I9RehTj3uouwnmmXOh4rsCecPhZGmrj1Khhe/9EvZjUDs13Wk45neN5hCeR4DW
 1JOwEyCBzcljuM+AnugBkhy7v6HVN8Ceazj9xnW7MMxzIXU/LIdEw231YfahpqFMfHRq
 fLXQ==
X-Gm-Message-State: APjAAAU85e+omZMS4AehJ9V9TaCFT2rzZMQ3VJqpPnBeKlgLp1Petbu4
 cpvNgQOMzLVSG0bfhxgZ4L9p6Q==
X-Google-Smtp-Source: APXvYqysE5jQwu5IGvItnPtoqMfHXLCakREbAz5IbbNkflU7Xd2VYz5hjEn1/wSvLEs0Ks3ehAZ0LQ==
X-Received: by 2002:ad4:5388:: with SMTP id i8mr6987929qvv.166.1560944093328; 
 Wed, 19 Jun 2019 04:34:53 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id i22sm10799810qti.30.2019.06.19.04.34.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Jun 2019 04:34:52 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hdYrc-0002xP-6l; Wed, 19 Jun 2019 08:34:52 -0300
Date: Wed, 19 Jun 2019 08:34:52 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 hmm 06/12] mm/hmm: Hold on to the mmget for the
 lifetime of the range
Message-ID: <20190619113452.GB9360@ziepe.ca>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-7-jgg@ziepe.ca>
 <20190615141435.GF17724@infradead.org>
 <20190618151100.GI6961@ziepe.ca>
 <20190619081858.GB24900@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619081858.GB24900@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:22:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=Lo9X66uznaZ6SGYkNk0Sx1BYJ1CIYwurC70zh2R4uz8=;
 b=FKAUonMZk1gq68qWyHk5hxQwjYagl4YsmsAJviMRujON6p/cymKi6K/YRCSBGj83zJ
 JkfE/8aIyLUhGGY3g43VYw3XN/P1XonbUFKtelLRQiEwpnDabiu0XyHp4MTd4BxXnjq0
 V7oSMVDQ0B9LhdM9XamUqUYQ5FEAD5RlNAb4/W6UMjxMBMs9JgY42UFu4GcvX+n/zWDK
 MfPOy1Eqv9vEhMluQPKsGeBikLCd90E0ip1ORNx/X6O84GweOuD7mvfqOcigbyXMEBZB
 NoPogRjRvgMiG+lHlke1ShBBcwTOJQM51QTvE9P4WYq9zRxtb4rz854nmVnQvJZtVMtb
 Qb+A==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDE6MTg6NThBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gPiAgCW11dGV4X2xvY2soJmhtbS0+bG9jayk7Cj4gPiAtCWxpc3RfZGVsKCZy
YW5nZS0+bGlzdCk7Cj4gPiArCWxpc3RfZGVsX2luaXQoJnJhbmdlLT5saXN0KTsKPiA+ICAJbXV0
ZXhfdW5sb2NrKCZobW0tPmxvY2spOwo+IAo+IEkgZG9uJ3Qgc2VlIHRoZSBwb2ludCB3aHkgdGhp
cyBpcyBhIGxpc3RfZGVsX2luaXQgLSB0aGF0IGp1c3QKPiByZWluaXRpYWxpemXRlSByYW5nZS0+
bGlzdCwgYnV0IGRvZXNuJ3QgY2hhbmdlIGFueXRoaW5nIGZvciB0aGUgbGlzdAo+IGhlYWQgaXQg
d2FzIHJlbW92ZWQgZnJvbS4gIChhbmQgaWYgdGhlIGxpc3RfZGVsX2luaXQgd2FzIGludGVuZGVk
Cj4gYSBsYXRlciBwYXRjaCBpbiB5b3VyIGJyYW5jaCByZXZlcnRzIGl0IHRvIHBsYWluIGxpc3Rf
ZGVsLi4pCgpKdXN0IGZvbGxvd2luZyB0aGUgaW5zdHJ1Y3Rpb25zOgoKLyoqCiAqIGxpc3RfZW1w
dHlfY2FyZWZ1bCAtIHRlc3RzIHdoZXRoZXIgYSBsaXN0IGlzIGVtcHR5IGFuZCBub3QgYmVpbmcg
bW9kaWZpZWQKICogQGhlYWQ6IHRoZSBsaXN0IHRvIHRlc3QKICoKICogRGVzY3JpcHRpb246CiAq
IHRlc3RzIHdoZXRoZXIgYSBsaXN0IGlzIGVtcHR5IF9hbmRfIGNoZWNrcyB0aGF0IG5vIG90aGVy
IENQVSBtaWdodCBiZQogKiBpbiB0aGUgcHJvY2VzcyBvZiBtb2RpZnlpbmcgZWl0aGVyIG1lbWJl
ciAobmV4dCBvciBwcmV2KQogKgogKiBOT1RFOiB1c2luZyBsaXN0X2VtcHR5X2NhcmVmdWwoKSB3
aXRob3V0IHN5bmNocm9uaXphdGlvbgogKiBjYW4gb25seSBiZSBzYWZlIGlmIHRoZSBvbmx5IGFj
dGl2aXR5IHRoYXQgY2FuIGhhcHBlbgogKiB0byB0aGUgbGlzdCBlbnRyeSBpcyBsaXN0X2RlbF9p
bml0KCkuIEVnLiBpdCBjYW5ub3QgYmUgdXNlZAogKiBpZiBhbm90aGVyIENQVSBjb3VsZCByZS1s
aXN0X2FkZCgpIGl0LgogKi8KCkFncmVlIGl0IGRvZXNuJ3Qgc2VlbSBvYnZpb3VzIHdoeSB0aGlz
IGlzIHJlbGV2YW50IHdoZW4gY2hlY2tpbmcgdGhlCmxpc3QgaGVhZC4uCgpNYXliZSB0aGUgY29t
bWVudCBpcyBhIGJpdCBtaXNsZWFkaW5nPwoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
