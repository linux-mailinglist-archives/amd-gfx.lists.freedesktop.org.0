Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB9138C01
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Jun 2019 15:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E0E89DC5;
	Fri,  7 Jun 2019 13:54:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE4D89DA3
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Jun 2019 13:42:30 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id j19so2232287qtr.12
 for <amd-gfx@lists.freedesktop.org>; Fri, 07 Jun 2019 06:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GnW/twM6MkT3sK1ZhrwgxUqvD0LPiRdOubIMmtxqWdI=;
 b=cVhDE+YKFlt+dCpsgqEPkx6558lCn177X8zl8XsKpAqtI8rFr4XGxlSdn9PzwjCOkh
 ZR3Z/mMVa4KiMRY4+TohYXQgg1E9WDkerM5KzLnTNzXlOPRGQSA24zqTF/79uhPEQiYD
 NpM2KMQQFTMvECffiIubq+9I89zv58Xq35JrpkdgU/Qya7vuihi5fGvloWeSIUFtY6Kd
 SI4KNRLFGhTBvGnN7yNlzurFZp3x0QlH78dtUJKFMSC/XHdMH8D8l/qFQ5qKJkYSOIyM
 PHsxOd5yUYQHrDc0BRaFgx5tWhnXlruuitgQpWYKxUsFLqqOuBJRnumF6fBI+TcfmcQn
 fOTA==
X-Gm-Message-State: APjAAAWxIzG3gE97Cw2TQvAvHyyHgTNDYK/rraeMPPC//ejwWPqPqltJ
 xOnmZZ7yexna2Dgg+8YCzBQTfQ==
X-Google-Smtp-Source: APXvYqwsAceJbR30iBQCPsJ2106L5t6QxNp2dZRUeMJkrJIRo66xTGleQFJNlMPYL+7b91XqCDSsBw==
X-Received: by 2002:ac8:3811:: with SMTP id q17mr17943650qtb.315.1559914949560; 
 Fri, 07 Jun 2019 06:42:29 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id m66sm1104947qkb.12.2019.06.07.06.42.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 06:42:29 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hZF8W-0008Kq-EF; Fri, 07 Jun 2019 10:42:28 -0300
Date: Fri, 7 Jun 2019 10:42:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 hmm 01/11] mm/hmm: fix use after free with struct hmm
 in the mmu notifiers
Message-ID: <20190607134228.GG14802@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-2-jgg@ziepe.ca>
 <9c72d18d-2924-cb90-ea44-7cd4b10b5bc2@nvidia.com>
 <20190607123432.GB14802@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190607123432.GB14802@ziepe.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 07 Jun 2019 13:54:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GnW/twM6MkT3sK1ZhrwgxUqvD0LPiRdOubIMmtxqWdI=;
 b=fOBioA9m9PbWefjn1DmJWxfFXCC2dztfbWTo9BaFpc1JJx99fsn9by4LkHonqKcFmM
 d/2SspLVs5CoByQJzhZGvsoKTPp5pbaAMXH/Y3xnQgNd85ur/14fqcJt/zQPtZRGnhan
 hRpZi3W37HzqC4a9zJzl2YUJbc3HDrINupGkFqNcTc57YBA+twb6v9h7pN4lWFUIZh/5
 fXWs4cmg6a6Z4mz+q5dP4OTA32NAxXoy6nmukwYHw4QH3BhKt9SZ5xtA10sXK/+ww6j6
 Rpga877RogkeluQhFKwv8FEazUzN2dRczANS+ORbtBYTcceCE2B/jT2rHsQls1Rwme7b
 Lo6w==
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
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 Felix.Kuehling@amd.com, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDk6MzQ6MzJBTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgoKPiBDSCBhbHNvIHBvaW50ZWQgb3V0IGEgbW9yZSBlbGVnYW50IHNvbHV0aW9uLCB3
aGljaCBpcyB0byBnZXQgdGhlIHdyaXRlCj4gc2lkZSBvZiB0aGUgbW1hcF9zZW0gZHVyaW5nIGht
bV9taXJyb3JfdW5yZWdpc3RlciAtIG5vIG5vdGlmaWVyCj4gY2FsbGJhY2sgY2FuIGJlIHJ1bm5p
bmcgaW4gdGhpcyBjYXNlLiBUaGVuIHdlIGRlbGV0ZSB0aGUga3JlZiwgc3JjdQo+IGFuZCBzbyBm
b3J0aC4KCk9vcHMsIGl0IHR1cm5zIG91dCB0aGlzIGlzIG9ubHkgdGhlIGNhc2UgZm9yIGludmFs
aWRhdGVfc3RhcnQvZW5kLCBub3QKcmVsZWFzZSwgc28gdGhpcyBkb2Vzbid0IGhlbHAgd2l0aCB0
aGUgU1JDVSB1bmxlc3Mgd2UgYWxzbyBjaGFuZ2UKZXhpdF9tbWFwIHRvIGNhbGwgcmVsZWFzZSB3
aXRoIHRoZSBtbWFwIHNlbSBoZWxkLgoKU28gSSB0aGluayB3ZSBoYXZlIHRvIHN0aWNrIHdpdGgg
dGhpcyBmb3Igbm93LgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
