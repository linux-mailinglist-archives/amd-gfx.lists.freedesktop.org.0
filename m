Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE1C38BFD
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Jun 2019 15:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E0489214;
	Fri,  7 Jun 2019 13:54:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5AC89E06
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Jun 2019 12:34:34 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id i125so1099206qkd.6
 for <amd-gfx@lists.freedesktop.org>; Fri, 07 Jun 2019 05:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=A2FbqDaOIm85eFPjOPRRz/esCZO+J4vaz7zIDfIOxvA=;
 b=JP50RxDtYZbSMd58NBde7nL1Gzsypa/9m16PKad3Fnw/phkgXIGSJX6/xTMtBaqn7J
 RHtzBebkE9rnAvGZJk0HAM2xNi+rg9hiQSef/N4ERUIzY/6tdpAOE+VubCR+lsrP6k0M
 xVsBXfATAFrJl9qPb0qO3gJOwU2jp+FOTSE9iRiR/fkxc72T8ZfV6GgIxZv8U64YuN0P
 3CeqrPAYl0+wIa0ciUyXbTjybysXmpC96LCtILEbqyeCdSPH1NIul17+3tNaRh+zGFZB
 4jMUWRr5PuLfEV/zE1IwWE6vPnBkdnKCzsk32/dOdnD8FAs/l0a936qx2F1ZYS6xEXQI
 zyGg==
X-Gm-Message-State: APjAAAXth+aZiUkRW+nVdoc6cpE0F+3bL4NsOt0OEn5YIK4H4srIyNFJ
 H8JTSyGvNJzbT0BdqStTl9mdvw==
X-Google-Smtp-Source: APXvYqxt6cvXSe1Vnp7yMI6I6KtFfMUDzTi4iQ4hvnAcaJXl648GbcSmQKXBch+Om0G7zfr9TuWsKw==
X-Received: by 2002:a05:620a:5b0:: with SMTP id
 q16mr42567473qkq.212.1559910873269; 
 Fri, 07 Jun 2019 05:34:33 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id t29sm1505233qtt.42.2019.06.07.05.34.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 05:34:32 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hZE4m-00071G-Dh; Fri, 07 Jun 2019 09:34:32 -0300
Date: Fri, 7 Jun 2019 09:34:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 hmm 01/11] mm/hmm: fix use after free with struct hmm
 in the mmu notifiers
