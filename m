Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85FA83867
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 20:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4556E524;
	Tue,  6 Aug 2019 18:08:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC37F6E511
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 18:02:10 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id n11so85448680qtl.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 06 Aug 2019 11:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DWmSMnF3B1mTPtWIyEYX2euOl5QowlPflL5LrFAqjMw=;
 b=AYvPpJ3FVDqI9AqagqSkJDj/8BB23Lco3mHRls+5gWXvgnosc+G+axQlaAKFAQ8hp9
 2n2RhE55ZwiS0aBLdwUX8K7L+u38NNH6+vQlj2W8E3dvEuA65g01OpvaSDyCb4WJsoAT
 ZrSZoIJCAmKaiHMcN7oKbhNyFPZr57dw4KOPW6GrGkcGmIj6MvT9ENXB67TGVE4sdznM
 w71IqmoSlDOi38VlUw1uCZ4VEI0JMYS/Cut3L4d5FEMKBFYTJ/VtSfj7Frxl4WM7b/tx
 agdUSsIL7lMXG27YnFM4af8YwqYAypkMAGJnWurAkQjonKLXNDZmW8+GRr0xGWdw43x7
 35TQ==
X-Gm-Message-State: APjAAAV0+ZEdpkoLBOdDriQzNJ8laAQkchnNtYFFP/XqxfZBV6zNR4Bf
 PICn3JcpGIEldEwDHoLydaQmAA==
X-Google-Smtp-Source: APXvYqzwT9xNxemQscVlJmSlpGsNQA9yiKA1TtYWgT1CZ65aDe7RTogerUHwfzBX65WGTnxLLbQenA==
X-Received: by 2002:ac8:f99:: with SMTP id b25mr4258745qtk.142.1565114530121; 
 Tue, 06 Aug 2019 11:02:10 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id w10sm263879qts.77.2019.08.06.11.02.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 11:02:09 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hv3mj-0000H9-63; Tue, 06 Aug 2019 15:02:09 -0300
Date: Tue, 6 Aug 2019 15:02:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 08/15] mm: remove the mask variable in
 hmm_vma_walk_hugetlb_entry
Message-ID: <20190806180209.GN11627@ziepe.ca>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-9-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806160554.14046-9-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 06 Aug 2019 18:08:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DWmSMnF3B1mTPtWIyEYX2euOl5QowlPflL5LrFAqjMw=;
 b=Fz9mT5h+F2iLSvCsBQC5ggiqblN5sutWqjuhuF03Psd+Uf9SPIthU1SFjsJOpswgqI
 i/rgIdKvSW+0tmW7prrn9Y9533G5r4E6d8zM2DnGZ+TNNPM1MBH1FT1zMnZwkyxWU56W
 iIxNzxmjUm0QE0MLJTbJe3z6JqTvYF91SW6QufY/zMDl+9YGG4y5cVhS4ePPcReybl3S
 5KnATeu6yNsS0v/Exp3ApYHy7cwB4/w0c77CJqZUqewRB2Fv001+6QZuzn3886W/04vb
 HuXkgysTL1jkEq+Yt2WQvBYWRBxT7DYd/4ML1Ga5aZt50ou9KZTiM8DcK7BJNDl2Ss0U
 6iSw==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDc6MDU6NDZQTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhlIHBhZ2V3YWxrIGNvZGUgYWxyZWFkeSBwYXNzZXMgdGhlIHZhbHVlIGFz
IHRoZSBobWFzayBwYXJhbWV0ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3
aWcgPGhjaEBsc3QuZGU+Cj4gIG1tL2htbS5jIHwgNyArKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogSmFzb24gR3Vu
dGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
