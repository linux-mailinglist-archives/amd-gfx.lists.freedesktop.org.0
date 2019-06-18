Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F7449A4E
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 09:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6EE6E0FB;
	Tue, 18 Jun 2019 07:19:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBC789F71
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 00:37:00 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id y57so13229033qtk.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 17:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DUhdu87n/RcFK2o2RKT7Xn6jZQqeitWARb0DhK6/xFo=;
 b=YRJGe581asjvfd0Ry1bMHggJ21hkr9raqSyr+s2utDK3ocqALDyt/uBony+5dx2T5R
 a9wFq1wI9zxqg2Tciqye4dFD1/d3m52dosXSO0AdeqdAvcsDVhIFtF5pbxjbqE4f/mUP
 Y44FC0GdHlfqfHkhaOvfkt5uLfsWomG4ckkYuVUx6owwX2SmWmsgD0Y6ngS/Z/kLEZfT
 fSsdb19VYO9h79zJb+nOW+hlz4hjC2gtvqWxrv1q0Z/XD7ACoJCOw5PpaxLQCWTgPGvo
 qzBmKbISC8b0WLnWquYZ3ZC1soHUVZ4doJ+j70JQMu03sMWkij/lYkdj/4NMLXH8/eTl
 /9mg==
X-Gm-Message-State: APjAAAVBZAptP4hRYGsAlFc/VcsdhTeEV0PYZR8AwJLQPuXGjUVdSzQ3
 p5JQygKl1HT37+JwpwJiEZcTsQ==
X-Google-Smtp-Source: APXvYqwNKmMPGfd11Aoys/ex+FCBBx8y28tJjyO+G3ezjcr0a4wUE2AKBOFyQh6LE7vtVp6hp3BWOw==
X-Received: by 2002:a0c:89a5:: with SMTP id 34mr4976222qvr.110.1560818219783; 
 Mon, 17 Jun 2019 17:36:59 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id 41sm9704086qtp.32.2019.06.17.17.36.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Jun 2019 17:36:59 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hd27O-0000jS-MT; Mon, 17 Jun 2019 21:36:58 -0300
Date: Mon, 17 Jun 2019 21:36:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 hmm 04/12] mm/hmm: Simplify hmm_get_or_create and make
 it reliable
Message-ID: <20190618003658.GC30762@ziepe.ca>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-5-jgg@ziepe.ca>
 <20190615141211.GD17724@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190615141211.GD17724@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:19:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DUhdu87n/RcFK2o2RKT7Xn6jZQqeitWARb0DhK6/xFo=;
 b=Br9RdI5mPQREEmkYKTbqml22ch68dceGzZJ3NpqNGWnyOqMXHH3Vp3I8RbvWN+0dGG
 +g1j7rLYevDrJD9u1C3ny612FtpBO3tbIePe350M5ElOwdk4pjJA8/R330jcc3+vtYpn
 17S07MU/B/lrrFpSdr2NFsNSFXPEIP46dFGaUq3K6P/Gztn1b6znTuHTRL9kMCjl+OsE
 E/SXSnxqH8z94kWuui++s5M1RdL+/flIEAt9fmVVYofcAVK2jbveGcEm8QPiuUNVzG1y
 spSh4cwLvofbfJDRrinF0oVrVOFf22UKWIYy7Uyrxgd7cZ/rnvEbnjdjRkZxGdQjLAWX
 AxQw==
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
 Ira Weiny <ira.weiny@intel.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMTUsIDIwMTkgYXQgMDc6MTI6MTFBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gPiArCXNwaW5fbG9jaygmbW0tPnBhZ2VfdGFibGVfbG9jayk7Cj4gPiArCWlm