Message-ID: <20190607123432.GB14802@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-2-jgg@ziepe.ca>
 <9c72d18d-2924-cb90-ea44-7cd4b10b5bc2@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9c72d18d-2924-cb90-ea44-7cd4b10b5bc2@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 07 Jun 2019 13:54:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=A2FbqDaOIm85eFPjOPRRz/esCZO+J4vaz7zIDfIOxvA=;
 b=cejnsklTN8gSa78nEyihP29Lx9J/VrusPGqXCyf5Rd+9hsmueFkxF1/YWmjS5sZO9/
 HH7v0sLRxeqlre/3LEQrtuC+ECX1CoDlHi7RjWJwsqX6IeTPRlBpObDM60nJLr+PMIIZ
 uzHsDgz4cQDDPKWcxBmzLfOKqAFg0G5K+NTmL3XYc/xpH9SNkaui88s0XGcmaj3ydsNz
 lFmSis1GsZQ0McoTZeDRJxbCFy9jepSrW5xnowcXy9X8ErbPrOuk0a0CsrL2yro8PtIO
 QOyIHW79VvRsPULJ5mPeQG+Tpqjmic/6xvxDcab8YmZz75UNLwahdhxIcfW61W60/Fm1
 QZ3w==
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

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDc6Mjk6MDhQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IE9uIDYvNi8xOSAxMTo0NCBBTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+ID4gRnJv
bTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IC4uLgo+ID4gZGlmZiAtLWdp
dCBhL21tL2htbS5jIGIvbW0vaG1tLmMKPiA+IGluZGV4IDhlNzQwM2YwODFmNDRhLi41NDcwMDJm
NTZhMTYzZCAxMDA2NDQKPiA+ICsrKyBiL21tL2htbS5jCj4gLi4uCj4gPiBAQCAtMTI1LDcgKzEz
MCw3IEBAIHN0YXRpYyB2b2lkIGhtbV9mcmVlKHN0cnVjdCBrcmVmICprcmVmKQo+ID4gIAkJbW0t
PmhtbSA9IE5VTEw7Cj4gPiAgCXNwaW5fdW5sb2NrKCZtbS0+cGFnZV90YWJsZV9sb2NrKTsKPiA+
ICAKPiA+IC0Ja2ZyZWUoaG1tKTsKPiA+ICsJbW11X25vdGlmaWVyX2NhbGxfc3JjdSgmaG1tLT5y
Y3UsIGhtbV9mcmVlX3JjdSk7Cj4gCj4gCj4gSXQgb2NjdXJyZWQgdG8gbWUgdG8gd29uZGVyIGlm
IGl0IGlzIGJlc3QgdG8gdXNlIHRoZSBNTVUgbm90aWZpZXIncwo+IGluc3RhbmNlIG9mIHNyY3Us
IGluc3RlYWQgb2YgY3JlYXRpbmcgYSBzZXBhcmF0ZSBpbnN0YW5jZSBmb3IgSE1NLgoKSXQgKmhh
cyogdG8gYmUgdGhlIE1NVSBub3RpZmllciBTUkNVIGJlY2F1c2Ugd2UgYXJlIHN5bmNob3JuaXpp
bmcKYWdhaW5zdCB0aGUgcmVhZCBzaWRlIG9mIHRoYXQgU1JVIGluc2lkZSB0aGUgbW11IG5vdGlm
aWVyIGNvZGUsIGllOgoKaW50IF9fbW11X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQo
c3RydWN0IG1tdV9ub3RpZmllcl9yYW5nZSAqcmFuZ2UpCiAgICAgICAgaWQgPSBzcmN1X3JlYWRf
bG9jaygmc3JjdSk7CiAgICAgICAgaGxpc3RfZm9yX2VhY2hfZW50cnlfcmN1KG1uLCAmcmFuZ2Ut
Pm1tLT5tbXVfbm90aWZpZXJfbW0tPmxpc3QsIGhsaXN0KSB7CiAgICAgICAgICAgICAgICBpZiAo
bW4tPm9wcy0+aW52YWxpZGF0ZV9yYW5nZV9zdGFydCkgewogICAgICAgICAgICAgICAgICAgXl5e
Xl4KCkhlcmUgJ21uJyBpcyByZWFsbHkgaG1tIChobW0gPSBjb250YWluZXJfb2YobW4sIHN0cnVj
dCBobW0sCm1tdV9ub3RpZmllcikpLCBzbyB3ZSBtdXN0IHByb3RlY3QgdGhlIG1lbW9yeSBhZ2Fp
bnN0IGZyZWUgZm9yIHRoZSBtbXUKbm90aWZpZXIgY29yZS4KClRodXMgd2UgaGF2ZSBubyBjaG9p
Y2UgYnV0IHRvIHVzZSBpdHMgU1JDVS4KCkNIIGFsc28gcG9pbnRlZCBvdXQgYSBtb3JlIGVsZWdh
bnQgc29sdXRpb24sIHdoaWNoIGlzIHRvIGdldCB0aGUgd3JpdGUKc2lkZSBvZiB0aGUgbW1hcF9z
ZW0gZHVyaW5nIGhtbV9taXJyb3JfdW5yZWdpc3RlciAtIG5vIG5vdGlmaWVyCmNhbGxiYWNrIGNh
biBiZSBydW5uaW5nIGluIHRoaXMgY2FzZS4gVGhlbiB3ZSBkZWxldGUgdGhlIGtyZWYsIHNyY3UK
YW5kIHNvIGZvcnRoLgoKVGhpcyBpcyBtdWNoIGNsZWFyZXIvc2FuZXIvYmV0dGVyLCBidXQuLiBy
ZXF1cmllcyB0aGUgY2FsbGVycyBvZgpobW1fbWlycm9yX3VucmVnaXN0ZXIgdG8gYmUgc2FmZSB0
byBnZXQgdGhlIG1tYXBfc2VtIHdyaXRlIHNpZGUuCgpJIHRoaW5rIHRoaXMgaXMgdHJ1ZSwgc28g
bWF5YmUgdGhpcyBwYXRjaCBzaG91bGQgYmUgc3dpdGNoZWQsIHdoYXQgZG8KeW91IHRoaW5rPwoK
PiA+IEBAIC0xNTMsMTAgKzE1OCwxNCBAQCB2b2lkIGhtbV9tbV9kZXN0cm95KHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tKQo+ID4gIAo+ID4gIHN0YXRpYyB2b2lkIGhtbV9yZWxlYXNlKHN0cnVjdCBtbXVf
bm90aWZpZXIgKm1uLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiA+ICB7Cj4gPiAtCXN0cnVjdCBo
bW0gKmhtbSA9IG1tX2dldF9obW0obW0pOwo+ID4gKwlzdHJ1Y3QgaG1tICpobW0gPSBjb250YWlu
ZXJfb2YobW4sIHN0cnVjdCBobW0sIG1tdV9ub3RpZmllcik7Cj4gPiAgCXN0cnVjdCBobW1fbWly
cm9yICptaXJyb3I7Cj4gPiAgCXN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlOwo+ID4gIAo+ID4gKwkv
KiBobW0gaXMgaW4gcHJvZ3Jlc3MgdG8gZnJlZSAqLwo+IAo+IFdlbGwsIHNvbWV0aW1lcywgeWVz
LiA6KQoKSXQgdGhpbmsgaXQgaXMgaW4gYWxsIGNhc2VzIGFjdHVhbGx5Li4gVGhlIG9ubHkgd2F5
IHdlIHNlZSBhIDAga3JlZgphbmQgc3RpbGwgcmVhY2ggdGhpcyBjb2RlIHBhdGggaXMgaWYgYW5v
dGhlciB0aHJlYWQgaGFzIGFscmVheSBzZXR1cAp0aGUgaG1tX2ZyZWUgaW4gdGhlIGNhbGxfc3Jj
dS4uCgo+IE1heWJlIHRoaXMgd29yZGluZyBpcyBjbGVhcmVyIChpZiB3ZSBuZWVkIGFueSBjb21t
ZW50IGF0IGFsbCk6CgpJIGFsd2F5cyBmaW5kIHRoaXMgaGFyZC4uIFRoaXMgaXMgYSB2ZXJ5IHN0
YW5kYXJkIHBhdHRlcm4gd2hlbiB3b3JraW5nCndpdGggUkNVIC0gaG93ZXZlciBpbiBteSBleHBl
cmllbmNlIGZldyBwZW9wbGUgYWN0dWFsbHkga25vdyB0aGUgUkNVCnBhdHRlcm5zLCBhbmQgbWlz
c2luZyB0aGUgX3VubGVzc196ZXJvIGlzIGEgY29tbW9uIGJ1ZyBJIGZpbmQgd2hlbgpsb29raW5n
IGF0IGNvZGUuCgpUaGlzIGlzIG1tLyBzbyBJIGNhbiBkcm9wIGl0LCB3aGF0IGRvIHlvdSB0aGlu
az8KClRoYW5rcywKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
