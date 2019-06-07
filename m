Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F288838C12
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Jun 2019 15:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D07189DD8;
	Fri,  7 Jun 2019 13:58:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B2F89DDF
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Jun 2019 13:57:55 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id d15so1289625qkl.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 07 Jun 2019 06:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=17gadSvJGp+uvcoNC+FfcmshKqVGv1ZUwiPdnI82lOI=;
 b=Ijr5tQQffvulQ2MjcBXeCl6/ZcMBKfoyBwyWR+mforX+kshMnjlMR9iFIGpNdaqbLw
 WYBMLdEeNrAfJl6+5ex5P43CN9uToQ4TNM68B0iSJrtnyuA/OaDkqqQkQ647MfNwE6JK
 DkwLxTWBbNC4lL5IR2AmI4P13QWRwLNSrK5VuNErdhfy6mYdEu+K+JdL67Yb2mBlM1YY
 87C4ORBjgF9SAQvvdjII906CCnmPjcOuxZPK51Twjxzu68kmSNoay1tnjCvre69cmAFY
 /d5LBxDxze/d6yKog7cZ/CIjA5/ryqnS4PAFqnHgkIppQsTeBjV9zdAr+tzQfY+KfXNC
 L4/w==
X-Gm-Message-State: APjAAAWAB7ZhLnztAbdRtw/IeWGjhg8ZiQubKCNwrZla5i8DnaiMn7sL
 Ilt3TujHvMBfo9mpRdna+mR3OvWJcLWLJg==
X-Google-Smtp-Source: APXvYqyXb3YGPBh3lIclsi3PYfUGbJ2uvWrtfDWhG41E8l5j7j4vV139lmCRlFT78OmA7F3xtrX4pg==
X-Received: by 2002:a37:bc03:: with SMTP id m3mr24773704qkf.199.1559915874559; 
 Fri, 07 Jun 2019 06:57:54 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id w30sm1247493qtb.28.2019.06.07.06.57.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 06:57:54 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hZFNR-0001xU-JJ; Fri, 07 Jun 2019 10:57:53 -0300
Date: Fri, 7 Jun 2019 10:57:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 hmm 08/11] mm/hmm: Remove racy protection against
 double-unregistration
