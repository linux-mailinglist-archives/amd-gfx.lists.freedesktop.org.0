Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54563907BC
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 20:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB1C6E97D;
	Fri, 16 Aug 2019 18:25:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BB56E388
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 17:21:53 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id c34so10270139otb.7
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 10:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zMvxega2p/6F2S/eoDzz+sN4i7bM8B+uz60Grtez1JE=;
 b=sEPtYoLnKcFRFL/A4iMtzBiUYr6ugw3sKrHplOz3tD1FfagLlY74b8mq/LSr0mX5yW
 jIL79UlGT3W6koGDVIkAoA3IQiBwca5LZWq/P0DSWDQFZJwdRPoiIi2RjBlzEamQJEk9
 OY8Is0gCXLg66V+OxeCKHdO+BPHklaLi8EoeCMSlP3uZkRdcgnGTFb8rtKw+WRBvZDMP
 uJwFvibjGgfNl2oM4TiEY1irlizoO0ZfUFSeoLp9Jh9r3HtXy1pGD9gmK/ncHTfWXY1z
 yC+Jtitk0BWOBQ+Es4K8EiptU/yF3wWFuzkQ7iItmju8g2c/uJDyBZPTP99eQmUQasvY
 6zbg==
X-Gm-Message-State: APjAAAXm72diLiQhi4vwdKaAK5H3/jspJ1uXRLwW3sIgIRNhSppa2UJS
 LFUjQ3pK5Y556EzzZv14D+o0iNaxw0DLJlfKpEPVSw==
X-Google-Smtp-Source: APXvYqwNxRXX6MojhKuxmTIkgv8yzk3NfRtB0XcnaOCwg7viPPwMQ/JTCtWNqWdiMYWGOJVL8emAQc22ws+XFOORnhM=
X-Received: by 2002:a9d:6b96:: with SMTP id b22mr8643397otq.363.1565976113121; 
 Fri, 16 Aug 2019 10:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAPcyv4g8usp8prJ+1bMtyV1xuedp5FKErBp-N8+KzR=rJ-v0QQ@mail.gmail.com>
 <20190815180325.GA4920@redhat.com>
 <CAPcyv4g4hzcEA=TPYVTiqpbtOoS30ahogRUttCvQAvXQbQjfnw@mail.gmail.com>
 <20190815194339.GC9253@redhat.com>
 <CAPcyv4jid8_=-8hBpn_Qm=c4S8BapL9B9RGT7e9uu303yH=Yqw@mail.gmail.com>
 <20190815203306.GB25517@redhat.com> <20190815204128.GI22970@mellanox.com>
 <CAPcyv4j_Mxbw+T+yXTMdkrMoS_uxg+TXXgTM_EPBJ8XfXKxytA@mail.gmail.com>
 <20190816004053.GB9929@mellanox.com>
 <CAPcyv4gMPVmY59aQAT64jQf9qXrACKOuV=DfVs4sNySCXJhkdA@mail.gmail.com>
 <20190816122414.GC5412@mellanox.com>
In-Reply-To: <20190816122414.GC5412@mellanox.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 16 Aug 2019 10:21:41 -0700
Message-ID: <CAPcyv4jgHF05gdRoOFZORqeOBE9Z7PhagsSD+LVnjH2dc3mrFg@mail.gmail.com>
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Approved-At: Fri, 16 Aug 2019 18:25:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zMvxega2p/6F2S/eoDzz+sN4i7bM8B+uz60Grtez1JE=;
 b=QCN9eZvxzAPGmUPLnJH/woDtKhvSbyWNPI2WVuuw78XLs8YTeApowbbTpG4QmVhRT8
 KiEz3hmHc4YlVhpGKa4TQ2iVsusMkMmynlM+BCY4q+fdKS3rJPykSdyfO9A3QGOq+bCv
 Ep1qhKfWcW3SsmTBurcp0FktyN0IH0JZXWMk3EtkNfv4UCl45hWL/qKUAJyVWq8HCPc+
 04MySaN5P2L8D4z2nil2AJHtxzcCAXe9+Ae3Qzl3Th1EMpkCiYr6W6vATmErlpeFN+X6
 UckZrP9+cKrZkBK1Mne3Ywq2nD/UZNxrcPAq4iFlzuaxVK76A2sJ0kE48E61MlCk6O69
 /0RQ==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgNToyNCBBTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxs
