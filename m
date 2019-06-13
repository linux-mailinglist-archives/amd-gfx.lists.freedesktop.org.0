Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965984566C
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jun 2019 09:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859B5899D5;
	Fri, 14 Jun 2019 07:32:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F5089624
 for <amd-gfx@lists.freedesktop.org>; Thu, 13 Jun 2019 17:50:11 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id s15so23537506qtk.9
 for <amd-gfx@lists.freedesktop.org>; Thu, 13 Jun 2019 10:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CW8Dmkt0odT79Xf4+B/xbpKgEC6daDBVeyuQmTJJES8=;
 b=d5pOZtwjZfSd+gLnooUrCsYNsmy+i3tz7Sl2z+SWzdfuakxCFGdYU1O/maP1MTYKvG
 gn5DF/gkbgRs/2N7U79GCviS0hN3FitzCqFKlAsbN/caBk59QqZk/8jAh/O1CaK6n0wo
 YD95rXCmN3xZ0toU2F5i42u6L5PKaEL4Xk5EcZGv4DNHUIEROvLtofxhGiZMgwd9ALwO
 Byw1CYhwi1Lt5yM6VBWFdf9euYD3KNY1nSfnlAM4ngeUV/dLk7QbY+awzs7GK312Rgka
 GX22qfGtAbhoRHtckxJnQhL661W6bCEnwueLr/R5uIcd2h7TDdzdt+QLEJbttcBpYOUg
 ofyA==
X-Gm-Message-State: APjAAAX6LmRYuO5LV0k4yKilOwsJnVkW/OhbW3p7PkVqZvHIp3wvwmxq
 BRoqOGNUlh3oe3m+2762cfujyg==
X-Google-Smtp-Source: APXvYqyiojsO9AL2I7FFH8QZQ3t97ZM/cVMsGf4rVJyZYQVaUkpxSashUx10y6Oje86asaNHv0rxLg==
X-Received: by 2002:aed:254c:: with SMTP id w12mr79027848qtc.127.1560448210185; 
 Thu, 13 Jun 2019 10:50:10 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id c4sm137165qkd.24.2019.06.13.10.50.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Jun 2019 10:50:09 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hbTrV-0006NJ-8F; Thu, 13 Jun 2019 14:50:09 -0300