IChtbS0+aG1tKSB7Cj4gPiArCQlpZiAoa3JlZl9nZXRfdW5sZXNzX3plcm8oJm1tLT5obW0tPmty
ZWYpKSB7Cj4gPiArCQkJc3Bpbl91bmxvY2soJm1tLT5wYWdlX3RhYmxlX2xvY2spOwo+ID4gKwkJ
CXJldHVybiBtbS0+aG1tOwo+ID4gKwkJfQo+ID4gKwl9Cj4gPiArCXNwaW5fdW5sb2NrKCZtbS0+
cGFnZV90YWJsZV9sb2NrKTsKPiAKPiBUaGlzIGNvdWxkIGJlY29tZToKPiAKPiAJc3Bpbl9sb2Nr
KCZtbS0+cGFnZV90YWJsZV9sb2NrKTsKPiAJaG1tID0gbW0tPmhtbQo+IAlpZiAoaG1tICYmIGty
ZWZfZ2V0X3VubGVzc196ZXJvKCZobW0tPmtyZWYpKQo+IAkJZ290byBvdXRfdW5sb2NrOwo+IAlz
cGluX3VubG9jaygmbW0tPnBhZ2VfdGFibGVfbG9jayk7Cj4gCj4gYXMgdGhlIGxhc3QgdHdvIGxp
bmVzIG9mIHRoZSBmdW5jdGlvbiBhbHJlYWR5IGRyb3AgdGhlIHBhZ2VfdGFibGVfbG9jawo+IGFu
ZCB0aGVuIHJldHVybiBobW0uICBPciBkcm9wIHRoZSAiaG1tID0gbW0tPmhtbSIgYXNpZ25tZW50
IGFib3ZlIGFuZAo+IHJldHVybiBtbS0+aG1tIGFzIHRoYXQgc2hvdWxkIGJlIGFsd2F5cyBpZGVu
dGljYWwgdG8gaG1tIGF0IHRoZSBlbmQKPiB0byBzYXZlIGFub3RoZXIgbGluZS4KClllYWgsIEkg
Y2FuIGZ1c3MgaXQgc29tZSBtb3JlLgoKPiA+ICsJLyoKPiA+ICsJICogVGhlIG1tLT5obW0gcG9p
bnRlciBpcyBrZXB0IHZhbGlkIHdoaWxlIG5vdGlmaWVyIG9wcyBjYW4gYmUgcnVubmluZwo+ID4g
KwkgKiBzbyB0aGV5IGRvbid0IGhhdmUgdG8gZGVhbCB3aXRoIGEgTlVMTCBtbS0+aG1tIHZhbHVl
Cj4gPiArCSAqLwo+IAo+IFRoZSBjb21tZW50IGNvbmZ1c2VzIG1lLiAgSG93IGRvZXMgdGhlIHBh
Z2VfdGFibGVfbG9jayByZWxhdGUgdG8KPiBwb3NzaWJseSBydW5uaW5nIG5vdGlmaWVycywgYXMg
SSBjYW4ndCBmaW5kIHRoYXQgd2UgdGFrZQo+IHBhZ2VfdGFibGVfbG9jaz8gIE9yIGlzIGl0IGp1
c3QgYWJvdXQgdGhlIGZhY3QgdGhhdCB3ZSBvbmx5IGNsZWFyCj4gbW0tPmhtbSBpbiB0aGUgZnJl
ZSBjYWxsYmFjaywgYW5kIG5vdCBpbiBobW1fZnJlZT8KCkl0IHdhcyBsYXRlIHdoZW4gSSB3cm90
ZSB0aGlzIGZpeHVwLCB0aGUgY29tbWVudCBpcyBmYXVsdHksIGFuZCB0aGVyZQppcyBubyByZWFz
b24gdG8gZGVsYXkgdGhpcyB1bnRpbCB0aGUgU1JDVSBjbGVhbnVwIGF0IHRoaXMgcG9pbnQgaW4g
dGhlCnNlcmllcy4KClRoZSBvcHMgYWxsIGdldCB0aGVpciBzdHJ1Y3QgaG1tIGZyb20gY29udGFp
bmVyX29mLCB0aGUgb25seSB0aGluZwp0aGF0IHJlZmVycyB0byBtbS0+aG1tIGlzIGhtbV9nZXRf
b3JfY3JlYXRlKCkuCgpJJ2xsIHJldmlzZSBpdCB0b21vcnJvdywgdGhlIGNvbW1lbnQgd2lsbCBn
byBhd2F5IGFuZCB0aGUgPU5VTEwgd2lsbApnbyB0byB0aGUgcmVsZWFzZSBjYWxsYmFjawoKSmFz
b24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