YW5veC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDg6NTQ6NDZQTSAt
MDcwMCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+Cj4gPiA+IEhvd2V2ZXIsIHRoaXMgbWVhbnMgd2Ug
Y2Fubm90IGRvIGFueSBwcm9jZXNzaW5nIG9mIFpPTkVfREVWSUNFIHBhZ2VzCj4gPiA+IG91dHNp
ZGUgdGhlIGRyaXZlciBsb2NrLCBzbyBlZywgZG9pbmcgYW55IERNQSBtYXAgdGhhdCBtaWdodCBy
ZWx5IG9uCj4gPiA+IE1FTU9SWV9ERVZJQ0VfUENJX1AyUERNQSBoYXMgdG8gYmUgZG9uZSBpbiB0
aGUgZHJpdmVyIGxvY2ssIHdoaWNoIGlzCj4gPiA+IGEgYml0IHVuZm9ydHVuYXRlLgo+ID4KPiA+
IFdvdWxkbid0IFAyUERNQSB1c2UgcGFnZSBwaW5zPyBOb3QgbmVlZGluZyB0byBob2xkIGEgbG9j
ayBvdmVyCj4gPiBaT05FX0RFVklDRSBwYWdlIG9wZXJhdGlvbnMgd2FzIG9uZSBvZiB0aGUgbW90
aXZhdGlvbnMgZm9yIHBsdW1iaW5nCj4gPiBnZXRfZGV2X3BhZ2VtYXAoKSB3aXRoIGEgcGVyY3B1
LXJlZi4KPgo+IGhtbV9yYW5nZV9mYXVsdCgpIGRvZXNuJ3QgdXNlIHBhZ2UgcGlucyBhdCBhbGws
IHNvIGlmIGEgWk9ORV9ERVZJQ0UKPiBwYWdlIGNvbWVzIG91dCBvZiBpdCB0aGVuIGl0IG5lZWRz
IHRvIHVzZSBhbm90aGVyIGxvY2tpbmcgcGF0dGVybi4KPgo+IElmIEkgZm9sbG93IGl0IGFsbCBy
aWdodDoKPgo+IFdlIGNhbiBkbyBhIGdldF9kZXZfcGFnZW1hcCBpbnNpZGUgdGhlIHBhZ2Vfd2Fs
ayBhbmQgdG91Y2ggdGhlIHBnbWFwLAo+IG9yIHdlIGNhbiBkbyB0aGUgJ2RldmljZSBtdXRleCAm
JiByZXRyeScgcGF0dGVybiBhbmQgdG91Y2ggdGhlIHBnbWFwCj4gaW4gdGhlIGRyaXZlciwgdW5k
ZXIgdGhhdCBsb2NrLgo+Cj4gSG93ZXZlciBpbiBhbGwgY2FzZXMgdGhlIGN1cnJlbnQgZ2V0X2Rl
dl9wYWdlbWFwKCkncyBpbiB0aGUgcGFnZSB3YWxrCj4gYXJlIG5vdCBuZWNlc3NhcnksIGFuZCB3
ZSBjYW4gZGVsZXRlIHRoZW0uCgpZZXMsIGFzIGxvbmcgYXMgJ3N0cnVjdCBwYWdlJyBpbnN0YW5j
ZXMgcmVzdWx0aW5nIGZyb20gdGhhdCBsb29rdXAgYXJlCm5vdCBwYXNzZWQgb3V0c2lkZSBvZiB0
aGF0IGxvY2suCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