Date: Thu, 13 Jun 2019 14:50:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Yang, Philip" <Philip.Yang@amd.com>
Subject: Re: [PATCH v2 hmm 00/11] Various revisions from a locking/code review
Message-ID: <20190613175009.GG22901@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190611194858.GA27792@ziepe.ca>
 <5d3b0ae2-3662-cab2-5e6c-82912f32356a@amd.com>
 <69bb7fe9-98e7-8a49-3e0b-f639010b8991@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69bb7fe9-98e7-8a49-3e0b-f639010b8991@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:32:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CW8Dmkt0odT79Xf4+B/xbpKgEC6daDBVeyuQmTJJES8=;
 b=P0/fYNP9ZcO3+OGBpONisUzkN8/fc+iUh8W32JiaGiFfNUt4qj3hrdWOLa/2kOC2Ga
 uu/8ijXw30ur7PSRQYFk7Oe6OadCse1RRqrxDoqyNJlNajrnSqTh1ShrZ48X/c3/G4b1
 9g+0Y3ZmUyd781bC8WLIAtVBzmwUTu3co6WnZDr4CXQvlI8tMzdoMpQOhxvEQuWv/dIr
 FMHaFB6W/Smdy5NjElS5AmWr8tSHAPDVdpcJzzt7mZ8Ty3sqcvZGxCvSXRIoQ81pMrC3
 kMb0362dUdKeGvJFK+wK54XHlEHfz16TwTLECzqd5j0SbpDhpcQWqdCP3c8gebNRqYEV
 sAgw==
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
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDk6NDk6MTJQTSArMDAwMCwgWWFuZywgUGhpbGlwIHdy
b3RlOgo+IFJlYmFzZSB0byBodHRwczovL2dpdGh1Yi5jb20vamd1bnRob3JwZS9saW51eC5naXQg
aG1tIGJyYW5jaCwgbmVlZCBzb21lIAo+IGNoYW5nZXMgYmVjYXVzZSBvZiBpbnRlcmZhY2UgaG1t
X3JhbmdlX3JlZ2lzdGVyIGNoYW5nZS4gVGhlbiBydW4gYSBxdWljayAKPiBhbWRncHVfdGVzdC4g
VGVzdCBpcyBmaW5pc2hlZCwgcmVzdWx0IGlzIG9rLgoKR3JlYXQhIFRoYW5rcwoKSSdsbCBhZGQg
eW91ciBUZXN0ZWQtYnkgdG8gdGhlIHNlcmllcwoKPiAgQnV0IHRoZXJlIGlzIGJlbG93IGtlcm5l
bCBCVUcgbWVzc2FnZSwgc2VlbXMgaG1tX2ZyZWVfcmN1IGNhbGxzCj4gZG93bl93cml0ZS4uLi4u
Cj4gCj4gWyAxMTcxLjkxOTkyMV0gQlVHOiBzbGVlcGluZyBmdW5jdGlvbiBjYWxsZWQgZnJvbSBp
bnZhbGlkIGNvbnRleHQgYXQgCj4gL2hvbWUveWFuZ3AvZ2l0L2NvbXB1dGVfc3RhZ2luZy9rZXJu
ZWwva2VybmVsL2xvY2tpbmcvcndzZW0uYzo2NQo+IFsgMTE3MS45MTk5MzNdIGluX2F0b21pYygp
OiAxLCBpcnFzX2Rpc2FibGVkKCk6IDAsIHBpZDogNTMsIG5hbWU6IAo+IGt3b3JrZXIvMToxCj4g
WyAxMTcxLjkxOTkzOF0gMiBsb2NrcyBoZWxkIGJ5IGt3b3JrZXIvMToxLzUzOgo+IFsgMTE3MS45
MTk5NDBdICAjMDogMDAwMDAwMDAxYzdjMTlkNCAoKHdxX2NvbXBsZXRpb24pcmN1X2dwKXsrLisu
fSwgYXQ6IAo+IHByb2Nlc3Nfb25lX3dvcmsrMHgyMGUvMHg2MzAKPiBbIDExNzEuOTE5OTUxXSAg
IzE6IDAwMDAwMDAwOTIzZjJjZmEgCj4gKCh3b3JrX2NvbXBsZXRpb24pKCZzZHAtPndvcmspKXsr
LisufSwgYXQ6IHByb2Nlc3Nfb25lX3dvcmsrMHgyMGUvMHg2MzAKPiBbIDExNzEuOTE5OTU5XSBD
UFU6IDEgUElEOiA1MyBDb21tOiBrd29ya2VyLzE6MSBUYWludGVkOiBHICAgICAgICBXIAo+ICAg
ICA1LjIuMC1yYzEta2ZkLXlhbmdwICMxOTYKPiBbIDExNzEuOTE5OTYxXSBIYXJkd2FyZSBuYW1l
OiBBU1VTIEFsbCBTZXJpZXMvWjk3LVBSTyhXaS1GaSBhYykvVVNCIDMuMSwgCj4gQklPUyA5MDAx
IDAzLzA3LzIwMTYKPiBbIDExNzEuOTE5OTY1XSBXb3JrcXVldWU6IHJjdV9ncCBzcmN1X2ludm9r
ZV9jYWxsYmFja3MKPiBbIDExNzEuOTE5OTY4XSBDYWxsIFRyYWNlOgo+IFsgMTE3MS45MTk5NzRd
ICBkdW1wX3N0YWNrKzB4NjcvMHg5Ygo+IFsgMTE3MS45MTk5ODBdICBfX19taWdodF9zbGVlcCsw
eDE0OS8weDIzMAo+IFsgMTE3MS45MTk5ODVdICBkb3duX3dyaXRlKzB4MWMvMHg3MAo+IFsgMTE3
MS45MTk5ODldICBobW1fZnJlZV9yY3UrMHgyNC8weDgwCj4gWyAxMTcxLjkxOTk5M10gIHNyY3Vf
aW52b2tlX2NhbGxiYWNrcysweGM5LzB4MTUwCj4gWyAxMTcxLjkyMDAwMF0gIHByb2Nlc3Nfb25l
X3dvcmsrMHgyOGUvMHg2MzAKPiBbIDExNzEuOTIwMDA4XSAgd29ya2VyX3RocmVhZCsweDM5LzB4
M2YwCj4gWyAxMTcxLjkyMDAxNF0gID8gcHJvY2Vzc19vbmVfd29yaysweDYzMC8weDYzMAo+IFsg
MTE3MS45MjAwMTddICBrdGhyZWFkKzB4MTFjLzB4MTQwCj4gWyAxMTcxLjkyMDAyMV0gID8ga3Ro
cmVhZF9wYXJrKzB4OTAvMHg5MAo+IFsgMTE3MS45MjAwMjZdICByZXRfZnJvbV9mb3JrKzB4MjQv
MHgzMAoKVGhhbmsgeW91IFBoaWxsaXAsIGl0IHNlZW1zIHRoZSBwcmlvciB0ZXN0cyB3ZXJlIG5v
dCBkb25lIHdpdGgKbG9ja2RlcC4uCgpTaWdoLCBJIHdpbGwga2VlcCB0aGlzIHdpdGggdGhlIGdy
b3NzIHBhZ2V0YWJsZV9sb2NrIHRoZW4uIEkgdXBkYXRlZAp0aGUgcGF0Y2hlcyBvbiB0aGUgZ2l0
IHdpdGggdGhpcyBtb2RpZmljYXRpb24uIEkgdGhpbmsgd2UgaGF2ZSBjb3ZlcmVkCmFsbCB0aGUg
YmFzZXMgc28gSSB3aWxsIHNlbmQgYW5vdGhlciBWIG9mIHRoZSBzZXJpZXMgdG8gdGhlIGxpc3Qg
YW5kCmlmIG5vIG1vcmUgY29tbWVudHMgdGhlbiBpdCB3aWxsIG1vdmUgYWhlYWQgdG8gaG1tLmdp
dC4gVGhhbmtzIHRvIGFsbC4KCmRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCmluZGV4
IDEzNmM4MTJmYWEyNzkwLi40YzY0ZDRjMzJmNDgyNSAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysr
IGIvbW0vaG1tLmMKQEAgLTQ5LDE2ICs0OSwxNSBAQCBzdGF0aWMgc3RydWN0IGhtbSAqaG1tX2dl
dF9vcl9jcmVhdGUoc3RydWN0IG1tX3N0cnVjdCAqbW0pCiAKIAlsb2NrZGVwX2Fzc2VydF9oZWxk
X2V4Y2x1c2l2ZSgmbW0tPm1tYXBfc2VtKTsKIAorCS8qIEFidXNlIHRoZSBwYWdlX3RhYmxlX2xv
Y2sgdG8gYWxzbyBwcm90ZWN0IG1tLT5obW0uICovCisJc3Bpbl9sb2NrKCZtbS0+cGFnZV90YWJs
ZV9sb2NrKTsKIAlpZiAobW0tPmhtbSkgewotCQlpZiAoa3JlZl9nZXRfdW5sZXNzX3plcm8oJm1t
LT5obW0tPmtyZWYpKQorCQlpZiAoa3JlZl9nZXRfdW5sZXNzX3plcm8oJm1tLT5obW0tPmtyZWYp
KSB7CisJCQlzcGluX3VubG9jaygmbW0tPnBhZ2VfdGFibGVfbG9jayk7CiAJCQlyZXR1cm4gbW0t
PmhtbTsKLQkJLyoKLQkJICogVGhlIGhtbSBpcyBiZWluZyBmcmVlZCBieSBzb21lIG90aGVyIENQ
VSBhbmQgaXMgcGVuZGluZyBhCi0JCSAqIFJDVSBncmFjZSBwZXJpb2QsIGJ1dCB0aGlzIENQVSBj
YW4gTlVMTCBub3cgaXQgc2luY2Ugd2UKLQkJICogaGF2ZSB0aGUgbW1hcF9zZW0uCi0JCSAqLwot
CQltbS0+aG1tID0gTlVMTDsKKwkJfQogCX0KKwlzcGluX3VubG9jaygmbW0tPnBhZ2VfdGFibGVf
bG9jayk7CiAKIAlobW0gPSBrbWFsbG9jKHNpemVvZigqaG1tKSwgR0ZQX0tFUk5FTCk7CiAJaWYg
KCFobW0pCkBAIC04MSw3ICs4MCwxNCBAQCBzdGF0aWMgc3RydWN0IGhtbSAqaG1tX2dldF9vcl9j
cmVhdGUoc3RydWN0IG1tX3N0cnVjdCAqbW0pCiAJfQogCiAJbW1ncmFiKGhtbS0+bW0pOworCisJ
LyoKKwkgKiBXZSBob2xkIHRoZSBleGNsdXNpdmUgbW1hcF9zZW0gaGVyZSBzbyB3ZSBrbm93IHRo
YXQgbW0tPmhtbSBpcworCSAqIHN0aWxsIE5VTEwgb3IgMCBrcmVmLCBhbmQgaXMgc2FmZSB0byB1
cGRhdGUuCisJICovCisJc3Bpbl9sb2NrKCZtbS0+cGFnZV90YWJsZV9sb2NrKTsKIAltbS0+aG1t
ID0gaG1tOworCXNwaW5fdW5sb2NrKCZtbS0+cGFnZV90YWJsZV9sb2NrKTsKIAlyZXR1cm4gaG1t
OwogfQogCkBAIC04OSwxMCArOTUsMTQgQEAgc3RhdGljIHZvaWQgaG1tX2ZyZWVfcmN1KHN0cnVj
dCByY3VfaGVhZCAqcmN1KQogewogCXN0cnVjdCBobW0gKmhtbSA9IGNvbnRhaW5lcl9vZihyY3Us
IHN0cnVjdCBobW0sIHJjdSk7CiAKLQlkb3duX3dyaXRlKCZobW0tPm1tLT5tbWFwX3NlbSk7CisJ
LyoKKwkgKiBUaGUgbW0tPmhtbSBwb2ludGVyIGlzIGtlcHQgdmFsaWQgd2hpbGUgbm90aWZpZXIg
b3BzIGNhbiBiZSBydW5uaW5nCisJICogc28gdGhleSBkb24ndCBoYXZlIHRvIGRlYWwgd2l0aCBh
IE5VTEwgbW0tPmhtbSB2YWx1ZQorCSAqLworCXNwaW5fbG9jaygmaG1tLT5tbS0+cGFnZV90YWJs
ZV9sb2NrKTsKIAlpZiAoaG1tLT5tbS0+aG1tID09IGhtbSkKIAkJaG1tLT5tbS0+aG1tID0gTlVM
TDsKLQl1cF93cml0ZSgmaG1tLT5tbS0+bW1hcF9zZW0pOworCXNwaW5fdW5sb2NrKCZobW0tPm1t
LT5wYWdlX3RhYmxlX2xvY2spOwogCW1tZHJvcChobW0tPm1tKTsKIAogCWtmcmVlKGhtbSk7Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