Message-ID: <20190607135753.GH14802@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-9-jgg@ziepe.ca>
 <88400de9-e1ae-509b-718f-c6b0f726b14c@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88400de9-e1ae-509b-718f-c6b0f726b14c@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 07 Jun 2019 13:58:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=17gadSvJGp+uvcoNC+FfcmshKqVGv1ZUwiPdnI82lOI=;
 b=I+46Zffwelv3FY2kYKGzdobJ6uMmX8zCgsnvKiDTSkfI3HJBa+htk88VkGWM7NSZpi
 /0JCHDpAA7Hsoa4omW1wx1J85SCrH7dgr6RV0StdZtsaWrex1ZOuSIm+Zka617XPTGpN
 X1fcgiH+n0lyWRW1QagWvryyhg9XGrmKSd/F4IVorle0OcarTMiFrJd0Z3r6ZGdD+cmy
 VAiy5ECKzDJ4NQLEc4bwJAM+qICcpqA6QdhJ28xs1+NDe0kplypSuDdQRy0yFtY9sLB3
 MnA8Gv2LBIO0rwR5UIbYCFViG3FrLuek4drM6k3G4h9h5StmR/AX6O3RMQT8pEjmMpLr
 Yz8Q==
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

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDg6Mjk6MTBQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IE9uIDYvNi8xOSAxMTo0NCBBTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+ID4gRnJv
bTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+ID4gCj4gPiBObyBvdGhlciBy
ZWdpc3Rlci91bnJlZ2lzdGVyIGtlcm5lbCBBUEkgYXR0ZW1wdHMgdG8gcHJvdmlkZSB0aGlzIGtp
bmQgb2YKPiA+IHByb3RlY3Rpb24gYXMgaXQgaXMgaW5oZXJlbnRseSByYWN5LCBzbyBqdXN0IGRy
b3AgaXQuCj4gPiAKPiA+IENhbGxlcnMgc2hvdWxkIHByb3ZpZGUgdGhlaXIgb3duIHByb3RlY3Rp
b24sIGl0IGFwcGVhcnMgbm91dmVhdSBhbHJlYWR5Cj4gPiBkb2VzLCBidXQganVzdCBpbiBjYXNl
IGRyb3AgYSBkZWJ1Z2dpbmcgUE9JU09OLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBH
dW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xp
c3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4gPiAgbW0vaG1tLmMgfCA5ICsrLS0tLS0tLQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gPiAKPiA+
IGRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCj4gPiBpbmRleCBjNzAyY2Q3MjY1MWI1
My4uNjgwMmRlNzA4MGQxNzIgMTAwNjQ0Cj4gPiArKysgYi9tbS9obW0uYwo+ID4gQEAgLTI4NCwx
OCArMjg0LDEzIEBAIEVYUE9SVF9TWU1CT0woaG1tX21pcnJvcl9yZWdpc3Rlcik7Cj4gPiAgICov
Cj4gPiAgdm9pZCBobW1fbWlycm9yX3VucmVnaXN0ZXIoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJv
cikKPiA+ICB7Cj4gPiAtCXN0cnVjdCBobW0gKmhtbSA9IFJFQURfT05DRShtaXJyb3ItPmhtbSk7
Cj4gPiAtCj4gPiAtCWlmIChobW0gPT0gTlVMTCkKPiA+IC0JCXJldHVybjsKPiA+ICsJc3RydWN0
IGhtbSAqaG1tID0gbWlycm9yLT5obW07Cj4gPiAgCj4gPiAgCWRvd25fd3JpdGUoJmhtbS0+bWly
cm9yc19zZW0pOwo+ID4gIAlsaXN0X2RlbF9pbml0KCZtaXJyb3ItPmxpc3QpOwo+ID4gLQkvKiBU
byBwcm90ZWN0IHVzIGFnYWluc3QgZG91YmxlIHVucmVnaXN0ZXIgLi4uICovCj4gPiAtCW1pcnJv
ci0+aG1tID0gTlVMTDsKPiA+ICAJdXBfd3JpdGUoJmhtbS0+bWlycm9yc19zZW0pOwo+ID4gLQo+
ID4gIAlobW1fcHV0KGhtbSk7Cj4gPiArCW1lbXNldCgmbWlycm9yLT5obW0sIFBPSVNPTl9JTlVT
RSwgc2l6ZW9mKG1pcnJvci0+aG1tKSk7Cj4gCj4gSSBoYWRuJ3QgdGhvdWdodCBvZiBQT0lTT05f
KiBmb3IgdGhlc2UgdHlwZXMgb2YgY2FzZXMsIGl0J3MgYSAKPiBnb29kIHRlY2huaXF1ZSB0byBy
ZW1lbWJlci4KPiAKPiBJIG5vdGljZWQgdGhhdCB0aGlzIGlzIG5vdyBkb25lIG91dHNpZGUgb2Yg
dGhlIGxvY2ssIGJ1dCB0aGF0Cj4gZm9sbG93cyBkaXJlY3RseSBmcm9tIHlvdXIgY29tbWl0IGRl
c2NyaXB0aW9uLCBzbyB0aGF0IGFsbCBsb29rcyAKPiBjb3JyZWN0LgoKWWVzLCB0aGUgdGhpbmcg
YWJvdXQgUE9JU09OIGlzIHRoYXQgaWYgeW91IGV2ZXIgcmVhZCBpdCB0aGVuIHlvdSBoYXZlCmZv
dW5kIGEgdXNlIGFmdGVyIGZyZWUgYnVnIC0gdGh1cyB3ZSBzaG91bGQgbmV2ZXIgbmVlZCB0byB3
cml0ZSBpdAp1bmRlciBhIGxvY2sgKGp1c3QgYWZ0ZXIgYSBzZXJpYWxpemluZyBsb2NrKQoKTm9y
bWFsbHkgSSB3b3VsZG4ndCBib3RoZXIgYXMga2ZyZWUgZG9lcyBwb2lzb24gYXMgd2VsbCwgYnV0
IHNpbmNlIHdlCmNhbid0IGVhc2lseSBhdWRpdCB0aGUgcGF0Y2hlcyB5ZXQgdG8gYmUgc3VibWl0
dGVkIHRoaXMgc2VlbXMgc2FmZXIKYW5kIHdpbGwgcmVsaWFibHkgY2F1c2UgdGhvc2UgcGF0Y2hl
cyB0byBleHBsb2RlIHdpdGggYW4gb29wcyBpbgp0ZXN0aW5nLgoKVGhhbmtzLApKYXNvbgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
