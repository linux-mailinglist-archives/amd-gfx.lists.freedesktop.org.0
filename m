Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF88C8386A
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 20:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0ED6E52E;
	Tue,  6 Aug 2019 18:08:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179F86E51B
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 18:02:50 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id 201so63569631qkm.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 06 Aug 2019 11:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=J340zbxKrZwPhKQPn9TeC4csGhsk958SAmRA1+an/JE=;
 b=qlLPv5Xe8uT/4pLaZphKz62GcsMIF2sKqg0UDu2DF9CdxZ4wrTFVUhd+H89VbyIM4O
 uBuoAl+vNbKziypveYVoiqdbnndtEcCKMNa28Bb6wY5PAOUzP9N2wsIR3B9VF6/3Rofm
 UvbEokZNYSIBInxn56icc1mdN6fRfjZK0L11x2o8nrcz0q7r/2UiXV78R0HsrQqORGJM
 yszgqCx4ln3lB7rVvkszxlpFyifBgxb4ZDVfVjNnLuwvGUbsb2HFi1fG45Qp1dOYI1eV
 zwGTDkgkMdjVfNT5ooCKOwaq28tmPYPZEHP3TH0/hKcogjMHQx5YudOQ7oMdBIzLrPO9
 qKLQ==
X-Gm-Message-State: APjAAAWQxiEeaTwYYXqBhfU6fybdigfsjlJntQdpEEvvJcHZpWC4C1vw
 D+hAZKAX++RajROkyqF/PGcjAQ==
X-Google-Smtp-Source: APXvYqzeVullh9O51A7m3TZsWYHDgm0ndSlca+disOdIT8zFGqnFmyETv0vAgxjYTLrTqv0QWoZpMA==
X-Received: by 2002:a37:7704:: with SMTP id s4mr4481690qkc.310.1565114569197; 
 Tue, 06 Aug 2019 11:02:49 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id c18sm6024222qtj.25.2019.08.06.11.02.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 11:02:48 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hv3nM-0000IY-6M; Tue, 06 Aug 2019 15:02:48 -0300
Date: Tue, 6 Aug 2019 15:02:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/15] nouveau: pass struct nouveau_svmm to
 nouveau_range_fault
Message-ID: <20190806180248.GO11627@ziepe.ca>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806160554.14046-4-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 06 Aug 2019 18:08:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=J340zbxKrZwPhKQPn9TeC4csGhsk958SAmRA1+an/JE=;
 b=dmyRhMBZI6zY0I2u7wdyHQjMKNx7X6q/44JyGKfb/VDswyFMmZFRkfFHuwa6xb9W77
 /60SemHut0sNFpXi8VWhLEujUvdmhIPrdRNkn3/J8WP+d2+9yM+59k7uYRD0oXqoGmkv
 AdAgySgMZPnuRZQMrufc/1lAUL2PUjg7rsZvJGuL8Mj2mTI3z0O2wFRQECzd2fD6TiTN
 BOs8Eu8913OI8Gc+ity2XD16jj+X32RK4PRj79qKdpLBOcODvMrV18XBvn3mOzh3Diqj
 awOnPn2b4LSHKJWlA/RvcCNCNU2eXDwXISITGSPgHG1GksuEOvVSXUJKrqxO2IQiTL/B
 Xh+g==
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

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDc6MDU6NDFQTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gV2UnbGwgbmVlZCB0aGUgbm91dmVhdV9zdm1tIHN0cnVjdHVyZSB0byBpbXBy
b3ZlIHRoZSBmdW5jdGlvbiBzb29uLgo+IEZvciBub3cgdGhpcyBhbGxvd3MgdXNpbmcgdGhlIHN2
bW0tPm1tIHJlZmVyZW5jZSB0byB1bmxvY2sgdGhlCj4gbW1hcF9zZW0sIGFuZCB0aHVzIHRoZSBz
YW1lIGRlcmVmZXJlbmNlIGNoYWluIHRoYXQgdGhlIGNhbGxlciB1c2VzCj4gdG8gbG9jayBhbmQg
dW5sb2NrIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0
LmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jIHwgMTIg
KysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCgpSZXZpZXdlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoK
SmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
