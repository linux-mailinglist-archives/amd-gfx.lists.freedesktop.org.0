Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56645984DB
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 21:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F9C6E984;
	Wed, 21 Aug 2019 19:54:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184D06E98E
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 19:53:04 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id s145so2952046qke.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 12:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Avf248fSzuypFcso7Kkr0yA+lcmduhMaWHH94TkjpAI=;
 b=aTzooJqohFwvw0t6jR6qXifKTT0WmANSaXIKtoNmWfrwOBnHwpAsMvEaLNnbYwbcSX
 HJWNvTP5aaaoVKyC21FgWsK+vb6R8bs6E7/3ceubVnXkBhL9oGTV5rZYTDXFZD3liNRJ
 azjSO2SSP5ErJJ4g1pM9+EmVGb6nuxD+M+cYLWM27BBY48pYIiMoj0wggam0TO7EC/VT
 +tA1hWpm46GqmrzZzjOFI2oRBQz+dJcAcSRG4u1SfbSWeI7bWqQb6q6+lChMSNZODTmk
 SI3hoAKE5NEfJqKQ9W0bDHlGs+s2YILDVxr71V/Uo3DU3okaonnisVs3N8Z8Fr1+SPr2
 gAjw==
X-Gm-Message-State: APjAAAV0v0rMGCAHt/l3YeFmuQBDdF/kG1Nn0sx/qYW9rary/cXU1X4n
 hRoHyhuy92M4PE/SNeZiVxRLhw==
X-Google-Smtp-Source: APXvYqwPksLN/jmRrXTfKl1JB/9WM5tJ8kTKLiTdMf+ZNHYSP0hbNDBV4ZLxlKKKGF2mGcl3vHw8pg==
X-Received: by 2002:a37:9701:: with SMTP id z1mr17576531qkd.66.1566417183189; 
 Wed, 21 Aug 2019 12:53:03 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id b202sm10311656qkg.83.2019.08.21.12.53.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Aug 2019 12:53:02 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1i0WfG-0005oO-5E; Wed, 21 Aug 2019 16:53:02 -0300
Date: Wed, 21 Aug 2019 16:53:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org
Subject: Re: [PATCH v3 hmm 00/11] Add mmu_notifier_get/put for managing mmu
 notifier registrations
Message-ID: <20190821195302.GA22164@ziepe.ca>
References: <20190806231548.25242-1-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806231548.25242-1-jgg@ziepe.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 21 Aug 2019 19:54:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Avf248fSzuypFcso7Kkr0yA+lcmduhMaWHH94TkjpAI=;
 b=AxfhikvjRrOipQcntJRqjdr/eKvR8BEra5qlDG10hvhnCuoV2Y1rax7uZg5mfRHTHC
 uPaWNuH6Em8WzNOLx9kTZ3NE540jiIjPDyL116dF2ihKw7XrA7R8XahBlEtlmkpTrEca
 iiMP7POS3K8y6Kjq4ZtTUy8g4uMiJ8gVVTdfnXrqGDdfUfCnK8ClM5wD8SM+V4khKCtG
 GxBMkz9dMuyiKJVS7YQukqCbImb4gRl3aNgGS/xQvglUUbXbj0EYMXZXq6GP+7adG5Jr
 vBXarNpeiZyR7KKPZZeJfz7rr0BkCL3tTmpq3tB8OjRr7Lbf17hUatbpQDkomugG4wri
 qr5Q==
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
IHdyb3RlOgogCj4gVGhpcyBzZXJpZXMgaXMgYWxyZWFkeSBlbnRhbmdsZWQgd2l0aCBwYXRjaGVz
IGluIHRoZSBobW0gJiBSRE1BIHRyZWUgYW5kCj4gd2lsbCByZXF1aXJlIHNvbWUgZ2l0IHRvcGlj
IGJyYW5jaGVzIGZvciB0aGUgUkRNQSBPRFAgc3R1ZmYuIEkgaW50ZW5kIGZvcgo+IGl0IHRvIGdv
IHRocm91Z2ggdGhlIGhtbSB0cmVlLgoKVGhlIFJETUEgcmVsYXRlZCBwYXRjaGVzIGhhdmUgYmVl
biBhcHBsaWVkIHRvIHRoZSBSRE1BIHRyZWUgb24gYQpzaGFyZWQgdG9waWMgYnJhbmNoLCBzbyBJ
J3ZlIG1lcmdlZCB0aGF0IGludG8gaG1tLmdpdCBhbmQgYXBwbGllZCB0aGUKbGFzdCBwYXRjaGVz
IGZyb20gdGhpcyBzZXJpZXMgb24gdG9wOgoKPiAgIFJETUEvb2RwOiB1c2UgbW11X25vdGlmaWVy
X2dldC9wdXQgZm9yICdzdHJ1Y3QgaWJfdWNvbnRleHRfcGVyX21tJwo+ICAgUkRNQS9vZHA6IHJl
bW92ZSBpYl91Y29udGV4dCBmcm9tIGliX3VtZW0KPiAgIG1tL21tdV9ub3RpZmllcnM6IHJlbW92
ZSB1bnJlZ2lzdGVyX25vX3JlbGVhc2UKClRoZXJlIHdhcyBzb21lIGNvbmZsaWN0IGNodXJuIGlu
IHRoZSBSRE1BIE9EUCBwYXRjaGVzIHZzIHdoYXQgd2FzIHVzZWQKdG8gdGhlIHBhdGNoZXMgZnJv
bSB0aGlzIHNlcmllcywgSSBmaXhlZCBpdCB1cC4gTm93IEknbSB3YWl0aW5nIGZvcgpzb21lIHRl
c3RpbmcgZmVlZGJhY2sgYmVmb3JlIHB1c2hpbmcgaXQgdG8gbGludXgtbmV4dAoKVGhhbmtzLApK
YXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
