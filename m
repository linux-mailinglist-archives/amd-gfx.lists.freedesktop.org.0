Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4584C9F2A6
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 20:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B25D89829;
	Tue, 27 Aug 2019 18:51:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364CA89BB0
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 18:41:58 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id t12so34367qtp.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 11:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9ceAN/Yoez35TeAjbDhFK5DksMbw1eL2zoww/c7DDSE=;
 b=SClLb6n9QoUTKt8plDyNdsR2ALOAxv13aYa5KCVu/N+POnthk4txzpocMmXjYSVYRq
 Q9xVFd6497KyS7JDepgiSHZ5WSt7b1AFPHBGGSitJ05AZPyQ7mIZTY+yWZVJNIItoMOg
 J12D5bJ0K7a2t8nEX2wrh0itN9A5qx4MXODPQwl55pe2HZm3NLU3okjgDhxS+JvHPNVL
 vY57BYffNfnX+w7+JK+ELqciTZ7Ax7CfEYh/2XKx56Kmepv46sc6Qqi9C2YCywFSVz4j
 unixvO7v2YAAJViTXRyMnRuCsK6hcOs0V0XHTBPDuoYYegBH96oEUcL4FHpKwPCXFRH7
 NWGw==
X-Gm-Message-State: APjAAAWXVBIe/xFpdo3vPQDLaNRgwEZvdZSXSS/m6lRTrPg677Tj38pK
 bNubeFUcFuTw7nJDF8Jc5E3yMg==
X-Google-Smtp-Source: APXvYqxGsIEH37K7EHHZpDcbxKJ2Zt/WeLY+aot3NzZQz1/QF/DaeFShLNUpqkv0bACqFBQq4QCy2g==
X-Received: by 2002:ac8:23cf:: with SMTP id r15mr242835qtr.97.1566931317969;
 Tue, 27 Aug 2019 11:41:57 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-216-168.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.216.168])
 by smtp.gmail.com with ESMTPSA id x28sm9926373qtk.8.2019.08.27.11.41.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Aug 2019 11:41:57 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1i2gPl-0006d2-1c; Tue, 27 Aug 2019 15:41:57 -0300
Date: Tue, 27 Aug 2019 15:41:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 2/2] mm/hmm: hmm_range_fault() infinite loop
Message-ID: <20190827184157.GA24929@ziepe.ca>
References: <20190823221753.2514-1-rcampbell@nvidia.com>
 <20190823221753.2514-3-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190823221753.2514-3-rcampbell@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 27 Aug 2019 18:51:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9ceAN/Yoez35TeAjbDhFK5DksMbw1eL2zoww/c7DDSE=;
 b=Tg3wAqzKDb2Nvtp5xnTJu8Zd7Xoskps6KbP7KGSG2mXkHL1YpVlpacJxibryLDlNJw
 179cDfjV75KnOnbO786z8kq561zwavu/nufenfX6VMltb+S29UuroexvGBTlW43jXQmu
 BnfnPJVVYk2s3RHioNaSV2iGEh7jX3UBGoPb1YLczXEMrlSdBRwoauSdVh1dnk3odz81
 5DTC0TRiSs3uSv6gH+zLxmF3Fs8g9ISCjSxPwwihfMHKeWeF5bYqA+q9TtOOx2nNKZ8P
 Zp8VHkM7RZiKWOrFRQbrnX0L3PbEWZuZHj7c02SuCN1iqneJHz/alYfeQVVF1tfTWxVj
 JRYw==
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 amd-gfx@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMDM6MTc6NTNQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cgo+IFNpZ25lZC1vZmYtYnk6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlh
LmNvbT4KPiAgbW0vaG1tLmMgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKPiBpbmRleCAyOTM3MTQ4
NWZlOTQuLjQ4ODJiODNhZWNjYiAxMDA2NDQKPiArKysgYi9tbS9obW0uYwo+IEBAIC0yOTIsNiAr
MjkyLDkgQEAgc3RhdGljIGludCBobW1fdm1hX3dhbGtfaG9sZV8odW5zaWduZWQgbG9uZyBhZGRy
LCB1bnNpZ25lZCBsb25nIGVuZCwKPiAgCWhtbV92bWFfd2Fsay0+bGFzdCA9IGFkZHI7Cj4gIAlp
ID0gKGFkZHIgLSByYW5nZS0+c3RhcnQpID4+IFBBR0VfU0hJRlQ7Cj4gIAo+ICsJaWYgKHdyaXRl
X2ZhdWx0ICYmIHdhbGstPnZtYSAmJiAhKHdhbGstPnZtYS0+dm1fZmxhZ3MgJiBWTV9XUklURSkp
Cj4gKwkJcmV0dXJuIC1FUEVSTTsKCkNhbiB3YWxrLT52bWEgYmUgTlVMTCBoZXJlPyBobW1fdm1h
X2RvX2ZhdWx0KCkgdG91Y2hlcyBpdAp1bmNvbmRpdGlvbmFsbHkuCgpKYXNvbgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
