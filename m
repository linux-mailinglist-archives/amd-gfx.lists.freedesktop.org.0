Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAFD49A50
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 09:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE976E101;
	Tue, 18 Jun 2019 07:19:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E09F89F97
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 00:38:09 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id l128so7467755qke.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 17:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EFgy84qSqdB63j+sw5RQb8FlQ7olTwYiiqpzSjRkr8U=;
 b=Xq+8422BrqyxP4JXYqZejleB0UvgCT/hN5G1jN0t+CgonBSXxVqP+bA//Ba+PtbhUn
 diaoewa4DWF0lRF45umqJDjTlDfk9/zZHkgR8H31N7sYlem26Nm4L0fG2KZT2K+nB5uH
 4YI/bA05E1dk92PfeaHWS/O3cKjpa71LYLQvRcgOQuR4592mmtcPEP7nXsNMT+CMIit7
 2JYgDzwtXzN4ITIvai0Ro99RzVmcOGw9ZSq98tuUgcyq7ZoqRAuy9YvSok7qjhG1pOiQ
 TPFRjop6dV9hGtfLcN3gXQ7AP/CEelSnCp8zt0GJenzY+DX68LpXLoDs0A38DjNq3W0D
 KR9Q==
X-Gm-Message-State: APjAAAXyS/ZLTsdoPyckuKDJVCxxBdC0tmVhS7OYaGPa7GT3mKBdn4X6
 Ej47qaa+JdQmmmwE9KAVaBg5hQ==
X-Google-Smtp-Source: APXvYqyeFBKaRlaV7l7eUdOweeWB83eOAxMhqF5BFWtungKZNloqqlhd+ctR1JGUO5HBcVp4eWezCA==
X-Received: by 2002:a37:4793:: with SMTP id
 u141mr66063884qka.355.1560818288855; 
 Mon, 17 Jun 2019 17:38:08 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id i22sm7653833qti.30.2019.06.17.17.38.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Jun 2019 17:38:08 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hd28V-0000kY-Jn; Mon, 17 Jun 2019 21:38:07 -0300
Date: Mon, 17 Jun 2019 21:38:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 hmm 10/12] mm/hmm: Do not use list*_rcu() for
 hmm->ranges
Message-ID: <20190618003807.GD30762@ziepe.ca>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-11-jgg@ziepe.ca>
 <20190615141826.GJ17724@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190615141826.GJ17724@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:19:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EFgy84qSqdB63j+sw5RQb8FlQ7olTwYiiqpzSjRkr8U=;
 b=gEMe8OGDFmOz6H46yGNGMqF8pI5BwGDEcf+SCaHqb0Q7uRwuonwPVlWfdaht7QofIf
 YtRgnZv2e9ADohWcFTRVNBYXno1F4xdqwANh3AoWhgQMpkk6q4C73j++QLk+F6iC/Wju
 IPMl2CiAFZSvU7ydMedZlrsuuDZ/6Y0XEeYIDVixBngY8FE0gVLsWnlEJSLgpw6skcr+
 zzYgJ2BJQj3dg2qGcz6M9TsKsHpszq25fWMd1XzmqaGMWCdE4XNQHbUtNhiHChs/I842
 xkYSo0wFMFiReic1CZqd6S3jyFJPcJgNcxDLbu/6GrsVfkHd0kWkCTx4jW2kP6BEEWBL
 gN8A==
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
 Ira Weiny <iweiny@intel.com>, dri-devel@lists.freedesktop.org,
 Souptick Joarder <jrdr.linux@gmail.com>, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMTUsIDIwMTkgYXQgMDc6MTg6MjZBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDk6NDQ6NDhQTSAtMDMwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gIAlyYW5nZS0+aG1tID0gaG1tOwo+ID4gIAlrcmVmX2dl
dCgmaG1tLT5rcmVmKTsKPiA+IC0JbGlzdF9hZGRfcmN1KCZyYW5nZS0+bGlzdCwgJmhtbS0+cmFu
Z2VzKTsKPiA+ICsJbGlzdF9hZGQoJnJhbmdlLT5saXN0LCAmaG1tLT5yYW5nZXMpOwo+ID4gIAo+
ID4gIAkvKgo+ID4gIAkgKiBJZiB0aGVyZSBhcmUgYW55IGNvbmN1cnJlbnQgbm90aWZpZXJzIHdl
IGhhdmUgdG8gd2FpdCBmb3IgdGhlbSBmb3IKPiA+IEBAIC05MzQsNyArOTM0LDcgQEAgdm9pZCBo
bW1fcmFuZ2VfdW5yZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKPiA+ICAJc3RydWN0
IGhtbSAqaG1tID0gcmFuZ2UtPmhtbTsKPiA+ICAKPiA+ICAJbXV0ZXhfbG9jaygmaG1tLT5sb2Nr
KTsKPiA+IC0JbGlzdF9kZWxfcmN1KCZyYW5nZS0+bGlzdCk7Cj4gPiArCWxpc3RfZGVsKCZyYW5n
ZS0+bGlzdCk7Cj4gPiAgCW11dGV4X3VubG9jaygmaG1tLT5sb2NrKTsKPiAKPiBMb29rcyBmaW5l
Ogo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IAo+
IEJ0dywgaXMgdGhlcmUgYW55IHJlYXNvbiBuZXcgcmFuZ2VzIGFyZSBhZGRlZCB0byB0aGUgZnJv
bnQgYW5kIG5vdCB0aGUKPiB0YWlsIG9mIHRoZSBsaXN0PwoKQ291bGRuJ3QgZmluZCBvbmUuIEkg
dGhpbmsgb3JkZXIgb24gdGhpcyBsaXN0IGRvZXNuJ3QgbWF0dGVyLgoKSmFzb24KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
