Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 668F63B6D5
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 16:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A412B891AC;
	Mon, 10 Jun 2019 14:08:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11D488F61
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jun 2019 13:09:17 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y57so10463761qtk.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jun 2019 06:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=4F5p4XvqxWD0TPhx038sRdW6UkfS+pQjYQgLxUjnBMI=;
 b=CAw56Ee0MaOEZcSeWWoHMLn7m3MMHXQOKKVtYKRDXXDlNbyOSf1ojvjKW8wpDaV8VK
 5QJ9uLwZeP3irW5r+kvaAzoxZnS38WY0PM7iw751fwV4JFWZB1nGIQ7xRM1d7yJ9GtCa
 WMK3ahVPLUkmEOuotas2GjOd6H25RP5gv4PPAYBY9Uu8YA74IYqzlKDaP2cdg6GRRG8v
 rWiwUr5nmMh2NDz4NlxMEDxMqmMfzu9ahLFrSNBId6Dc4hawaeB3A0MjdKKxh9nTD+Gw
 gMx/R0/zyFQrNxpPNR9ghlD+AuGFROoUyjRMOKAIVvsBAlK+rCXbWCAjtFf85fPcf2aJ
 RJdQ==
X-Gm-Message-State: APjAAAWoAiSzKn2XVRM0ZFFNtGSQbGn+zi5Rr0jbb+nmd4iNwRuFO39a
 xhtwHk3orH4GprXAFUnu2398BA==
X-Google-Smtp-Source: APXvYqyfdzwD7zPoXm7GvJhg1KqfurFKZJX3W/vApYwm27bMvAhRfi5kk7rnbLbo+akkzc5tVyXK/g==
X-Received: by 2002:ac8:1af4:: with SMTP id h49mr51085239qtk.183.1560172156644; 
 Mon, 10 Jun 2019 06:09:16 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id v30sm1245889qtk.45.2019.06.10.06.09.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Jun 2019 06:09:16 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1haK31-0006cK-Gt; Mon, 10 Jun 2019 10:09:15 -0300
Date: Mon, 10 Jun 2019 10:09:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v2 hmm 02/11] mm/hmm: Use hmm_mirror not mm as an
 argument for hmm_range_register
Message-ID: <20190610130915.GA18468@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-3-jgg@ziepe.ca>
 <4a391bd4-287c-5f13-3bca-c6a46ff8d08c@nvidia.com>
 <e460ddf5-9ed3-7f3b-98ce-526c12fdb8b1@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e460ddf5-9ed3-7f3b-98ce-526c12fdb8b1@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 10 Jun 2019 14:08:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=4F5p4XvqxWD0TPhx038sRdW6UkfS+pQjYQgLxUjnBMI=;
 b=BhIIjcgOeQFdpsXOGxWnmGvjoyeGrIjjevpQNRl/I2/FM8ihdN5hXQobSh95XYjgPy
 BcVai4r/g1HxBTsXAlAV0qer0KY857kzqTHnHg2h6eEGGmmeCl7I6rNfu1lMP1j2s+65
 HMCq4j4xGVfZGz9FHAfQJXTacr+yVjc2YESaxykFfinvyANrOti3zkztW1T11pGgbt+m
 ogx8XVpNVzdJsodX6ozViM6hnDCL71wrSt/am17+Hfd0sGLK4ljxB0UQChBHCVSbWxea
 5/soEI9XcHDofveKfkWMk8uTfUv0yVeOC28YGBJDNyrnMAdm6q1bApQkogtXbzNnCf+V
 garw==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDM6Mzk6MDZQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gPiA+ICvCoMKgwqAgcmFuZ2UtPmhtbSA9IGhtbTsKPiA+ID4gK8KgwqDCoCBrcmVm
X2dldCgmaG1tLT5rcmVmKTsKPiA+ID4gwqDCoMKgwqDCoCAvKiBJbml0aWFsaXplIHJhbmdlIHRv
IHRyYWNrIENQVSBwYWdlIHRhYmxlIHVwZGF0ZXMuICovCj4gPiA+IMKgwqDCoMKgwqAgbXV0ZXhf
bG9jaygmaG1tLT5sb2NrKTsKPiA+ID4gCj4gCj4gSSBmb3Jnb3QgdG8gYWRkIHRoYXQgSSB0aGlu
ayB5b3UgY2FuIGRlbGV0ZSB0aGUgZHVwbGljYXRlCj4gICAgICJyYW5nZS0+aG1tID0gaG1tOyIK
PiBoZXJlIGJldHdlZW4gdGhlIG11dGV4X2xvY2svdW5sb2NrLgoKRG9uZSwgdGhhbmtzCgpKYXNv
bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
